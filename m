Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id CAA8C6BE8F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 17:49:06 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 29 Aug 2013 10:49:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,984,1367996400"; d="scan'208";a="288534512"
Received: from unknown (HELO [10.255.14.210]) ([10.255.14.210])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Aug 2013 10:49:06 -0700
Message-ID: <521F898F.1060209@linux.intel.com>
Date: Thu, 29 Aug 2013 10:49:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1377792005.git.Martin.Jansa@gmail.com>
	<e77564486cce8199bd317f1ee79adb4f8b508ffa.1377792006.git.Martin.Jansa@gmail.com>
In-Reply-To: <e77564486cce8199bd317f1ee79adb4f8b508ffa.1377792006.git.Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [WIP][PATCH 17/20] librsvg: Fix dependencies for PACKAGECONFIG gdkpixbuf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Aug 2013 17:49:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/29/2013 09:03 AM, Martin Jansa wrote:
> * without gtk+ or gdk-pixbuf available it gets disabled even with --enable-pixbuf-loader
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   meta/recipes-gnome/librsvg/librsvg_2.32.1.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
> index 4818422..30846bf 100644
> --- a/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
> +++ b/meta/recipes-gnome/librsvg/librsvg_2.32.1.bb
> @@ -29,7 +29,7 @@ PACKAGECONFIG ??= "croco gdkpixbuf"
>   # Support embedded CSS stylesheets (recommended upstream)
>   PACKAGECONFIG[croco] = "--with-croco,--without-croco,libcroco"
>   # gdk-pixbuf loader
> -PACKAGECONFIG[gdkpixbuf] = "--enable-pixbuf-loader,--disable-pixbuf-loader"
> +PACKAGECONFIG[gdkpixbuf] = "--enable-pixbuf-loader,--disable-pixbuf-loader,gtk+ gdk-pixbuf"

I think this needs to be a target only PACKAGECONFIG, as it will try to 
depend on gtk+-native when building the librsvg-native.

Sau!

>   # GTK+ 2 theme engine
>   PACKAGECONFIG[gtk] = "--enable-gtk-theme,--disable-gtk-theme,gtk+"
>
>

