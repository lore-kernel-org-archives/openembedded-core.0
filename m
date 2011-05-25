Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QPF69-0005l5-K7
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 16:30:09 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 25 May 2011 07:27:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,267,1304319600"; 
   d="scan'208";a="8513127"
Received: from unknown (HELO [10.255.12.133]) ([10.255.12.133])
	by fmsmga001.fm.intel.com with ESMTP; 25 May 2011 07:27:05 -0700
Message-ID: <4DDD11B9.8030508@linux.intel.com>
Date: Wed, 25 May 2011 07:27:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1306312621.git.sgw@linux.intel.com>
	<e9b41a5bbc89a3a6f1a4d9d744e1cd0c579af2e9.1306312621.git.sgw@linux.intel.com>
In-Reply-To: <e9b41a5bbc89a3a6f1a4d9d744e1cd0c579af2e9.1306312621.git.sgw@linux.intel.com>
Subject: Re: [Updated Consolidated Pull 19/19] gnutls: update to 2.12.5
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
X-List-Received-Date: Wed, 25 May 2011 14:30:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/25/2011 01:40 AM, Saul Wold wrote:
> - Add libcap to depends
>
> Signed-off-by: Saul Wold<sgw@linux.intel.com>
> ---
>   .../configure-fix.patch                            |    0
>   .../gnutls-openssl.patch                           |    0
>   .../gnutls-texinfo-euro.patch                      |    0
>   meta/recipes-support/gnutls/gnutls.inc             |    2 +-
>   .../gnutls/{gnutls_2.10.4.bb =>  gnutls_2.12.5.bb}  |    4 ++--
>   5 files changed, 3 insertions(+), 3 deletions(-)
>   rename meta/recipes-support/gnutls/{gnutls-2.10.4 =>  gnutls-2.12.5}/configure-fix.patch (100%)
>   rename meta/recipes-support/gnutls/{gnutls-2.10.4 =>  gnutls-2.12.5}/gnutls-openssl.patch (100%)
>   rename meta/recipes-support/gnutls/{gnutls-2.10.4 =>  gnutls-2.12.5}/gnutls-texinfo-euro.patch (100%)
>   rename meta/recipes-support/gnutls/{gnutls_2.10.4.bb =>  gnutls_2.12.5.bb} (53%)
>
> diff --git a/meta/recipes-support/gnutls/gnutls-2.10.4/configure-fix.patch b/meta/recipes-support/gnutls/gnutls-2.12.5/configure-fix.patch
> similarity index 100%
> rename from meta/recipes-support/gnutls/gnutls-2.10.4/configure-fix.patch
> rename to meta/recipes-support/gnutls/gnutls-2.12.5/configure-fix.patch
> diff --git a/meta/recipes-support/gnutls/gnutls-2.10.4/gnutls-openssl.patch b/meta/recipes-support/gnutls/gnutls-2.12.5/gnutls-openssl.patch
> similarity index 100%
> rename from meta/recipes-support/gnutls/gnutls-2.10.4/gnutls-openssl.patch
> rename to meta/recipes-support/gnutls/gnutls-2.12.5/gnutls-openssl.patch
> diff --git a/meta/recipes-support/gnutls/gnutls-2.10.4/gnutls-texinfo-euro.patch b/meta/recipes-support/gnutls/gnutls-2.12.5/gnutls-texinfo-euro.patch
> similarity index 100%
> rename from meta/recipes-support/gnutls/gnutls-2.10.4/gnutls-texinfo-euro.patch
> rename to meta/recipes-support/gnutls/gnutls-2.12.5/gnutls-texinfo-euro.patch
> diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
> index 2dcd8a0..d220a24 100644
> --- a/meta/recipes-support/gnutls/gnutls.inc
> +++ b/meta/recipes-support/gnutls/gnutls.inc
> @@ -1,7 +1,7 @@
>   DESCRIPTION = "GNU Transport Layer Security Library"
>   HOMEPAGE = "http://www.gnu.org/software/gnutls/"
>   BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
> -DEPENDS = "zlib lzo libtasn1 libgcrypt (>= 1.4.2)"
> +DEPENDS = "zlib lzo libtasn1 libgcrypt (>= 1.4.2) libcap"
>
>   BBCLASSEXTEND = "native"
>
> diff --git a/meta/recipes-support/gnutls/gnutls_2.10.4.bb b/meta/recipes-support/gnutls/gnutls_2.12.5.bb
> similarity index 53%
> rename from meta/recipes-support/gnutls/gnutls_2.10.4.bb
> rename to meta/recipes-support/gnutls/gnutls_2.12.5.bb
> index 3924ecd..ad4fd3d 100644
> --- a/meta/recipes-support/gnutls/gnutls_2.10.4.bb
> +++ b/meta/recipes-support/gnutls/gnutls_2.12.5.bb
> @@ -6,5 +6,5 @@ SRC_URI += "file://gnutls-openssl.patch \
>               file://gnutls-texinfo-euro.patch \
>               file://configure-fix.patch"
>
> -SRC_URI[md5sum] = "4e1517084018a8b1fdc96daabea40528"
> -SRC_URI[sha256sum] = "b8bfe36450fe671e99db5ff1e44e6b65fda8a79cacd9e77d550eff7da3745fc8"
> +SRC_URI[md5sum] = "2d0bd5ae11534074fcd78da6ea384e64"
> +SRC_URI[sha256sum] = "bf263880f327ac34a561d8e66b5a729cbe33eea56728bfed3406ff2898448b60"

Please don't take this gnutls update, I was a little too hasty in 
sending it up, was testing it and it should not be here.

Sau!


