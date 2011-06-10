Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QUrgf-0002By-BT
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 04:43:06 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jun 2011 19:39:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,344,1304319600"; d="scan'208";a="14527502"
Received: from unknown (HELO [10.255.12.216]) ([10.255.12.216])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2011 19:39:42 -0700
Message-ID: <4DF183EE.9050605@linux.intel.com>
Date: Thu, 09 Jun 2011 19:39:42 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Kang Kai <kai.kang@windriver.com>
References: <cover.1307529994.git.kai.kang@windriver.com>
	<3753d5b6e3a1c6cec6bdb75b90c73f96058b292c.1307529994.git.kai.kang@windriver.com>
In-Reply-To: <3753d5b6e3a1c6cec6bdb75b90c73f96058b292c.1307529994.git.kai.kang@windriver.com>
Cc: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libxml-simple-perl: update EXTRA_PERLFLAGS
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
X-List-Received-Date: Fri, 10 Jun 2011 02:43:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2011 03:49 AM, Kang Kai wrote:
> From: Kang Kai<kai.kang@windriver.com>
>
> [Yocto 1132]
>
> libxml-simple-perl should not refer to native perl libs modules, update
> EXTRA_PERLFLAGS to fix the failure.
>
> Signed-off-by: Kang Kai<kai.kang@windriver.com>
> ---
>   .../perl/libxml-simple-perl_2.18.bb                |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb b/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb
> index ca57776..75a018a 100644
> --- a/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb
> +++ b/meta/recipes-devtools/perl/libxml-simple-perl_2.18.bb
> @@ -2,7 +2,7 @@ SECTION = "libs"
>   LICENSE = "Artistic"
>   LIC_FILES_CHKSUM = "file://README;beginline=70;md5=94aa5d46682b411a53a5494cfb22640e"
>   DEPENDS += "libxml-parser-perl"
> -PR = "r1"
> +PR = "r2"
>
>   SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Simple-${PV}.tar.gz"
>
> @@ -11,6 +11,6 @@ SRC_URI[sha256sum] = "a54967c188cda3e20f496c83be4de3f1740eeaa83c0380712ecd969ad8
>
>   S = "${WORKDIR}/XML-Simple-${PV}"
>
> -EXTRA_PERLFLAGS = "-I ${STAGING_LIBDIR_NATIVE}/perl/${@get_perl_version(d)}"
> +EXTRA_PERLFLAGS = "-I ${STAGING_LIBDIR}/perl/${@get_perl_version(d)}"
>
Can you explain in more detail why this change is needed?  should the 
ordering DEPENDS ordering change?

Sau!


>   inherit cpan


