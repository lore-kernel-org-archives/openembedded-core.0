Return-Path: <net147@gmail.com>
Received: from mail-vb0-f52.google.com (mail-vb0-f52.google.com
	[209.85.212.52])
	by mail.openembedded.org (Postfix) with ESMTP id C5BF662051
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 06:25:44 +0000 (UTC)
Received: by mail-vb0-f52.google.com with SMTP id p12so4158512vbe.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2013 23:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=dyvdEIf51O/6ia8u5L+nGjU536I/0y3KuAOS5Qkp+cA=;
	b=BUXFK3H5ll7/lgHm/4cbMPm9RE5V45p9aRIoCD1nVAxJnO6Qzp/4QZ5teQ9qN5xeK7
	zkFGx1+Y9gcxyON0gGS1Hz9KjFnuYGZlUNKDXXmJSd2QSkXmL1fGfIHvAHpUNKQnJqUv
	4eRAT6aVwuGVFS0Wo2bIbT6eAZgrbJQg0KhVYU3HOAlgxFHPkK7LMCV7xsaT2sQ1Xbbp
	djMtigpT6ceH57R23bLPIbDB5DkRFeuTSm+GbUHbYqmZjHfUcvSsqQyBd59nUWFrzD+G
	2FsGxvkzeVNKoQGTGr6TBvgqUV+KwHTHEK/Fgzy2G6FSNuv1H9/yaIUbB8gEw/2cb1xJ
	M33Q==
MIME-Version: 1.0
X-Received: by 10.220.101.69 with SMTP id b5mr17110702vco.55.1369722345390;
	Mon, 27 May 2013 23:25:45 -0700 (PDT)
Received: by 10.58.34.132 with HTTP; Mon, 27 May 2013 23:25:45 -0700 (PDT)
In-Reply-To: <cover.1369719531.git.Qi.Chen@windriver.com>
References: <cover.1369719531.git.Qi.Chen@windriver.com>
Date: Tue, 28 May 2013 16:25:45 +1000
Message-ID: <CANwerB12XmNSm9AYAdz+SZGp6VYmjDiLyJYQY8g6F+GdJqn0rQ@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Qi.Chen@windriver.com
Cc: qingtao.cao@windriver.com, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] switch to using busybox instead of tinylogin
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
X-List-Received-Date: Tue, 28 May 2013 06:25:45 -0000
Content-Type: multipart/alternative; boundary=047d7b3a7e92d6892404ddc15539

--047d7b3a7e92d6892404ddc15539
Content-Type: text/plain; charset=UTF-8

On 28 May 2013 15:39, <Qi.Chen@windriver.com> wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>
> The following changes since commit
> 21089515bd18ba18e86ec8f72ff8141b9fb1dea8:
>
>   ref-manual: Added xmlto and dblatex packages for docs (2013-05-22
> 17:23:41 +0100)
>
> are available in the git repository at:
>
>   git://git.pokylinux.org/poky-contrib ChenQi/tinylogin-busybox
>
> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/tinylogin-busybox
>
> Chen Qi (2):
>   packagegroup-core-boot: use busybox as the default login manager
>   busybox: enable login/password commands by default
>
>  meta/recipes-core/busybox/busybox-1.20.2/defconfig |   26
> ++++++++++----------
>  .../packagegroups/packagegroup-core-boot.bb        |    2 +-
>  2 files changed, 14 insertions(+), 14 deletions(-)
>

After switching from tinylogin to busybox, the following commands that used
to be provided by tinylogin are provided by other packages instead of
busybox:
-/bin/login [shadow]
-/sbin/getty [util-linux-agetty]
-/usr/bin/passwd  [shadow]
-/usr/bin/su [shadow]

Perhaps util-linux-agetty and shadow packages have higher alternatives
priority?

Regards,
Jonathan

--047d7b3a7e92d6892404ddc15539
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 28 May 2013 15:39,  <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;=
</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padd=
ing-left:1ex">

From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank=
">Qi.Chen@windriver.com</a>&gt;<br>
<br>
The following changes since commit 21089515bd18ba18e86ec8f72ff8141b9fb1dea8=
:<br>
<br>
=C2=A0 ref-manual: Added xmlto and dblatex packages for docs (2013-05-22 17=
:23:41 +0100)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.pokylinux.org/poky-contrib" target=3D"_b=
lank">git.pokylinux.org/poky-contrib</a> ChenQi/tinylogin-busybox<br>
=C2=A0 <a href=3D"http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3DC=
henQi/tinylogin-busybox" target=3D"_blank">http://git.pokylinux.org/cgit.cg=
i/poky-contrib/log/?h=3DChenQi/tinylogin-busybox</a><br>
<br>
Chen Qi (2):<br>
=C2=A0 packagegroup-core-boot: use busybox as the default login manager<br>
=C2=A0 busybox: enable login/password commands by default<br>
<br>
=C2=A0meta/recipes-core/busybox/busybox-1.20.2/defconfig | =C2=A0 26 ++++++=
++++----------<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-core-boot.bb" target=
=3D"_blank">packagegroup-core-boot.bb</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 =C2=A02 +-<br>
=C2=A02 files changed, 14 insertions(+), 14 deletions(-)<br></blockquote><d=
iv><br></div>After switching from tinylogin to busybox, the following comma=
nds that used to be provided by tinylogin are provided by other packages in=
stead of busybox:<br>
<div>-/bin/login [shadow]<br></div><div>-/sbin/getty [util-linux-agetty]<br=
></div><div>-/usr/bin/passwd =C2=A0[shadow]</div><div>-/usr/bin/su [shadow]=
<br></div><div><br></div><div style>Perhaps util-linux-agetty and shadow pa=
ckages have higher alternatives priority?</div>
<div style><br></div><div style>Regards,</div><div style>Jonathan</div></di=
v></div></div>

--047d7b3a7e92d6892404ddc15539--
