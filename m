Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 432DFC6FA86
	for <webhook@archiver.kernel.org>; Wed, 14 Sep 2022 02:26:30 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web11.1790.1663122383210231220
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 19:26:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=rC2P1Hvk;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f176.google.com with SMTP id bh13so13049136pgb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 19:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=kjFgVOmRytCE1DgIntT80nOHDFyElxQeAoID7z/PAAk=;
        b=rC2P1Hvkz2940uRkUsVppsoQKhFFbyQCD7uEHDCxgu9XkKE6s3vpBrMQvyTfw7vobf
         NfwoFNwFSYq1FIFJrAzAQtrMInX4y7BYmaIEPDa5S1dz36slZsSucwCD9Ko1bi/qMDU8
         5+ckc8+0hFjuuTT+5UJwXBQO2eFicCgBiPKfQqF/allk3FhhRRmDHGNHlhLpX8DZsmcM
         HnXGTm+QOJKf5X79hP3S5hU3vil5o3XOcEQuo5kZ4IRw+LmQg7Tk/a6ZqBj2JkSBM7Ma
         8ANHO6Y6K+wavCsHG6/fv6UwfhRWEDakkc7R9J9TnVi8JVjwYs213SjRUSF1wMwSDrNd
         bN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=kjFgVOmRytCE1DgIntT80nOHDFyElxQeAoID7z/PAAk=;
        b=DGDNJFioHf21gMVBD9+jVQkuld7DU3MdEcUyqBdBvH09BlA78zhqPehVr7pc1xvBMX
         jzrjNGc3VbNrgCj6OZ+2EjSacZ6GQR6hoy1V5L0bTmAg+RdNLzE+NpbKeNaNVuoRrWuP
         SLyfgOsXjRPjl0836BBzfboMTGz2nPqRDqBI+ZYY8stGo0QExkT/vJmgvI4gSZ4te6ip
         I+tuw3Sxw57/OIlO8xq8SLfjFjFmFYbYIhKcpYhkGoR9SUTB8Vtxo/u7WpsMcYf3mYkJ
         XOMGIZC5LI9FVN8uLtGdTUEFS1JMMnAPKw5Oxb1hV85lVk2SE2/D2eHdw/n8NLnBq3YF
         bnXw==
X-Gm-Message-State: ACgBeo0YO7B94Hsd29Neuz8Q4Ic72/ivKTyF+DlGME9eX9lHJGTwij2v
	Pm6iB2LTu3tUfQaDketeEDMckI+fFUdhdmux
X-Google-Smtp-Source: 
 AA6agR626KkkBFT1qO1aJ6a/5v4goIW9ZdVRAmzut4UBUnEK4LKk90WNp5z2bXFzynZlDQ2rq/rHbA==
X-Received: by 2002:a05:6a00:1308:b0:53a:9663:1c19 with SMTP id
 j8-20020a056a00130800b0053a96631c19mr35835474pfu.60.1663122382229;
        Tue, 13 Sep 2022 19:26:22 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 s14-20020a65644e000000b00438fe64d61esm5259871pgv.0.2022.09.13.19.26.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 19:26:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 9/9] binutils : CVE-2022-38533
Date: Tue, 13 Sep 2022 16:25:19 -1000
Message-Id: 
 <2cf26e2e5a83d2b2efd01de34c11da07eeb9c8f9.1663122098.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663122098.git.steve@sakoman.com>
References: <cover.1663122098.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Sep 2022 02:26:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170627

From: Florin Diaconescu <florin.diaconescu009@gmail.com>

Upstream-Status: Backport
[https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ef186fe54aa6d281a3ff8a9528417e5cc614c797]

Signed-off-by: Florin Diaconescu <florin.diaconescu009@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.34.inc                |  1 +
 .../binutils/binutils/CVE-2022-38533.patch    | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2022-38533.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.34.inc b/meta/recipes-devtools/binutils/binutils-2.34.inc
index 6a55de2d45..ff0d467132 100644
--- a/meta/recipes-devtools/binutils/binutils-2.34.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.34.inc
@@ -52,5 +52,6 @@ SRC_URI = "\
      file://CVE-2021-3549.patch \
      file://CVE-2020-16593.patch \
      file://0001-CVE-2021-45078.patch \
+     file://CVE-2022-38533.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2022-38533.patch b/meta/recipes-devtools/binutils/binutils/CVE-2022-38533.patch
new file mode 100644
index 0000000000..102d65f8a6
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2022-38533.patch
@@ -0,0 +1,37 @@
+From ef186fe54aa6d281a3ff8a9528417e5cc614c797 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Sat, 13 Aug 2022 15:32:47 +0930
+Subject: [PATCH] PR29482 - strip: heap-buffer-overflow
+
+	PR 29482
+	* coffcode.h (coff_set_section_contents): Sanity check _LIB.
+
+CVE: CVE-2022-38533
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=ef186fe54aa6d281a3ff8a9528417e5cc614c797]
+
+Signed-off-by: Florin Diaconescu <florin.diaconescu009@gmail.com>
+
+---
+ bfd/coffcode.h | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/bfd/coffcode.h b/bfd/coffcode.h
+index dec2e9c6370..75c18d88602 100644
+--- a/bfd/coffcode.h
++++ b/bfd/coffcode.h
+@@ -4170,10 +4170,13 @@ coff_set_section_contents (bfd * abfd,
+ 
+ 	rec = (bfd_byte *) location;
+ 	recend = rec + count;
+-	while (rec < recend)
++	while (recend - rec >= 4)
+ 	  {
++	    size_t len = bfd_get_32 (abfd, rec);
++	    if (len == 0 || len > (size_t) (recend - rec) / 4)
++	      break;
++	    rec += len * 4;
+ 	    ++section->lma;
+-	    rec += bfd_get_32 (abfd, rec) * 4;
+ 	  }
+ 
+ 	BFD_ASSERT (rec == recend);
-- 
2.25.1


