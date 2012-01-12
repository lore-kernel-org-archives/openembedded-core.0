Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RlTxK-00088p-Ls
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 00:21:14 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 11 Jan 2012 22:28:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95015284"
Received: from unknown (HELO [10.255.13.168]) ([10.255.13.168])
	by azsmga001.ch.intel.com with ESMTP; 11 Jan 2012 22:28:25 -0800
Message-ID: <4F0E7D83.5050707@linux.intel.com>
Date: Wed, 11 Jan 2012 22:28:19 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1325911915-16001-3-git-send-email-steve@sakoman.com>
In-Reply-To: <1325911915-16001-3-git-send-email-steve@sakoman.com>
Cc: Steve Sakoman <steve@sakoman.com>
Subject: Re: [PATCH RFC v2] gtk-icon-cache.bbclass: add -f option to gtk-update-icon-cache in postinst
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
X-List-Received-Date: Thu, 12 Jan 2012 23:21:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2012 08:51 PM, Steve Sakoman wrote:
> The gtk-update-icon-cache utility does not create a cache file if
> one does not already exist.  Since some packages (notably gnome-icon-theme)
> do not ship a cache file by default, the results of the utility are
> not saved.  Adding the force option writes out the cache even if there
> wasn't a default cache in the package.
>
> Signed-off-by: Steve Sakoman<steve@sakoman.com>
> ---
>   meta/classes/gtk-icon-cache.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
> index eac3061..0204fd3 100644
> --- a/meta/classes/gtk-icon-cache.bbclass
> +++ b/meta/classes/gtk-icon-cache.bbclass
> @@ -14,7 +14,7 @@ GDK_PIXBUF_MODULEDIR=${libdir}/gdk-pixbuf-2.0/2.10.0/loaders gdk-pixbuf-query-lo
>
>   for icondir in /usr/share/icons/* ; do
>       if [ -d $icondir ] ; then
> -        gtk-update-icon-cache -qt  $icondir
> +        gtk-update-icon-cache -fqt  $icondir
>       fi
>   done
>   }

Seemed reasonable, so merged into OE-Core

Thanks
	Sau!


