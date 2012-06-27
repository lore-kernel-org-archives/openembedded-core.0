Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SjvtC-0006SW-4P
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 19:18:50 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jun 2012 10:07:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="161385899"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by azsmga001.ch.intel.com with ESMTP; 27 Jun 2012 10:07:11 -0700
Message-ID: <4FEB3DBF.9030304@linux.intel.com>
Date: Wed, 27 Jun 2012 10:07:11 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1340811339-6223-1-git-send-email-jrsantos@jonathanrsantos.com>
In-Reply-To: <1340811339-6223-1-git-send-email-jrsantos@jonathanrsantos.com>
Cc: Jonathan Santos <jrsantos@jonathanrsantos.com>
Subject: Re: [PATCH] openjade-native: Fix use of obsolete getopts.pl in msggen.pl
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
X-List-Received-Date: Wed, 27 Jun 2012 17:18:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/27/2012 08:35 AM, Jonathan Santos wrote:
> getopts.pl was deprecated in perl 5.14, and removed in 5.16.
>
> Signed-off-by: Jonathan Santos<jrsantos@jonathanrsantos.com>
> ---
>   .../openjade/openjade-1.3.2/getopts.patch            | 20 ++++++++++++++++++++
>   .../openjade/openjade-native_1.3.2.bb                |  3 ++-
>   2 files changed, 22 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-devtools/openjade/openjade-1.3.2/getopts.patch
>
> diff --git a/meta/recipes-devtools/openjade/openjade-1.3.2/getopts.patch b/meta/recipes-devtools/openjade/openjade-1.3.2/getopts.patch
> new file mode 100644
> index 0000000..b89861d
> --- /dev/null
> +++ b/meta/recipes-devtools/openjade/openjade-1.3.2/getopts.patch

This need a patch header, with comment (why is patch needed) along with 
Upstream-Status and Signed-off-by

Please see the Commit and Patch Wiki:

http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Thanks
	Sau!

> @@ -0,0 +1,20 @@
> +--- ./msggen.pl.orig	2012-06-11 11:35:22.000000000 +0000
> ++++ ./msggen.pl	2012-06-11 11:37:06.000000000 +0000
> +@@ -4,6 +4,7 @@
> + # See the file COPYING for copying permission.
> +
> + use POSIX;
> ++use Getopt::Std;
> +
> + # Package and version.
> + $package = 'openjade';
> +@@ -18,8 +19,7 @@ $gen_c = 0;
> + undef $opt_l;
> + undef $opt_p;
> + undef $opt_t;
> +-do 'getopts.pl';
> +-&Getopts('l:p:t:');
> ++getopts('l:p:t:');
> + $module = $opt_l;
> + $pot_file = $opt_p;
> +
> diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> index 5b29c1f..a69c697 100644
> --- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> +++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> @@ -15,7 +15,8 @@ RDEPENDS_${PN} = "sgml-common-native"
>   SRC_URI = "${SOURCEFORGE_MIRROR}/openjade/openjade-${PV}.tar.gz \
>              file://makefile.patch \
>              file://reautoconf.patch \
> -	   file://user-declared-default-constructor.patch"
> +           file://user-declared-default-constructor.patch \
> +           file://getopts.patch"
>
>   SRC_URI[md5sum] = "7df692e3186109cc00db6825b777201e"
>   SRC_URI[sha256sum] = "1d2d7996cc94f9b87d0c51cf0e028070ac177c4123ecbfd7ac1cb8d0b7d322d1"


