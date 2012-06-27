Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sjvop-0006Lh-P4
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 19:14:20 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 27 Jun 2012 10:02:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="116610336"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Jun 2012 10:02:45 -0700
Message-ID: <4FEB3CB5.9080601@linux.intel.com>
Date: Wed, 27 Jun 2012 10:02:45 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1334908328-13649-1-git-send-email-florin.sarbu@windriver.com>
	<4FEAC63E.3020903@windriver.com>
In-Reply-To: <4FEAC63E.3020903@windriver.com>
Subject: Re: [PATCH v3] Update intltool to version 0.50.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jun 2012 17:14:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/27/2012 01:37 AM, Florin Sarbu wrote:
> Ping?
>
Looking at it now, it got lost sorry.

Why did you not move to .50.2, that's the latest version, correct?

Sau!

> On 04/20/2012 10:52 AM, Florin Sarbu wrote:
>> Uprev intltool to newer 0.50.0 version
>>
>> Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
>> ---
>> .../intltool-0.40.6/intltool-nowarn-0.40.0.patch | 52
>> --------------------
>> .../intltool-0.50.0/intltool-nowarn-0.50.0.patch | 42 ++++++++++++++++
>> .../noperlcheck.patch | 8 +--
>> .../remove-xml-check.patch | 3 --
>> .../use-nativeperl.patch | 0
>> meta/recipes-devtools/intltool/intltool.inc | 2 +-
>> .../{intltool_0.40.6.bb => intltool_0.50.0.bb} | 12 ++---
>> 7 files changed, 53 insertions(+), 66 deletions(-)
>> delete mode 100644
>> meta/recipes-devtools/intltool/intltool-0.40.6/intltool-nowarn-0.40.0.patch
>>
>> create mode 100644
>> meta/recipes-devtools/intltool/intltool-0.50.0/intltool-nowarn-0.50.0.patch
>>
>> rename meta/recipes-devtools/intltool/{intltool-0.40.6 =>
>> intltool-0.50.0}/noperlcheck.patch (85%)
>> rename meta/recipes-devtools/intltool/{intltool-0.40.6 =>
>> intltool-0.50.0}/remove-xml-check.patch (95%)
>> rename meta/recipes-devtools/intltool/{intltool-0.40.6 =>
>> intltool-0.50.0}/use-nativeperl.patch (100%)
>> rename meta/recipes-devtools/intltool/{intltool_0.40.6.bb =>
>> intltool_0.50.0.bb} (63%)
>>
>> diff --git
>> a/meta/recipes-devtools/intltool/intltool-0.40.6/intltool-nowarn-0.40.0.patch
>> b/meta/recipes-devtools/intltool/intltool-0.40.6/intltool-nowarn-0.40.0.patch
>>
>> deleted file mode 100644
>> index ff9f52e..0000000
>> ---
>> a/meta/recipes-devtools/intltool/intltool-0.40.6/intltool-nowarn-0.40.0.patch
>>
>> +++ /dev/null
>> @@ -1,52 +0,0 @@
>> -Upstream-Status: Inappropriate [embedded specific]
>> -
>> -Index: intltool-0.40.0/intltool-extract.in
>> -===================================================================
>> ---- intltool-0.40.0.orig/intltool-extract.in 2008-12-17
>> 11:50:19.000000000 +0000
>> -+++ intltool-0.40.0/intltool-extract.in 2008-12-17 11:50:31.000000000
>> +0000
>> -@@ -1,4 +1,4 @@
>> --#!@INTLTOOL_PERL@ -w
>> -+#!@INTLTOOL_PERL@
>> - # -*- Mode: perl; indent-tabs-mode: nil; c-basic-offset: 4 -*-
>> -
>> - #
>> -Index: intltool-0.40.0/intltool-merge.in
>> -===================================================================
>> ---- intltool-0.40.0.orig/intltool-merge.in 2008-12-17
>> 11:50:19.000000000 +0000
>> -+++ intltool-0.40.0/intltool-merge.in 2008-12-17 11:50:38.000000000
>> +0000
>> -@@ -1,4 +1,4 @@
>> --#!@INTLTOOL_PERL@ -w
>> -+#!@INTLTOOL_PERL@
>> - # -*- Mode: perl; indent-tabs-mode: nil; c-basic-offset: 4 -*-
>> -
>> - #
>> -Index: intltool-0.40.0/intltool-prepare.in
>> -===================================================================
>> ---- intltool-0.40.0.orig/intltool-prepare.in 2008-12-17
>> 11:50:19.000000000 +0000
>> -+++ intltool-0.40.0/intltool-prepare.in 2008-12-17 11:50:42.000000000
>> +0000
>> -@@ -1,4 +1,4 @@
>> --#!@INTLTOOL_PERL@ -w
>> -+#!@INTLTOOL_PERL@
>> - # -*- Mode: perl; indent-tabs-mode: nil; c-basic-offset: 4 -*-
>> -
>> - # Intltool .desktop, .directory Prepare Tool
>> -Index: intltool-0.40.0/intltool-unicodify.in
>> -===================================================================
>> ---- intltool-0.40.0.orig/intltool-unicodify.in 2008-12-17
>> 11:50:19.000000000 +0000
>> -+++ intltool-0.40.0/intltool-unicodify.in 2008-12-17
>> 11:50:46.000000000 +0000
>> -@@ -1,4 +1,4 @@
>> --#!@INTLTOOL_PERL@ -w
>> -+#!@INTLTOOL_PERL@
>> -
>> - #
>> - # The i18n Unicode Encoding Utility
>> -Index: intltool-0.40.0/intltool-update.in
>> -===================================================================
>> ---- intltool-0.40.0.orig/intltool-update.in 2008-12-17
>> 11:50:19.000000000 +0000
>> -+++ intltool-0.40.0/intltool-update.in 2008-12-17 11:50:49.000000000
>> +0000
>> -@@ -1,4 +1,4 @@
>> --#!@INTLTOOL_PERL@ -w
>> -+#!@INTLTOOL_PERL@
>> - # -*- Mode: perl; indent-tabs-mode: nil; c-basic-offset: 4 -*-
>> -
>> - #
>> diff --git
>> a/meta/recipes-devtools/intltool/intltool-0.50.0/intltool-nowarn-0.50.0.patch
>> b/meta/recipes-devtools/intltool/intltool-0.50.0/intltool-nowarn-0.50.0.patch
>>
>> new file mode 100644
>> index 0000000..06c938b
>> --- /dev/null
>> +++
>> b/meta/recipes-devtools/intltool/intltool-0.50.0/intltool-nowarn-0.50.0.patch
>>
>> @@ -0,0 +1,42 @@
>> +Upstream-Status: Inappropriate [embedded specific]
>> +
>> +Index: intltool-0.40.0/intltool-extract.in
>> +===================================================================
>> +--- intltool-0.50.0.orig/intltool-extract.in 2011-10-08
>> 22:24:57.000000000 +0300
>> ++++ intltool-0.50.0/intltool-extract.in 2011-12-07 16:04:07.000000000
>> +0200
>> +@@ -1,4 +1,4 @@
>> +-#!@INTLTOOL_PERL@ -w
>> ++#!@INTLTOOL_PERL@
>> + # -*- Mode: perl; indent-tabs-mode: nil; c-basic-offset: 4 -*-
>> +
>> + #
>> +Index: intltool-0.50.0/intltool-merge.in
>> +===================================================================
>> +--- intltool-0.50.0.orig/intltool-merge.in 2011-10-08
>> 17:52:01.000000000 +0300
>> ++++ intltool-0.50.0/intltool-merge.in 2011-12-07 16:05:55.000000000
>> +0200
>> +@@ -1,4 +1,4 @@
>> +-#!@INTLTOOL_PERL@ -w
>> ++#!@INTLTOOL_PERL@
>> + # -*- Mode: perl; indent-tabs-mode: nil; c-basic-offset: 4 -*-
>> +
>> + #
>> +Index: intltool-0.50.0/intltool-prepare.in
>> +===================================================================
>> +--- intltool-0.50.0.orig/intltool-prepare.in 2011-10-08
>> 09:16:58.000000000 +0300
>> ++++ intltool-0.50.0/intltool-prepare.in 2011-12-07 16:06:13.000000000
>> +0200
>> +@@ -1,4 +1,4 @@
>> +-#!@INTLTOOL_PERL@ -w
>> ++#!@INTLTOOL_PERL@
>> + # -*- Mode: perl; indent-tabs-mode: nil; c-basic-offset: 4 -*-
>> +
>> + # Intltool .desktop, .directory Prepare Tool
>> +Index: intltool-0.50.0/intltool-update.in
>> +===================================================================
>> +--- intltool-0.50.0.orig/intltool-update.in 2011-10-08
>> 22:24:57.000000000 +0300
>> ++++ intltool-0.50.0/intltool-update.in 2011-12-07 16:06:39.000000000
>> +0200
>> +@@ -1,4 +1,4 @@
>> +-#!@INTLTOOL_PERL@ -w
>> ++#!@INTLTOOL_PERL@
>> + # -*- Mode: perl; indent-tabs-mode: nil; c-basic-offset: 4 -*-
>> +
>> + #
>> diff --git
>> a/meta/recipes-devtools/intltool/intltool-0.40.6/noperlcheck.patch
>> b/meta/recipes-devtools/intltool/intltool-0.50.0/noperlcheck.patch
>> similarity index 85%
>> rename from
>> meta/recipes-devtools/intltool/intltool-0.40.6/noperlcheck.patch
>> rename to
>> meta/recipes-devtools/intltool/intltool-0.50.0/noperlcheck.patch
>> index 3d8b591..cc26749 100644
>> --- a/meta/recipes-devtools/intltool/intltool-0.40.6/noperlcheck.patch
>> +++ b/meta/recipes-devtools/intltool/intltool-0.50.0/noperlcheck.patch
>> @@ -7,11 +7,11 @@ RP 31/8/2011
>> Upstream-Status: Inappropriate [OE specific]
>> -Index: intltool-0.40.6/configure.in
>> +Index: intltool-0.40.6/configure.ac
>> ===================================================================
>> ---- intltool-0.40.6.orig/configure.in 2011-08-31 11:21:13.061160535
>> +0100
>> -+++ intltool-0.40.6/configure.in 2011-08-31 11:22:44.991160885 +0100
>> -@@ -9,24 +9,10 @@
>> +--- intltool-0.40.6.orig/configure.ac 2011-08-31 11:21:13.061160535
>> +0100
>> ++++ intltool-0.40.6/configure.ac 2011-08-31 11:22:44.991160885 +0100
>> +@@ -11,24 +11,10 @@
>> aclocaldir='${datadir}'/aclocal
>> AC_SUBST(aclocaldir)
>> diff --git
>> a/meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch b/meta/recipes-devtools/intltool/intltool-0.50.0/remove-xml-check.patch
>>
>> similarity index 95%
>> rename from
>> meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch
>> rename to
>> meta/recipes-devtools/intltool/intltool-0.50.0/remove-xml-check.patch
>> index 2eb9abd..476d091 100644
>> ---
>> a/meta/recipes-devtools/intltool/intltool-0.40.6/remove-xml-check.patch
>> +++
>> b/meta/recipes-devtools/intltool/intltool-0.50.0/remove-xml-check.patch
>> @@ -1,6 +1,3 @@
>> -
>> -Upstream-Status: Inappropriate [configuration]
>> -
>> Index: intltool-0.40.6/intltool.m4
>> ===================================================================
>> --- intltool-0.40.6.orig/intltool.m4 2009-02-14 14:12:28.000000000 -0800
>> diff --git
>> a/meta/recipes-devtools/intltool/intltool-0.40.6/use-nativeperl.patch
>> b/meta/recipes-devtools/intltool/intltool-0.50.0/use-nativeperl.patch
>> similarity index 100%
>> rename from
>> meta/recipes-devtools/intltool/intltool-0.40.6/use-nativeperl.patch
>> rename to
>> meta/recipes-devtools/intltool/intltool-0.50.0/use-nativeperl.patch
>> diff --git a/meta/recipes-devtools/intltool/intltool.inc
>> b/meta/recipes-devtools/intltool/intltool.inc
>> index 8d983df..1c41f0f 100644
>> --- a/meta/recipes-devtools/intltool/intltool.inc
>> +++ b/meta/recipes-devtools/intltool/intltool.inc
>> @@ -3,7 +3,7 @@ SECTION = "devel"
>> LICENSE = "GPLv2"
>> URLV="${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
>> -SRC_URI = "${GNOME_MIRROR}/intltool/${URLV}/intltool-${PV}.tar.bz2"
>> +SRC_URI =
>> "http://launchpad.net/${BPN}/trunk/${PV}/+download/${BP}.tar.gz"
>> S = "${WORKDIR}/intltool-${PV}"
>> DEPENDS = "libxml-parser-perl-native"
>> diff --git a/meta/recipes-devtools/intltool/intltool_0.40.6.bb
>> b/meta/recipes-devtools/intltool/intltool_0.50.0.bb
>> similarity index 63%
>> rename from meta/recipes-devtools/intltool/intltool_0.40.6.bb
>> rename to meta/recipes-devtools/intltool/intltool_0.50.0.bb
>> index c820f11..d1ee31d 100644
>> --- a/meta/recipes-devtools/intltool/intltool_0.40.6.bb
>> +++ b/meta/recipes-devtools/intltool/intltool_0.50.0.bb
>> @@ -1,11 +1,11 @@
>> require intltool.inc
>> LICENSE="GPLv2"
>> LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>> -PR = "r6"
>> +PR = "r0"
>> -SRC_URI_append = " file://intltool-nowarn-0.40.0.patch \
>> - ${NATIVEPATCHES} \
>> - "
>> +SRC_URI += "file://intltool-nowarn-0.50.0.patch \
>> + ${NATIVEPATCHES} \
>> + "
>> #
>> # All of the intltool scripts have the correct paths to perl already
>> @@ -15,5 +15,5 @@ NATIVEPATCHES = "file://noperlcheck.patch \
>> file://remove-xml-check.patch"
>> NATIVEPATCHES_virtclass-native = "file://use-nativeperl.patch"
>> -SRC_URI[md5sum] = "69bc0353323112f42ad4f9cf351bc3e5"
>> -SRC_URI[sha256sum] =
>> "4d1e5f8561f09c958e303d4faa885079a5e173a61d28437d0013ff5efc9e3b64"
>> +SRC_URI[md5sum] = "0da9847a60391ca653df35123b1f7cc0"
>> +SRC_URI[sha256sum] =
>> "dccfb0b7dd35a170130e8934bfd30c29da6ae73bcd3ca4ba71317c977b2893d6"
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


