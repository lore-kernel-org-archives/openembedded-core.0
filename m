Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.787.1589820553918721455
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 09:49:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=T3rqtHCm;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id q9so84933pjm.2
        for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2020 09:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=3o3sM2OMT+hILCQKLPZRiQJG0AMJZ5nU5soqdGJdVww=;
        b=T3rqtHCm9aW7X5aAnOJy6gWE2z0iSqCCIEIDBEZVmfmijwhylPbVOfwWYQZvy30I+e
         D+i0CwGb6+59QkcOW9k4+tp3Ce0Yw52c1fxoJg7fvx2oWybBAqevAtrUzjSse/RVyJ0/
         Sb6dC6L5us47OTdaKqH1uLAksNPTB6SjyM6wnbsuO3911ns61lRjHc5fjYy55VLLpgz/
         TsTNS4bxjRUD7vS3r8qvn0NAJ8E91Q1aZVBHkCiSADsr5elpOIu2qMs2jhDv6vsLrtto
         3o9PA5s4LfRpiNqyhPri5HDU6O/jYrHlr2QuAq8HD7rmlSOGtdgZAd6l2+1EB7PiXoRd
         pzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=3o3sM2OMT+hILCQKLPZRiQJG0AMJZ5nU5soqdGJdVww=;
        b=V2Ge2s0XIdrtwIFTD3rV6r+26O7Tt7usIDeUVyeEdY2zpnmuqY4j9SkYNGPUVzmPzP
         EZCpvBxofZYUc5zDj0zW7ina/jeGzX8Cc//KlFK/6IN1Nd1uhQoKLxnbxnoIaOlGmrvc
         wVQ1KzbyxufnKn3yuhuAth2aeSpeY5wMug0Put3kynyBBtg832kHCfk2lvF/3uUKtj2T
         FOqjcKbV86ZEr4q+g26Xp0C8xtuQ8oZR2TAk08RVCmo3CtQcoCJGpykEesjIOmlBiv4e
         +UgWIVc/rcDDjWnHqppR2vN12aIQfBjO+/Nqj8S8Br1vmEhwvHmGA7VNkjZoJpf8p1HH
         jNwg==
X-Gm-Message-State: AOAM531G7Zx9qDOY51ZtzOVyVnzAvd3GTtpbl9H9PDXdaxHHMMGFv/rS
	U+sXvAAyx94aOcgEV2LtZawKrkyLLm7iVQ==
X-Google-Smtp-Source: ABdhPJwlBdbrtnKBi3vwjaLzjbpN6AWWLPkQ0lf27P4MnsY11bzCL4yohSVnj1GoQTVgI9rMQ7V4KA==
X-Received: by 2002:a17:902:9d94:: with SMTP id c20mr2222428plq.224.1589820552838;
        Mon, 18 May 2020 09:49:12 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id g6sm62869pjx.48.2020.05.18.09.49.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 09:49:12 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/19] documentation.conf: Add variables supported by features_check.bbclass
Date: Mon, 18 May 2020 06:48:24 -1000
Message-Id: <d82fc1d482c5be81cf88f9b37943bf9f4159ea56.1589820011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589820010.git.steve@sakoman.com>
References: <cover.1589820010.git.steve@sakoman.com>

From: "Robert P. J. Day" <rpjday@crashcourse.ca>

Add to documentation.conf all the new variables supported by
features_check.bbclass.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/documentation.conf | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 44d69197bf..b48cbd4ac0 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -64,6 +64,9 @@ ALTERNATIVE[doc] = "Lists commands in a package that need an alternative binary
 ALTERNATIVE_LINK_NAME[doc] = "Used by the alternatives system to map duplicated commands to actual locations."
 ALTERNATIVE_PRIORITY[doc] = "Used by the alternatives system to create default priorities for duplicated commands."
 ALTERNATIVE_TARGET[doc] = "Used by the alternatives system to create default link locations for duplicated commands."
+ANY_OF_COMBINED_FEATURES[doc] = "When a recipe inherits the features_check class, at least one item in this variable must be included in COMBINED_FEATURES."
+ANY_OF_DISTRO_FEATURES[doc] = "When a recipe inherits the features_check class, at least one item in this variable must be included in DISTRO_FEATURES."
+ANY_OF_MACHINE_FEATURES[doc] = "When a recipe inherits the features_check class, at least one item in this variable must be included in MACHINE_FEATURES."
 ASSUME_PROVIDED[doc] = "List of packages (recipes actually) that are assumed to be implicitly available. BitBake does not build these packages."
 ASSUME_SHLIBS[doc] = "List of shlib:package[_version] mappings. Useful for lib packages in ASSUME_PROVIDED, for which automatic shlib dependency tracking does not work."
 AUTHOR[doc] = "Email address used to contact the original author(s) in order to send patches and forward bugs."
@@ -114,7 +117,9 @@ COMPATIBLE_MACHINE[doc] = "A regular expression that resolves to one or more tar
 COMPLEMENTARY_GLOB[doc] = "Defines wildcards to match when installing a list of complementary packages for all the packages installed in an image."
 CONFFILES[doc] = "Identifies editable or configurable files that are part of a package."
 CONFIG_SITE[doc] = "A list of files that contains autoconf test results relevant to the current build. This variable is used by the Autotools utilities when running configure."
-CONFLICT_DISTRO_FEATURES[doc] = "When a recipe inherits the features_check class, this variable identifies distribution features that would be in conflict should the recipe be built."
+CONFLICT_COMBINED_FEATURES[doc] = "When a recipe inherits the features_check class, no item in this variable can be included in COMBINED_FEATURES."
+CONFLICT_DISTRO_FEATURES[doc] = "When a recipe inherits the features_check class, no item in this variable can be included in DISTRO_FEATURES."
+CONFLICT_MACHINE_FEATURES[doc] = "When a recipe inherits the features_check class, no item in this variable can be included in MACHINE_FEATURES."
 CORE_IMAGE_EXTRA_INSTALL[doc] = "Specifies the list of packages to be added to the image. You should only set this variable in the conf/local.conf file in the Build Directory."
 COREBASE[doc] = "Specifies the parent directory of the OpenEmbedded Core Metadata layer (i.e. meta)."
 CONF_VERSION[doc] = "Tracks the version of local.conf.  Increased each time build/conf/ changes incompatibly."
@@ -345,7 +350,9 @@ QMAKE_PROFILES[doc] = "Specifies your own subset of .pro files to be built for u
 
 RCONFLICTS[doc] = "The list of packages that conflict with another package. Note that the package will not be installed if the conflicting packages are not first removed."
 RDEPENDS[doc] = "Lists a package's runtime dependencies (i.e. other packages) that must be installed for the package to be built. They must be the names of other packages as listed in the PACKAGES variable, not recipe names (PN)."
-REQUIRED_DISTRO_FEATURES[doc] = "When a recipe inherits the features_check class, this variable identifies distribution features that must exist in the current configuration in order for the OpenEmbedded build system to build the recipe."
+REQUIRED_COMBINED_FEATURES[doc] = "When a recipe inherits the features_check class, all items in this variable must be included in COMBINED_FEATURES."
+REQUIRED_DISTRO_FEATURES[doc] = "When a recipe inherits the features_check class, all items in this variable must be included in DISTRO_FEATURES."
+REQUIRED_MACHINE_FEATURES[doc] = "When a recipe inherits the features_check class, all items in this variable must be included in MACHINE_FEATURES."
 RM_WORK_EXCLUDE[doc] = "With rm_work enabled, this variable specifies a list of packages whose work directories should not be removed."
 ROOTFS[doc] = "Indicates a filesystem image to include as the root filesystem."
 ROOTFS_POSTPROCESS_COMMAND[doc] = "Added by classes to run post processing commands once the OpenEmbedded build system has created the root filesystem."
-- 
2.17.1

