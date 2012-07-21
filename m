Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SsNhk-0005hM-1O
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Jul 2012 02:37:56 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 20 Jul 2012 17:26:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181820675"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by fmsmga001.fm.intel.com with ESMTP; 20 Jul 2012 17:26:31 -0700
Message-ID: <5009F737.2010305@linux.intel.com>
Date: Fri, 20 Jul 2012 17:26:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342761780-20215-1-git-send-email-raj.khem@gmail.com>
	<1342761780-20215-2-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1342761780-20215-2-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH 2/3] binutils: Add missing target package dependencies
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
X-List-Received-Date: Sat, 21 Jul 2012 00:37:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/19/2012 10:22 PM, Khem Raj wrote:
> e.g. libfl from flex is needed for target
> binutils to link otherwise it can fail to build
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/recipes-devtools/binutils/binutils-2.22.inc |    2 +-
>   meta/recipes-devtools/binutils/binutils_2.22.bb  |    3 +++
>   2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.22.inc b/meta/recipes-devtools/binutils/binutils-2.22.inc
> index e776985..e3e179d 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.22.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.22.inc
> @@ -1,4 +1,4 @@
> -PR = "r12"
> +PR = "r13"
>
>   LIC_FILES_CHKSUM="\
>       file://src-release;endline=17;md5=4830a9ef968f3b18dd5e9f2c00db2d35\
> diff --git a/meta/recipes-devtools/binutils/binutils_2.22.bb b/meta/recipes-devtools/binutils/binutils_2.22.bb
> index b8e1112..b8250d8 100644
> --- a/meta/recipes-devtools/binutils/binutils_2.22.bb
> +++ b/meta/recipes-devtools/binutils/binutils_2.22.bb
> @@ -1,5 +1,8 @@
>   require binutils.inc
>   require binutils-${PV}.inc
> +
> +DEPENDS += "flex bison zlib"
> +
>   EXTRA_OECONF += "--with-sysroot=/ \
>                   --enable-install-libbfd \
>                   --enable-shared \
>

Merged this along with 3/3 puzzles, sorry for the confusion on the http, 
I thought I downloaded it correctly, must have hit the mirror.

Thanks
	Sau!


