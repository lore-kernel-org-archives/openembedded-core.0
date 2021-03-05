Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.12804.1614955706168457839
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:48:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Uy4iWoAq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id p5so1529079plo.4
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JCGrV/ekKbg2P/TQNC59kpzD1IjZFphuj7zYfwLGmlY=;
        b=Uy4iWoAq1E1TPtexcTF3loHHXaau+qwNcLTug+ehe7U8sxD9VXWUuZ0azmJ+ma4UTd
         eR0gDNrkUDEUQWK125HEwPxCNtn4iSYIeey3blyWGzHxGZX2PkDMcqLYsMRgqDjZGTbl
         MO1Kn9ZyeypI2PzEt9Dz3ZqdIp81OWGnADFuDLohJg7vEoptzDI25yLfMNtrC0Zd21LC
         AL6HXSS7LwprKU/nU9Hn0xGYG+SG+V/pR1Gxx6fZm8+iLsSCZOmhTRXjfX0f0c119WYx
         hQTzh9938orcCwcOmu/57KcPaoLzsfTqzVHtwBga9qvcsfRHMRhVfgooSsY2m/ikl8BH
         t5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JCGrV/ekKbg2P/TQNC59kpzD1IjZFphuj7zYfwLGmlY=;
        b=HCLpoOTGp2kyItC6vE7IKER1QOcgm1ZqOoy1XZhYWlKhCUIYTtcIbsyngQ1kx8R66F
         FE++HDIpv299/x4Ewapcmun4XWtm31jmnUpiQSOGaVGvzjJYSl/m/P074P3Y0+Fu24ny
         tQINrVi7SqH//OJAWGHtNUojp9fPUnHYk2T+w9bxgeEGR/BuHzZ9ZvpIIqVBDVWKGY2e
         R+rJzS9L6w+ELd8ig/xJAsGvSUZk0nDa47/PpREV/vW/5WNetzY3OJdI5LWFHNxLb98N
         sOvXQmJopXVUqbfySw0WrwlEzbRdYIbRdAUQ0Tj0wGCkD4pFZ1KX0acXrZKoRE07j3LS
         ldfQ==
X-Gm-Message-State: AOAM532iUU4x0MYNjPX0RYYO6qF64j7FSgAspUE0CvzJOr8L18qilq/k
	HBwkrp6LOEMl/Pbcg4I/AKiOmDFGyuV9zRz/
X-Google-Smtp-Source: ABdhPJwugpoHxuGJDcIJ0aD0rhJDc5odVz3TK7BzgH424PIlpYDwZoXLJXKs2HV1ItKjdevWWhvxvw==
X-Received: by 2002:a17:90a:df8a:: with SMTP id p10mr11062560pjv.4.1614955705241;
        Fri, 05 Mar 2021 06:48:25 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c72sm2659261pfb.165.2021.03.05.06.48.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:48:24 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/27] ca-certificates: Clean up two patches and submit upstream
Date: Fri,  5 Mar 2021 04:46:25 -1000
Message-Id: <52a912ae4951a9040257b9ce5dd600390a7d8133.1614955420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614955420.git.steve@sakoman.com>
References: <cover.1614955420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f3eabbb5c15fb55ae3d46b2377c09bb58226d965)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ca-certificates/sbindir.patch             | 10 +++++++--
 ...pdate-ca-certificates-support-Toybox.patch | 21 +++++++++----------
 2 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch b/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
index a113fa8b15..f343ebf16e 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/sbindir.patch
@@ -1,6 +1,12 @@
-Upstream-Status: Pending
+sbin/Makefile: Allow the sbin path to be configurable
 
-Let us alter the install destination of the script via SBINDIR
+Some project sharing ca-certificates from Debian allow configuration
+of the installation location. Make the sbin location configurable.
+
+Also ensure the target directory exists
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Submitted [https://salsa.debian.org/debian/ca-certificates/-/merge_requests/5]
 
 --- ca-certificates-20130119.orig/sbin/Makefile
 +++ ca-certificates-20130119/sbin/Makefile
diff --git a/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch b/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch
index 6e2171f758..f78790923c 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch
+++ b/meta/recipes-support/ca-certificates/ca-certificates/update-ca-certificates-support-Toybox.patch
@@ -1,14 +1,13 @@
-From 30378026d136efa779732e3f6664e2ecf461e458 Mon Sep 17 00:00:00 2001
-From: Patrick Ohly <patrick.ohly@intel.com>
-Date: Thu, 17 Mar 2016 12:38:09 +0100
-Subject: [PATCH] update-ca-certificates: support Toybox
+update-ca-certificates: Replace deprecated mktemp -t with mktemp --tmpdir
 
-"mktemp -t" is deprecated and does not work when using Toybox. Replace
-with something that works also with Toybox.
+According to coreutils docs, mktemp -t is deprecated, switch to the
+--tmpdir option instead.
 
-Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Submitted [https://salsa.debian.org/debian/ca-certificates/-/merge_requests/5]
 
-Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
+[This was originally for compatibility with toybox but toybox now
+supports -t]
 ---
  sbin/update-ca-certificates | 6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
@@ -24,9 +23,9 @@ index 79c41bb..ae9e3f1 100755
 -TEMPBUNDLE="$(mktemp -t "${CERTBUNDLE}.tmp.XXXXXX")"
 -ADDED="$(mktemp -t "ca-certificates.tmp.XXXXXX")"
 -REMOVED="$(mktemp -t "ca-certificates.tmp.XXXXXX")"
-+TEMPBUNDLE="$(mktemp -p${TMPDIR:-/tmp} "${CERTBUNDLE}.tmp.XXXXXX")"
-+ADDED="$(mktemp -p${TMPDIR:-/tmp} "ca-certificates.tmp.XXXXXX")"
-+REMOVED="$(mktemp -p${TMPDIR:-/tmp} "ca-certificates.tmp.XXXXXX")"
++TEMPBUNDLE="$(mktemp --tmpdir "${CERTBUNDLE}.tmp.XXXXXX")"
++ADDED="$(mktemp --tmpdir "ca-certificates.tmp.XXXXXX")"
++REMOVED="$(mktemp --tmpdir "ca-certificates.tmp.XXXXXX")"
  
  # Adds a certificate to the list of trusted ones.  This includes a symlink
  # in /etc/ssl/certs to the certificate file and its inclusion into the
-- 
2.25.1

