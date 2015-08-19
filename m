Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9CC1873CC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 20:23:22 +0000 (UTC)
Received: by igfj19 with SMTP id j19so117520489igf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 13:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=afuNNMoRH4245qGcDiNrWikILQBhxG2MpOTRAPe/2OY=;
	b=rsdVPXtbPE1ageymbVgfRYFSgzU3ISslY4B4//256MWjuO05KojWfe2bQFEZOFUlZb
	uSa+MzkODtiqp+c/1oYLUXJ2M0IUrfNdmp0ebfqNOGzS34uMdbdP53aC14vQId7GPWJb
	KV3/5fodzz9jYFAqxj2La+MIj//JRayOERfZyDbXNo7kFsrUqNd4juLl8bszuml5EigD
	8b56+KfaAj3vdgUgq2OUTDNMkzTecoq4CMbywla6qX5C9zYe1Vkn11js39QnK+jRbykb
	PCufj9ho09uGPZpqRG21K9tB6aCg1yZ1OOdSrvDpyr1NzIabS369niY9jnZvG7iMHk2/
	gWuA==
MIME-Version: 1.0
X-Received: by 10.50.153.75 with SMTP id ve11mr28344188igb.52.1440015803208;
	Wed, 19 Aug 2015 13:23:23 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Wed, 19 Aug 2015 13:23:23 -0700 (PDT)
In-Reply-To: <68fe672e09b44fb814b733199c4058e3cce78bf0.1439991562.git.alexander.kanavin@linux.intel.com>
References: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
	<68fe672e09b44fb814b733199c4058e3cce78bf0.1439991562.git.alexander.kanavin@linux.intel.com>
Date: Wed, 19 Aug 2015 22:23:23 +0200
Message-ID: <CALbNGRTnJfkUDJSyH4-v3642e_=ea3m4-JAb6znDLUbpn0w+yQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/22] libnotify: update to version 0.7.6
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
X-List-Received-Date: Wed, 19 Aug 2015 20:23:26 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 19, 2015 at 3:40 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> New webkit requires at least version 0.7
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/recipes-gnome/libnotify/libnotify_0.6.0.bb | 21 ---------------------
>  meta/recipes-gnome/libnotify/libnotify_0.7.6.bb | 12 ++++++++++++
>  2 files changed, 12 insertions(+), 21 deletions(-)
>  delete mode 100644 meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
>  create mode 100644 meta/recipes-gnome/libnotify/libnotify_0.7.6.bb
>
> diff --git a/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb b/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
> deleted file mode 100644
> index e6ee89b..0000000
> --- a/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -SUMMARY = "Library for sending desktop notifications to a notification daemon"
> -SECTION = "libs"
> -LICENSE = "LGPLv2.1"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
> -
> -PR = "r1"
> -
> -DEPENDS = "dbus gtk+ dbus-glib"
> -
> -inherit gnomebase distro_features_check
> -
> -# Requires gdk/gdkx.h which is provided by gtk when x11 in DISTRO_FEATURES
> -REQUIRED_DISTRO_FEATURES = "x11"
> -
> -SRC_URI[archive.md5sum] = "732c9d2cd5eb6a9069264a319d330516"
> -SRC_URI[archive.sha256sum] = "73b16a79bb2fed62dcf146b11c4405776cb96a09dce66379ca541da7dbd64210"
> -
> -do_configure_prepend() {
> -    sed -i /GTK3/d ${S}/configure.ac
> -    sed -i -e /test-gtk3/d -e 's/test-xy-stress \\/test-xy-stress/' ${S}/tests/Makefile.am
> -}
> diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb
> new file mode 100644
> index 0000000..5d7b4ce
> --- /dev/null
> +++ b/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb
> @@ -0,0 +1,12 @@
> +SUMMARY = "Library for sending desktop notifications to a notification daemon"
> +SECTION = "libs"
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
> +
> +DEPENDS = "dbus gtk+3 dbus-glib"
> +
> +inherit gnomebase distro_features_check gtk-doc
> +
> +SRC_URI[archive.md5sum] = "a4997019d08f46f3bf57b78e6f795a59"
> +SRC_URI[archive.sha256sum] = "0ef61ca400d30e28217979bfa0e73a7406b19c32dd76150654ec5b2bdf47d837"
> +
> --
What about

REQUIRED_DISTRO_FEATURES = "x11"?

Andreas

