Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RztJQ-0005si-C0
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 18:15:36 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Feb 2012 09:07:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119728908"
Received: from unknown (HELO [10.255.15.72]) ([10.255.15.72])
	by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2012 09:07:16 -0800
Message-ID: <4F43CF43.50206@linux.intel.com>
Date: Tue, 21 Feb 2012 09:07:15 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1329147583.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1329147583.git.Martin.Jansa@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, fcooper@ti.com
Subject: Re: [PATCH 0/4] PR bumps for missing libz.la, resent gdb python support with fix
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
X-List-Received-Date: Tue, 21 Feb 2012 17:15:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/13/2012 07:40 AM, Martin Jansa wrote:
> The following changes since commit e5ad03093dfc4364d1407183f458df79f347c7a1:
>
>    guile: fix cross configure failure (2012-02-10 13:38:16 +0000)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib jansa/pull
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull
>
> Eric BENARD (1):
>    gdb-cross-canadian: build gdb with python support
>
> Martin Jansa (3):
>    gdb-cross-canadian: use NATIVESDK paths as it happens to be here
>    zlib: remove ldconfig call from install-libs
>    recipes: bump PR to rebuild .la files without libz.la
>
The zlib patches were pulled, but as already noted the 
gdb-cross-canadian ones are pending.

Thanks
	Sau!

>   meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb    |    2 +-
>   meta/recipes-connectivity/gupnp/gupnp-av_0.8.0.bb  |    2 +-
>   meta/recipes-connectivity/gupnp/gupnp_0.16.1.bb    |    2 +-
>   .../telepathy/libtelepathy_0.3.3.bb                |    2 +-
>   .../telepathy/telepathy-glib_0.17.4.bb             |    2 +-
>   .../telepathy/telepathy-mission-control_5.10.1.bb  |    2 +-
>   meta/recipes-core/eggdbus/eggdbus_0.6.bb           |    2 +-
>   meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb      |    2 +-
>   .../glib-networking/glib-networking_2.28.7.bb      |    2 +-
>   meta/recipes-core/libxml/libxml2_2.7.8.bb          |    2 +-
>   .../zlib/zlib-1.2.6/remove.ldconfig.call.patch     |   20 +++++++++++++++
>   meta/recipes-core/zlib/zlib_1.2.6.bb               |    3 ++
>   meta/recipes-devtools/binutils/binutils_2.22.bb    |    2 +-
>   meta/recipes-devtools/file/file_5.10.bb            |    2 +-
>   meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |   26 +++++++++++++++++++-
>   meta/recipes-devtools/python/python-gst_0.10.22.bb |    2 +-
>   .../python/python-pygobject_2.27.91.bb             |    2 +-
>   meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    2 +-
>   .../subversion/subversion_1.7.2.bb                 |    2 +
>   meta/recipes-extended/cracklib/cracklib_2.8.18.bb  |    2 +-
>   meta/recipes-extended/pam/libpam_1.1.5.bb          |    2 +-
>   meta/recipes-extended/polkit/polkit_0.104.bb       |    2 +-
>   meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb |    2 +-
>   meta/recipes-gnome/gnome/gconf_3.2.3.bb            |    2 +-
>   meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   |    2 +-
>   meta/recipes-gnome/gthumb/gthumb_2.12.4.bb         |    2 +
>   meta/recipes-gnome/gtk+/gtk+_2.24.8.bb             |    2 +-
>   meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb        |    2 +-
>   meta/recipes-gnome/json-glib/json-glib_0.14.2.bb   |    2 +
>   meta/recipes-gnome/libglade/libglade_2.6.4.bb      |    2 +-
>   meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |    2 +-
>   meta/recipes-gnome/libunique/libunique_1.1.6.bb    |    2 +-
>   meta/recipes-graphics/cairo/cairo_1.10.2.bb        |    2 +-
>   .../libmatchbox/libmatchbox_1.9.bb                 |    2 +-
>   .../menu-cache/menu-cache_0.3.2.bb                 |    2 +-
>   meta/recipes-graphics/xorg-lib/libfontenc_1.1.0.bb |    2 +-
>   meta/recipes-graphics/xorg-lib/libxfont_1.4.4.bb   |    2 +-
>   .../gstreamer/gst-plugins-bad_0.10.22.bb           |    2 +-
>   .../gstreamer/gst-plugins-base_0.10.35.bb          |    2 +-
>   .../gstreamer/gst-plugins-good_0.10.30.bb          |    2 +-
>   .../gstreamer/gst-plugins-ugly_0.10.18.bb          |    2 +-
>   .../gstreamer/gstreamer_0.10.35.bb                 |    2 +-
>   .../libid3tag/libid3tag_0.15.1b.bb                 |    2 +-
>   meta/recipes-multimedia/libpng/libpng_1.2.46.bb    |    2 +-
>   meta/recipes-multimedia/libtiff/tiff_3.9.5.bb      |    2 +-
>   meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb          |    2 +-
>   meta/recipes-sato/eds/eds-dbus_git.bb              |    2 +-
>   .../gtk-engines/gtk-sato-engine_git.bb             |    2 +-
>   .../matchbox-keyboard/matchbox-keyboard_git.bb     |    2 +-
>   .../matchbox-panel-2/matchbox-panel-2_git.bb       |    2 +-
>   .../recipes-sato/owl-video-widget/libowl-av_git.bb |    2 +-
>   .../sato-screenshot/sato-screenshot_git.bb         |    2 +-
>   meta/recipes-sato/webkit/webkit-gtk_svn.bb         |    2 +-
>   meta/recipes-support/curl/curl_7.23.1.bb           |    2 +-
>   meta/recipes-support/gnutls/gnutls_2.12.16.bb      |    2 +-
>   meta/recipes-support/libcroco/libcroco_0.6.3.bb    |    2 +-
>   meta/recipes-support/libfm/libfm_0.1.17.bb         |    2 +-
>   meta/recipes-support/libsoup/libsoup_2.2.105.bb    |    2 +-
>   meta/recipes-support/libxslt/libxslt_1.1.26.bb     |    2 +-
>   meta/recipes-support/neon/neon_0.29.6.bb           |    2 +-
>   meta/recipes-support/vte/vte_0.28.2.bb             |    2 +-
>   61 files changed, 109 insertions(+), 56 deletions(-)
>   create mode 100644 meta/recipes-core/zlib/zlib-1.2.6/remove.ldconfig.call.patch
>


