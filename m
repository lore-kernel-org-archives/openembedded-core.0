Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id A798C76F56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 20:19:06 +0000 (UTC)
Received: by igboj15 with SMTP id oj15so37811329igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 13:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=lE4vvVSNZtXo9U1Sz7TnSvSdLFSGzVcMn/kKuK9bKiI=;
	b=0gf5nAJTkGCsC9iJ1ER3K7n3OWpoEozhZU3dX4rXDp00hVPeK8L7cwKSya6oGGEJIl
	S8z9LDj6UcjypvaFX9B0VgtTnXkYfCs+EyiSxCktI2dfK0df7Yv22MQD8soQzSKq8DLJ
	RjBwZmt+EHFGIJcSHox4DxmtHizG48Hye6a8pRH44aU+EcvUzUF8naS2aNoAIXHZTxwP
	lh1yQsbYA455NSlHX0777nwto6443oifajsPM8HbIQ2F1xMZDazuiRsUQIRg4HFw+FRB
	3u5eWLKMJ+eStW7I6VicVw6j1y12NfkkFseDnJzQotuRrF2NABGpwMCwQnTtpQgnacKV
	aTkQ==
X-Received: by 10.50.138.76 with SMTP id qo12mr432261igb.38.1441052346582;
	Mon, 31 Aug 2015 13:19:06 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.71 with HTTP; Mon, 31 Aug 2015 13:18:47 -0700 (PDT)
In-Reply-To: <55E4AE5F.9080804@windriver.com>
References: <1440952270-9085-1-git-send-email-raj.khem@gmail.com>
	<CAPhnLPBue6s_m7rYYyuy6hyxdBTz8y1MedgspDeOLcL1XaunYQ@mail.gmail.com>
	<CAMKF1srWus=7f3EoCGtMVez0FbsFPsa1g8COMM87pqxxpkg2zw@mail.gmail.com>
	<CABcZANmWhU5sFXSU1j=3GOPu0gOCY3Nt_b54oQkRLhzs=ERSYQ@mail.gmail.com>
	<55E4940B.5050105@windriver.com>
	<CAMKF1sqSTenmfkQst644-c0yGHmheSE0APwOR7cHK_5-T_d4mQ@mail.gmail.com>
	<55E4AE5F.9080804@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 31 Aug 2015 13:18:47 -0700
X-Google-Sender-Auth: Q0Dzo9urHlT_DLc3PtTVe0MoN9A
Message-ID: <CABcZANkeKcXKumkxmMTwtw=wt4i5ja+brbeQEuLdLLLO4cVBcA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xz: Correctly specify GPL-3.0 with autoconf exception
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
X-List-Received-Date: Mon, 31 Aug 2015 20:19:06 -0000
Content-Type: multipart/alternative; boundary=001a1134b964388e17051ea12531

--001a1134b964388e17051ea12531
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 31, 2015 at 12:43 PM, Mark Hatle <mark.hatle@windriver.com>
wrote:

> If that is the way we want to move forward, then my recommendation would
> be to
> add a new field for that.
>
> LICENSE-SRC = "source license list"
> LICENSE = "declared license for the expected output of the build"
> LICENSE_<package> = "The license for the items in this specific package"
>
> Where:
>
>  LICENSE ?= "${LICENSE-SRC}"
>
>  LICENSE_<package> ?= "${LICENSE}"
>
> I see a lot of potential work here, but I don't see the benefit though.
>
> I don't know of any cases where someone has gotten in trouble, or even
> questioned, when the build system has a slightly different license then
> output
> of the build.  The GNU build tools are definitely the biggest example I
> can give
> here.
>

I would say we should introduce LICENSE-SRC, alter archiver.bbclass to use
it, and set LICENSE-SRC ?= "${LICENSE}" instead. Much less work, but then
we have a variable we can append to if we run into a case like that which
we've discussed, without increasing work for the more common cases.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1134b964388e17051ea12531
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Aug 31, 2015 at 12:43 PM, Mark Hatle <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":9u=
" class=3D"a3s" style=3D"overflow:hidden">If that is the way we want to mov=
e forward, then my recommendation would be to<br>
add a new field for that.<br>
<br>
LICENSE-SRC =3D &quot;source license list&quot;<br>
LICENSE =3D &quot;declared license for the expected output of the build&quo=
t;<br>
LICENSE_&lt;package&gt; =3D &quot;The license for the items in this specifi=
c package&quot;<br>
<br>
Where:<br>
<br>
=C2=A0LICENSE ?=3D &quot;${LICENSE-SRC}&quot;<br>
<br>
=C2=A0LICENSE_&lt;package&gt; ?=3D &quot;${LICENSE}&quot;<br>
<br>
I see a lot of potential work here, but I don&#39;t see the benefit though.=
<br>
<br>
I don&#39;t know of any cases where someone has gotten in trouble, or even<=
br>
questioned, when the build system has a slightly different license then out=
put<br>
of the build.=C2=A0 The GNU build tools are definitely the biggest example =
I can give<br>
here.</div></blockquote></div><br>I would say we should introduce LICENSE-S=
RC, alter archiver.bbclass to use it, and set LICENSE-SRC ?=3D &quot;${LICE=
NSE}&quot; instead. Much less work, but then we have a variable we can appe=
nd to if we run into a case like that which we&#39;ve discussed, without in=
creasing work for the more common cases.<br>-- <br><div class=3D"gmail_sign=
ature">Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics</div>
</div></div>

--001a1134b964388e17051ea12531--
