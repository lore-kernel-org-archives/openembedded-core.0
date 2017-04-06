Return-Path: <vlsireddy@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id EE1D277CFB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 20:11:56 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id o21so9322609wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Apr 2017 13:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gCanWv78k6aj0w3XnzZ8RCNDWTvq6Fm3OJKrKdgB2Ug=;
	b=A8ycMTnH27h8Br4JR7EeZgo2tZiPi12yqw95MvpmWa9Oi+0MhBzIg5BYM5c5Lb232I
	UVRy/tlJq7BPr95Uu2RLjNd0VL07eTT7p/WZxKcTAreBLwHdvWJc0RmUTaH6DYlOsZzk
	i5ie7s03sUCjkq3IEuEBDj0h7DAYXflTF0KRwGL1xvts7bpirSGnrXu4Gizzrh4y3keg
	naIyREaAzPr+6g5h/hZaWlLvHvI0L8+dCvuQxd5/wiCWbnl0CLYy2F7UatY59kt5rFON
	TeJ+b7VqPpXCSqF1xJnvNm7P0F7IqXHcJ7jiEgabtB7oVa+F/8UqlHbnHy9bvuzffgUt
	CRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gCanWv78k6aj0w3XnzZ8RCNDWTvq6Fm3OJKrKdgB2Ug=;
	b=S27U7jQlQtcPxgJW+cGiHX8MJztmKJYZ3iKYGwfvGogdbHQKL8dO4bA7TNJF4XmQpt
	+Uvu2ahCddJ4CchoVQw0v67pxEEzACHMfePSD+vyFonHP3H9P6SZXouQDZiU2Is0J4Gc
	lKuxIXpglMlmVrsI5vRgR16OHaKU/lZjE53BHISUKEKrByOpGRQQ2kBDTa8tAqm4Pw0A
	cAPQ16DFjObyJ6zGmokAv/YB/XoPVrytH6ogdjRcnvyvtNGIodOk/hCnpIklRAX5Qygb
	1rreUQJfNcazKmy4rleEasmUCugIC2Z/D56qemJF4NOyqFGCrRKEZcxMpJUJ7rVY7ekE
	ilAQ==
X-Gm-Message-State: AFeK/H3HO0npXql+sm98z7g2ImAh+xVXY1ilyKn6s+Egsk2MCdOliG6nwf1V7FgRprOS1hSitbStCPoOPlk+Eg==
X-Received: by 10.223.152.107 with SMTP id v98mr13564916wrb.60.1491509517263; 
	Thu, 06 Apr 2017 13:11:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.35.214 with HTTP; Thu, 6 Apr 2017 13:11:56 -0700 (PDT)
In-Reply-To: <CAEsOVNf_wSreuAQk7mGMAbWN44PGo35WfcshbggzJ14OjvYVog@mail.gmail.com>
References: <CAGQ4JX3rYtONiVv_eOhj-MK=2FA7=h3xCA_iytd=fpTF00rT6A@mail.gmail.com>
	<CAGQ4JX06AcUkSzRyg2255mZxxT=etOaE786_fVQqGp32EO8S2Q@mail.gmail.com>
	<CAEsOVNencj+9iW4xnqAUTzJAZ1_W=o8-N2-S6x0fr2pB-YJd9g@mail.gmail.com>
	<1491407333.17200.22.camel@linuxfoundation.org>
	<CAGQ4JX1DGeQuO3WhhpHZbJFsUpOg1uHmOou1fcQvgBy+hJpjOQ@mail.gmail.com>
	<CAGQ4JX12JDMaffLGYO16626BhXCSAQ3wzVEzN21wzcrZ7mwJ5A@mail.gmail.com>
	<CAEsOVNcN6=XAt8b7_PN288yHs8syzV08LreRkwSf2Mxpeb8Cgw@mail.gmail.com>
	<CAGQ4JX1ibcWeYV7NfYSB8cCOYH=83XEON1=sf4U9S378A16p8w@mail.gmail.com>
	<CAGQ4JX27J_dh=2wPJ=1Gp_=1T6KL2rcL3EhxNTx4BF=ukLwxJA@mail.gmail.com>
	<CAEsOVNf_wSreuAQk7mGMAbWN44PGo35WfcshbggzJ14OjvYVog@mail.gmail.com>
From: Ravi chandra reddy <vlsireddy@gmail.com>
Date: Thu, 6 Apr 2017 16:11:56 -0400
Message-ID: <CAGQ4JX1L0jqm6KeKCwDNnhNHDrGZFARJACk9pwreyUKzRgrFTg@mail.gmail.com>
To: Matthew McClintock <msm-oss@mcclintock.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Recipe [patch] modification to generate a static library instead of shared library
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
X-List-Received-Date: Thu, 06 Apr 2017 20:11:57 -0000
Content-Type: multipart/alternative; boundary=f403045d59aef4a992054c851e6e

--f403045d59aef4a992054c851e6e
Content-Type: text/plain; charset=UTF-8

Hi,
    I am trying to generate LibIIO [open source by Analog Devices], however
there is dependancy on Libxml2.

problem with Libxml2, it is dependant on *python*-lib, libdl, libz, libzma,
libm

for some reason with Yocto built Libxml2.so, i am encountering "undefined
references error", which i am unable to solve [inspite of linking possible
dependant libraries],

if i get could the Libxml2.a, it packages all "REQUIRED ELEMENTS", so i
assume, there WONT be any error in linking Libxml2 in Libiio.

======in short=========
Libiio ---linking---> Libxml2*.so* [yocto based] ---errors-> undefined
referneces to .....

======in short=========
Libiio ---linking---> Libxml2.a [yocto based] --> SHOULD solve and install
libiio

for me to generate Libxml2.a, i need to make/ask yocto build LIbxml2.a for
me. i tried putting libxml2-staticdev  in the local.conf file and it gives
me build error.

all i want is Libxml2.a which is to be used by Libiio.so/Libiio.a to be
used by an application [called in user space of AARCH linux]


Thanks
RC

On Thu, Apr 6, 2017 at 3:17 PM, Matthew McClintock <msm-oss@mcclintock.net>
wrote:

> On Thu, Apr 6, 2017 at 9:20 AM, Ravi chandra reddy <vlsireddy@gmail.com>
> wrote:
> > Hi,
> >      Is there any hidden pointer within these static dev packages. i
> > expected the library to be .a format. what can i understand from these
> > static dev packages, plz let me know.
>
> Can you expand on what you're trying to accomplish? Are you trying to
> build a static binary? I don't think you actually are trying to
> install libxml2.a on the running image are you? Maybe you really want
> an SDK with a sysroot populated with static libraries so you can link
> against them?
>
> -M
>

--f403045d59aef4a992054c851e6e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>=C2=A0 =C2=A0 I am trying to generate LibIIO [open=
 source by Analog Devices], however there is dependancy on Libxml2.</div><d=
iv><br></div><div>problem with Libxml2, it is dependant on *python*-lib, li=
bdl, libz, libzma, libm</div><div><br></div><div>for some reason with Yocto=
 built Libxml2.so, i am encountering &quot;undefined references error&quot;=
, which i am unable to solve [inspite of linking possible dependant librari=
es],=C2=A0</div><div><br></div><div>if i get could the Libxml2.a, it packag=
es all &quot;REQUIRED ELEMENTS&quot;, so i assume, there WONT be any error =
in linking Libxml2 in Libiio.</div><div><br></div><div>=3D=3D=3D=3D=3D=3Din=
 short=3D=3D=3D=3D=3D=3D=3D=3D=3D</div><div>Libiio ---linking---&gt; Libxml=
2<b>.so</b> [yocto based] ---errors-&gt; undefined referneces to .....</div=
><div><br></div><div><div>=3D=3D=3D=3D=3D=3Din short=3D=3D=3D=3D=3D=3D=3D=
=3D=3D</div><div>Libiio ---linking---&gt; Libxml2.a [yocto based] --&gt; SH=
OULD solve and install libiio</div></div><div><br></div><div>for me to gene=
rate Libxml2.a, i need to make/ask yocto build LIbxml2.a for me. i tried pu=
tting libxml2-staticdev =C2=A0in the local.conf file and it gives me build =
error.=C2=A0<br></div><div><br></div><div>all i want is Libxml2.a which is =
to be used by Libiio.so/Libiio.a to be used by an application [called in us=
er space of AARCH linux]</div><div><br></div><div><br></div><div>Thanks</di=
v><div>RC</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Apr 6, 2017 at 3:17 PM, Matthew McClintock <span dir=3D"ltr">&l=
t;<a href=3D"mailto:msm-oss@mcclintock.net" target=3D"_blank">msm-oss@mccli=
ntock.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">On Thu, Apr 6, 2017 at 9:20 AM, Ravi chandra reddy &lt;<a href=3D"=
mailto:vlsireddy@gmail.com">vlsireddy@gmail.com</a>&gt; wrote:<br>
&gt; Hi,<br>
</span><span class=3D"">&gt;=C2=A0 =C2=A0 =C2=A0 Is there any hidden pointe=
r within these static dev packages. i<br>
&gt; expected the library to be .a format. what can i understand from these=
<br>
&gt; static dev packages, plz let me know.<br>
<br>
</span>Can you expand on what you&#39;re trying to accomplish? Are you tryi=
ng to<br>
build a static binary? I don&#39;t think you actually are trying to<br>
install libxml2.a on the running image are you? Maybe you really want<br>
an SDK with a sysroot populated with static libraries so you can link<br>
against them?<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
-M<br>
</font></span></blockquote></div><br></div>

--f403045d59aef4a992054c851e6e--
