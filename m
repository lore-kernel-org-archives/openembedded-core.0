Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5A4B96DA27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 23:49:11 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id q58so4172311wes.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 15:49:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=j2KNerJNHxDJFS71JF6ypggP3h1xoL/Q/dYZxS8GJyg=;
	b=Cc0YrJ6jQOyn91ccx+LsdSFxPFQJaLmlC8qdBTVayNGVx2MI+sTCG2Xr8JbWRO3RU0
	CbZphrqBpVhnWAPD3LCccF1MdoyG6fxgNGJdiOpBZw4Vk/FVLeewsnouOTdK7urQBAeC
	3yE3sRwA8kAj/L93c9meewCgL0up+vsZgrEktkWlb83xsEyyslXkE2Zw6cPTGJNIiVEv
	BcBg+CviVTo9wmNJYvqipq7HQvajxfq1yAs2o5SC32kRVC7RyLkPLI6U+eIXKEx1zjcT
	vJmeichDLvaKi1YpsxpbvmcXcRWyK80S3fIcV0CQqMGii1Y/LsW/8L35NAZYBnUvBntC
	voqg==
X-Gm-Message-State: ALoCoQmjBpOejXK7XsXeO3gnxCTh/usVR0bGoW/fTNIPWtb+PCekwue+mM0ziIkQirua8ibh4bhy
X-Received: by 10.194.216.38 with SMTP id on6mr8686184wjc.14.1384559352527;
	Fri, 15 Nov 2013 15:49:12 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id x19sm11002wia.5.2013.11.15.15.49.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Nov 2013 15:49:11 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Nov 2013 23:49:09 +0000
Message-Id: <1384559349-27625-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] json-glib: upgrade to 0.16.2
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
X-List-Received-Date: Fri, 15 Nov 2013 23:49:12 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../json-glib/{json-glib_0.16.0.bb => json-glib_0.16.2.bb}        |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/json-glib/{json-glib_0.16.0.bb => json-glib_0.16.2.bb} (79%)

diff --git a/meta/recipes-gnome/json-glib/json-glib_0.16.0.bb b/meta/recipes-gnome/json-glib/json-glib_0.16.2.bb
similarity index 79%
rename from meta/recipes-gnome/json-glib/json-glib_0.16.0.bb
rename to meta/recipes-gnome/json-glib/json-glib_0.16.2.bb
index ffff75e..d2bcb07 100644
--- a/meta/recipes-gnome/json-glib/json-glib_0.16.0.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_0.16.2.bb
@@ -8,13 +8,12 @@ HOMEPAGE = "http://live.gnome.org/JsonGlib"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-
 DEPENDS = "glib-2.0"
 
 GNOME_COMPRESS_TYPE = "xz"
 
-SRC_URI[archive.md5sum] = "bbca11f32509d6eb3f54d24156e7312d"
-SRC_URI[archive.sha256sum] = "e4a3fd2f399e4c148aad608e6ed0a94095f2ddde9dd12f5aa2f072ecae5c1d37"
+SRC_URI[archive.md5sum] = "0c6121741956fc34933a7ebae5868ec2"
+SRC_URI[archive.sha256sum] = "a95475364ec27ab1d2a69303cf579018558bfb6981e3498b3aaf1e6401f7422c"
 
 inherit gnome gettext
 
-- 
1.7.10.4


