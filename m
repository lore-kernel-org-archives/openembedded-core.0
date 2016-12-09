Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id CA93A71CB7;
	Fri,  9 Dec 2016 13:02:03 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id 20so16585817uak.0;
	Fri, 09 Dec 2016 05:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4MlcS6qUvhC/J9XYA2H9xezsNxkZ0FMl+FUlXClLmtU=;
	b=pPLdCDgxqBVQlW5X+kh8zR9aPtcoSf1HEsw3V1ISaV2U+yrmld39OGHAnKE+O7djfi
	EACgeh8OWr4gljZ8/LTRxHNe1biKEFKH4ao4YFsPKDaSv7oekzxeMlCsXOdlnNwFndy5
	Q9AP9FCI8G/ZKgbP+8C6PwR7ZPlQt62xJEoJ04/M934WrLP0HIhNRnC4jrkW1uf7FfmB
	XX//2GOCOM65/w5HWN8J3rzFFx9XrTx7hi6ojYRa9rFYz20HjGYnzz1NVhC51pYoVACa
	b5T986s9B6dxXfRvJYN23Xg5uMo7Y8GNWQ3wUpz9qxiSuLqwZqMbMNrQWw4etJqXfSuB
	DXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4MlcS6qUvhC/J9XYA2H9xezsNxkZ0FMl+FUlXClLmtU=;
	b=YZzeY/+DUWj2LUn7U6HsM4D8YZZyXxjvaVdT2VuGWJ7v/9r5uaBwehqiJIaXC4OAwy
	Rps0BFQUJm+0jXn/iwLeDOYIqIQtnHmoFCBkxCTrF5JKA4tgu7cb/LIsRyonDOcg/I/B
	0DQcWFtahqqCZqgLz65h5NPRDKU+o0szMDJRDeI3fxnDrIaMXkBbn+DRk30XL/IsvXhU
	LVdIIQammEBlNy/7WPu7cQRsxqCzhJelUhoQcuX4r73v8QsQ7yxsK/HH3hHj242tNiE3
	ZIQwWU4Omp/XlgxDVzXOs3+leaBvXhyLS2ceHV5FgW+AqBIP4g9QB+GO0zwncPJUCR5L
	fQYQ==
X-Gm-Message-State: AKaTC01DOoFYlD8Y4W8uMCYihm4iDyejl7LoHUlMgj/zagNyYz4dGmtd7z5XZA7aU2QNnSiNZoF6/wI3fTtFLQ==
X-Received: by 10.176.84.147 with SMTP id p19mr15044978uaa.76.1481288524630;
	Fri, 09 Dec 2016 05:02:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.85.157 with HTTP; Fri, 9 Dec 2016 05:02:03 -0800 (PST)
In-Reply-To: <20161209124402.GB3327@jama>
References: <20161209124402.GB3327@jama>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Fri, 9 Dec 2016 14:02:03 +0100
Message-ID: <CALbNGRRLOOi7fEeXdevp1cC-JZuBbudQpghJfAFQYR9ieoiT3w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2016-12-06
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
X-List-Received-Date: Fri, 09 Dec 2016 13:02:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 9, 2016 at 1:44 PM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> =3D=3D Number of issues - stats =3D=3D
> {| class=3D'wikitable'
> !|Date               !!colspan=3D'3'|Failed tasks                     !!c=
olspan=3D'6'|Failed depencencies                    !!|Signatures          =
  !!colspan=3D'12'|QA !!Comment
> |-
> ||              ||qemuarm       ||qemux86       ||qemux86_64    ||qemuarm=
||max||min     ||qemux86||max||min     ||all   ||already-stripped      ||li=
bdir        ||textrel       ||build-deps    ||file-rdeps    ||version-going=
-backwards       ||host-user-contaminated        ||installed-vs-shipped  ||=
unknown-configure-option      ||symlink-to-sysroot    ||invalid-pkgconfig  =
   ||pkgname       ||
> |-
> ||2016-12-06    ||6     ||7     ||6     ||13    ||6     ||6     ||15    |=
|7     ||7     ||0     ||0             ||0             ||1             ||6 =
            ||3             ||0             ||0             ||0            =
 ||0             ||0             ||0             ||0             ||
> |}
>
> http://www.openembedded.org/wiki/Bitbake_World_Status
>
> =3D=3D Failed tasks 2016-12-06 =3D=3D
>
> INFO: jenkins-job.sh-1.8.12 Complete log available at http://logs.nslu2-l=
inux.org/buildlogs/oe/world/pyro/log.report.20161209_001246.log
>
> =3D=3D=3D common (5) =3D=3D=3D
>     * meta-openembedded/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3=
_3.10.1.bb:do_configure
>     * meta-openembedded/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb:=
do_configure
>     * meta-openembedded/meta-gnome/recipes-gnome/libwnck/libwnck3_3.20.1.=
bb:do_configure
^^ These three should be fixed with the patches you just applied to master-=
next
>     * meta-openembedded/meta-multimedia/recipes-mediacenter/kodi/kodi_16.=
bb:do_configure
>     * meta-openembedded/meta-xfce/recipes-xfce/exo/exo_0.11.1.bb:do_confi=
gure
^^ This one should be fixed by oe-core's pending patch 'liburi-perl:
update to 1.71
>
> =3D=3D=3D common-x86 (0) =3D=3D=3D
>
> =3D=3D=3D qemuarm (1) =3D=3D=3D
>     * openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.14.2.bb:do_c=
ompile
>
> =3D=3D=3D qemux86 (2) =3D=3D=3D
>     * meta-browser/recipes-browser/chromium/chromium_52.0.2743.76.bb:do_c=
ompile
>     * meta-qt5/recipes-qt/qt5/qtwebengine_git.bb:do_compile
>
> =3D=3D=3D qemux86_64 (1) =3D=3D=3D
>     * meta-openembedded/meta-oe/recipes-graphics/libvncserver/libvncserve=
r_0.9.10.bb:do_compile
>
> =3D=3D=3D Number of failed tasks (19) =3D=3D=3D
> {| class=3Dwikitable
> |-
> || qemuarm      || 6     || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/pyro/log.world.qemuarm.20161206_030245.log/ || http://errors.yoctoproject=
.org/Errors/Build/25556/
> |-
> || qemux86      || 7     || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/pyro/log.world.qemux86.20161206_052857.log/ || http://errors.yoctoproject=
.org/Errors/Build/25561/
> |-
> || qemux86_64   || 6     || http://logs.nslu2-linux.org/buildlogs/oe/worl=
d/pyro/log.world.qemux86-64.20161206_072352.log/ || http://errors.yoctoproj=
ect.org/Errors/Build/25797/
> |}
Andreas

