Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SUigw-0004tY-C3
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 20:11:18 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 May 2012 11:01:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="141373046"
Received: from unknown (HELO [10.255.13.103]) ([10.255.13.103])
	by orsmga001.jf.intel.com with ESMTP; 16 May 2012 11:01:14 -0700
Message-ID: <4FB3EB6A.6040101@linux.intel.com>
Date: Wed, 16 May 2012 21:01:14 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAMKF1srWO69M=MOa4_ar8oO55fkaofzSHj_UAsRaVL+-dzEXNw@mail.gmail.com>
	<1336686231-28111-1-git-send-email-cazfi74@gmail.com>
In-Reply-To: <1336686231-28111-1-git-send-email-cazfi74@gmail.com>
Subject: Re: [PATCH] expat: update to upstream version 2.1.0
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
X-List-Received-Date: Wed, 16 May 2012 18:11:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/11/2012 12:43 AM, Marko Lindqvist wrote:
> Signed-off-by: Marko Lindqvist<cazfi74@gmail.com>
> ---
>   .../expat/{expat-2.0.1 =>  expat-2.1.0}/autotools.patch    |   13 ++++++++-----
>   meta/recipes-core/expat/expat_2.0.1.bb                    |    6 ------
>   meta/recipes-core/expat/expat_2.1.0.bb                    |    6 ++++++
>   3 files changed, 14 insertions(+), 11 deletions(-)
>   rename meta/recipes-core/expat/{expat-2.0.1 =>  expat-2.1.0}/autotools.patch (53%)
>   delete mode 100644 meta/recipes-core/expat/expat_2.0.1.bb
>   create mode 100644 meta/recipes-core/expat/expat_2.1.0.bb
>
> diff --git a/meta/recipes-core/expat/expat-2.0.1/autotools.patch b/meta/recipes-core/expat/expat-2.1.0/autotools.patch
> similarity index 53%
> rename from meta/recipes-core/expat/expat-2.0.1/autotools.patch
> rename to meta/recipes-core/expat/expat-2.1.0/autotools.patch
> index c0ac10b..0e59969 100644
> --- a/meta/recipes-core/expat/expat-2.0.1/autotools.patch
> +++ b/meta/recipes-core/expat/expat-2.1.0/autotools.patch
> @@ -6,14 +6,17 @@ Workaround specific to our build system.
>   Signed-off-by: Kevin Tian<kevin.tian@intel.com>
>   Signed-off-by: Scott Garman<scott.a.garman@intel.com>
>
> -diff -bur expat-2.0.0~orig/configure.in expat-2.0.0/configure.in
> ---- expat-2.0.0~orig/configure.in	2006-01-10 19:10:46.000000000 -0600
> -+++ expat-2.0.0/configure.in	2006-02-10 19:12:24.000000000 -0600
> -@@ -50,9 +50,6 @@
> +Updated to apply over expat 2.1.0
> +
> +Signed-off-by: Marko Lindqvist<cazfi74@gmail.com>
> +
> +diff -Nurd expat-2.1.0/configure.in expat-2.1.0/configure.in
> +--- expat-2.1.0/configure.in	2012-03-04 01:45:53.000000000 +0200
> ++++ expat-2.1.0/configure.in	2012-05-10 21:04:44.000000000 +0300
> +@@ -51,8 +51,6 @@
>
>    AC_CONFIG_HEADER(expat_config.h)
>
> --sinclude(conftools/libtool.m4)
>   -sinclude(conftools/ac_c_bigendian_cross.m4)
>   -
>    AC_LIBTOOL_WIN32_DLL
> diff --git a/meta/recipes-core/expat/expat_2.0.1.bb b/meta/recipes-core/expat/expat_2.0.1.bb
> deleted file mode 100644
> index 30b5684..0000000
> --- a/meta/recipes-core/expat/expat_2.0.1.bb
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -require expat.inc
> -LIC_FILES_CHKSUM = "file://COPYING;md5=1b71f681713d1256e1c23b0890920874"
> -PR = "r1"
> -
> -SRC_URI[md5sum] = "ee8b492592568805593f81f8cdf2a04c"
> -SRC_URI[sha256sum] = "847660b4df86e707c9150e33cd8c25bc5cd828f708c7418e765e3e983a2e5e93"
> diff --git a/meta/recipes-core/expat/expat_2.1.0.bb b/meta/recipes-core/expat/expat_2.1.0.bb
> new file mode 100644
> index 0000000..1ce1844
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat_2.1.0.bb
> @@ -0,0 +1,6 @@
> +require expat.inc
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1b71f681713d1256e1c23b0890920874"
> +PR = "r0"
> +
> +SRC_URI[md5sum] = "dd7dab7a5fea97d2a6a43f511449b7cd"
> +SRC_URI[sha256sum] = "823705472f816df21c8f6aa026dd162b280806838bb55b3432b0fb1fcca7eb86"

Merged into OE-Core

Thanks
	Sau!


