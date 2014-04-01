Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id 05B4F6EA2F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 18:50:16 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N3D00LBQ8BCRX50@vms173023.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 01 Apr 2014 13:50:00 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 32756201B7; Tue,
	01 Apr 2014 14:50:00 -0400 (EDT)
Date: Tue, 01 Apr 2014 14:50:00 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-id: <20140401185000.GA3370@denix.org>
References: <1396372080-27607-1-git-send-email-otavio@ossystems.com.br>
	<1396372080-27607-2-git-send-email-otavio@ossystems.com.br>
MIME-version: 1.0
In-reply-to: <1396372080-27607-2-git-send-email-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] alsa-tools: Enable GTK support for X11 and Wayland
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
X-List-Received-Date: Tue, 01 Apr 2014 18:50:20 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 01, 2014 at 02:08:00PM -0300, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> This patch depends on the alsa-tools one I sent some minutes ago
> 
>  meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb b/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
> index 4f64a38..fdbe82a 100644
> --- a/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-tools_1.0.27.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://hdsploader/COPYING;md5=94d55d512a9ba36caa9b7df079bae1
>  SRC_URI = "ftp://ftp.alsa-project.org/pub/tools/alsa-tools-${PV}.tar.bz2 \
>             file://mips_has_no_io_h.patch \
>             file://autotools.patch \
> -           ${@base_contains('DISTRO_FEATURES', 'x11', '', 'file://makefile_no_gtk.patch', d)}"
> +           ${@base_any_contains('DISTRO_FEATURES', 'x11', '', 'file://makefile_no_gtk.patch', d)}"

What's the reason to use any_contains here?


>  SRC_URI[md5sum] = "1ea381d00a6069a98613aa7effa4cb51"
>  SRC_URI[sha256sum] = "6562611b5a6560712f109e09740a9d4fa47296b07ed9590cb44139c5f154ada2"
> @@ -20,7 +20,7 @@ inherit autotools-brokensep
>  
>  EXTRA_OEMAKE += "GITCOMPILE_ARGS='--host=${HOST_SYS} --build=${BUILD_SYS} --target=${TARGET_SYS} --with-libtool-sysroot=${STAGING_DIR_HOST} --prefix=${prefix}'"
>  
> -PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"
> +PACKAGECONFIG ??= "${@base_any_contains('DISTRO_FEATURES', 'x11', 'gtk+', '', d)}"

Same here - what's the reason for the change?


>  PACKAGECONFIG[gtk+] = ",,gtk+ gtk+3,"
>  
>  # configure.ac/.in doesn't exist so force copy
> -- 
> 1.9.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

