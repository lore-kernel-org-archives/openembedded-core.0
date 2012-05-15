Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SUOjW-0003HN-7L
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 22:52:42 +0200
Received: from mail-pz0-f52.google.com ([209.85.210.52])
	by mga11.intel.com with ESMTP/TLS/RC4-MD5; 15 May 2012 13:42:29 -0700
Received: by dano14 with SMTP id o14so9794dan.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 13:42:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=Mo2JWUkwAVmfn05rItyhP9gyRLl34EeVbNVk1DYe9oE=;
	b=RZzFJzO4/DLX4Z0S4ljmxua7y7CiJjdnD6DBYlsnDoaxqWCeC4VSzYdhoPODl5+xxz
	jBUhQYfLVUENcm8WXwem1oEPkusr4oIADi+K11TMAyE4OC3/A6FaxxrUGnHWXMird8DJ
	mnsNAicZ4qi40jIbpqjJ91bEDHE587oCcQA7J2EU/wGn4a6tn9yrQB/tkPqzKMZzqKwg
	QMrO2JJWzdHZAVJFj14J9QATg7eu/YgDsytEBu+O156M0bqYN6h2DbeRxj6c9VL6+Klf
	P8FclDh7Lphj5lG38KETMCiFCeNjCLgAs+4WCBVSsSx8GAZzDhLYLB9sLEGwPK4Bo6D5
	S9AA==
Received: by 10.68.217.67 with SMTP id ow3mr8408158pbc.16.1337114549317;
	Tue, 15 May 2012 13:42:29 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id z2sm2888444pbv.34.2012.05.15.13.42.27
	(version=SSLv3 cipher=OTHER); Tue, 15 May 2012 13:42:28 -0700 (PDT)
Message-ID: <4FB2BFB6.4020504@intel.com>
Date: Tue, 15 May 2012 13:42:30 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CAMKF1srWO69M=MOa4_ar8oO55fkaofzSHj_UAsRaVL+-dzEXNw@mail.gmail.com>
	<1336686231-28111-1-git-send-email-cazfi74@gmail.com>
In-Reply-To: <1336686231-28111-1-git-send-email-cazfi74@gmail.com>
X-Gm-Message-State: ALoCoQm9zG8t7+pvkgdepHgd5d0WqoQ9EKs+ExrkpkeeXWumk8+pqfRUC2Y5r8XgYrnXUWeCvs1F
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
X-List-Received-Date: Tue, 15 May 2012 20:52:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/10/2012 02:43 PM, Marko Lindqvist wrote:
> Signed-off-by: Marko Lindqvist<cazfi74@gmail.com>
> ---
>   .../expat/{expat-2.0.1 =>  expat-2.1.0}/autotools.patch    |   13 ++++++++-----
>   meta/recipes-core/expat/expat_2.0.1.bb                    |    6 ------
>   meta/recipes-core/expat/expat_2.1.0.bb                    |    6 ++++++
>   3 files changed, 14 insertions(+), 11 deletions(-)
>   rename meta/recipes-core/expat/{expat-2.0.1 =>  expat-2.1.0}/autotools.patch (53%)
>   delete mode 100644 meta/recipes-core/expat/expat_2.0.1.bb
>   create mode 100644 meta/recipes-core/expat/expat_2.1.0.bb

Tested-by: Scott Garman <scott.a.garman@intel.com>
Acked-by: Scott Garman <scott.a.garman@intel.com>

Richard/Saul, if it's easier for you to cherry-pick, I have the patch in 
a git tree here:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=sgarman/expat-upgrade-oe

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


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


