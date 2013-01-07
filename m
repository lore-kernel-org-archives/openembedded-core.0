Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TsD5C-0004l5-P3 for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 14:50:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r07DYV4f004820;
	Mon, 7 Jan 2013 13:34:31 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04100-03; Mon,  7 Jan 2013 13:34:27 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r07DYM6D004813
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 7 Jan 2013 13:34:23 GMT
Message-ID: <1357565664.25855.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Constantin Musca <constantinx.musca@intel.com>
Date: Mon, 07 Jan 2013 13:34:24 +0000
In-Reply-To: <1357560325-8260-1-git-send-email-constantinx.musca@intel.com>
References: <1357560325-8260-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] gsettings-desktop-schemas: add missing elements from meta-gnome
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
X-List-Received-Date: Mon, 07 Jan 2013 13:50:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-01-07 at 14:05 +0200, Constantin Musca wrote:
> - add postinst using gsettings.bbclass
> - modify the recipe according to the meta-gnome variant
> 
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>  meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb b/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
> index 720858a..1242741 100644
> --- a/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
> +++ b/meta/recipes-gnome/gnome/gsettings-desktop-schemas_3.7.3.bb
> @@ -4,10 +4,9 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
>  
>  LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> +PR = "r1"
>  
> -DEPENDS = "glib-2.0"

It doesn't need glib-2.0?

> -
> -inherit gnome pkgconfig autotools gettext
> +inherit gnome gsettings

It doesn't need gettext?

Cheers,

Richard



