Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B0F3978B4F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 14:51:20 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i139-v6so15076937wmf.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jul 2018 07:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=2XO3rlo+ThpRs4U+DW6urtrFRzl1JoVHbPyXLsb09nE=;
	b=KKC42NGT5+BR06RObqE9zSdfcvWkeKI76Fnx73TQkuWwgrZlR7ouVpV+gsTn4zEPqC
	tBBDN0CESWahJ0rywGVKBvl/2Xii4/vzUpQV1oY4InschoiEQR8OV7dgaHV4h2MiBksi
	i+Uz2qufYu52IELjd9aqDH/lS7BWNLwzc9I0CM32gZ6EIRExwoVmYVDa/tNGSASogZSg
	EnaMTcKiOBl1mQS0fdzvqZpvt3SN7QYV4n37PCmX2ilFvbdfGHAaBMUZnNuWYomV7QPp
	XCjJQVuySLq3BKANTNUvY2E+xM1i1BtLnh4PP8cvH/7kdEoYFNB4CvJrs5lExmnwwpNy
	D+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=2XO3rlo+ThpRs4U+DW6urtrFRzl1JoVHbPyXLsb09nE=;
	b=IjfjgDCQaPRnYEyxJooYH/scMuxW+yW2my/NbaSiZkw5daHnt7e0NG8LhL0RC02Fn8
	SEOwwq6qGeGLafWkaa1FpDYQbBH6ZDuvwvLxvpGaTN1crU+I80lv6s3DHOSzAL1QS6NA
	xurVjI5lKZ9SibgtTDLZ0gJEyi4lMd8kVwis94dro+jGsjVTBhNhh7hHrdFd19tEo501
	uQlrCm/Qg3wuNeym5VAP4EQswXS60tl7rAy4uQPW8YnJLB/ys0U3FlOhFvKrm3VsTfrT
	hNrKnAaKVWjRxI+aWr3WCOn1ryibjSauSILEex0IY7OoLGw9RHQMied2RvF5rLUCpn2H
	DuFA==
X-Gm-Message-State: APt69E1R4xqYk/uu1uIolZzSIc1tyUuUqMJu9NSIVFwU09qLj/WPX1rQ
	7hI5x70Xx4oUiEKmsuppFXBcef0b
X-Google-Smtp-Source: AAOMgpfBoET6klxKI8BOhI1SfkrJElTI56Q3seYZh73kBB/O+pGJzsyZAKk/e8B4vZSj6ekZtOIR8w==
X-Received: by 2002:a1c:4d09:: with SMTP id
	o9-v6mr7469625wmh.111.1530888681321; 
	Fri, 06 Jul 2018 07:51:21 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	72-v6sm3321672wmh.0.2018.07.06.07.51.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jul 2018 07:51:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jul 2018 15:51:16 +0100
Message-Id: <20180706145116.30481-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180706145116.30481-1-ross.burton@intel.com>
References: <20180706145116.30481-1-ross.burton@intel.com>
Subject: [PATCH 2/2] meson: map mipsel TARGET_ARCH to mips for the cross file
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
X-List-Received-Date: Fri, 06 Jul 2018 14:51:21 -0000

Meson uses 'mips' for both big- and little-endian MIPS machines, so map mipsel
to mips.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/meson.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 13a6f948756..0c9bf73596a 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -52,6 +52,8 @@ def meson_cpu_family(var, d):
     arch = d.getVar(var)
     if arch == 'powerpc':
         return 'ppc'
+    if arch == 'mipsel':
+        return 'mips'
     elif re.match(r"i[3-6]86", arch):
         return "x86"
     else:
-- 
2.11.0


