Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0DD9C60EF6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 15:13:12 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id ep20so1489849lab.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 07:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=YuWDaLN7ZGbIQthzdcwsGs7TcoONtE2MN+riN7StLIc=;
	b=dXKwc1zQ9Ffi1g5clt1TlgAb9pTBZKvGGb0k8+ULSpwP+Mqpzyet/3Qlz2Wko7i0lt
	nq6x4BgIh7pkxyBZpIkO27M00ux9lZOh5SIc6jLIVQjZYyqRi6laKCIp1MHE+B6hW7h3
	HnQTNTM6TaWgZNpoJx5BLPOgX55n5eq9Y9FimMOLBilT7kV2StT26TJuBAQRcUDHnQ4e
	/TT7DPtB+PAmKhLBgJv2rw9xWgj2nFCBvfzQ19fymQn+YssjntHiFht5dbYzE3ypbzRL
	0SNpn/VWLXLI7c/YUELW8VzZl3VmbTLwPTIVpSQoNbap/lVH42E5vty575Lp9rxMIlps
	yT1w==
X-Received: by 10.152.115.230 with SMTP id jr6mr1846142lab.45.1386947591813;
	Fri, 13 Dec 2013 07:13:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.114.22.169 with HTTP; Fri, 13 Dec 2013 07:12:51 -0800 (PST)
In-Reply-To: <20131213150826.GC3715@jama>
References: <cover.1386946335.git.kergoth@gmail.com>
	<6122710ad05d4a2c1fa2d42fba3025cae6dab5ed.1386946335.git.kergoth@gmail.com>
	<20131213150826.GC3715@jama>
From: Chris Larson <kergoth@gmail.com>
Date: Fri, 13 Dec 2013 08:12:51 -0700
Message-ID: <CABcZAN=usCwUpjWFy2G9D2VPUAhPhBFCVRp0UzVpg6=Lks3goQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC 1/2] os-release: add new operating system identification recipe
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
X-List-Received-Date: Fri, 13 Dec 2013 15:13:13 -0000
Content-Type: multipart/alternative; boundary=001a11c36742883df804ed6be643

--001a11c36742883df804ed6be643
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2013 at 8:08 AM, Martin Jansa <martin.jansa@gmail.com>wrote=
:

> > +do_compile () {
> > +    for field in ${OS_RELEASE_FIELDS}; do
> > +        if eval "test -n \"\$$field\""; then
> > +            eval "printf \"%s=3D%s\n\" \"\$field\" \"\$$field\""
> > +        fi
> > +    done >os-release
> > +}
> > +do_compile[vardeps] +=3D "${OS_RELEASE_FIELDS}"
>
> Isn't this dependency picked automatically?
>

No, this is expanded, so this adds the dependency on the variables whose
names are in the OS_RELEASE_FIELDS variable, not just on OS_RELEASE_FIELDS
itself. Due to the use of eval, bitbake doesn=E2=80=99t know we=E2=80=99re =
using the
iterated values as variable names.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c36742883df804ed6be643
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Dec 13, 2013 at 8:08 AM, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb adM"><div class=3D"im">=
&gt; +do_compile () {<br>
&gt; + =C2=A0 =C2=A0for field in ${OS_RELEASE_FIELDS}; do<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0if eval &quot;test -n \&quot;\$$field\&qu=
ot;&quot;; then<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0eval &quot;printf \&quot;%s=
=3D%s\n\&quot; \&quot;\$field\&quot; \&quot;\$$field\&quot;&quot;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; + =C2=A0 =C2=A0done &gt;os-release<br>
&gt; +}<br>
&gt; +do_compile[vardeps] +=3D &quot;${OS_RELEASE_FIELDS}&quot;<br>
<br>
</div></div>Isn&#39;t this dependency picked automatically?<br>
<div class=3D"im"></div></blockquote></div><br>No, this is expanded, so thi=
s adds the dependency on the variables whose names are in the OS_RELEASE_FI=
ELDS variable, not just on OS_RELEASE_FIELDS itself. Due to the use of eval=
, bitbake doesn=E2=80=99t know we=E2=80=99re using the iterated values as v=
ariable names.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a11c36742883df804ed6be643--
