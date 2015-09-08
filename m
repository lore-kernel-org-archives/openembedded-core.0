Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 1124F75E80
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 10:32:10 +0000 (UTC)
Received: by qgx61 with SMTP id 61so78160232qgx.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 03:32:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Jjuwo9BxUmQQ14aXNr3dpuzmo83voWQXUv7tSneRcAA=;
	b=XHLzIUbfERAopx5AZOIcRBezZWO3OuAW8qgonwb8nBXV++V9lpZZh//x7BxJ70KWsp
	aLIH627jiKS4wuWZsQdmNdBaityjJSyXJYiv7BTUrMhohp/wB5J1GU7Pl1z4B7HaIbYW
	0VeotgWWmCb549rAX+heNkhLAxFNI83tb6W1+1PqCLA8jG7j880XY81Jyd4XW68CmO1J
	jio0CK0Ua1iULSm3YjbqZoFEiGC8PdvwanJiP0rXLcfpwclXmyIZkEeStSfP4nVizjFK
	ulbGERaN74VufcAkmY9J394T5kvtspI+KHRSjM24u3w8stoxs2yO2M2I2Cmi5kPM32Z0
	WP4g==
X-Gm-Message-State: ALoCoQkzkGfkHKPLNxa+9n22HSpCQACENJHp2rtsub6j+o1M9jGx1Z9YMPI2+5p3Ay/84e35WOZA
X-Received: by 10.140.237.150 with SMTP id i144mr34030525qhc.22.1441708330376; 
	Tue, 08 Sep 2015 03:32:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Tue, 8 Sep 2015 03:31:50 -0700 (PDT)
In-Reply-To: <E437DE0B-65F0-42B4-B061-BC30F27A24B8@gmail.com>
References: <cover.1441552859.git.raj.khem@gmail.com>
	<1441654013.24871.259.camel@linuxfoundation.org>
	<4A72FD2B-1B79-4827-B02E-E3B23A966AE7@gmail.com>
	<1441659401.24871.261.camel@linuxfoundation.org>
	<956735BC-7AA6-4513-AA09-3FBFD3250428@gmail.com>
	<1441660176.24871.268.camel@linuxfoundation.org>
	<E437DE0B-65F0-42B4-B061-BC30F27A24B8@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Sep 2015 11:31:50 +0100
Message-ID: <CAJTo0LZL5H1uW7nZzyT5q51=2RxmiRr8vAAn4n0e1kKUjrN7ag@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Systemd Upgrade
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
X-List-Received-Date: Tue, 08 Sep 2015 10:32:11 -0000
Content-Type: multipart/alternative; boundary=001a113595aae6eaf0051f39e009

--001a113595aae6eaf0051f39e009
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 7 September 2015 at 22:12, Khem Raj <raj.khem@gmail.com> wrote:

> > I believe the tests will run with the nographic options to qemu which
> > then won't need X, Ross had a patch around for that recently. To be
> > honest when looking at this kind of issue, I usually debug it using
> > testimage now, its actually easier in many cases=E2=80=A6
>
> in this case it will be faster. Care to point to Ross=E2=80=99s patch ?
>

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dross/mut=
&id=3De67ab458ab2d67908d80f9aa1954dee05cb21fc1
is the patch to run the tests in a nographics qemu.  The framework still
checks that DISPLAY is set, but you can just set that to anything you want
as it won't be used.

Ross

--001a113595aae6eaf0051f39e009
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 September 2015 at 22:12, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-st=
yle:solid;padding-left:1ex"><span class=3D"">&gt; I believe the tests will =
run with the nographic options to qemu which<br>
&gt; then won&#39;t need X, Ross had a patch around for that recently. To b=
e<br>
&gt; honest when looking at this kind of issue, I usually debug it using<br=
>
</span>&gt; testimage now, its actually easier in many cases=E2=80=A6<br>
<br>
in this case it will be faster. Care to point to Ross=E2=80=99s patch ?<br>=
</blockquote></div><br><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi=
/poky-contrib/commit/?h=3Dross/mut&amp;id=3De67ab458ab2d67908d80f9aa1954dee=
05cb21fc1">http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=
=3Dross/mut&amp;id=3De67ab458ab2d67908d80f9aa1954dee05cb21fc1</a> is the pa=
tch to run the tests in a nographics qemu.=C2=A0 The framework still checks=
 that DISPLAY is set, but you can just set that to anything you want as it =
won&#39;t be used.<br></div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a113595aae6eaf0051f39e009--
