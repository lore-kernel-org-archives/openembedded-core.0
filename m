Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TOwL8-0004ec-68
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 22:05:10 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 Oct 2012 12:51:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,608,1344236400"; d="scan'208";a="235684087"
Received: from unknown (HELO [10.255.13.210]) ([10.255.13.210])
	by fmsmga001.fm.intel.com with ESMTP; 18 Oct 2012 12:51:43 -0700
Message-ID: <50805DCF.3060104@linux.intel.com>
Date: Thu, 18 Oct 2012 12:51:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1348608781.1335.9.camel@x121e.pbcl.net>
In-Reply-To: <1348608781.1335.9.camel@x121e.pbcl.net>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cpan_build: Unify directory layout for native and target builds
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
X-List-Received-Date: Thu, 18 Oct 2012 20:05:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/25/2012 02:33 PM, Phil Blundell wrote:
> There seems to be no benefit in having them be different and this
> appears to cause a certain amount of confusion about paths for
> the native modules.
>
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
> previously posted as RFC, no comments so reposting as an actual patch
>
>   meta/classes/cpan_build.bbclass |    7 ++-----
>   1 files changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/cpan_build.bbclass
> b/meta/classes/cpan_build.bbclass
> index 36ffc56..0809602 100644
> --- a/meta/classes/cpan_build.bbclass
> +++ b/meta/classes/cpan_build.bbclass
> @@ -23,8 +23,9 @@ cpan_build_do_configure () {
>   	if [ ${@is_target(d)} == "yes" ]; then
>   		# build for target
>   		. ${STAGING_LIBDIR}/perl/config.sh
> +	fi
>
> -			perl Build.PL --installdirs vendor \
> +	perl Build.PL --installdirs vendor \
>   				--destdir ${D} \
>   				--install_path lib="${datadir}/perl" \
>   				--install_path arch="${libdir}/perl" \
> @@ -32,10 +33,6 @@ cpan_build_do_configure () {
>   				--install_path bin=${bindir} \
>   				--install_path bindoc=${mandir}/man1 \
>   				--install_path libdoc=${mandir}/man3
> -	else
> -		# build for host
> -		perl Build.PL --installdirs site --destdir ${D}
> -	fi
>   }
>
>   cpan_build_do_compile () {
>

Merged into OE-Core

Thanks
	Sau!



