Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7Cp0-00069Y-0R
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Mar 2012 22:30:26 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Mar 2012 14:21:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="117025924"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by orsmga001.jf.intel.com with ESMTP; 12 Mar 2012 14:21:41 -0700
Message-ID: <4F5E68E5.5020308@linux.intel.com>
Date: Mon, 12 Mar 2012 14:21:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1331035393-27558-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1331035393-27558-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] xz: split out liblzma as seperate packages
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
X-List-Received-Date: Mon, 12 Mar 2012 21:30:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2012 04:03 AM, Koen Kooi wrote:
> As usual, this creates problems for upgrade paths, but splitting out the lib is worth the short term hassle
>
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>   meta/recipes-extended/xz/xz_5.0.3.bb |    9 ++++++++-
>   1 files changed, 8 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-extended/xz/xz_5.0.3.bb b/meta/recipes-extended/xz/xz_5.0.3.bb
> index bae71ec..e8f96b6 100644
> --- a/meta/recipes-extended/xz/xz_5.0.3.bb
> +++ b/meta/recipes-extended/xz/xz_5.0.3.bb
> @@ -14,8 +14,15 @@ SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
>   SRC_URI[md5sum] = "fefe52f9ecd521de2a8ce38c21a27574"
>   SRC_URI[sha256sum] = "10eb4df72dffb2fb14c3d2d82b450e72282ffcb9ee3908a8e5b392b8f09681bf"
>
> -PR = "r0"
> +PR = "r1"
>
>   inherit autotools gettext
>
> +PACKAGES =+ "liblzma liblzma-dev liblzma-staticdev liblzma-dbg"
> +
> +FILES_liblzma = "${libdir}/liblzma*${SOLIBS}"
> +FILES_liblzma-dev = "${includedir}/lzma* ${libdir}/liblzma*${SOLIBSDEV} ${libdir}/liblzma.la ${libdir}/pkgconfig/liblzma.pc"
> +FILES_liblzma-staticdev = "${libdir}/liblzma.a"
> +FILES_liblzma-dbg = "${libdir}/.debug/liblzma*"
> +
>   BBCLASSEXTEND = "native"

Merged into OE-Core

Thanks
	Sau!


