Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3B9DE605FE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 10:32:18 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id q128so88558638iof.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Apr 2016 03:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BJ3vGl4JFmbwyH3S/I9X4G0nraR+xVZEcXaOEiCKGmk=;
	b=oJ3EyCyWdbaJDCHluegvgs8qdL9J4CEuIMocMqKMgBOJbxqYd3bAX8xj8egn+lXNLM
	PCn6NyP8sZR1n8AQMSTPAQ09sMEcDc9UvtREzr2d+/hZvES3wuDCeGceb5sbdn1GtrQe
	pqJJzKuUAcbvJ2zykhSVsmDFI5paD050/eUTUQ0NpeRhkh8Gmk6p/R0q7pt7aLxClZLp
	bbcMuIXMI+tGbm/ZOds3y8mEZ9IokvzeU8jHXZFIWUINxDwIrvyICwarOjwSOa3MOdOJ
	pbfYbltBe20+ophe3WnuN+tr/TBB1xSl86jXJF6jaJoeHlhrgzIlNWW0EzVZXw9LcEel
	yWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BJ3vGl4JFmbwyH3S/I9X4G0nraR+xVZEcXaOEiCKGmk=;
	b=U9FagSy/XNEIIbT3J9Jv5AcPAtrDwkvjzVkEtQC4YckHOjwZNCDlepc85pW5mFLyiy
	hteXyGDnkSWytj3uh1i54c53Kp65TtzzRZJ8ya11sxPXBAIIqB6oPjXQQINxT4WTmF2a
	/HEwV0sYVZAfOvJV9+/S7PtjJHRIS/MxDlxjFxeEi3xJ+G52b7nV5vQ+Zph2ihnUCe6C
	8R6OBHfx6Hj91YXAZdz+SiXEdO+va3/flGhInlYz0HXbRZcLn4K7o3Azyh/vHAJYKF/T
	M20/WFkcOsm1g6MZNWHDOmwccrjVhdDlAUm3o1abvCAgCEPwqUKXPdsbeUwTz6MdXM0Y
	OkXw==
X-Gm-Message-State: AD7BkJLEs+e/dWMO0Mlb7ELuaCp8EUP4qCzGn194MwwA4hWehxDKcYVgiEuZM5gCpRMgLAAx75PZsKkTNkvn0QVn
X-Received: by 10.107.16.104 with SMTP id y101mr2263671ioi.148.1460025139765; 
	Thu, 07 Apr 2016 03:32:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Thu, 7 Apr 2016 03:32:00 -0700 (PDT)
In-Reply-To: <BF87E273B05A4CE7A838874136B2D7CA@RD3>
References: <188BD465D20643E496811D07CF7FDF9C@RD3>
	<CAJTo0LYhW-_8nC5DEi+uHnpE7TicR+rmrJQ+m5_0b_jdq--sSw@mail.gmail.com>
	<BF87E273B05A4CE7A838874136B2D7CA@RD3>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Apr 2016 11:32:00 +0100
Message-ID: <CAJTo0LbD+5jA281uE+N2Jj5RM8=9j2q5e-J3tdSpL0toXWOCWA@mail.gmail.com>
To: winiston@futuraautomation.com
Cc: yocto texas <meta-ti@yoctoproject.org>,
	Yocto layer <linux-yocto@yoctoproject.org>,
	OpenEmbedded core <openembedded-core@lists.openembedded.org>
Subject: Re: Problem in Third party Software (Navit) integration
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
X-List-Received-Date: Thu, 07 Apr 2016 10:32:21 -0000
Content-Type: multipart/alternative; boundary=001a113ff020d1e350052fe297be

--001a113ff020d1e350052fe297be
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 7 April 2016 at 10:57, <winiston@futuraautomation.com> wrote:

> Your question: You're not really giving much away by just saying "not
> running",
> Answer : kernel is generated using =E2=80=9Cbitbake core-image-base=E2=80=
=9D command.  I
> extracted my kernel image to SD card and used it in my am437x-eVm board, =
It
> boots and end up with command prompt. But No GUI related to =E2=80=9CNavi=
t=E2=80=9D . I
> wanted to get the =E2=80=9CNavit=E2=80=9D GUI. So I assume that it is not=
 running.
>

core-image-base doesn't come with a GUI, so I'm not sure what you expect.
If you want navit to start up on boot then that's part of the integration
that you'll have to do.


>
>
Your question:  you may need to install more than just the navit package.
> Answer : I don=E2=80=99t have idea, what are the package I need to instal=
l and
> how to install? I have added  IMAGE_INSTALL_append =3D " navit"  in
> /build/conf/local.conf  .... Do you have any procedure to install
> additional packages?
>

The packages are the ones listed in the PACKAGES variable in the recipe.
You install them by listing more of them in your INSTALL_IMAGE_append
assignment.


> Your question:    Have a look at the recipe and you'll see that it
> generates lots of packages,
> Answer :  when I run =E2=80=9Cbitbake core-image-base=E2=80=9D , No packa=
ges are
> generated it seems. But when I run =E2=80=9Cbitbake  qt4e-demo-image=E2=
=80=9D , Lot of
> packages are generated related to =E2=80=9Cnavit=E2=80=9D in
> /home/winiston/poky/build/tmp/sysroots/am437x-evm/pkgdata/runtime.
> What are the packages I need to add ? How do I add those packages in the
> image?
>

No idea, I've never used or even look at navit before. You'll have to look
at the contents of the packages to understand what is being put in what
package (or just install all of them).

Ross

--001a113ff020d1e350052fe297be
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 April 2016 at 10:57,  <span dir=3D"ltr">&lt;<a href=3D"mailto:winiston=
@futuraautomation.com" target=3D"_blank">winiston@futuraautomation.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><font color=3D"#00=
00ff">Your question:</font> You&#39;re not really giving much=20
away by just saying &quot;not running&quot;,</div>
<div><font color=3D"#0000ff">Answer :</font> kernel is generated using =E2=
=80=9Cbitbake=20
core-image-base=E2=80=9D command.=C2=A0 I extracted my kernel image to SD c=
ard and used=20
it in my am437x-eVm board, It boots and end up with command prompt. But No =
GUI=20
related to =E2=80=9CNavit=E2=80=9D . I wanted to get the =E2=80=9CNavit=E2=
=80=9D GUI. So I assume that it is not=20
running.</div></blockquote><div><br></div><div>core-image-base doesn&#39;t =
come with a GUI, so I&#39;m not sure what you expect.=C2=A0 If you want nav=
it to start up on boot then that&#39;s part of the integration that you&#39=
;ll have to do.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>=
=C2=A0</div></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div></div>
<div><font color=3D"#0000ff">Your question:</font>=C2=A0 you may need to in=
stall=20
more than just the navit package.</div>
<div><font color=3D"#0000ff">Answer :</font> I don=E2=80=99t have idea, wha=
t are the package=20
I need to install and how to install? I have added=C2=A0 <font color=3D"#00=
00ff">IMAGE_INSTALL_append =3D &quot; navit&quot;</font>=C2=A0 in=20
/build/conf/local.conf=C2=A0 .... Do you have any procedure to install=20
additional packages?</div></blockquote><div><br></div><div>The packages are=
 the ones listed in the PACKAGES variable in the recipe.=C2=A0 You install =
them by listing more of them in your INSTALL_IMAGE_append assignment.</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
<div><font color=3D"#0000ff">Your question:</font>=C2=A0=C2=A0=C2=A0 Have a=
 look at=20
the recipe and you&#39;ll see that it generates lots of packages,</div>
<div><font color=3D"#0000ff">Answer :</font>=C2=A0 when I run =E2=80=9Cbitb=
ake=20
core-image-base=E2=80=9D , No packages are generated it seems. But when I r=
un=20
=E2=80=9Cbitbake=C2=A0 qt4e-demo-image=E2=80=9D , Lot of packages are gener=
ated related to=20
=E2=80=9Cnavit=E2=80=9D in<font face=3D"Times New Roman">=C2=A0 <span><font=
 color=3D"#000000">/home/winiston/poky/build/tmp/sysroots/am437x-evm/pkgdat=
a/runtime.</font></span></font></div>
<div><font face=3D"Times New Roman"><span><font color=3D"#0000ff">What are =
the packages I need to add ? How do I add those packages=20
in the image?</font></span></font></div></blockquote></div><br>No idea, I&#=
39;ve never used or even look at navit before. You&#39;ll have to look at t=
he contents of the packages to understand what is being put in what package=
 (or just install all of them).</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Ross</div></div>

--001a113ff020d1e350052fe297be--
