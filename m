Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7508C75791
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 22:21:43 +0000 (UTC)
Received: by oigd21 with SMTP id d21so6457549oig.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 15:21:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=XXTbaaASirUDCpFpKL34vRlB6Y1QOQqkfQgCqT7sshc=;
	b=FwLH1/+OZVPWgTz4dxh3+oXJWb58e2qLf+SoApVzHANG1opOHuPRJzuQWit17tUsg1
	ra81IGpLaR0pb+RUvQT0brBtxG6+XOKUSX8jwXNA/EdRZvttZP5JuF5YkIHjMQh9jEmQ
	mmI6cxuHFDsICpOipg6nPwNOKOg9jfoKUXvd++z2CXJnn1im0h3ms31+F4MAuatjI0Hn
	60rvWvngTOVipGDumQH1yv8P0bPVyPcvjCB6hp+ZUrHgBWEC8lOjSD0NJnxmgvWESb+4
	5szR1GKiIV+GwdisaIDhT+y79Nls56xeFyInLR52wBZBXzy+Yc3l5BXWMOrSzouJy2dJ
	BSnA==
X-Gm-Message-State: ALoCoQn7yN/i1sOa5/CdocJXdH+3hCV+khYDCvU6+2sF8awA42MDKBawhn8x71iDehnnXkvurLg9
X-Received: by 10.202.105.210 with SMTP id e201mr11291846oic.83.1437690104179; 
	Thu, 23 Jul 2015 15:21:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.108.4 with HTTP; Thu, 23 Jul 2015 15:21:24 -0700 (PDT)
In-Reply-To: <1437650226-27368-1-git-send-email-amarnath.valluri@intel.com>
References: <1437650226-27368-1-git-send-email-amarnath.valluri@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Jul 2015 23:21:24 +0100
Message-ID: <CAJTo0Lbf3xfewq5=2EsPqQ6knBmw3LNXAD8Gc9aRjv6V3uHeXw@mail.gmail.com>
To: Amarnath Valluri <amarnath.valluri@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libical: Upgrade v1.0.0 -> v1.0.1
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
X-List-Received-Date: Thu, 23 Jul 2015 22:21:48 -0000
Content-Type: multipart/alternative; boundary=001a114033e6f50956051b924fe7

--001a114033e6f50956051b924fe7
Content-Type: text/plain; charset=UTF-8

On 23 July 2015 at 12:17, Amarnath Valluri <amarnath.valluri@intel.com>
wrote:

> - Build system changed from autotools to cmake.
> - Perl dependency added.
>

We had almost exactly this patch a week or so ago from Cristian (CC'd) who
promptly retracted it with the comment that he "hadn't done enough testing".

Cristian, was there something wrong with the 1.0.1 upgrade, or were you
being cautious and the patch is fine?

 SRC_URI = "https://github.com/${BPN}/${BPN}/archive/v${PV}.tar.gz"
>

Until the people at github confirm that tarballs generated with archive/
are static I don't trust them.  Luckily the libical maintainers actually
released a tarball of 1.0.1 so the recipe should use that.

Ross

--001a114033e6f50956051b924fe7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 July 2015 at 12:17, Amarnath Valluri <span dir=3D"ltr">&lt;<a href=3D=
"mailto:amarnath.valluri@intel.com" target=3D"_blank">amarnath.valluri@inte=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1=
ma" class=3D"a3s" style=3D"overflow:hidden">- Build system changed from aut=
otools to cmake.<br>
- Perl dependency added.<br></div></blockquote><div><br></div><div>We had a=
lmost exactly this patch a week or so ago from Cristian (CC&#39;d) who prom=
ptly retracted it with the comment that he &quot;hadn&#39;t done enough tes=
ting&quot;.</div><div><br></div><div>Cristian, was there something wrong wi=
th the 1.0.1 upgrade, or were you being cautious and the patch is fine?</di=
v><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1ma" class=3D"a=
3s" style=3D"overflow:hidden">=C2=A0SRC_URI =3D &quot;<a href=3D"https://gi=
thub.com/${BPN}/${BPN}/archive/v${PV}.tar.gz" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/${BPN}/${BPN}/archive/v${PV}.tar.gz</a>&quot;</d=
iv></blockquote></div><br>Until the people at github confirm that tarballs =
generated with archive/ are static I don&#39;t trust them.=C2=A0 Luckily th=
e libical maintainers actually released a tarball of 1.0.1 so the recipe sh=
ould use that.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">Ross</div></div>

--001a114033e6f50956051b924fe7--
