Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7F38365CBB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 21:26:51 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id m184so1066074iof.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 14:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DKXhZ7M3GX1UCIvDqHKCABi+ojqc8t+xCmqFNFMYT2s=;
	b=Pmd0NWYFvd5bEpdZmp4QuyUGp4EhjX9KZ1CeMyhquSRVOmOBE9OiFKebU331jEi97F
	AmUxQXIJL9YQg4RxqsfII3IOihzJhjKppmYgULirS9qxPHdahbnpjHPlXo0/+fHVxiHn
	zDpaoKxmzEl/iUVTeO+lZ3c2iiqZ1elPIDS7wiWGiaXNvgznf7yA5G07VIqj6U/N979X
	YbWweL4zFoSE3hW1PDkqxqJlpO7Rr52I/U3MeCxZEtqOvANms0ux0f+HTNrHU9JteEhW
	1iQHfzIfi6KsaB9Ldgh3dNa7SWFP7sIegaKbEYfiwnMRWolp8SLlF/32rqxUUAG1CaA6
	TdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DKXhZ7M3GX1UCIvDqHKCABi+ojqc8t+xCmqFNFMYT2s=;
	b=DYNwhtpSscPSiLQWs1+Zlh4EPNnjlXLUx0phSlqfEwSfFcDYzmZPmquXgRVaO870Fs
	cbCLM+byEn/0oQzQpCAZperEc1PglhuSOHXzY2hS4VTFKTwvH6GPCWMuVLNgRL/6Hodm
	gACggxVihZcVXgJkASXFo0enV9HAqlNHIyWBaD9oicn+vouaZs1ejTyYXW3p8oBw1MRk
	kOj6XL1NTyc0y/mTRRko+ZwhW018xx8aOjQQU/ILOAPNUU85S+6r2kxD15hGeH148jsH
	YbcbRkMIU/F0wApFby+MmAvzYWDVtR+00OBsAF8UnuF8WyfP2epuBSo7W2ijvBC8VMhJ
	6XoA==
X-Gm-Message-State: AD7BkJI4ds9ZtOWdrjToUc8RnVIPS5t69c22Mx9kFTXbCzAFRkZnn6fQZSkoAwhYyesQQ/+GFc/dexqRHE6rQPLX
X-Received: by 10.107.16.19 with SMTP id y19mr24003138ioi.148.1457990811752;
	Mon, 14 Mar 2016 14:26:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 14 Mar 2016 14:26:32 -0700 (PDT)
In-Reply-To: <CAP9ODKprS3P41A_fCApFSTmm=s9MvTDtD5J87d9fOdRm=cS0Zg@mail.gmail.com>
References: <1457981210-23532-1-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKpGfXsyzE91Nxak39npYTZ-yLw0NkVw91z75=vuVo1UyQ@mail.gmail.com>
	<CAJTo0LaVVaY9gmtzp7tq=77GBj+rCzGBC+2K1CnOoXEk8XCwBw@mail.gmail.com>
	<CAP9ODKq2CDKAxXijkEQH75vV6QKakt2HCSXHOU-HhZ0tCCnzwg@mail.gmail.com>
	<CAJTo0LYfwrc+wteB+ez6gqZbXgM8dJO6PKrB+vf0S6+ANC7ggQ@mail.gmail.com>
	<CAP9ODKopJb0SusuYNubJz9oEMjJUDLyRBjNWDjeFD+tw0iYS3g@mail.gmail.com>
	<CAJTo0Lbx5YajNU5fcRkn1sk43LW1tCLm7p1WxCM=fQqTYo=zWA@mail.gmail.com>
	<CAP9ODKp=+6F6dMDryHOtNcMsmBL3VqHpNwioxpi3AtoxQ3ji9A@mail.gmail.com>
	<CAJTo0LY=BQxpH0Eq=86OnLB7M_bAR5+HhrWg7YqfhVPZgQ6=ng@mail.gmail.com>
	<CAP9ODKqoummpnrf_-4mZgY94u3kRTdmB0AhNX=0LGFAz0yBpVA@mail.gmail.com>
	<CABcZAN=_-oVgP+8OOggYaGox6GkDLeyhtS5+=dCvgapaKZ0TDw@mail.gmail.com>
	<CAP9ODKprS3P41A_fCApFSTmm=s9MvTDtD5J87d9fOdRm=cS0Zg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Mar 2016 21:26:32 +0000
Message-ID: <CAJTo0Lb5ehLTcYu5=twZOqJQULCX1qywXz=p1K7=E5ExWDVM2g@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Christopher Larson <clarson@kergoth.com>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsdl: Only enable X11 support when the DISTRO supports it
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
X-List-Received-Date: Mon, 14 Mar 2016 21:26:54 -0000
Content-Type: multipart/alternative; boundary=001a113fd1ea6bab33052e08f0e6

--001a113fd1ea6bab33052e08f0e6
Content-Type: text/plain; charset=UTF-8

On 14 March 2016 at 21:23, Otavio Salvador <otavio.salvador@ossystems.com.br
> wrote:

> Do you mind to explain to me why?
>
> I would like to try to see your view on this.
>

libsdl is a good example to be honest.  Why does your choice of target
distro features decide what libraries the native sdl should use?
Respecting them means in this case that you can't have a graphical qemu.
Taking it to hypotheticals, just because my target is pure Wayland doesn't
mean I expect sdl to build for Wayland without X11, especially if my
desktop is X11 based.

Ross

--001a113fd1ea6bab33052e08f0e6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 March 2016 at 21:23, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D=
"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador=
@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div id=3D":26s" class=3D"a3s" style=3D"overflow:hidden">Do you mind to expl=
ain to me why?<br>
<br>
I would like to try to see your view on this.</div></blockquote><div><br></=
div><div>libsdl is a good example to be honest.=C2=A0 Why does your choice =
of target distro features decide what libraries the native sdl should use?=
=C2=A0 Respecting them means in this case that you can&#39;t have a graphic=
al qemu.=C2=A0 Taking it to hypotheticals, just because my target is pure W=
ayland doesn&#39;t mean I expect sdl to build for Wayland without X11, espe=
cially if my desktop is X11 based.</div><div><br></div><div>Ross=C2=A0</div=
></div></div></div>

--001a113fd1ea6bab33052e08f0e6--
