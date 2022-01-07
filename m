Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D74C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 13:53:52 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.6517.1641563631149791301
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 05:53:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HlPbmZ7+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id r9so9430914wrg.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 05:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=m0LglH5/NyzuJzosRegJMEcX9xuOUEdxv23lb2udnTA=;
        b=HlPbmZ7+RFcPs1p/cu1ZIEzKfWy4P08Bgvli1kzHIb6UQ5OHeNpH+N5MT/0Irtn+pu
         yHL8reD2uDLg86U1EyzsafKvjCqXaX8+ps1FNC8KyojDuXIFm6kskOhhv/+thd/AwxbV
         90r6eBZdd5+XNcPFHV5lI+n4ZFfVaIsQpYTL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m0LglH5/NyzuJzosRegJMEcX9xuOUEdxv23lb2udnTA=;
        b=la+C5q4kFRR//jz3qbHpJUgUwx+Q4S50Px3cy3q3EGjU0hxnFLpm5wf5Bip/NRn1H/
         Oc2YhV8gujWb9UIF+773P0hSqlMXQRFvK8GuOk17BBj/343SvDWtOws0oolE/Vt9yME0
         gZ0Vs+XqNuHs1wW3Zq6BpGotLIR+Rbu4Vk9W+AAjLYHdsphYBnnt3bgy+SUt8TGK0Ovt
         cmeApMODgSd585VFr2s3gncfuDvATOpJs5FsSXBjDHehrlbn0hJs4UcBFu5cjtCHUwGa
         mU2K2tfdc/IPAl4RHJhltKFpM84Mmv+9gxIMGraRIdbXjgofD10yKeg564oeFVOXqGKU
         HztQ==
X-Gm-Message-State: AOAM532llTftpZhKyB8B6gtBJmeskLkTFN+s9owrQe3q39ePgBk7oMIv
	CMNxrS+fmEgJ8ffQCDbw8QNed4e3OQR+hw==
X-Google-Smtp-Source: 
 ABdhPJxM8PP9nsm/OmTwhGVmOjrDTqI7grYIm3SwlQqdIFhncWasXSHGEgn1UVEByeLRyL1EjsTAWw==
X-Received: by 2002:a5d:47c6:: with SMTP id o6mr56398997wrc.326.1641563629628;
        Fri, 07 Jan 2022 05:53:49 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:df67:6706:4d53:dd6b])
        by smtp.gmail.com with ESMTPSA id
 m12sm5581776wrp.49.2022.01.07.05.53.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 05:53:49 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] gtk-doc/meson: Fix typos
Date: Fri,  7 Jan 2022 13:53:48 +0000
Message-Id: <20220107135348.1505019-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220107135348.1505019-1-richard.purdie@linuxfoundation.org>
References: <20220107135348.1505019-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jan 2022 13:53:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160259

Fix a couple of function name typos copy and pasted between the classes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/gtk-doc.bbclass | 2 +-
 meta/classes/meson.bbclass   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/gtk-doc.bbclass b/meta/classes/gtk-doc.bbclass
index 7149bc06c0b..07b46ac8299 100644
--- a/meta/classes/gtk-doc.bbclass
+++ b/meta/classes/gtk-doc.bbclass
@@ -63,7 +63,7 @@ export GIO_MODULE_DIR=${STAGING_LIBDIR}/gio/modules-dummy
 GIR_EXTRA_LIBS_PATH=\`find ${B} -name *.so -printf "%h\n"|sort|uniq| tr '\n' ':'\`\$GIR_EXTRA_LIBS_PATH
 GIR_EXTRA_LIBS_PATH=\`find ${B} -name .libs| tr '\n' ':'\`\$GIR_EXTRA_LIBS_PATH
 
-# meson sets this wrongly (only to libs in build-dir), qemu-wrapper_cmdline() and GIR_EXTRA_LIBS_PATH take care of it properly
+# meson sets this wrongly (only to libs in build-dir), qemu_wrapper_cmdline() and GIR_EXTRA_LIBS_PATH take care of it properly
 unset LD_LIBRARY_PATH
 
 if [ -d ".libs" ]; then
diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index ffec5f32698..0bfe9458118 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -124,7 +124,7 @@ do_write_config:append:class-target() {
 # which may then get deleted (or their dependencies) and potentially segfault
 export GIO_MODULE_DIR=${STAGING_LIBDIR}/gio/modules-dummy
 
-# meson sets this wrongly (only to libs in build-dir), qemu-wrapper_cmdline() and GIR_EXTRA_LIBS_PATH take care of it properly
+# meson sets this wrongly (only to libs in build-dir), qemu_wrapper_cmdline() and GIR_EXTRA_LIBS_PATH take care of it properly
 unset LD_LIBRARY_PATH
 
 $qemu_binary "\$@"
-- 
2.32.0


