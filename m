Return-Path: <nathangutzmann@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8AE4165CC2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 21:45:47 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id x188so21997364pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Mar 2016 13:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vhIRfkOZG4CYnRJuWwXmyVczLGfijpglEq1kkaVqLug=;
	b=yfeR4pzQpUYgjMk73CUix4buoI1+enX1U1PkfOSlCxR/u+bA5MimDjJ7F9ws4s2Rd2
	u6eTVf6BwdelyPwhuq3uJDrS9YQUqiX3+plebyIoeWFPoiGAX09R5s2b2hPt2N+/lULH
	3RDUwfa4xBhLB6IkuRrIvcaTImjTfnwxuINjk6JGK5nocCnCvzKHJ1Vo+4NoMX4SrOeh
	3+0w5nvK8V6qiWB75PbUc1zkl8SwSS7uG6Xwfu1+sOBJ91Kl9M2OBVcKbWVo+uCLWrdK
	71y7gKpFXTHlUoWc53g3PJibcc0ZCVkBbw9ue3D7MyaRwlZw+ngZdt/TKCZn0rvPRiKA
	sODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vhIRfkOZG4CYnRJuWwXmyVczLGfijpglEq1kkaVqLug=;
	b=LrvIKMSH+BzgFFkcNxT+Giz+q1MCjWm7Al9W6SWybUMlqQpyLGMdYq5pLX2ALi2UCo
	6+TPgrjd5W7N9b4ukSa0gEPEDvOXuKaHxp5NLjn58ZsenePH4SLzRwnKRF71vBa4fE55
	0uh56c3zkk+NgUSeEulaGjqFD8VBTBT1OVf3UvfdQLHjPo0C889oxQRw6R2msXpsg3kT
	LtVCPhTQUpF2lBXAiNSvbYZR4MDSQdww48cw71CVA63EEfMkXtsa867gghetHoPesLFp
	oEFemQzDwEvrcDEuC/zbemnM9I+soeZqsSUXp6dcfuDyb0ZHYFoFVShrDnLctyRt0Jcv
	J1eA==
X-Gm-Message-State: AD7BkJL/bOIWPNQQGo27OS8VfMBWk9Pf2/RUaIvyoxGSTaooFi6V/SakdkUHltx0rjs5Vw==
X-Received: by 10.98.16.198 with SMTP id 67mr45300887pfq.21.1457473548065;
	Tue, 08 Mar 2016 13:45:48 -0800 (PST)
Received: from ngutzmann-fedora.int.pason.com ([69.58.16.39])
	by smtp.gmail.com with ESMTPSA id 9sm7123031pfm.10.2016.03.08.13.45.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Mar 2016 13:45:47 -0800 (PST)
From: ngutzmann <nathangutzmann@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Mar 2016 14:49:20 -0700
Message-Id: <1457473760-8486-1-git-send-email-nathangutzmann@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [meta-oe][PATCH] nettle: The variable named p in the patch file was incorrectly named.
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
X-List-Received-Date: Tue, 08 Mar 2016 21:45:48 -0000

The variable in question should have been called ecc->p. The patch has been updated
so that the compilation of the nettle recipe would complete successfully.

Signed-off-by: ngutzmann <nathangutzmann@gmail.com>
---
 meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patch b/meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patch
index 1c4b9a9..a956f42 100644
--- a/meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patch
+++ b/meta/recipes-support/nettle/nettle-2.7.1/CVE-2015-8803_8805.patch
@@ -40,7 +40,7 @@ Index: nettle-2.7.1/ecc-256.c
        u1 -= cy;
 -      u1 += cnd_add_n (t, rp + n - 4, ecc->p, 3);
 +
-+      cy = cnd_add_n (t, rp + n - 4, p->m, 2);
++      cy = cnd_add_n (t, rp + n - 4, ecc->p, 2);
 +      u0 += cy;
 +      u1 += (u0 < cy);
        u1 -= (-t) & 0xffffffff;
-- 
2.1.0


