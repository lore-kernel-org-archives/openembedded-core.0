Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 1D4B76A9BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 15:51:03 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5EFudvF032691; Fri, 14 Jun 2013 16:56:39 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rl_aUqktFivV; Fri, 14 Jun 2013 16:56:39 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5EFuZXq032687
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 14 Jun 2013 16:56:36 +0100
Message-ID: <1371225044.20823.84.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>
Date: Fri, 14 Jun 2013 16:50:44 +0100
In-Reply-To: <1371224418-11163-1-git-send-email-ross.burton@intel.com>
References: <1371224418-11163-1-git-send-email-ross.burton@intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] atk: inherit gnomebase
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
X-List-Received-Date: Fri, 14 Jun 2013 15:51:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-06-14 at 16:40 +0100, Ross Burton wrote:
> This recipe was missing a dependency on gnome-common, so lets just inherit
> gnomebase and get both it and GNOME SRC_URI handling for free.
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-support/atk/atk_2.8.0.bb |    5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-support/atk/atk_2.8.0.bb b/meta/recipes-support/atk/atk_2.8.0.bb
> index a190c0a..cfe2f58 100644
> --- a/meta/recipes-support/atk/atk_2.8.0.bb
> +++ b/meta/recipes-support/atk/atk_2.8.0.bb
> @@ -10,11 +10,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
>  
>  DEPENDS = "glib-2.0"
>  
> -inherit autotools gtk-doc pkgconfig
> +inherit gnome gtk-doc

The above and the commit message don't match (gnome verses gnomebase) :/

Cheers,

Richard

> -MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
> +GNOME_COMPRESS_TYPE = "xz"
>  
> -SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
>  SRC_URI[md5sum] = "c652bd25530825d604dae1c1ebd2da02"
>  SRC_URI[sha256sum] = "b22519176226f3e07cf6d932b77852e6b6be4780977770704b32d0f4e0686df4"
>  



