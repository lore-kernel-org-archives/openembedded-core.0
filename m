Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T9gqD-0000df-Mb
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 20:30:13 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Sep 2012 11:17:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,380,1344236400"; d="scan'208";a="189746862"
Received: from unknown (HELO [10.255.13.76]) ([10.255.13.76])
	by orsmga001.jf.intel.com with ESMTP; 06 Sep 2012 11:17:48 -0700
Message-ID: <5048E8CB.4070409@linux.intel.com>
Date: Thu, 06 Sep 2012 11:17:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1346844999-9420-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1346844999-9420-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gsettings.bbclass: fix whitespace
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
X-List-Received-Date: Thu, 06 Sep 2012 18:30:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/05/2012 04:36 AM, Ross Burton wrote:
> As nothing in oe-core uses gsettings, it wasn't noticed that the whitespace is
> wrong.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/classes/gsettings.bbclass |   32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/meta/classes/gsettings.bbclass b/meta/classes/gsettings.bbclass
> index 1e3f7a1..dec5abc 100644
> --- a/meta/classes/gsettings.bbclass
> +++ b/meta/classes/gsettings.bbclass
> @@ -18,20 +18,20 @@ gsettings_postinstrm () {
>   }
>
>   python populate_packages_append () {
> -	pkg = d.getVar('PN', True)
> -	bb.note("adding gsettings postinst scripts to %s" % pkg)
> -
> -	postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
> -	if not postinst:
> -		postinst = '#!/bin/sh\n'
> -	postinst += d.getVar('gsettings_postinstrm', True)
> -	d.setVar('pkg_postinst_%s' % pkg, postinst)
> -
> -	bb.note("adding gsettings postrm scripts to %s" % pkg)
> -
> -	postrm = d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)
> -	if not postrm:
> -		postrm = '#!/bin/sh\n'
> -	postrm += d.getVar('gsettings_postinstrm', True)
> -	d.setVar('pkg_postrm_%s' % pkg, postrm)
> +    pkg = d.getVar('PN', True)
> +    bb.note("adding gsettings postinst scripts to %s" % pkg)
> +
> +    postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
> +    if not postinst:
> +        postinst = '#!/bin/sh\n'
> +    postinst += d.getVar('gsettings_postinstrm', True)
> +    d.setVar('pkg_postinst_%s' % pkg, postinst)
> +
> +    bb.note("adding gsettings postrm scripts to %s" % pkg)
> +
> +    postrm = d.getVar('pkg_postrm_%s' % pkg, True) or d.getVar('pkg_postrm', True)
> +    if not postrm:
> +        postrm = '#!/bin/sh\n'
> +    postrm += d.getVar('gsettings_postinstrm', True)
> +    d.setVar('pkg_postrm_%s' % pkg, postrm)
>   }
>
Merged into OE-Core

Thanks
	Sau!



