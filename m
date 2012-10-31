Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TTSRN-0006DI-Mb
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Oct 2012 08:10:17 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 30 Oct 2012 23:56:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,685,1344236400"; d="scan'208";a="240656060"
Received: from unknown (HELO [10.255.14.124]) ([10.255.14.124])
	by fmsmga001.fm.intel.com with ESMTP; 30 Oct 2012 23:56:39 -0700
Message-ID: <5090CBA7.7040100@linux.intel.com>
Date: Tue, 30 Oct 2012 23:56:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1351524020.13864.17.camel@phil-desktop>
In-Reply-To: <1351524020.13864.17.camel@phil-desktop>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: Use ${CFLAGS} not ${FULL_OPTIMIZATION}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 31 Oct 2012 07:10:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/2012 08:20 AM, Phil Blundell wrote:
> The latter variable is only applicable for target builds and could
> result in passing incompatible options (and/or failing to pass
> required options) to ${BUILD_CC} for a virtclass-native build.
>
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>   meta/recipes-connectivity/openssl/openssl.inc |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
> index 089b9a4..1b2be93 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -19,7 +19,7 @@ S = "${WORKDIR}/openssl-${PV}"
>
>   AR_append = " r"
>   CFLAG = "${@base_conditional('SITEINFO_ENDIANNESS', 'le', '-DL_ENDIAN', '-DB_ENDIAN', d)} \
> -	-DTERMIO ${FULL_OPTIMIZATION} -Wall"
> +	-DTERMIO ${CFLAGS} -Wall"
>
>   # Avoid binaries being marked as requiring an executable stack (which causes
>   # issues with SELinux on the host)
>
Merged into OE-Core

Thanks
	Sau!



