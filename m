Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 98C217C763
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 18:44:06 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id p25so32439073qtb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 10:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Q66JK72nlM2ANmpRaFpXlXi3stW0/tkry1VJtEfEZ98=;
	b=LVg80skeabSCYhmHuKrKhtn7jFD96PADbZAdiPP9rjy7bnzL+NrPMcrqaLgZy0uVmR
	3Ws7ZdBoNGuqIf/1WimDdgaZhXn4EIVrOgvY2Ingsldt6POiDLPisRnlq3xV6F9099xu
	PI+Lzxt6BTWq0VvHS4xaFQQLyY9s1y+5cT00ODbCNRAoc6UJc0bma6Qs4q4Nj5n8hOde
	8mVz35bVjedBKFct4n35hTK78IEKPfnvdJohrT7YngnT8tHJfxClFpryKxU6RSNyTBbW
	2Rhek2mgyeo0+zwbNFibFjXm+32zvhiOsj/F5KSnaIN6HoUs7eiI+X7RrpZAg8b3r/2d
	3Fuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Q66JK72nlM2ANmpRaFpXlXi3stW0/tkry1VJtEfEZ98=;
	b=shm9XMMm2Ga3qPnFiJdB35vb1Z9x7pyslQERT9aHqU8jX/QLbGPThOHvEb84U5kqdi
	at4YhzgmpN67cc+8gNRrazNEsFQI36KKBZ+CPWC4ggHsCQBNbI7ZxSsymVx4YST46sL8
	JLIsmv2mJlLfylpbwXB3E9hvkHMPc5sq9u4pAnatGiOFBR2B4d12Z93Ra0xuMCihAxcD
	t7vmNUWr7hUiMEBXcOB4/NL/UGVPMcUKrhVEEmnSiu3QF5P7n5rDlvwxWlLa7wPAMBdN
	pXc3bdqjBiuq8k4p+0JGRXPoLGgYKtKsp4BRZ/wxIIGhJO3Prb83BYSMoBlN9Vr275/L
	JmMQ==
X-Gm-Message-State: AHQUAuaMMwUqC8YUJgaWJzQwYUNQ74uyG5H+N0sIdm5RWhzWugEQWc+W
	m+jtPF0HPVuXrAkjqODkhqHjUVxq0jujVrTfsLY=
X-Google-Smtp-Source: AHgI3IZitpyk5KytBc6m4+4KYFqFLuf5DOju2y9JzBw+lyrYe0HTXMBcnwMygRhJPQYxKhxgO4ahHhWDWYGRW6mQjwc=
X-Received: by 2002:ac8:2562:: with SMTP id 31mr33282018qtn.253.1550774647235; 
	Thu, 21 Feb 2019 10:44:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1550755109.git.tanuk@iki.fi>
	<4adb54612485c88c98ae65860adc8d820f5b51c3.1550755110.git.tanuk@iki.fi>
In-Reply-To: <4adb54612485c88c98ae65860adc8d820f5b51c3.1550755110.git.tanuk@iki.fi>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Feb 2019 10:43:41 -0800
Message-ID: <CAMKF1srNi9+LnpUdg5qoXse6EZ6kKN5i2AJjLBYU4B1eBJ0oGQ@mail.gmail.com>
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] alsa-lib: 1.1.6 -> 1.1.8
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
X-List-Received-Date: Thu, 21 Feb 2019 18:44:06 -0000
Content-Type: text/plain; charset="UTF-8"

WARNING: alsa-lib-native-1.1.8-r0 do_fetch: Failed to fetch URL
ftp://ftp.alsa-project.org/pub/lib/alsa-lib-1.1.8.tar.bz2, attempting
MIRRORS if available

we might need a better source

On Thu, Feb 21, 2019 at 5:34 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
>
> Changelogs:
> http://alsa-project.org/main/index.php/Changes_v1.1.6_v1.1.7
> http://alsa-project.org/main/index.php/Changes_v1.1.7_v1.1.8
>
> One significant change was that the search path of add-on configuration
> files was changed from /usr/share/alsa/alsa.conf.d to /etc/alsa/conf.d.
> Packages that install such files should still use the /usr/share
> location, though. Symlinks need to be created from /etc to /usr/share.
> The rationale for using /etc is that the system administrator can better
> control the configuration that way, and the rationale for installing
> files under /usr/share is that configuration snippets that are installed
> by packages are not meant to be directly edited by the administrator.
>
> alsa-plugins had to be modified to add symlinks for the configuration
> snippets that it installs. I also added FILES_${PN} = "", because the
> alsa-plugins package is supposed to be empty, but also because for some
> reason that I don't understand the symlinks would otherwise go to the
> alsa-plugins package rather than alsa-plugins-pulseaudio-conf.
>
> Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
> ---
>  .../alsa/{alsa-lib_1.1.6.bb => alsa-lib_1.1.8.bb}   |  4 ++--
>  meta/recipes-multimedia/alsa/alsa-plugins_1.1.6.bb  | 13 ++++++++++++-
>  2 files changed, 14 insertions(+), 3 deletions(-)
>  rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.6.bb => alsa-lib_1.1.8.bb} (88%)
>
> diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.8.bb
> similarity index 88%
> rename from meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
> rename to meta/recipes-multimedia/alsa/alsa-lib_1.1.8.bb
> index 25e7a3c6b7..bb22acdd33 100644
> --- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.8.bb
> @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
>                      "
>
>  SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2"
> -SRC_URI[md5sum] = "2f981a8f7897c59ec2ddc44916d33788"
> -SRC_URI[sha256sum] = "5f2cd274b272cae0d0d111e8a9e363f08783329157e8dd68b3de0c096de6d724"
> +SRC_URI[md5sum] = "0eec0d657a07927795809c8f87fb76ca"
> +SRC_URI[sha256sum] = "3cdc3a93a6427a26d8efab4ada2152e64dd89140d981f6ffa003e85be707aedf"
>
>  inherit autotools pkgconfig
>
> diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.6.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.1.6.bb
> index 7ede8be98a..ee06191ea9 100644
> --- a/meta/recipes-multimedia/alsa/alsa-plugins_1.1.6.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.1.6.bb
> @@ -47,14 +47,23 @@ PACKAGES_DYNAMIC = "^libasound-module-.*"
>
>  # The alsa-plugins package doesn't itself contain anything, it just depends on
>  # all built plugins.
> +FILES_${PN} = ""
>  ALLOW_EMPTY_${PN} = "1"
>
>  do_install_append() {
>         rm ${D}${libdir}/alsa-lib/*.la
>
> -       # We use the example as is, so just drop the .example suffix.
>         if [ "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', 'yes', 'no', d)}" = "yes" ]; then
> +               # We use the example as is, so just drop the .example suffix.
>                 mv ${D}${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf.example ${D}${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf
> +
> +               # The conf.d files are installed in datadir, but alsa-lib
> +               # searches for conf.d files only in sysconfdir. Distributions
> +               # are expected to create symlinks in sysconfdir, so that's what
> +               # we do here.
> +               mkdir -p ${D}${sysconfdir}/alsa/conf.d
> +               ln -s ${datadir}/alsa/alsa.conf.d/50-pulseaudio.conf ${D}${sysconfdir}/alsa/conf.d/50-pulseaudio.conf
> +               ln -s ${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf ${D}${sysconfdir}/alsa/conf.d/99-pulseaudio-default.conf
>         fi
>  }
>
> @@ -94,6 +103,8 @@ INSANE_SKIP_${MLPREFIX}libasound-module-rate-speexrate = "dev-so"
>  FILES_${PN}-pulseaudio-conf += "\
>          ${datadir}/alsa/alsa.conf.d/50-pulseaudio.conf \
>          ${datadir}/alsa/alsa.conf.d/99-pulseaudio-default.conf \
> +        ${sysconfdir}/alsa/conf.d/50-pulseaudio.conf \
> +        ${sysconfdir}/alsa/conf.d/99-pulseaudio-default.conf \
>  "
>
>  RDEPENDS_${PN}-pulseaudio-conf += "\
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

