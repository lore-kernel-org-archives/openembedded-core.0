Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id B3E1F60962
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 14:59:49 +0000 (UTC)
Received: by oiyy130 with SMTP id y130so19015398oiy.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 07:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=XGPpIkFlLCwAYexDINXrNFeltK93igYQkVv7WFubNZs=;
	b=KiQWlMzK7H0A0WCVj6s9du4RIPNd5g+6wlzOVLVW/LhX5O3YRQ/zWfAWr2laEww5f8
	R14Qy8d9PxxeB+wLKrbfeSWIZW3Iltj6JEYhJnLcBzxqkbC7XvIcyso2VIUkXVcfBj2E
	eoLB6rbDiBSmivlOYO24fe8kVWyaUWPUtPj0UhLromdW8g5+JxLvssBdsw8+YLoisqWv
	T7RM8SkNkufAvX2OKEJJ41a3pGy1VKPm/d0gbDRbTS5BpVSULWZ22eEYeqWtnmpK3koO
	pIMCLqerZMxord98du8VbzxyXipX91XAihajMbNrUURG3w+NYw09tjE1JlEBDzJZ2NcY
	/3iA==
X-Gm-Message-State: ALoCoQkyVo3alp5BkNFtBwzGBHoXe/pJlNi4velMMTyU8fF3mvE2caMtot8//ubP5P+PFVDaNhfR
X-Received: by 10.202.108.84 with SMTP id h81mr4669401oic.5.1434553190213;
	Wed, 17 Jun 2015 07:59:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.225.2 with HTTP; Wed, 17 Jun 2015 07:59:19 -0700 (PDT)
In-Reply-To: <1434547172-24620-6-git-send-email-alexander.kanavin@linux.intel.com>
References: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>
	<1434547172-24620-6-git-send-email-alexander.kanavin@linux.intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 17 Jun 2015 17:59:19 +0300
Message-ID: <CAHiDW_EwLwe52-VXnJTctjMS5+4pevuOE1CZwHuEbc_xRQ=4Zw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/22] Update libnotify to version 0.7.6
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
X-List-Received-Date: Wed, 17 Jun 2015 14:59:53 -0000
Content-Type: text/plain; charset=UTF-8

On 17 June 2015 at 16:19, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> New webkit requires at least version 0.7

0.6 is the last release that supports GTK+2 and changing this might
annoy people who are avoiding GTK+3 and are using some of the recipes
in meta-oe that depend on libnotify.

I believe the GTK dependency is only there for tests: Modifying the
build so it doesn't build tests and doesn't depend on GTK should not
be difficult.

 - Jussi

> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../libnotify/{libnotify_0.6.0.bb => libnotify_0.7.6.bb}          | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta/recipes-gnome/libnotify/{libnotify_0.6.0.bb => libnotify_0.7.6.bb} (66%)
>
> diff --git a/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb
> similarity index 66%
> rename from meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
> rename to meta/recipes-gnome/libnotify/libnotify_0.7.6.bb
> index e6ee89b..e9363e8 100644
> --- a/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
> +++ b/meta/recipes-gnome/libnotify/libnotify_0.7.6.bb
> @@ -5,15 +5,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
>
>  PR = "r1"
>
> -DEPENDS = "dbus gtk+ dbus-glib"
> +DEPENDS = "dbus gtk+3 dbus-glib"
>
> -inherit gnomebase distro_features_check
> +inherit gnomebase distro_features_check gtk-doc
>
>  # Requires gdk/gdkx.h which is provided by gtk when x11 in DISTRO_FEATURES
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> -SRC_URI[archive.md5sum] = "732c9d2cd5eb6a9069264a319d330516"
> -SRC_URI[archive.sha256sum] = "73b16a79bb2fed62dcf146b11c4405776cb96a09dce66379ca541da7dbd64210"
> +SRC_URI[archive.md5sum] = "a4997019d08f46f3bf57b78e6f795a59"
> +SRC_URI[archive.sha256sum] = "0ef61ca400d30e28217979bfa0e73a7406b19c32dd76150654ec5b2bdf47d837"
>
>  do_configure_prepend() {
>      sed -i /GTK3/d ${S}/configure.ac
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

