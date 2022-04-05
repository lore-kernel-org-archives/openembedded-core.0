Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEAF4C38161
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:47 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.7190.1649169707422558639
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Apr 2022 07:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Xno9ZlXi;
 spf=pass (domain: intel.com, ip: 192.55.52.93,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649169731; x=1680705731;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=D1w58VRkgvGAZOf0iPOdM5pbqgygTvtZ1YiCZPXqK84=;
  b=Xno9ZlXiPx8d/7xiX80kwapXQfjq+GPGP/bQzhImLcci8YEXJL5BhGuE
   CKEdYzPjWoSa3q7lKXUapyHZsWXfbNXjiIo4awsAk6CRWVh4s54PAAnlM
   adqPRSHoDSZzQmxfwx/VkWsP8EO/1JN+F5ZgzYKiBYXBOinkg3Ez3Ng/e
   DeU47Wplc4cc5nZ3Yxyg26lJaYqFDUYjvWQ1qXFGsHntQeHh8hTUiNDjh
   r5ZK7/Vl+mlJpYLa6hdeZbfGHb9ZhqlCbBveTmOb/LptauN8hfljRyRAD
   a9NKp+CT6SLKOLwvrfn/aa+rs9KWNEyMJV7Z425Q4RiPMYFwAR6d3Gb6J
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="258348900"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="258348900"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:42:10 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400";
   d="scan'208";a="696953639"
Received: from ntabdull-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.226.238])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 07:42:09 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 16/22] libxml2: move to gitlab.gnome.org
Date: Tue,  5 Apr 2022 22:41:35 +0800
Message-Id: 
 <e30e3804f7ade175016981697c6b266c001e1d06.1649169646.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1649169646.git.anuj.mittal@intel.com>
References: <cover.1649169646.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164034

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
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/libxml/libxml2_2.9.12.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.12.bb b/meta/recipes-core/libxml/libxml2_2.9.12.bb
index a7939c9713..3508733cc0 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.12.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.12.bb
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
@@ -24,7 +25,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
            file://0002-Work-around-lxml-API-abuse.patch \
            "
 
-SRC_URI[libtar.sha256sum] = "c8d6681e38c56f172892c85ddc0852e1fd4b53b4209e7f4ebf17f7e2eae71d92"
+SRC_URI[archive.sha256sum] = "28a92f6ab1f311acf5e478564c49088ef0ac77090d9c719bbc5d518f1fe62eb9"
 SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7"
 
 BINCONFIG = "${bindir}/xml2-config"
-- 
2.35.1


