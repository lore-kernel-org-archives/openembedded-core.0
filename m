Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnEyX-0002Yp-EU
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 20:45:45 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Jan 2012 11:37:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="57371363"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Jan 2012 11:37:33 -0800
Message-ID: <4F15CDFD.8050204@linux.intel.com>
Date: Tue, 17 Jan 2012 11:37:33 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Colin Walters <walters@verbum.org>
References: <1326651241.9066.0.camel@lenny> <4F13A366.1010807@linux.intel.com>
	<1326812944.3467.46.camel@lenny>
In-Reply-To: <1326812944.3467.46.camel@lenny>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libtool: Put all libltdl headers in the correct libltdl-dev package
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
X-List-Received-Date: Tue, 17 Jan 2012 19:45:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/17/2012 07:09 AM, Colin Walters wrote:
> On Sun, 2012-01-15 at 20:11 -0800, Saul Wold wrote:
>> On 01/15/2012 10:13 AM, Colin Walters wrote:
>>> See attached.
>>>
>>>
>> The current version is 2.4.2 and this requires a PR bump.
>
> Hm, do you want a new patch that bumps the PR?  What are the rules for
> when a PR should be incremented?
>
No, I updated your patch for 2.4.2.

The PR bumps required if the output of a package is going to change or a 
dependee needs to get rebuilt due to the change. Other than comments 
changing it's commonly required.

>> Also, can you use "git send-email" directly instead of sending the patch
>> as an attachment, when sent that way, it requires extra steps to edit
>> the file before applying.
>
> Ah...the problem is that I'd have to teach git-send-email how to
> authenticate to my mail server which isn't trivial.  Would a workflow
> where I paste the patch inline (thus creating whitespace damage), but
> also link to my github mirror work?  Let's try it with a new patch:
>
> https://github.com/cgwalters/poky/commit/0255ac2e95bb5230f7fdf1b861be0b97b01f2ecf
>
Yes, this will work better in the future, let me know the github branch 
that contains your patch against oe-core or poky master (which ever you 
prefer).

Thanks
	Sau!


>> From 0255ac2e95bb5230f7fdf1b861be0b97b01f2ecf Mon Sep 17 00:00:00 2001
> From: Colin Walters<walters@verbum.org>
> Date: Tue, 17 Jan 2012 09:06:28 -0500
> Subject: [PATCH] zlib: Build and install zlib.pc
>
> Poky has a fork of the zlib build system which presently installs
> headers and the shared library, but neglects the zlib.pc file.
> Several components (e.g. glib, WebKitGtk) look for this, so let's
> provide it.
> ---
>   meta/recipes-core/zlib/files/Makefile.am  |    3 +++
>   meta/recipes-core/zlib/files/configure.ac |    3 ++-
>   2 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-core/zlib/files/Makefile.am
> b/meta/recipes-core/zlib/files/Makefile.am
> index b66d299..0458892 100644
> --- a/meta/recipes-core/zlib/files/Makefile.am
> +++ b/meta/recipes-core/zlib/files/Makefile.am
> @@ -7,3 +7,6 @@ libz_la_SOURCES = adler32.c compress.c crc32.c gzlib.c
> gzclose.c gzread.c \
>   libz_la_LDFLAGS = -version-number 1:2:5 --version-script zlib.map
>
>   include_HEADERS = zconf.h zlib.h zlibdefs.h
> +
> +pkgconfigdir = ${libdir}/pkgconfig
> +pkgconfig_DATA = zlib.pc
> diff --git a/meta/recipes-core/zlib/files/configure.ac
> b/meta/recipes-core/zlib/files/configure.ac
> index 4761b7e..5698175 100644
> --- a/meta/recipes-core/zlib/files/configure.ac
> +++ b/meta/recipes-core/zlib/files/configure.ac
> @@ -43,6 +43,7 @@ cat>  zlibdefs.h<<  EOF
>   #endif
>   EOF
>
> -AC_CONFIG_FILES([Makefile])
> +AC_CONFIG_FILES([Makefile
> +	         zlib.pc])
>
>   AC_OUTPUT


