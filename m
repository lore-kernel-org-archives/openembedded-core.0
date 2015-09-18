Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5E35B77028
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 13:32:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8IDWPRV021821; Fri, 18 Sep 2015 14:32:25 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 9Xjwz-Qo96a6; Fri, 18 Sep 2015 14:32:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8IDWDB7021795
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 18 Sep 2015 14:32:24 +0100
Message-ID: <1442583133.26666.253.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Date: Fri, 18 Sep 2015 14:32:13 +0100
In-Reply-To: <1442577093-6511-1-git-send-email-dv@pseudoterminal.org>
References: <1442577093-6511-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gdk-pixbuf: remove redundant libx11 DEPENDS line
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
X-List-Received-Date: Fri, 18 Sep 2015 13:32:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-09-18 at 13:51 +0200, Carlos Rafael Giani wrote:
> The x11 packageconfig already takes care of the X11 dependency, and also
> respects the DISTRO_FEATURES
> 
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
> ---
>  meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
> index 07c2dce..bdf173a 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb
> @@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
>  SECTION = "libs"
>  
>  DEPENDS = "glib-2.0"
> -DEPENDS_append_linuxstdbase = " virtual/libx11"

Do we not need something like:

PACKAGECONFIG_append_linuxstdbase = "x11"

to ensure that this is enabled for LSB?

Cheers,

Richard


