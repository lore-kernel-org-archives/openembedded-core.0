Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 22C48605BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 09:54:30 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Aug 2018 02:54:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,299,1531810800"; d="scan'208";a="258653574"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by fmsmga006.fm.intel.com with ESMTP; 28 Aug 2018 02:54:30 -0700
Date: Tue, 28 Aug 2018 12:56:40 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Message-ID: <20180828095640.GA4372@mbabyjoh-desk.ger.corp.intel.com>
References: <20180828094319.19765-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20180828094319.19765-1-hongl.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] [PATCH] pango:1.40.14 -> 1.42.4
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
X-List-Received-Date: Tue, 28 Aug 2018 09:54:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Tue, Aug 28, 2018 at 05:43:17PM +0800, Hong Liu wrote:
> 1.Upgrade pango from 1.40.14 to 1.42.4
> 
> 2.Add new depends fribidi
> 
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-graphics/pango/{pango_1.40.14.bb => pango_1.42.4.bb} | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>  rename meta/recipes-graphics/pango/{pango_1.40.14.bb => pango_1.42.4.bb} (87%)
> 
> diff --git a/meta/recipes-graphics/pango/pango_1.40.14.bb b/meta/recipes-graphics/pango/pango_1.42.4.bb
> similarity index 87%
> rename from meta/recipes-graphics/pango/pango_1.40.14.bb
> rename to meta/recipes-graphics/pango/pango_1.42.4.bb
> index 3bd9c64..d889431 100644
> --- a/meta/recipes-graphics/pango/pango_1.40.14.bb
> +++ b/meta/recipes-graphics/pango/pango_1.42.4.bb
> @@ -14,13 +14,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
>  inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even gobject-introspection
>  
>  SRC_URI += "file://run-ptest \
> -            file://0001-Drop-introspection-macros-from-acinclude.m4.patch \
>              file://0001-Enforce-recreation-of-docs-pango.types-it-is-build-c.patch \
>  "
> -SRC_URI[archive.md5sum] = "18d7eb8d52e7e445e733c109ddaa7b78"
> -SRC_URI[archive.sha256sum] = "90af1beaa7bf9e4c52db29ec251ec4fd0a8f2cc185d521ad1f88d01b3a6a17e3"
> +SRC_URI[archive.md5sum] = "deb171a31a3ad76342d5195a1b5bbc7c"
> +SRC_URI[archive.sha256sum] = "1d2b74cd63e8bd41961f2f8d952355aa0f9be6002b52c8aa7699d9f5da597c9d"
>  
> -DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz"
> +DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz fribidi"
>  
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
>  PACKAGECONFIG[x11] = "--with-xft,--without-xft,virtual/libx11 libxft"

ERROR: Nothing PROVIDES 'fribidi' (but /home/maxin/poky/meta/recipes-graphics/pango/pango_1.42.4.bb DEPENDS on or otherwise requires it)
ERROR: Required build target 'pango' has no buildable providers.
Missing or unbuildable dependency chain was: ['pango', 'fribidi']

Can we move fribidi dependency to another PACKAGECONFIG ?

Best Regards,
Maxin

