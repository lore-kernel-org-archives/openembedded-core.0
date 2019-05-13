Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id C85C87D593
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 17:19:27 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id y22so12223193qtn.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 10:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ocectig0oM02CWoAW5XAF4WvUI73jfG1uBB71edf8AE=;
	b=sCt7qHRXEydWwfqw9vg2wj267iXx1kG2YalwYRIp5h5TX8CXgHzRJHmILu9EE0gfnF
	+NnGJ2FiLmmndcmex1T0oJ63b6Fzn3UtG7xq8XsUdmGpOpcp5u0Mrs7yTpYWHKxn6WtG
	1z8dPGfgyOJqLp27YI/qAqrMdsHDn4TZp8rdt4cWwPdsA2sXmjV/iHaxbahZ3amKIJcE
	wGAKFOFjkaICyFzlR7MD/MSxk63B9e46l9ANbN2ukGW6m95ph2mrbVmX69/TGXMPhGiE
	JbDIr38yNLv+BuS8o3jsQf/pyJSg9n1Qx/w+el3f+G99xoMAXQSAVhKf+RTHQeodthK/
	NO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ocectig0oM02CWoAW5XAF4WvUI73jfG1uBB71edf8AE=;
	b=KdhcHCv5E8ylL11/r4LqwTU3U3OTj5u2k1unzvj3Fas/24edOTfj/K8yBykR0ZplgB
	ZUKgeUbDAhoTH/KFesXPkKffRZtQEGcZexAElzVOQhiOOSwFvCjunnnfIihkDNoxlvMw
	wfMj+kD43pbuxJHviRfYUBy+bsf9Zdz9Hmr4QJ29jBu7SBZdjdmk1Jlthfq1PEAXn647
	pBzGzYDPpDk7dRp8VsgYY1JIJnuNyRF4B8GN9eI0Tff4LBdFMMWXuGVGLC4fKYICXrMp
	dVA01SJs4ZUya71cCU6suBYIJA83H2rjtDQF57TSrUbMQonsuc6HyEFl1g66cSTfZ/eP
	70QA==
X-Gm-Message-State: APjAAAUo2oj+prYvaIMHajGlUUhSJyj7HCPOV2Tuc4UY/HvQJ1d7gmBh
	N3grCcSvyvZCdezOmuX1LVX6Xa1DLgIf0HHuEhk=
X-Google-Smtp-Source: APXvYqzURXuQJKPIXf1/fh1OJ3ScNIwFYH1MdILMVcw6MGYPba5k6AEP0iHRYID9TQEABCDEcYEx5J++wYOX3OHQ3tw=
X-Received: by 2002:a0c:93e1:: with SMTP id g30mr17368677qvg.194.1557767968372;
	Mon, 13 May 2019 10:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190513153303.50095-1-alex.kanavin@gmail.com>
	<CAMKF1srh_U0ge_1VkPJ0TAS6hKPkybyADUXaTp7SqRnFCmPm=Q@mail.gmail.com>
	<CAJTo0LZ=yDqyaZYv0PEOokt=6prPMa_gA=hnsYuNRA1oqw9TUQ@mail.gmail.com>
	<CAMKF1sorBuvDn0kmuPfn24t=vnM3QT_rT358REmcZkmZZS1T-A@mail.gmail.com>
	<CANNYZj8wfJ6wQYHSc1c71BU1DCS=ymz+Dbkz=+0sEsGmo-O3jQ@mail.gmail.com>
In-Reply-To: <CANNYZj8wfJ6wQYHSc1c71BU1DCS=ymz+Dbkz=+0sEsGmo-O3jQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 May 2019 10:19:07 -0700
Message-ID: <CAMKF1sq2LcZFZm-iPPiXLeZAnTf-ELHBOzwNBWJAeUQz++_+6A@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] qemux86: use a Core 2 Duo CPU instead of the original circa-1993 Pentium
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
X-List-Received-Date: Mon, 13 May 2019 17:19:28 -0000
Content-Type: multipart/alternative; boundary="00000000000065bc8d0588c81e97"

--00000000000065bc8d0588c81e97
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sounds good then unless someone else has more
Info

On Mon, May 13, 2019 at 9:07 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Note that the 32 bit machine from meta-intel has actually been using
> core2-32 tune for a while, so we are simply catching up here.
>
> Alex
>
> On Mon, 13 May 2019 at 18:02, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> >
> > On Mon, May 13, 2019 at 9:00 AM Burton, Ross <ross.burton@intel.com>
> wrote:
> >>
> >> On Mon, 13 May 2019 at 08:55, Khem Raj <raj.khem@gmail.com> wrote:
> >> > While I like this change I also worry if we are leaving out any
> significant x86 implementation out there in embedded space x86-64 is
> relatively newer compared to 32 bit which was long stable
> >>
> >> core2duo isn't exactly a modern chipset though, first released in
> >> 2006.  Does anyone *know* of any significant 32-bit x86 deployments
> >> which are using significantly older hardware?
> >
> >
> > If intel bsp folks are okay with this then let=E2=80=99s go for it
> >>
> >>
> >> Ross
>

--00000000000065bc8d0588c81e97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Sounds good then unless someone else has more</div><=
/div><div dir=3D"auto">Info=C2=A0</div><div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 13, 2019 at 9:07 AM Alexa=
nder Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Note that the=
 32 bit machine from meta-intel has actually been using<br>
core2-32 tune for a while, so we are simply catching up here.<br>
<br>
Alex<br>
<br>
On Mon, 13 May 2019 at 18:02, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, May 13, 2019 at 9:00 AM Burton, Ross &lt;<a href=3D"mailto:ros=
s.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt; wrote:<=
br>
&gt;&gt;<br>
&gt;&gt; On Mon, 13 May 2019 at 08:55, Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; While I like this change I also worry if we are leaving out a=
ny significant x86 implementation out there in embedded space x86-64 is rel=
atively newer compared to 32 bit which was long stable<br>
&gt;&gt;<br>
&gt;&gt; core2duo isn&#39;t exactly a modern chipset though, first released=
 in<br>
&gt;&gt; 2006.=C2=A0 Does anyone *know* of any significant 32-bit x86 deplo=
yments<br>
&gt;&gt; which are using significantly older hardware?<br>
&gt;<br>
&gt;<br>
&gt; If intel bsp folks are okay with this then let=E2=80=99s go for it<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Ross<br>
</blockquote></div></div>

--00000000000065bc8d0588c81e97--
