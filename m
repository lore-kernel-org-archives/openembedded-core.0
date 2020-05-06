Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web12.137.1588802799105784067
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 15:06:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:58224 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jWSBZ-003PEp-4r
	for openembedded-core@lists.openembedded.org; Wed, 06 May 2020 18:06:38 -0400
Date: Wed, 6 May 2020 18:06:34 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: [PATCH] doc: add variables supported by features_check.bbclass
Message-ID: <alpine.LFD.2.21.2005061801110.14436@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

Add to documentation.conf all the new variables supported by
features_check.bbclass.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  in preparation for adding all this info to the YP reference manual,
might as well add them all here first.

diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index c6544b9698..eee3c43ff2 100644
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
@@ -344,7 +349,9 @@ QMAKE_PROFILES[doc] = "Specifies your own subset of .pro files to be built for u

 RCONFLICTS[doc] = "The list of packages that conflict with another package. Note that the package will not be installed if the conflicting packages are not first removed."
 RDEPENDS[doc] = "Lists a package's runtime dependencies (i.e. other packages) that must be installed for the package to be built. They must be the names of other packages as listed in the PACKAGES variable, not recipe names (PN)."
-REQUIRED_DISTRO_FEATURES[doc] = "When a recipe inherits the features_check class, this variable identifies distribution features that must exist in the current configuration in order for the OpenEmbedded build system to build the recipe."
+REQUIRED_COMBINED_FEATURES[doc] = "When a recipe inherits the features_check class, all items in this variable must be included in COMBINED_FEATURES."
+REQUIRED_DISTRO_FEATURES[doc] = "When a recipe inherits the features_check class, all items in this variable must be included in DISTRO_FEATURES."
+REQUIRED_MACHINE_FEATURES[doc] = "When a recipe inherits the features_check class, all items in this variable must be included in MACHINE_FEATURES."
 RM_WORK_EXCLUDE[doc] = "With rm_work enabled, this variable specifies a list of packages whose work directories should not be removed."
 ROOTFS[doc] = "Indicates a filesystem image to include as the root filesystem."
 ROOTFS_POSTPROCESS_COMMAND[doc] = "Added by classes to run post processing commands once the OpenEmbedded build system has created the root filesystem."
