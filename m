Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Srlb6-0006TT-AT
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 09:56:32 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 19 Jul 2012 00:45:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="168353269"
Received: from unknown (HELO [10.255.12.217]) ([10.255.12.217])
	by orsmga001.jf.intel.com with ESMTP; 19 Jul 2012 00:45:09 -0700
Message-ID: <5007BB05.2040007@linux.intel.com>
Date: Thu, 19 Jul 2012 00:45:09 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1342206947-22186-1-git-send-email-msm@freescale.com>
In-Reply-To: <1342206947-22186-1-git-send-email-msm@freescale.com>
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH v2] gcc-package-runtime.inc: Fix QA warning
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
X-List-Received-Date: Thu, 19 Jul 2012 07:56:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/13/2012 12:15 PM, Matthew McClintock wrote:
>> ERROR: QA Issue: gcc-runtime: Files/directories were installed but not shipped
>>    /usr/lib/libgomp.so.1.0.0
>>    /usr/lib/libgomp.so.1
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> v2: - use SOLIBS and SOLIBSDEV
>
>   meta/recipes-devtools/gcc/gcc-4.7.inc             |    2 +-
>   meta/recipes-devtools/gcc/gcc-package-runtime.inc |    3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
> index 0e40533..b3012d7 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.7.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
> @@ -1,6 +1,6 @@
>   require gcc-common.inc
>
> -PR = "r5"
> +PR = "r6"
>
>   # Third digit in PV should be incremented after a minor release
>   # happens from this branch on gcc e.g. currently its 4.7.1
> diff --git a/meta/recipes-devtools/gcc/gcc-package-runtime.inc b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
> index a81e3b7..75847b6 100644
> --- a/meta/recipes-devtools/gcc/gcc-package-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
> @@ -64,8 +64,9 @@ FILES_libmudflap-dev = "\
>     ${libdir}/libmudflap*.a \
>     ${libdir}/libmudflap*.la"
>
> +FILES_libgomp = "${libdir}/libgomp*${SOLIBS}"
>   FILES_libgomp-dev = "\
> -  ${libdir}/libgomp*.so \
> +  ${libdir}/libgomp*${SOLIBSDEV} \
>     ${libdir}/libgomp*.la \
>     ${libdir}/libgomp.spec \
>     ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h \
>
Merged into OE-Core

Thanks
	Sau!





