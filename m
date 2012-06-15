Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sfb5j-0000uf-FA
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 20:17:51 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Jun 2012 11:07:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="158159587"
Received: from unknown (HELO [10.255.12.138]) ([10.255.12.138])
	by orsmga002.jf.intel.com with ESMTP; 15 Jun 2012 11:07:11 -0700
Message-ID: <4FDB79CF.1030200@linux.intel.com>
Date: Fri, 15 Jun 2012 11:07:11 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1339419329-26688-1-git-send-email-bogdan.a.marinescu@intel.com>
In-Reply-To: <1339419329-26688-1-git-send-email-bogdan.a.marinescu@intel.com>
Subject: Re: [PATCH] libpcre: updated to version 8.30
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
X-List-Received-Date: Fri, 15 Jun 2012 18:17:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/11/2012 05:55 AM, Bogdan Marinescu wrote:
> Tested by compiling lighttpd. The license file changed because the
> copyright notice was updated to cover 2012.
>
> Signed-off-by: Bogdan Marinescu<bogdan.a.marinescu@intel.com>
> ---
>   .../libpcre/{libpcre_8.21.bb =>  libpcre_8.30.bb}   |   10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>   rename meta/recipes-support/libpcre/{libpcre_8.21.bb =>  libpcre_8.30.bb} (86%)
>
> diff --git a/meta/recipes-support/libpcre/libpcre_8.21.bb b/meta/recipes-support/libpcre/libpcre_8.30.bb
> similarity index 86%
> rename from meta/recipes-support/libpcre/libpcre_8.21.bb
> rename to meta/recipes-support/libpcre/libpcre_8.30.bb
> index f5fa4ef..83831e7 100644
> --- a/meta/recipes-support/libpcre/libpcre_8.21.bb
> +++ b/meta/recipes-support/libpcre/libpcre_8.30.bb
> @@ -5,15 +5,15 @@ provides a POSIX calling interface to PCRE; the regular expressions \
>   themselves still follow Perl syntax and semantics. The header file for \
>   the POSIX-style functions is called pcreposix.h."
>   SECTION = "devel"
> -PR = "r1"
> +PR = "r0"
>   LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENCE;md5=2f00d186a775c8002422a5315079d96b"
> -SRC_URI = "${SOURCEFORGE_MIRROR}/pcre/pcre-${PV}.tar.bz2 \
> +LIC_FILES_CHKSUM = "file://LICENCE;md5=115e2bee152e2e23e838a29136094877"
> +SRC_URI = "${SOURCEFORGE_MIRROR}/project/pcre/pcre/${PV}/pcre-${PV}.tar.bz2 \
>              file://pcre-cross.patch \
>              file://fix-pcre-name-collision.patch"
>
> -SRC_URI[md5sum] = "0a7b592bea64b7aa7f4011fc7171a730"
> -SRC_URI[sha256sum] = "a4b8509d11fc2764fb4e1415b764ad2c214459edc011ce48aeeb6bbe1ac599e3"
> +SRC_URI[md5sum] = "98e8928cccc945d04279581e778fbdff"
> +SRC_URI[sha256sum] = "c1113fd7db934e97ad8b3917d432e5b642e9eb9afd127eb797804937c965f4ac"
>
>   S = "${WORKDIR}/pcre-${PV}"
>

Merged into OE-Core

Thanks
	Sau!


