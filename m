Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXcij-00080X-Ha
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 20:25:09 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 May 2012 11:14:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="103919541"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by AZSMGA002.ch.intel.com with ESMTP; 24 May 2012 11:14:56 -0700
Message-ID: <4FBE7AA0.6090705@linux.intel.com>
Date: Thu, 24 May 2012 11:14:56 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1337780788-30178-1-git-send-email-s.stirtzel@googlemail.com>
In-Reply-To: <1337780788-30178-1-git-send-email-s.stirtzel@googlemail.com>
Subject: Re: [PATCH v3] valgrind: Enable valgrind for armv7
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
X-List-Received-Date: Thu, 24 May 2012 18:25:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/23/2012 06:46 AM, Samuel Stirtzel wrote:
> Valgrind supports the armv7 architecture, this patch allows armv7 users to build and use Valgrind
>
> This patch was run-tested on a Gumstix Overo (armv7a cortex-a8)
> * The test consisted of running valgrinds memcheck (memory leakage detection),
> * and callgrind (profiling) on a Qt 4 application
>
> Signed-off-by: Samuel Stirtzel<s.stirtzel@googlemail.com>
> ---
>   meta/recipes-devtools/valgrind/valgrind_3.7.0.bb |    3 +++
>   1 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
> index d7c7b24..6b54472 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
> @@ -23,13 +23,16 @@ SRC_URI[md5sum] = "a855fda56edf05614f099dca316d1775"
>   SRC_URI[sha256sum] = "5d62c0330f1481fe2c593249192fa68ff454c19c34343978cc9ce91aa324cbf6"
>
>   COMPATIBLE_HOST = '(i.86|x86_64|powerpc|powerpc64).*-linux'
> +COMPATIBLE_HOST_armv7a = 'arm.*-linux'
>
>   inherit autotools
>
>   EXTRA_OECONF = "--enable-tls"
> +EXTRA_OECONF_armv7a = "--enable-tls -host=armv7-none-linux-gnueabi"
>   EXTRA_OEMAKE = "-w"
>   PARALLEL_MAKE = ""
>
>   FILES_${PN}-dbg += "${libdir}/${PN}/*/.debug/*"
>   RRECOMMENDS_${PN}_powerpc += "${TCLIBC}-dbg"
>   RRECOMMENDS_${PN}_powerpc64 += "${TCLIBC}-dbg"
> +RRECOMMENDS_${PN}_armv7a += "${TCLIBC}-dbg"

Merged into OE-Core

Thanks
	Sau!


