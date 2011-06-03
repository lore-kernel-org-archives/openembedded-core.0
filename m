Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QSHxL-0007hq-37
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 02:09:39 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jun 2011 17:06:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,312,1304319600"; d="scan'208";a="11157604"
Received: from swold-mobl.jf.intel.com (HELO [10.24.4.14]) ([10.24.4.14])
	by fmsmga002.fm.intel.com with ESMTP; 02 Jun 2011 17:06:25 -0700
Message-ID: <4DE82582.3050504@linux.intel.com>
Date: Thu, 02 Jun 2011 17:06:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1306857982.2529.13.camel@phil-desktop>
In-Reply-To: <1306857982.2529.13.camel@phil-desktop>
Subject: Re: [PATCH] binconfig: improve handling of empty prefixes
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
X-List-Received-Date: Fri, 03 Jun 2011 00:09:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/31/2011 09:06 AM, Phil Blundell wrote:
> This is a backport of 952e5e2b7a5c1deefc939594d40b81a71fb16a54 from oe master.
>
> Without this the script mangling goes very wrong if ${prefix}="".  There
> isn't really any way to fix this in the completely general case, but
> this patch does work with the two cases I tested (freetype and
> gpg-error) which were unusable previously.
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   meta/classes/binconfig.bbclass |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/binconfig.bbclass b/meta/classes/binconfig.bbclass
> index 8e22d2d..3deb541 100644
> --- a/meta/classes/binconfig.bbclass
> +++ b/meta/classes/binconfig.bbclass
> @@ -6,8 +6,8 @@ def get_binconfig_mangle(d):
>   		s += " -e 's:=%s${libdir}:=\\1OELIBDIR:;'" % optional_quote
>   		s += " -e 's:=%s${includedir}:=\\1OEINCDIR:;'" % optional_quote
>   		s += " -e 's:=%s${datadir}:=\\1OEDATADIR:'" % optional_quote
> -		s += " -e 's:=%s${prefix}:=\\1OEPREFIX:'" % optional_quote
> -		s += " -e 's:=%s${exec_prefix}:=\\1OEEXECPREFIX:'" % optional_quote
> +		s += " -e 's:=%s${prefix}/:=\\1OEPREFIX/:'" % optional_quote
> +		s += " -e 's:=%s${exec_prefix}/:=\\1OEEXECPREFIX/:'" % optional_quote
>   		s += " -e 's:-L${libdir}:-LOELIBDIR:;'"
>   		s += " -e 's:-I${includedir}:-IOEINCDIR:;'"
>   		s += " -e 's:OELIBDIR:${STAGING_LIBDIR}:;'"
Merged into OE-Core

Thanks
	Sau!


