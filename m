Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SuTso-0000GO-AM
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:38:02 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Jul 2012 12:26:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="171881765"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by orsmga001.jf.intel.com with ESMTP; 26 Jul 2012 12:26:30 -0700
Message-ID: <501199E5.1050809@linux.intel.com>
Date: Thu, 26 Jul 2012 12:26:29 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <alpine.DEB.2.02.1207230604520.20189@oneiric>
In-Reply-To: <alpine.DEB.2.02.1207230604520.20189@oneiric>
Subject: Re: webkit-gtk: Replace superfluous "+=" with "=", and add leading space
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
X-List-Received-Date: Thu, 26 Jul 2012 19:38:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/23/2012 03:06 AM, Robert P. J. Day wrote:
>
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> ---
>
>    i think that might be all of them ...
>
> diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
> index 229273f..dd43811 100644
> --- a/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
> +++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.1.bb
> @@ -47,9 +47,9 @@ EXTRA_OECONF = "\
>                  "
>
>   #default unicode backend icu breaks in cross-compile when target and host are different endian type
> -EXTRA_OECONF_append_powerpc += "--with-unicode-backend=glib"
> +EXTRA_OECONF_append_powerpc = " --with-unicode-backend=glib"
>
> -CPPFLAGS_append_powerpc += "-I${STAGING_INCDIR}/pango-1.0 \
> +CPPFLAGS_append_powerpc = " -I${STAGING_INCDIR}/pango-1.0 \
>                               -I${STAGING_LIBDIR}/glib-2.0/include \
>                               -I${STAGING_INCDIR}/glib-2.0"
>
>
Merged into OE-Core

Thanks
	Sau!




