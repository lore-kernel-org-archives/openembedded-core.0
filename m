Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9494A749A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 19:40:48 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id r2-v6so6093392lff.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 12:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=PAabAu2OpphXurldEVO5eUnu8YhYzItoTtx6sg9f+C8=;
	b=KmGviMzXoTF/JvTu+FqgAKg3+sR2MIJCVkjxv8udngj8EWXGq2XlGgoQPqPNCAHKE2
	ai1FBOyVixXo1tpdwBW2Qmq22fLsWYPB5eX+EMSfoqH77zgWV4Qzm3bAkJIu8bnEOAcd
	cftzfZiBZuNsyZu5y0m0VwbZDb14XGHfnQEMferg4usUwvGajlFT25z/sh14fbwYWlvR
	WhU1nPhJbc97oc92BrJa+5NC17tIr9smiePvVCur5gIPBQF8gAOMvYbE4xA4h108aMW+
	DG7mkXrSO18Bk1efYCEZ3bmzisGeZWPeowwyaB73qulYglgh94Luy+ifr41ugRibAr84
	2XBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=PAabAu2OpphXurldEVO5eUnu8YhYzItoTtx6sg9f+C8=;
	b=DXB5IWGT7hrgBHVkOpOXb1UO4CEnWQ2ZyCsYYOL292osYKjRmkjTXkpmNk2r2MJB6+
	BJD1CJ4oo1+kSd8+bFWhizIs6s7UPHRJvLG8zHiD0UGJPq6D5OEwm0xRhVyKU2CJCNxL
	EXPnCAj71ZwHM0s2WyZLYyMVB7JFsL4tUo25GYczYyjxSZrheqGYxFpBrrPDAVQJo32j
	1X68nMnIvu6UmKvo5Y3d8VnyBUnSWlicyFVxIk41pypM1lbWrE2LgjUzZkpBpMyzINyy
	cFyPryWxoKxzsqxJWzYAw/+Mcor5JZzGr2cKcPfRTQ1PRsy2J2vfFD5Xx6XLSmmicH7l
	umsw==
X-Gm-Message-State: ALKqPwc4fuOc7xU4MrsO7jKND0RY3wV6f2oK576hkVPjNGnZf+JzEiMX
	TVA+OPjwtmgre4OSpfjvZJk+0Q==
X-Google-Smtp-Source: ADUXVKLoPxum1owa2yA2Bo8NJ2UyUBGoZ2/BW7ta1h64FpqYp0dYzEEygrHu8WL1GtvoZfVviYcklQ==
X-Received: by 2002:a19:7b11:: with SMTP id
	w17-v6mr2404248lfc.103.1527709248580; 
	Wed, 30 May 2018 12:40:48 -0700 (PDT)
Received: from peterliu-Precision-M4800.lan (d83-183-77-184.cust.tele2.se.
	[83.183.77.184]) by smtp.gmail.com with ESMTPSA id
	e21-v6sm3228310lfg.74.2018.05.30.12.40.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 30 May 2018 12:40:47 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 May 2018 21:40:43 +0200
Message-Id: <1527709243-13517-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] kernel-uimage.bbclass: use boolean to check KEEPUIMAGE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 May 2018 19:40:48 -0000

From: Ming Liu <liu.ming50@gmail.com>

It now accepts yes/on/1 as positive values.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/kernel-uimage.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
index 1d8656e..a3a3d33 100644
--- a/meta/classes/kernel-uimage.bbclass
+++ b/meta/classes/kernel-uimage.bbclass
@@ -9,9 +9,9 @@ python __anonymous () {
         # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
         # to kernel.bbclass . We override the variable here, since we need
         # to build uImage using the kernel build system if and only if
-        # KEEPUIMAGE == yes. Otherwise, we pack compressed vmlinux into
-        # the uImage .
-        if d.getVar("KEEPUIMAGE") != 'yes':
+        # KEEPUIMAGE == yes|1|on. Otherwise, we pack compressed vmlinux
+        # into the uImage.
+        if not oe.types.boolean(d.getVar("KEEPUIMAGE")):
             typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE") or ""
             if "uImage" in typeformake.split():
                 d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('uImage', 'vmlinux'))
-- 
2.7.4


