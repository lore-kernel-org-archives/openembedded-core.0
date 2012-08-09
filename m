Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SzMdb-0005TQ-FT
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Aug 2012 08:54:31 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Aug 2012 23:42:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,738,1336374000"; d="scan'208";a="205330000"
Received: from unknown (HELO [10.255.12.203]) ([10.255.12.203])
	by fmsmga002.fm.intel.com with ESMTP; 08 Aug 2012 23:42:41 -0700
Message-ID: <50235BE0.3050601@linux.intel.com>
Date: Thu, 09 Aug 2012 09:42:40 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343741848-7753-1-git-send-email-bogdan.a.marinescu@intel.com>
In-Reply-To: <1343741848-7753-1-git-send-email-bogdan.a.marinescu@intel.com>
Subject: Re: [PATCH] libconvert-asn1-perl: updated to 0.26
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
X-List-Received-Date: Thu, 09 Aug 2012 06:54:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/31/2012 04:37 PM, Bogdan Marinescu wrote:
> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
> ---
>   ...1-perl_0.22.bb => libconvert-asn1-perl_0.26.bb} |    7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>   rename meta/recipes-extended/perl/{libconvert-asn1-perl_0.22.bb => libconvert-asn1-perl_0.26.bb} (60%)
>
> diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.22.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb
> similarity index 60%
> rename from meta/recipes-extended/perl/libconvert-asn1-perl_0.22.bb
> rename to meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb
> index dc950f1..d3a1fd6 100644
> --- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.22.bb
> +++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb
> @@ -1,13 +1,12 @@
>   DESCRIPTION = "Convert::ASN1 - ASN.1 Encode/Decode library"
>   SECTION = "libs"
>   LICENSE = "Artistic-1.0 | GPL-1.0+"
> -LIC_FILES_CHKSUM = "file://README;beginline=10;endline=12;md5=a64b291b13ffddeef33b14f047ee8b26"
> -PR = "r3"
> +LIC_FILES_CHKSUM = "file://README.md;beginline=93;endline=96;md5=223dc4bd67e994f3c371158686e19c19"
>
There is no commit message as to why you changed the order, did the 
license change at all?

Any changes to LIC_FILES_CHKSUM, regardless of how trivial needs a 
commit message please.

Sau!

>   SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/Convert-ASN1-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "64a555e44adc79d92072b9fc7a6779c4"
> -SRC_URI[sha256sum] = "be63d5cc715d7306e54b41d3c68c3617ca306289cff619a2ca43505e35f2f6ee"
> +SRC_URI[md5sum] = "1c846c8c1125e6a075444abe65d99b63"
> +SRC_URI[sha256sum] = "5db8b62fa0d036bd0cabc869ffe17941ad587d9a2af1ff030d554872adbc1ca1"
>
>   S = "${WORKDIR}/Convert-ASN1-${PV}"
>
>


