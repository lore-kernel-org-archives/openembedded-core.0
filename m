Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TQjx5-0006VA-5k
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 21:15:47 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 23 Oct 2012 12:02:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,637,1344236400"; d="scan'208";a="237295724"
Received: from unknown (HELO [10.255.14.141]) ([10.255.14.141])
	by fmsmga001.fm.intel.com with ESMTP; 23 Oct 2012 12:02:19 -0700
Message-ID: <5086E9BB.5080005@linux.intel.com>
Date: Tue, 23 Oct 2012 12:02:19 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1350598767.4470.179.camel@x121e.pbcl.net>
In-Reply-To: <1350598767.4470.179.camel@x121e.pbcl.net>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cpan-base: Add more debug paths to FILES
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
X-List-Received-Date: Tue, 23 Oct 2012 19:15:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/18/2012 03:19 PM, Phil Blundell wrote:
> We seem to be mostly installing modules into vendor_perl nowadays.
> Make sure that the .debug data from there is captured appropriately.
>
> Also, expand ${PERLLIBDIRS} at the point of assignment so we don't
> call the python again and again.
>
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>   meta/classes/cpan-base.bbclass |    9 +++++++--
>   1 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/cpan-base.bbclass b/meta/classes/cpan-base.bbclass
> index 660c15f..cf697f1 100644
> --- a/meta/classes/cpan-base.bbclass
> +++ b/meta/classes/cpan-base.bbclass
> @@ -39,8 +39,13 @@ def is_target(d):
>           return "yes"
>       return "no"
>
> -PERLLIBDIRS = "${@perl_get_libdirs(d)}"
> +PERLLIBDIRS := "${@perl_get_libdirs(d)}"
> +PERLVERSION := "${@get_perl_version(d)}"
>
>   FILES_${PN}-dbg += "${PERLLIBDIRS}/auto/*/.debug \
>                       ${PERLLIBDIRS}/auto/*/*/.debug \
> -                    ${PERLLIBDIRS}/auto/*/*/*/.debug"
> +                    ${PERLLIBDIRS}/auto/*/*/*/.debug \
> +		    ${PERLLIBDIRS}/vendor_perl/${PERLVERSION}/auto/*/.debug \
> +		    ${PERLLIBDIRS}/vendor_perl/${PERLVERSION}/auto/*/*/.debug \
> +		    ${PERLLIBDIRS}/vendor_perl/${PERLVERSION}/auto/*/*/*/.debug \
> +		    "
>
Merged into OE-Core (with whitespaces fixed)

Thanks
	Sau!



