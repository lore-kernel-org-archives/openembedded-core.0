Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RLOhp-0003Yj-Ln
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 01:29:25 +0100
Received: from mail-fx0-f52.google.com ([209.85.161.52])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 01 Nov 2011 17:23:17 -0700
Received: by faan26 with SMTP id n26so7387126faa.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Nov 2011 17:23:16 -0700 (PDT)
Received: by 10.223.7.20 with SMTP id b20mr4240414fab.21.1320193396016;
	Tue, 01 Nov 2011 17:23:16 -0700 (PDT)
Received: from [10.6.18.227] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id w27sm1920439fad.13.2011.11.01.17.23.14
	(version=SSLv3 cipher=OTHER); Tue, 01 Nov 2011 17:23:15 -0700 (PDT)
Message-ID: <4EB08D70.4050602@intel.com>
Date: Tue, 01 Nov 2011 17:23:12 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1320190662-748-1-git-send-email-Martin.Jansa@gmail.com>
In-Reply-To: <1320190662-748-1-git-send-email-Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] libxslt: don't replace COPYING with symlink to Copyright
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
X-List-Received-Date: Wed, 02 Nov 2011 00:29:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/01/2011 04:37 PM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> ---
>   .../dont.replace.COPYING.with.symlink.patch        |   27 ++++++++++++++++++++
>   meta/recipes-support/libxslt/libxslt_1.1.26.bb     |    3 +-
>   2 files changed, 29 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-support/libxslt/libxslt/dont.replace.COPYING.with.symlink.patch
>
> diff --git a/meta/recipes-support/libxslt/libxslt/dont.replace.COPYING.with.symlink.patch b/meta/recipes-support/libxslt/libxslt/dont.replace.COPYING.with.symlink.patch
> new file mode 100644
> index 0000000..a38b686
> --- /dev/null
> +++ b/meta/recipes-support/libxslt/libxslt/dont.replace.COPYING.with.symlink.patch
> @@ -0,0 +1,27 @@
> +When it's replaced with symlink to Copyright, then we end with link to nonexistent file like this:
> +
> +OE om-gta02@shr ~/shr-core $ ll tmp/deploy/licenses/libxslt/
> +total 40
> +drwxr-xr-x   2 bitbake bitbake  4096 Nov  2 00:27 ./
> +drwxr-xr-x 818 bitbake bitbake 32768 Nov  2 00:27 ../
> +lrwxrwxrwx   1 bitbake bitbake     9 Nov  2 00:27 COPYING ->  Copyright
> +lrwxrwxrwx   1 bitbake bitbake    52 Nov  2 00:27 generic_MIT ->  /OE/shr-core/tmp/deploy/licenses/common-licenses/MIT
> +
> +Upstream-Status: Pending
> +
No Signed-off-by: in the patch itself.

Thanks
	Sau!

> +diff -uNr libxslt-1.1.26.orig/configure.in libxslt-1.1.26/configure.in
> +--- libxslt-1.1.26.orig/configure.in	2009-09-24 16:27:30.000000000 +0200
> ++++ libxslt-1.1.26/configure.in	2011-11-02 00:30:47.651452392 +0100
> +@@ -671,12 +671,6 @@
> + RELDATE=`date +'%a %b %e %Y'`
> + AC_SUBST(RELDATE)
> +
> +-( cd $srcdir
> +-rm -f COPYING.LIB COPYING
> +-$LN_S Copyright COPYING
> +-)
> +-
> +-
> + AC_OUTPUT([
> + Makefile
> + libxslt.pc
> diff --git a/meta/recipes-support/libxslt/libxslt_1.1.26.bb b/meta/recipes-support/libxslt/libxslt_1.1.26.bb
> index 96bffc6..4dd6b55 100644
> --- a/meta/recipes-support/libxslt/libxslt_1.1.26.bb
> +++ b/meta/recipes-support/libxslt/libxslt_1.1.26.bb
> @@ -7,9 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0cd9a07afbeb24026c9b03aecfeba458"
>
>   SECTION = "libs"
>   DEPENDS = "libxml2"
> -PR = "r3"
> +PR = "r4"
>
>   SRC_URI = "ftp://xmlsoft.org/libxslt//libxslt-${PV}.tar.gz \
> +           file://dont.replace.COPYING.with.symlink.patch \
>              file://pkgconfig_fix.patch"
>
>   SRC_URI[md5sum] = "e61d0364a30146aaa3001296f853b2b9"



