Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjFKb-0007fZ-9J
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 20:47:45 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jul 2011 11:43:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,229,1309762800"; d="scan'208";a="32183358"
Received: from unknown (HELO [10.255.13.254]) ([10.255.13.254])
	by fmsmga001.fm.intel.com with ESMTP; 19 Jul 2011 11:43:38 -0700
Message-ID: <4E25D059.30605@linux.intel.com>
Date: Tue, 19 Jul 2011 11:43:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1310654732.2378.65.camel@phil-desktop>
In-Reply-To: <1310654732.2378.65.camel@phil-desktop>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH] libcap: pass prefix to "make install"
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
X-List-Received-Date: Tue, 19 Jul 2011 18:47:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/14/2011 07:45 AM, Phil Blundell wrote:
> Otherwise it will use /usr by default which may not be the right place.
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   meta/recipes-support/libcap/libcap.inc     |    2 +-
>   meta/recipes-support/libcap/libcap_2.20.bb |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
> index 3bff3b9..efa46d6 100644
> --- a/meta/recipes-support/libcap/libcap.inc
> +++ b/meta/recipes-support/libcap/libcap.inc
> @@ -29,7 +29,7 @@ do_compile() {
>   }
>
>   do_install() {
> -	oe_runmake install DESTDIR="${D}"
> +	oe_runmake install DESTDIR="${D}" prefix="${prefix}"
>   }
>
>   # pam files
> diff --git a/meta/recipes-support/libcap/libcap_2.20.bb b/meta/recipes-support/libcap/libcap_2.20.bb
> index c9741c2..a2b49c6 100644
> --- a/meta/recipes-support/libcap/libcap_2.20.bb
> +++ b/meta/recipes-support/libcap/libcap_2.20.bb
> @@ -1,6 +1,6 @@
>   require libcap.inc
>
> -PR = "r2"
> +PR = "r3"
>
>   SRC_URI[md5sum] = "10e47ed32ca2214eb0e58780282d27b4"
>   SRC_URI[sha256sum] = "20e7c1ea4d3d5c410efb3a6ff138dc417912fae316d883460dcd58d9803a9220"

Merged into oe-core

Thanks
	Sau!


