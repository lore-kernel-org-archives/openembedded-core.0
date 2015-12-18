Return-Path: <matt@madison.systems>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 978B86FFEC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 14:35:20 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id o64so50031997pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 06:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UOokn7W7m9v0dR/HwgSCPKnbP7tRAdYnAK1UFtVMtK0=;
	b=vGlUQvtF9XA3uXPYpgJAt24R0u+NCXKlJZAKk9jBKAEXYNcmNk75h6b2MfMCgoj2f4
	gxEg1k9HO2Jv/jQ4eRelAA3cxVdqTdJ3IEpz70n3ajzSLz00QIdA/RwZN878bChDSo7s
	jOb9/3Oyrru+L4LqfVS79IBOQuO1LQdciZ3ju9YF++vrQ8qL/8SiySOrz2qz6hBY7nES
	aVU459FOlvDDAtoxe1wPwcKSM8Q4XLXV7mgYRKp+xBjjNh5WrqHQH5Jhu9YSCdBBv4r4
	TwOxH06WGNyeaUwNGSW0Cr34QELdDlWnrgBSijVmBGNNCsBwgSAw7VfF/LWdfgVgdk/I
	zYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UOokn7W7m9v0dR/HwgSCPKnbP7tRAdYnAK1UFtVMtK0=;
	b=DIWMLFkG7rDPllSh5ZW/DK8fsvf8V5x8ZwPw/EuPQnpZZlchc9SpyP0v9lhm8KD69Y
	CK6DNGcHUvUqAs9pFCBU1zip58rH6lHKRyeNsoqlfbUBhDzKlw2NLNqQxohg20MOWXBu
	Ug9jLH6Vz59ExPPP8FdNbC1qp72oHDPJshB/KgXC648JXrtcugqm9AkMiLxW4KKu4chF
	gRnQ4WUTl2IRcwux6xjSeaSfh6H31L6CqrZBjG/S8GEHrqbqK4hkyKaT3vEYAIgiQBmB
	OL6ck2bRncpzeN1MneLbkcyDHYRTv5GEgCPX4vznyF4AkPAtL5VivrijHQhq6y3BR71X
	n3lA==
X-Gm-Message-State: ALoCoQm/a5UqmiESKtuhhlDcrSKzvsgVMnAPRUrMWk5VuztagSkWfCbXDQkptc3JvM26MYIRab98EP6D9+q6r/+xGH6lmvw5NA==
X-Received: by 10.98.12.150 with SMTP id 22mr5624994pfm.46.1450449321275;
	Fri, 18 Dec 2015 06:35:21 -0800 (PST)
Received: from workhorse.madison.systems
	(70.90.175.93-BusName-ca.sfba.hfc.comcastbusiness.net.
	[70.90.175.93]) by smtp.gmail.com with ESMTPSA id
	l66sm18429653pfj.71.2015.12.18.06.35.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 Dec 2015 06:35:19 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Dec 2015 06:34:31 -0800
Message-Id: <1450449271-28582-4-git-send-email-matt@madison.systems>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1450449271-28582-1-git-send-email-matt@madison.systems>
References: <1450449271-28582-1-git-send-email-matt@madison.systems>
Subject: [PATCH v2 3/3] package_deb.bbclass: add 'Multi-Arch: foreign' tag to allarch packages
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
X-List-Received-Date: Fri, 18 Dec 2015 14:35:22 -0000

This tells APT that it can use such packages to resolve dependencies
from packages of any architecture in a multilib build.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/classes/package_deb.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 8d27adf..25218d0 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -161,6 +161,8 @@ python do_package_deb () {
             return l2
 
         ctrlfile.write("Package: %s\n" % pkgname)
+        if d.getVar('PACKAGE_ARCH', True) == "all":
+            ctrlfile.write("Multi-Arch: foreign\n")
         # check for required fields
         try:
             for (c, fs) in fields:
-- 
2.5.0


