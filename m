Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id DCE577D190
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 19:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1A8B040BA5;
	Mon,  1 Apr 2019 19:50:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id sR5FL_vyQF3H; Mon,  1 Apr 2019 19:50:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-81-231.washdc.fios.verizon.net
	[100.15.81.231])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E5B8C407E7;
	Mon,  1 Apr 2019 19:50:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9F7C016D900; Mon,  1 Apr 2019 15:50:12 -0400 (EDT)
Date: Mon, 1 Apr 2019 15:50:12 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20190401195012.GE2112@denix.org>
References: <1553904350-30074-1-git-send-email-denis@denix.org>
	<CAJTo0LZZ0S0JoTTMFHQeT3CPK26_NY_JLDaHZQ_DJFpiTAF74w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZZ0S0JoTTMFHQeT3CPK26_NY_JLDaHZQ_DJFpiTAF74w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston: upgrade 5.0.0 -> 6.0.0
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
X-List-Received-Date: Mon, 01 Apr 2019 19:50:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ah, right, v2 is out.

On Mon, Apr 01, 2019 at 11:13:27AM +0000, Burton, Ross wrote:
> WARNING: weston-6.0.0-r0 do_patch:
> Some of the context lines in patches were ignored. This can lead to
> incorrectly applied patches.
> The context lines in the patches can be updated with devtool:
> 
>     devtool modify <recipe>
>     devtool finish --force-patch-refresh <recipe> <layer_path>
> 
> Then the updated patches and the source tree (in devtool's workspace)
> should be reviewed to make sure the patches apply in the correct place
> and don't introduce duplicate lines (which can, and does happen
> when some of the context is ignored). Further information:
> http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
> Details:
> Applying patch 0001-make-error-portable.patch
> patching file configure.ac
> Hunk #1 succeeded at 126 with fuzz 2 (offset 17 lines).
> patching file libweston/weston-error.h
> patching file libweston/weston-launch.c
> 
> Now at patch 0001-make-error-portable.patch
> 
> Ross
> 
> On Sat, 30 Mar 2019 at 00:06, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > Note:
> > 6.0.0 is the last one to support autotools (needs explicit configure option),
> > newer versions will only support meson.
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta/recipes-graphics/wayland/{weston_5.0.0.bb => weston_6.0.0.bb} | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >  rename meta/recipes-graphics/wayland/{weston_5.0.0.bb => weston_6.0.0.bb} (96%)
> >
> > diff --git a/meta/recipes-graphics/wayland/weston_5.0.0.bb b/meta/recipes-graphics/wayland/weston_6.0.0.bb
> > similarity index 96%
> > rename from meta/recipes-graphics/wayland/weston_5.0.0.bb
> > rename to meta/recipes-graphics/wayland/weston_6.0.0.bb
> > index e517109..fa08dac 100644
> > --- a/meta/recipes-graphics/wayland/weston_5.0.0.bb
> > +++ b/meta/recipes-graphics/wayland/weston_6.0.0.bb
> > @@ -12,8 +12,8 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
> >             file://xwayland.weston-start \
> >             file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
> >  "
> > -SRC_URI[md5sum] = "752a04ce3c65af4884cfac4e57231bdb"
> > -SRC_URI[sha256sum] = "15a23423bcfa45e31e1dedc0cd524ba71e2930df174fde9c99b71a537c4e4caf"
> > +SRC_URI[md5sum] = "7c634e262f8a464a076c97fd50ad36b3"
> > +SRC_URI[sha256sum] = "546323a90607b3bd7f48809ea9d76e64cd09718102f2deca6d95aa59a882e612"
> >
> >  UPSTREAM_CHECK_URI = "https://wayland.freedesktop.org/releases.html"
> >
> > @@ -28,6 +28,7 @@ WESTON_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:1])}"
> >
> >  EXTRA_OECONF = "--enable-setuid-install \
> >                  --disable-rdp-compositor \
> > +                --enable-autotools \
> >                  "
> >  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
> >                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 wayland', 'xwayland', '', d)} \
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

