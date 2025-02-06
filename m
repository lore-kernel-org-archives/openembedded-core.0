Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD1BDC02196
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 05:52:32 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.33442.1738821149869405765
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 21:52:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OfGwlxnM;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43690d4605dso2900695e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 21:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738821147; x=1739425947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kuw8nJF1SA1+GfwWvk7h/krpY+etFTLG8ojhJeTWl74=;
        b=OfGwlxnMv4vFT42i5niW87s+rWRhOLANwA8oy3H9MCKQZ3S5vDvq3aCrk/+ElEHpVS
         9NbOq7qt3gj3M8FgowxTFx7OiZ4vMjo1CfFMtOGsY7/qHeFRr/3bkYRV5wpt7C7VVMp6
         1j6gEZoF+kAsgh1eHQmUmcSB/2Lzk6jLe4j54hiwv1YKOtYCAShhXAnZjszGPtkDlDQv
         6JCUZSUenFmdZHxx2+ySlxb/u1/ETVqzLmoTFDJnPSYZ6UZ3cFGwlueYNek2ze5Ng3h8
         1/PiHf6OATh4C3B/UiBTaw9HlHVTlBFm6KpPQaKfwOd6FIW3QMEL+mIolOfx46+8Xs43
         xSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738821147; x=1739425947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kuw8nJF1SA1+GfwWvk7h/krpY+etFTLG8ojhJeTWl74=;
        b=vnt/9iu2WGOr+dgtu4h5XeGfT6cyRwrEC040fMAs3ubiI3TbaSLJ4VwrMUeYwl5zW/
         tWkvc919CT58/TUX4vxyWLgzLOPlrQVS2u8+FMPWjH4DGw3ZUS0CG9YbmrKkakYSSHOg
         r/Udn2cEzRuNUkfjeyJ0hDpnTY8Jy4YJt03fdeB1xS8B0ml7DtKLQ72gtNydwAbUGI0J
         E2rd316MrukOQiVaha/Zm07QckuBJsD10CRxTFczDZzD403oLxSUYDRhKGnlxnvPKEuH
         Iy/0E7mbkrE3r99IvH3Yt7K/PDPQocys+iX541U6idRT0E2wZHdg3ii5V6E8KhzQUv+z
         +RQQ==
X-Gm-Message-State: AOJu0YxpbJRT25F86zwwJmO/eX/3zQGMiAV6DNfeAXN9jprPfiSE6x3L
	dFYx89oUwilAfIqYPNFFDHCPiymbiSYrVaC3m33OaL484NaVlsVVUI2YBw==
X-Gm-Gg: ASbGnctXHojA5IPVHJPdPZd7nwvEuDrEJB9t1MegcO7ztF0U6kSrDJ6tQ+ipk/nEgsb
	aMZk8cLyeiNqzR2h6MrYs78CJD0znjqcyev6sPzOM0ruaXRFEQn2HhaYctLzcbXqka1Ut24tFb5
	hrJZN2OQoL5t3AO/HuuCZnw8xysh1g4DuBV9BLyXy98rJ4A0Ad6pifM/yL58JQ10XAdQOYTFtyi
	y56FIi/rw464AYF42VyzS9HFrqJ4y9KWUFamE7ooIWrlQfSOn67qyploevhv9i0olM3IScm/cQA
	b2qGTYCzza7jpwdV1+1MdbVpUCbR34mJlcK84X5bl8oYwg==
X-Google-Smtp-Source: AGHT+IGXNAQKvCx2dPdlZZyTcpr7ZGOLNWArIL7XkJuk5NkeLEQ/3zAEsu7Qc04iUw0X7O7EV6huIA==
X-Received: by 2002:adf:e7cd:0:b0:38a:888c:6786 with SMTP id ffacd0b85a97d-38db4947964mr2819385f8f.52.1738821147351;
        Wed, 05 Feb 2025 21:52:27 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde0fe37sm777242f8f.69.2025.02.05.21.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 21:52:26 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v8 1/5] rpm-sequoia-crypto-policy: New recipe
Date: Thu,  6 Feb 2025 06:52:18 +0100
Message-ID: <20250206055222.3319167-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 05:52:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210898

This ships a crypto policy file for rpm-sequoia.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../rpm-sequoia-crypto-policy_git.bb          | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index bec55a7c1c..648c8fceb8 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -744,6 +744,7 @@ RECIPE_MAINTAINER:pn-rpcbind = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-rng-tools = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-rpcsvc-proto = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-rpm = "Robert Yang <liezhi.yang@windriver.com>"
+RECIPE_MAINTAINER:pn-rpm-sequoia-crypto-policy = "Zoltán Böszörményi <zboszor@gmail.com>"
 RECIPE_MAINTAINER:pn-rsync = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-rt-tests = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-ruby = "Ross Burton <ross.burton@arm.com>"
diff --git a/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
new file mode 100644
index 0000000000..47ca7ca6a4
--- /dev/null
+++ b/meta/recipes-devtools/rpm-sequoia/rpm-sequoia-crypto-policy_git.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Crypto policy for rpm-sequoia"
+HOMEPAGE = "https://gitlab.com/redhat-crypto/fedora-crypto-policies/"
+
+LICENSE = "LGPL-2.1-or-later"
+
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=a6f89e2100d9b6cdffcea4f398e37343"
+
+DEPENDS = "openssl-native asciidoc-native libxslt-native make-native"
+
+SRC_URI = "git://gitlab.com/redhat-crypto/fedora-crypto-policies.git;protocol=https;branch=master"
+
+# Commit ID for crypto-policies 20250124-1.git4d262e7.fc41
+SRCREV = "4d262e79be1cd15c84cad55ad88c53a2d7712e85"
+PV = "20250124"
+
+S = "${UNPACKDIR}/git"
+
+do_compile () {
+	make
+}
+
+do_install () {
+	mkdir -p ${D}${datadir}/crypto-policies/back-ends
+	install -m644 ${S}/output/DEFAULT/rpm-sequoia.txt ${D}${datadir}/crypto-policies/back-ends/rpm-sequoia.config
+}
+
+BBCLASSEXTEND = "native"
-- 
2.48.1


