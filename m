Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1EDBD7828E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Jul 2017 09:48:35 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id m68so31844381ith.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Jul 2017 02:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H7IYTGTu09xfT7j79IutIyvgFw2WuLRrYuDeDt4mUAU=;
	b=0mLtMH8sUIYX/odjxN/HwfGGINkiyy8bYVWXav6vSGZtu0YWqv71fmKuE220ddSgR2
	ZjeO63oUthTHQxWdgzTrqxQe4YpzaEiRKyEl8CX+iaHEsxIaQ4fXCClKTnloS5NIprGv
	HRcON1cit7vuKFtxiNNmU7E68GbjLjtnAKOrh/fQFOiwqnCUjwsd+qnQ+vFV5VPFmDdT
	3OmDeoT+jVwKBl6j/0YNJt67byne8tTCq9xKjDqrGCW+S3142QhGYRxOEPtEWFw4GSXx
	lq9E5Q5iQPLZkapcJTZl3RYoN7gFAU5fxxsifz6liJQz2iGV61xPhJvKJgSxxBC2yDT5
	469g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H7IYTGTu09xfT7j79IutIyvgFw2WuLRrYuDeDt4mUAU=;
	b=C+OQ25WX1LH04UjH31qOpjVl61lAPOjO42doG72CoTLtVyA+O9kL282YXpNUN9RAjl
	kynicUHJ38Wr15bOZ/yyT7N8TfDs1ZTsZBkAI578wrU/lfWY4kPRgmpBRhM98E6F05Fl
	3pb27GYm7ZS46IKZxOMlEzM/88kskQGqRxGvdMcj0nfyh/xRoWrVmblCQt6Jy1dJ/JQ/
	wSruObEGcTRQniOB471RljxFNZ0DSSBwrgcR7FEdcK8ye2oTFdLYbNYLTLjSUAwyQAZa
	JFbWdVSCtkXLTHhcNcf2X9vQXo/eXi7OdjMEpRpoDS5Xalbnii01nPUqZcJtG613uQLW
	mG9g==
X-Gm-Message-State: AIVw113uK2s2U1zh0cHpQWSh4Pz2xQqNs7zPbYn7wTQYZGufrX8TftLg
	MSC7nVQ0AvMVls0Lyl43ypxjGGmZGdI1
X-Received: by 10.36.204.9 with SMTP id x9mr202208itf.5.1500112116531; Sat, 15
	Jul 2017 02:48:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.44.87 with HTTP; Sat, 15 Jul 2017 02:48:06 -0700 (PDT)
In-Reply-To: <cover.1500034432.git.jussi.kukkonen@intel.com>
References: <cover.1500034432.git.jussi.kukkonen@intel.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Sat, 15 Jul 2017 12:48:06 +0300
Message-ID: <CAHiDW_FhxAM5xPHD2P09ZAud4uANeKUzAHaqFcgN=7zU6rGinw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Remove gnome-common
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
X-List-Received-Date: Sat, 15 Jul 2017 09:48:36 -0000
Content-Type: multipart/alternative; boundary="94eb2c05a632d47c460554581109"

--94eb2c05a632d47c460554581109
Content-Type: text/plain; charset="UTF-8"

On 14 July 2017 at 15:25, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> Patchset should preferably only be merged once "gnome-common: Add
> recipe (from oe-core)" (2017-07-06) patch has been merged in meta-oe.
> I can ping the thread once it happens.
>

meta-openembedded master was updated so this set is good to go.


>
> This set removes gnome-common, an obsolete collection of m4-macros
> that partially conflicts with autoconf-archive. The plan is to fix the
> hacks between autoconf-archive and gnome-common once they're in the
> same repo.
>
> Thanks,
>  Jussi
>
> The following changes since commit 81498aac9560fbeaeb58eaada32ce8
> 0e0ea51628:
>
>   yocto-project-qs: Updated Next Steps list (2017-07-12 00:28:16 +0100)
>
> are available in the git repository at:
>
>   git://git.yoctoproject.org/poky-contrib jku/gnome-common
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=
> jku/gnome-common
>
> Jussi Kukkonen (4):
>   matchbox-desktop: Upgrade to 2.2
>   python3-pygobject: Don't use gnome-common
>   gnome-desktop: Don't use gnome-common
>   gnome-common: Remove as deprecated
>
>  ...onfigure.ac-Don-t-use-gnome-common-macros.patch | 33
> ++++++++++++++++++++++
>  .../python/python3-pygobject_3.24.1.bb             |  3 +-
>  ...figure.ac-Remove-gnome-common-macro-calls.patch | 33
> ++++++++++++++++++++++
>  .../gnome-desktop/gnome-desktop3_3.24.2.bb         |  6 ++--
>  meta/recipes-gnome/gnome/gnome-common_3.18.0.bb    | 20 -------------
>  ...hbox-desktop_2.1.bb => matchbox-desktop_2.2.bb} |  6 ++--
>  6 files changed, 75 insertions(+), 26 deletions(-)
>  create mode 100644 meta/recipes-devtools/python/python3-pygobject/0001-
> configure.ac-Don-t-use-gnome-common-macros.patch
>  create mode 100644 meta/recipes-gnome/gnome-desktop/gnome-desktop/0001-
> configure.ac-Remove-gnome-common-macro-calls.patch
>  delete mode 100644 meta/recipes-gnome/gnome/gnome-common_3.18.0.bb
>  rename meta/recipes-sato/matchbox-desktop/{matchbox-desktop_2.1.bb =>
> matchbox-desktop_2.2.bb} (87%)
>
> --
> 2.1.4
>
>

--94eb2c05a632d47c460554581109
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 1=
4 July 2017 at 15:25, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Patchset should prefera=
bly only be merged once &quot;gnome-common: Add<br>
recipe (from oe-core)&quot; (2017-07-06) patch has been merged in meta-oe.<=
br>
I can ping the thread once it happens.<br></blockquote><div><br></div><div>=
meta-openembedded master was updated so this set is good to go.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
<br>
This set removes gnome-common, an obsolete collection of m4-macros<br>
that partially conflicts with autoconf-archive. The plan is to fix the<br>
hacks between autoconf-archive and gnome-common once they&#39;re in the<br>
same repo.<br>
<br>
Thanks,<br>
=C2=A0Jussi<br>
<br>
The following changes since commit 81498aac9560fbeaeb58eaada32ce8<wbr>0e0ea=
51628:<br>
<br>
=C2=A0 yocto-project-qs: Updated Next Steps list (2017-07-12 00:28:16 +0100=
)<br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.yoctoproject.org/poky-contrib" rel=3D"no=
referrer" target=3D"_blank">git.yoctoproject.org/<wbr>poky-contrib</a> jku/=
gnome-common<br>
=C2=A0 <a href=3D"http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=
=3Djku/gnome-common" rel=3D"noreferrer" target=3D"_blank">http://git.yoctop=
roject.org/<wbr>cgit.cgi/poky-contrib/log/?h=3D<wbr>jku/gnome-common</a><br=
>
<br>
Jussi Kukkonen (4):<br>
=C2=A0 matchbox-desktop: Upgrade to 2.2<br>
=C2=A0 python3-pygobject: Don&#39;t use gnome-common<br>
=C2=A0 gnome-desktop: Don&#39;t use gnome-common<br>
=C2=A0 gnome-common: Remove as deprecated<br>
<br>
=C2=A0...onfigure.ac-Don-t-use-<wbr>gnome-common-macros.patch | 33 ++++++++=
++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python3-pygobject_3.24.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">python3-pygobject_<wbr>3.24.1.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +-<br>
=C2=A0...figure.ac-Remove-gnome-<wbr>common-macro-calls.patch | 33 ++++++++=
++++++++++++++<br>
=C2=A0.../gnome-desktop/<a href=3D"http://gnome-desktop3_3.24.2.bb" rel=3D"=
noreferrer" target=3D"_blank">gnome-<wbr>desktop3_3.24.2.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++--<br>
=C2=A0meta/recipes-gnome/gnome/<a href=3D"http://gnome-common_3.18.0.bb" re=
l=3D"noreferrer" target=3D"_blank">gnome<wbr>-common_3.18.0.bb</a>=C2=A0 =
=C2=A0 | 20 -------------<br>
=C2=A0...<a href=3D"http://hbox-desktop_2.1.bb" rel=3D"noreferrer" target=
=3D"_blank">hbox-desktop_2.1.bb</a> =3D&gt; <a href=3D"http://matchbox-desk=
top_2.2.bb" rel=3D"noreferrer" target=3D"_blank">matchbox-desktop_2.2.bb</a=
>} |=C2=A0 6 ++--<br>
=C2=A06 files changed, 75 insertions(+), 26 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/<wbr>python3-pygobjec=
t/0001-<wbr>configure.ac-Don-t-use-gnome-<wbr>common-macros.patch<br>
=C2=A0create mode 100644 meta/recipes-gnome/gnome-<wbr>desktop/gnome-deskto=
p/0001-<wbr>configure.ac-Remove-gnome-<wbr>common-macro-calls.patch<br>
=C2=A0delete mode 100644 meta/recipes-gnome/gnome/<a href=3D"http://gnome-c=
ommon_3.18.0.bb" rel=3D"noreferrer" target=3D"_blank">gnome<wbr>-common_3.1=
8.0.bb</a><br>
=C2=A0rename meta/recipes-sato/matchbox-<wbr>desktop/{<a href=3D"http://mat=
chbox-desktop_2.1.bb" rel=3D"noreferrer" target=3D"_blank">matchbox-desktop=
_2.1.<wbr>bb</a> =3D&gt; <a href=3D"http://matchbox-desktop_2.2.bb" rel=3D"=
noreferrer" target=3D"_blank">matchbox-desktop_2.2.bb</a>} (87%)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.1.4<br>
<br>
</font></span></blockquote></div><br></div></div>

--94eb2c05a632d47c460554581109--
