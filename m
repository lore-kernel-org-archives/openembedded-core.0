Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 074D571634
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Feb 2015 07:53:41 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id i8so3869127qcq.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 23:53:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=N4mkZUifiLaefQIlK7kBjwXvDSJ8y4L9cQlTKRJ2430=;
	b=cd0ALgNANzofCIo0XVZKTYcI3mWKFQb7jZcHFwhe4qDkr6ofT1unZMa5WuU7NsKzkD
	Hzr1pL+4aKVX8BwaZsfUUT3X6MQ9M7Rl2LLxI8PLdisjNQEx9BKmJvKxzJfoPfTf3XXI
	quns3ijAmYVVdHiUBRd6z6kdv84r58kuHCtOvqX9cHvMhnNHoyDfAPc7Jphv/ZcdPNCq
	CiQ2mIXMshc9CSUlAX7RC8qjkHw7NyDpTxcom/o+Job3iXNgWRbBJCf2GAR5NWF7Foz6
	fKlhJEPbRLmjqJpUmVk5LARm+YCwhSb+ljPR10w1xYspxIUnpaodrPT/vfkj/sXaatjM
	r02w==
X-Gm-Message-State: ALoCoQm3VaTIDmaF2Mu9CmY5JwhufetOuU+B2RsYptawB7PeKjacCfJux7Cj/lB5s/Cd5vIpgNl4
X-Received: by 10.140.133.69 with SMTP id 66mr4249090qhf.17.1423900422440;
	Fri, 13 Feb 2015 23:53:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Fri, 13 Feb 2015 23:53:22 -0800 (PST)
In-Reply-To: <CAMKF1sqjQm+n5xKfS0utm9B9h_S+RYWrgnGUCboRNCk5XSUmzg@mail.gmail.com>
References: <CAMKF1souj1-FLTjkQb0y8myTiKMJyNeAa7wiM5-pW1fz0EtheA@mail.gmail.com>
	<CAJTo0LaN3HMhjrpii2pPbJw5zWbywgr1keZe=iQmuKFMFFf=gQ@mail.gmail.com>
	<CAMKF1sq8NsuNYZDQRPtXruBeRndOP+0qwBuTO2ahb6q-fS8XGw@mail.gmail.com>
	<CAJTo0LYpKbwOHg-DBMJycy+KNayTCsnhToJR8K-REKZ2jxhnhw@mail.gmail.com>
	<EA0C9DE9-9E5F-4B74-8464-138895268F2F@gmail.com>
	<CAJTo0LbSFesauhA_H39Znd07SR5JCs45izy2us=cFWVGXtW8hg@mail.gmail.com>
	<80920FD0-CA08-45D7-9A41-3971FB2D58D7@gmail.com>
	<CAJTo0LbqTrQzk0KeHDxYnmtZrrFdZD12DWrjA=Y4RtbQzwM0ow@mail.gmail.com>
	<CAMKF1sr7bYpKqzTmvX5rCuYc-Rb2se7Vsrr4aYA43E_b1Z=vWA@mail.gmail.com>
	<CACS+7ZRNm2Y0SJn76imF6DNoEsL2+ppC1zG45iGspOmL0EN0BQ@mail.gmail.com>
	<CAMKF1sqjQm+n5xKfS0utm9B9h_S+RYWrgnGUCboRNCk5XSUmzg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 14 Feb 2015 07:53:22 +0000
Message-ID: <CAJTo0LZDh+nk6_JBbE7HEzqa8YVtorBXPvXMw+ne_fVekSbymg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [RFT] upcoming glibc 2.21 and gcc 4.9 upgrade
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
X-List-Received-Date: Sat, 14 Feb 2015 07:53:42 -0000
Content-Type: multipart/alternative; boundary=001a1136fdeee02452050f07a697

--001a1136fdeee02452050f07a697
Content-Type: text/plain; charset=UTF-8

Hi Khem,

On 12 February 2015 at 07:35, Khem Raj <raj.khem@gmail.com> wrote:

> I have refreshed the branch to include the patch which moves the src
> uri to use the newly released glibc 2.21 branch
> and please run it via autobuilder ( top 5 commits )
>

I did a preliminary test on my local build machines (core-image-sato-sdk on
all arches), and valgrind fails with "unsupported version 2.21, Valgrind
requires glibc 2.2 - 2.19".

Ross

--001a1136fdeee02452050f07a697
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Khem,</div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 12 February 2015 at 07:35, Khem=
 Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"=
_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div id=3D":p57" class=3D"a3s" style=3D"overflow:hidden">I have ref=
reshed the branch to include the patch which moves the src<br>
uri to use the newly released <span class=3D"il">glibc</span> 2.21 branch<b=
r>
and please run it via autobuilder ( top 5 commits )</div></blockquote></div=
><br>I did a preliminary test on my local build machines (core-image-sato-s=
dk on all arches), and valgrind fails with &quot;unsupported version 2.21, =
Valgrind requires glibc 2.2 - 2.19&quot;.</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1136fdeee02452050f07a697--
