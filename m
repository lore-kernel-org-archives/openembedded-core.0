Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73C6AC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 22:29:32 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web12.2377.1647901771037134939
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 15:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Jad14TUP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id s11so16653276pfu.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 15:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zgd3HZs5VTghDUhMxst35gSWSij0LxI4ZDUwpzdP3uA=;
        b=Jad14TUPlcGhnbjNvxObNUT31EY7vYok8qftfCf/gfCdBps6McjCVmp10p7eD9OyT5
         g3Ikha0XN0fEibRehjzyP2F0CXVeYjM7F6ls9OYd3KJM11j+UrB6zTnT1lOdoHbcd1IQ
         H0ztZmNV0NOGXbYMPjszDe94hj7N4sJWExk6x8lKEsuBOH+3gGrKALUpQdZBMUg6AU+/
         K99APBwy2fPW5juuudSqEcsietIOuWG/LZkT1iGbP2M0oRAABZ073cOnBVX6Q8ZkyR3T
         rpkcnatsYNr5u3LIJhcsgLOSwDaEcjbp+y4ghOgB1XHloE6VJpNrvNQyDbr2faalOaah
         6x6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zgd3HZs5VTghDUhMxst35gSWSij0LxI4ZDUwpzdP3uA=;
        b=ii891bKk4ymnbuPl4q8/o9TjxToT3NrltOtCn1tVi/veTNgN1M5AqEn1sS3aD3dxdC
         gEVbXVtdHWsHEj6OgbBkroDDVUk3LtxllRUaxQRMvKJPmX0pLloADMF6vSb1luH8TXnj
         Guj7cn2AlMxiR80T0GKK3kmMT2tXTPp6B6Xh+YVGlXF2WPqxoJYnPXjxv+qbF5JCaiBT
         8CuXGrop/uBGR0YTJNQXqb25k3rOLcFAHqaOy6g9ZbD+RKo6Jo+UrkS1GQBOxqL+vS1D
         DKPGA95Il/AjO4alfapbAFdvi5piPAMwNOyBp5hPo6Ff+4m1F/zgybZbdT+BLD7cXMzy
         L1Ug==
X-Gm-Message-State: AOAM5314pk/EzVLL3+P+uhNzPVSUGe/yN3qO8/bVhhhB79EdW0BHDFYO
	ixQwnLKtma9/gDxgGa03NYqF0JjCyAPbwXashCY=
X-Google-Smtp-Source: 
 ABdhPJw9ZhKC7qWTpBz6DaQSXKL0IgWpHxCgmTmdfy7CZNlViZY0GTfHJfR3VRgC0VCs5a8KrLiRlg==
X-Received: by 2002:a65:62d0:0:b0:381:d38:c7b0 with SMTP id
 m16-20020a6562d0000000b003810d38c7b0mr19852893pgv.186.1647901770076;
        Mon, 21 Mar 2022 15:29:30 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 k13-20020aa7820d000000b004fa72a52040sm12352649pfi.172.2022.03.21.15.29.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 15:29:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/13] libxml2: move to gitlab.gnome.org
Date: Mon, 21 Mar 2022 12:29:02 -1000
Message-Id: 
 <38681a213a3b5f57b37257f7d96c4e970032ffe4.1647901591.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1647901591.git.steve@sakoman.com>
References: <cover.1647901591.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 22:29:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163515

From: Ralph Siemsen <ralph.siemsen@linaro.org>

The project has migrated from www.xmlsoft.org to gitlab.gnome.org.
Update the homepage accordingly, and use gnomebase to construct the
download URL, rather than including it in SRC_URI explicitly.

Note that the download is now in .xz format rather than .gz, so the
sha256sum is updated accordingly. Post-decompression tarballs are
identical, so there is no change to the libxml2 code.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8bc17ceb997f8f31a03e5f5efc41c03ef1df3add)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/libxml/libxml2_2.9.10.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index 1b22e5672c..976eeca1d4 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -1,6 +1,6 @@
 SUMMARY = "XML C Parser Library and Toolkit"
 DESCRIPTION = "The XML Parser Library allows for manipulation of XML files.  Libxml2 exports Push and Pull type parser interfaces for both XML and HTML.  It can do DTD validation at parse time, on a parsed document instance or with an arbitrary DTD.  Libxml2 includes complete XPath, XPointer and Xinclude implementations.  It also has a SAX like interface, which is designed to be compatible with Expat."
-HOMEPAGE = "http://www.xmlsoft.org/"
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/libxml2"
 BUGTRACKER = "http://bugzilla.gnome.org/buglist.cgi?product=libxml2"
 SECTION = "libs"
 LICENSE = "MIT"
@@ -11,8 +11,9 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=2044417e2e5006b65a8b9067b683fcf1 \
 
 DEPENDS = "zlib virtual/libiconv"
 
-SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
-           http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=testtar \
+inherit gnomebase
+
+SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=testtar \
            file://libxml-64bit.patch \
            file://runtest.patch \
            file://run-ptest \
@@ -30,8 +31,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://CVE-2022-23308.patch \
            "
 
-SRC_URI[libtar.md5sum] = "10942a1dc23137a8aa07f0639cbfece5"
-SRC_URI[libtar.sha256sum] = "aafee193ffb8fe0c82d4afef6ef91972cbaf5feea100edc2f262750611b4be1f"
+SRC_URI[archive.sha256sum] = "28a92f6ab1f311acf5e478564c49088ef0ac77090d9c719bbc5d518f1fe62eb9"
 SRC_URI[testtar.md5sum] = "ae3d1ebe000a3972afa104ca7f0e1b4a"
 SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7"
 
-- 
2.25.1


