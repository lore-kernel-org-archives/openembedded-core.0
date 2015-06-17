Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f178.google.com (mail-pd0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id B313460962
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 15:01:57 +0000 (UTC)
Received: by pdjm12 with SMTP id m12so41870411pdj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 08:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=jBhGKPPGWZ4cgivJyLYIpZG8lRyLLKrjyxJjIA+mTMo=;
	b=fjqIwWtukr7RPSDUn4O0jhFtKvchh/NU7m7HT2IntLvgcIU3c0mi8UFiY32BdL4rz4
	135PVcDePr1n3fIJZTvYQczpUN16GZ1Dl4XOxCqLi9hh0iJ5RhgHSFrF0B6OShjeWRJF
	+TjsOW0EylRi1elH5lGRsvPtTE23fCEFW9+yZmpxpeIAGds//77/Ln7LsLr/9qCxRDr5
	mhzfmSfof4TQL/A14KNETxFq+dFvCFi8IIHzyWm/0BP29UIiuhMt85iQEz4eXmuBkkSH
	uf+eFylsbUQAt37xsuuADH4BXd0+Z3KvNDfjdE4ACha+xbtb1Lj0h1HBT5V+RaS7NhdV
	XJVw==
MIME-Version: 1.0
X-Received: by 10.68.57.170 with SMTP id j10mr11916176pbq.150.1434553318608;
	Wed, 17 Jun 2015 08:01:58 -0700 (PDT)
Received: by 10.70.44.41 with HTTP; Wed, 17 Jun 2015 08:01:58 -0700 (PDT)
In-Reply-To: <CALbNGRS5T12OGFK-C9B4DSyWsz-nRe8zsm=8_xnv4xtqhBHUXg@mail.gmail.com>
References: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>
	<1434547172-24620-6-git-send-email-alexander.kanavin@linux.intel.com>
	<CALbNGRS5T12OGFK-C9B4DSyWsz-nRe8zsm=8_xnv4xtqhBHUXg@mail.gmail.com>
Date: Wed, 17 Jun 2015 17:01:58 +0200
Message-ID: <CALbNGRSkb9_JQt2DAk6D9Xp7-1MeLsxzDwTH2+g5yf4qCVrbAw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: [PATCH 05/22] Update libnotify to version 0.7.6
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
X-List-Received-Date: Wed, 17 Jun 2015 15:01:57 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 17, 2015 at 3:19 PM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> New webkit requires at least version 0.7
>
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
^ Please remove
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
Just a note - I tried similar 2 years ago in meta-oe but stopped. If I
remember correct there were other packages to be updated due to API
change and these required gobject introspection which was not
available and still is missing in layers affected. What I know
definitely is that xfce4-notify will fail with this. I don't want to
be misunderstood: This is just a 'be prepared'.

Andreas

