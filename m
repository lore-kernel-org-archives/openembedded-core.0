Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f180.google.com (mail-yb0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7414C7751C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 14:08:58 +0000 (UTC)
Received: by mail-yb0-f180.google.com with SMTP id f194so18218569yba.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 07:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QnBUDf2XMaHK0dLbg+7luWiqzI5Wu3abnnXUD5Jjxv8=;
	b=X1oYM1t1CIyxB+sUgKE1YlXK4FEnzODeTdKbcRqa+QX4jZVw+AyI5P1kgimpk71vec
	Vh1DD97yknYecFj9MLO0pp0Z7gNDPOcKj6Z7fKgGk7Pj36mQa4i/Cw5484QblsgjafWB
	NH7rqF3vfjHmDqRLVeGR9kbFTMcndmOgd+KapjibO+MS7fltyx8yW8ZGXGLTeimetCNR
	GU1r2OU6OIG6Zc9tcf1oL3MnTN9nCPBmsMPpoXEKuWV3ZE4VKPIMO4nSFLQRKwdfihTM
	NgF78MYC/6q4VGv5hscnbW3JTaoJcF6w48UosZGWHkAe5Cgq5Ba5zEzL2AR497LsS3X+
	Xbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QnBUDf2XMaHK0dLbg+7luWiqzI5Wu3abnnXUD5Jjxv8=;
	b=BPIoq1jmtGK3dy6DIoUY5TFjPlS/ebzqRxZzGzTnomIIUq+vTqR+/nhrS1gNWoGIBf
	tqdiA8nERLJO4R4mCYDghmH/ayrBaeax1P2tHPyhH8mL5ew9gm2kk9QRsSY4Ivr0dgqw
	EJ2jbyBbBRfUCE5DwZVER1GeR0o0a+ZCfbR0uuTfHNoEo4iPurX5cEYEHyR8gkpA7ujN
	lEU9McUUCO/p9QW6y3c37d9PQBlQcgfT3NGwc8XElIhjwcdEmGkmcjnFEvyGbp7/BVhW
	Fy5m3W8XLR7yoHazs+jllVjMNlU+5nJuk2AWTvnO5gDsbh2ga3O1joFClTIkCpwPGYdp
	V0hw==
X-Gm-Message-State: AIVw110lxUwWsIHwq8cq5U6TIUlS3ojjCvF/A1F4sHTtfDVdyl5wcXQk
	vTiP+ybO2uxyv8ipriEHfTB/U5pLvA==
X-Received: by 10.13.202.214 with SMTP id m205mr2257362ywd.68.1499954939253;
	Thu, 13 Jul 2017 07:08:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Thu, 13 Jul 2017 07:08:58 -0700 (PDT)
In-Reply-To: <CAJgxT38yLAW3eNk+5HMUid70WNMP_qCTfuKTW22Nthb73jgX1Q@mail.gmail.com>
References: <CAJgxT38yLAW3eNk+5HMUid70WNMP_qCTfuKTW22Nthb73jgX1Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 13 Jul 2017 16:08:58 +0200
Message-ID: <CA+chaQccmGBV2GvBsDAqj2S5qyaSz+5ircYDgDOqXesXC74XGA@mail.gmail.com>
To: Matt Hoosier <matt.hoosier@gmail.com>
Cc: "akuster@mvista" <akuster@mvista.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Reasons for reverting "openssl: prevent ABI break from earlier krogoth releases" ?
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
X-List-Received-Date: Thu, 13 Jul 2017 14:08:59 -0000
Content-Type: multipart/alternative; boundary="001a11482b44555c6b055433799c"

--001a11482b44555c6b055433799c
Content-Type: text/plain; charset="UTF-8"

It was applied in fido, because fido was released with old version-script
and upgrade to 1.0.2h changed the ABI.

krogoth on the other hand was released with this new ABI, so applying this
partial revert in krogoth would cause ABI changes in different revisions in
krogoth branch.

You can find a bit longer discussion about this on the ML, this is just
what I recall.

On Thu, Jul 13, 2017 at 3:04 PM, Matt Hoosier <matt.hoosier@gmail.com>
wrote:

> Back on the Krogoth branch, there was a changed applied briefly last year
> to smooth over some symbol-versioning breakage that occurred when OpenSSL
> got upgraded past version 1.0.2g:
>
>     openssl: prevent ABI break from earlier krogoth releases
>
>     The backported upgrade to 1.0.2h included an updated GNU LD
>     version-script which results in an ABI change. In order to try and
>     respect ABI for existing binaries built against fido this commit
>     partially reverts the version-script to maintain the existing ABI
>     and instead only add the new symbols required by 1.0.2h.
>
>     Suggested-by: Martin Jansa <martin.jansa@gmail.com>
>     (From OE-Core rev: 480db6b)
>
>     Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>     Signed-off-by: Armin Kuster <akuster@mvista.com>
>     Signed-off-by: Armin Kuster <akuster808@gmail.com>
>
> However, it got reverted nearly immediately (in
> 08f85da10b3a7fc6165f163fd0f23784a2c9c8e4), but there wasn't much
> discussion in the commit message about why the reversion happened.
>
> I'm running into the same kinds of troubles that the original commit
> message cited as justification for implementing backwards-compatibility
> with the SSL symbols. Is there any memory about why the old
> foo@OPENSSL_1.0.0 versioned symbols ultimately got dropped?
>
> -Matt
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a11482b44555c6b055433799c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It was applied in fido, because fido was released with old=
 version-script and upgrade to 1.0.2h changed the ABI.<div><br></div><div>k=
rogoth on the other hand was released with this new ABI, so applying this p=
artial revert in krogoth would cause ABI changes in different revisions in =
krogoth branch.</div><div><br></div><div>You can find a bit longer discussi=
on about this on the ML, this is just what I recall.</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Jul 13, 2017 at 3:0=
4 PM, Matt Hoosier <span dir=3D"ltr">&lt;<a href=3D"mailto:matt.hoosier@gma=
il.com" target=3D"_blank">matt.hoosier@gmail.com</a>&gt;</span> wrote:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex"><div dir=3D"ltr">Back on the Krogoth branch, =
there was a changed applied briefly last year to smooth over some symbol-ve=
rsioning breakage that occurred when OpenSSL got upgraded past version 1.0.=
2g:<div><br></div><div><div>=C2=A0 =C2=A0 openssl: prevent ABI break from e=
arlier krogoth releases</div><div><br></div><div>=C2=A0 =C2=A0 The backport=
ed upgrade to 1.0.2h included an updated GNU LD</div><div>=C2=A0 =C2=A0 ver=
sion-script which results in an ABI change. In order to try and</div><div>=
=C2=A0 =C2=A0 respect ABI for existing binaries built against fido this com=
mit</div><div>=C2=A0 =C2=A0 partially reverts the version-script to maintai=
n the existing ABI</div><div>=C2=A0 =C2=A0 and instead only add the new sym=
bols required by 1.0.2h.</div><div><br></div><div>=C2=A0 =C2=A0 Suggested-b=
y: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_bl=
ank">martin.jansa@gmail.com</a>&gt;</div><div>=C2=A0 =C2=A0 (From OE-Core r=
ev: 480db6b)</div><div><br></div><div>=C2=A0 =C2=A0 Signed-off-by: Joshua L=
ock &lt;<a href=3D"mailto:joshua.g.lock@intel.com" target=3D"_blank">joshua=
.g.lock@intel.com</a>&gt;</div><div>=C2=A0 =C2=A0 Signed-off-by: Richard Pu=
rdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@<wbr>linuxfoundation.org</a>&gt;</div><div>=C2=A0 =C2=
=A0 Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com" t=
arget=3D"_blank">akuster@mvista.com</a>&gt;</div><div>=C2=A0 =C2=A0 Signed-=
off-by: Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"=
_blank">akuster808@gmail.com</a>&gt;</div><div><br></div><div>However, it g=
ot reverted nearly immediately (in 08f85da10b3a7fc6165f163fd0f237<wbr>84a2c=
9c8e4), but there wasn&#39;t much discussion in the commit message about wh=
y the reversion happened.</div><div><br></div><div>I&#39;m running into the=
 same kinds of troubles that the original commit message cited as justifica=
tion for implementing backwards-compatibility with the SSL symbols. Is ther=
e any memory about why the old foo@OPENSSL_1.0.0 versioned symbols ultimate=
ly got dropped?</div></div><span class=3D"HOEnZb"><font color=3D"#888888"><=
div><br></div><div>-Matt</div></font></span></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--001a11482b44555c6b055433799c--
