Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QtYXY-0001ob-Ek
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 07:19:44 +0200
Received: by pzk2 with SMTP id 2so548409pzk.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 22:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=jgnAxaWoo1u5P7LaU0BHOVGoGisGUFDtFuDPo8nvBU8=;
	b=M58EsO01gTymVw+Dg40MOklPyhE8Da8+UvzQuKh9s+PN/ZH7CYxdv11qyrxS0uQi2Q
	J4arDVF5hHPBup5Oe/puEvSDrjdHquNefrsLRZnIyd59h+OedejmxOA6BcEZhfUOgb8E
	0MuVGpVHCHbmXqJ+UaQWTT1lFw/TMp5vfvwLA=
Received: by 10.142.234.5 with SMTP id g5mr274571wfh.347.1313558105137; Tue,
	16 Aug 2011 22:15:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.46.197 with HTTP; Tue, 16 Aug 2011 22:14:35 -0700 (PDT)
In-Reply-To: <1313547374-10263-1-git-send-email-agnel.joel@gmail.com>
References: <1313547374-10263-1-git-send-email-agnel.joel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Aug 2011 22:14:35 -0700
Message-ID: <CAMKF1srp=45++6LUkqkB7CL9oqthEeGF_8+=siH75SrEpgkczQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: jdk@ti.com, k-kooi@ti.com
Subject: Re: [meta-oe] [PATCH] gnome-system-monitor: Add dependency on gnome-icon-theme
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
X-List-Received-Date: Wed, 17 Aug 2011 05:19:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2011 at 7:16 PM, Joel A Fernandes <agnel.joel@gmail.com> wr=
ote:
> Without this, the configure stage of this recipe fails with pkg-config no=
t finding
> the gnome-icon-theme package

may be you should bump up the PR to ensure a rebuild
>
> Signed-off-by: Joel A Fernandes <agnel.joel@gmail.com>
> Cc: jdk@ti.com
> Cc: k-kooi@ti.com
> ---
> =C2=A0.../gnome-system-monitor_2.28.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-m=
onitor_2.28.2.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-syst=
em-monitor_2.28.2.bb
> index 72ad32b..6ce4f92 100644
> --- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_=
2.28.2.bb
> +++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_=
2.28.2.bb
> @@ -3,7 +3,7 @@ LICENSE =3D "GPLv2"
> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaab=
aa882bbe"
> =C2=A0SECTION =3D "x11/gnome"
>
> -DEPENDS =3D "libgtop gtkmm glibmm gnome-doc-utils libwnck gtk+ dbus-glib=
 librsvg"
> +DEPENDS =3D "libgtop gtkmm glibmm gnome-doc-utils gnome-icon-theme libwn=
ck gtk+ dbus-glib librsvg"
>
> =C2=A0inherit gnome
> =C2=A0SRC_URI[archive.md5sum] =3D "3f0bca9b0ebc7a365466851cd580d167"
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


