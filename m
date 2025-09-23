Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62CF5CAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 15:42:21 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.14998.1758628567004718019
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:56:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JfRhPNx7;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b47174b335bso874691a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 04:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758628566; x=1759233366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0CJJ8ySW4s75tynIMwKv6339OAVJM35hBBWES/Jbmx0=;
        b=JfRhPNx7zX8gNdMUvf4QDJJjjiixE9TtChpKfhLlgsaTjyloFY5PZHCiwM3Jxi4bt2
         2CQAC9EvJLPExZNAhOD0hGUxhjwpFeRN34a2zAWjefBeLNzqIRzRqJidceqlFslVxOyj
         7pkY0XBSJk8mfXm2Di8Lquc2SIhqqM+vDLbhEZe112d7ag36kv2ZbkmwPW0MkkZzEhnH
         p857SN705aOe1KoSvJtqaklxdcpvaz2PTsuU7GDJRe1XLIG4iFwy+1f19hLbLVvcVPZ+
         1BV9IEdPo+nbmB92DcjDP0Pn6swjAhuOjfPknBQlyw6kfsBiZc67SaYXlV4DjDp+dugz
         QrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758628566; x=1759233366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0CJJ8ySW4s75tynIMwKv6339OAVJM35hBBWES/Jbmx0=;
        b=wM3NFChEc3J0PZuaXCqbiqBM2UTL019Q8Do27wDUKZA6SU/8oTH8VtO6fqs4CYuXlJ
         gQ9trWg/d+EX5G2P2zztk4tZxR8EFosKHQDy0B1Iqi5+YdhWUMx8byAzNfonsv3Dn8VD
         D30105s1Kg2UaL4NbXjJqwfH0V972MQG3THfgQMds1XftikWZ5owkGdornuMpjFEPZPC
         SW4cENyQP2zfXheh53h5WG+mGvD1K3GOz//rj8XalHvsc6T9fk/pBsZaujJdJ+SOLlLH
         3l93BUfy/LZEK7uB0fp4MCOlTwtG+8lXzyRYnC72h8poLGD58WbMg1whpWgaW0bKrMap
         tssw==
X-Gm-Message-State: AOJu0YxsJGPiux5rSS9rfk5nrFdNJ54L8/P3G/3N+bnFVp+zN/S1Md68
	YjXQWukMmShKqedaRV7wgtbKUn9kjDetZIkR3vYbH1bTSTiMKR4g91aOCdlDFeV2
X-Gm-Gg: ASbGncs9bLuxKdZI+FYZ4U8xOlpySiU3Lj53imj6TDgDGOnvEEi15o5AcqCvHncOPk8
	sVaUW+yjENVt49/Y7o9xdzUYdhgRETEdG/YaQe/FqUwO75LvEtdth3EypbDNiz38f86nBnn7Msx
	LfB+FIaoaBDaCS4+IwqlKtUAeuGY7cXR4hy20D89pYcLGCaLoFCf7rWWLPrqa5OP9EKPO8BUyFs
	iDado1kxIQTbu4G0OFydAwFF028mos/IHQZT1KGtu4Yn65TzaDOEu+Va79KTOZ5YYP2+5/MhC3g
	oW/QitxeJg9EzU7zbpBSuYil4wAVyHNujPvHYQKipRecJn7O+gbO51+uiXARuP3zQXwbFkeyClU
	bsxjQLcUlGNws492nvRumiCf8eLvfBLwM8jmfgfvBZB4=
X-Google-Smtp-Source: AGHT+IEHspRbj0vg37rJdTAbXCzXafO10qZR51oKoZAxkTtXwjVX0yReEdVJkL0XAzYez9xYdA0u8g==
X-Received: by 2002:a05:6a00:18a9:b0:77f:1a6a:e72b with SMTP id d2e1a72fcca58-77f539e8f49mr1498477b3a.5.1758628107491;
        Tue, 23 Sep 2025 04:48:27 -0700 (PDT)
Received: from LL-3324L.kpit.com ([2401:4900:1c45:4aaf:f702:9ced:7f9b:68e6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f4594a76bsm4274840b3a.62.2025.09.23.04.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 04:48:26 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Divyanshu.Rathore@bmwtechworks.in,
	Florian Westphal <fw@strlen.de>,
	Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
Subject: [OE-core][scarthgap][PATCH] examples: genl: fix wrong attribute size
Date: Tue, 23 Sep 2025 17:20:20 +0530
Message-Id: <20250923115020.2728131-1-nitin.wankhade333@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 15:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223897

This example no longer works on more recent kernels:

genl-family-get
error: Invalid argument

dmesg says:
netlink: 'genl-family-get': attribute type 1 has an invalid length.

Fix this and also zero out the reserved field in the genl header,
while not validated yet for dumps this could change.

Upstream-Status: Backport [https://git.netfilter.org/libmnl/patch/?id=54dea548d796653534645c6e3c8577eaf7d77411]

Reported-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
Signed-off-by: Florian Westphal <fw@strlen.de>
(cherry picked from commit 54dea548d796653534645c6e3c8577eaf7d77411)
Signed-off-by: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
---
 ...amples-genl-fix-wrong-attribute-size.patch | 44 +++++++++++++++++++
 meta/recipes-extended/libmnl/libmnl_1.0.5.bb  |  5 ++-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libmnl/files/0001-examples-genl-fix-wrong-attribute-size.patch

diff --git a/meta/recipes-extended/libmnl/files/0001-examples-genl-fix-wrong-attribute-size.patch b/meta/recipes-extended/libmnl/files/0001-examples-genl-fix-wrong-attribute-size.patch
new file mode 100644
index 0000000000..9e06abb9a4
--- /dev/null
+++ b/meta/recipes-extended/libmnl/files/0001-examples-genl-fix-wrong-attribute-size.patch
@@ -0,0 +1,44 @@
+From 67ad7abf1fe888c650f9e8ed326a499e1456285c Mon Sep 17 00:00:00 2001
+From: Florian Westphal <fw@strlen.de>
+Date: Mon, 15 Sep 2025 14:40:30 +0200
+Subject: [PATCH] examples: genl: fix wrong attribute size
+
+This example no longer works on more recent kernels:
+
+genl-family-get
+error: Invalid argument
+
+dmesg says:
+netlink: 'genl-family-get': attribute type 1 has an invalid length.
+
+Fix this and also zero out the reserved field in the genl header,
+while not validated yet for dumps this could change.
+
+Upstream-Status: Backport [https://git.netfilter.org/libmnl/patch/?id=54dea548d796653534645c6e3c8577eaf7d77411]
+
+Reported-by: Divyanshu Rathore <Divyanshu.Rathore@bmwtechworks.in>
+Signed-off-by: Florian Westphal <fw@strlen.de>
+(cherry picked from commit 54dea548d796653534645c6e3c8577eaf7d77411)
+Signed-off-by: Divyanshu Rathore <divyanshu.rathore@bmwtechworks.in>
+---
+ examples/genl/genl-family-get.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/examples/genl/genl-family-get.c b/examples/genl/genl-family-get.c
+index ba8de12..0c20067 100644
+--- a/examples/genl/genl-family-get.c
++++ b/examples/genl/genl-family-get.c
+@@ -199,8 +199,9 @@ int main(int argc, char *argv[])
+ 	genl = mnl_nlmsg_put_extra_header(nlh, sizeof(struct genlmsghdr));
+ 	genl->cmd = CTRL_CMD_GETFAMILY;
+ 	genl->version = 1;
++	genl->reserved = 0;
+ 
+-	mnl_attr_put_u32(nlh, CTRL_ATTR_FAMILY_ID, GENL_ID_CTRL);
++	mnl_attr_put_u16(nlh, CTRL_ATTR_FAMILY_ID, GENL_ID_CTRL);
+ 	if (argc >= 2)
+ 		mnl_attr_put_strz(nlh, CTRL_ATTR_FAMILY_NAME, argv[1]);
+ 	else
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/libmnl/libmnl_1.0.5.bb b/meta/recipes-extended/libmnl/libmnl_1.0.5.bb
index 66b30d7f60..d0bf658eef 100644
--- a/meta/recipes-extended/libmnl/libmnl_1.0.5.bb
+++ b/meta/recipes-extended/libmnl/libmnl_1.0.5.bb
@@ -6,7 +6,10 @@ SECTION = "libs"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "https://netfilter.org/projects/libmnl/files/libmnl-${PV}.tar.bz2"
+SRC_URI = "https://netfilter.org/projects/libmnl/files/libmnl-${PV}.tar.bz2 \
+           file://0001-examples-genl-fix-wrong-attribute-size.patch \
+"
+
 SRC_URI[sha256sum] = "274b9b919ef3152bfb3da3a13c950dd60d6e2bcd54230ffeca298d03b40d0525"
 
 inherit autotools pkgconfig
-- 
2.34.1


