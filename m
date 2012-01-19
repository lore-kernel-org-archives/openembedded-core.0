Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnyAo-0001qq-QW
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 21:01:27 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Jan 2012 11:53:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="100529722"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by orsmga002.jf.intel.com with ESMTP; 19 Jan 2012 11:53:45 -0800
Message-ID: <4F1874C4.8060104@linux.intel.com>
Date: Thu, 19 Jan 2012 11:53:40 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1326951556-18395-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1326951556-18395-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH] gnutls: Fix configure issue wrt to rm
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
X-List-Received-Date: Thu, 19 Jan 2012 20:01:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/18/2012 09:39 PM, Khem Raj wrote:
> Add -f option so if the files dont exist then we can
> still continue. Fixes errors like
>
> | + do_configure
> | + for dir in . lib libextra
> | + rm ./aclocal.m4 ./m4/libtool.m4 './m4/lt*.m4'
> | rm: cannot remove `./m4/libtool.m4': No such file or directory
> | rm: cannot remove `./m4/lt*.m4': No such file or directory
>
> Signed-off-by: Khem Raj<raj.khem@gmail.com>
> ---
>   meta/recipes-support/gnutls/gnutls.inc |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
> index 5991540..c639b11 100644
> --- a/meta/recipes-support/gnutls/gnutls.inc
> +++ b/meta/recipes-support/gnutls/gnutls.inc
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://www.gnu.org/software/gnutls/"
>   BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
>   DEPENDS = "zlib lzo libtasn1 libgcrypt (>= 1.4.2) libcap readline"
>
> -INC_PR = "r4"
> +INC_PR = "r5"
>
>   LICENSE = "GPLv3+&  LGPLv2.1+"
>   LICENSE_${PN} = "LGPLv2.1+"
> @@ -31,7 +31,7 @@ EXTRA_OECONF="--with-included-opencdk --with-included-libcfg --disable-rpath \
>                 "
>   do_configure_prepend() {
>   	for dir in . lib libextra; do
> -		rm ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
> +		rm -f ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
>   	done
>   }
>

Merged into OE-Core

Thanks
	Sau!


