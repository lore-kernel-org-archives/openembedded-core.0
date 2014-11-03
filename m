Return-Path: <niqingliang2003@gmail.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id B2C6265D3C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 09:17:18 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id k14so10569826wgh.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Nov 2014 01:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=SSQRfFBf6PfaJX+fQc0FUTe2ZWzuFHKJWam9EFBllTk=;
	b=WRR7cVoYo83t72Hp4ZDRXu9EjB1W5t+2tsCtlM/EofPDlC80h1im2aTmt8+h0+x6er
	AEZtUngOl69g1vfxWZg5L8OkW2v1gc3qD/gKm5LpqWXemI9x1FcFgrZFOkHv5Hes6uqo
	fnvlc32zlPwyaIn+7+NWAWHNiVbXxU07tgva+ngLDSb1tHKwEcaJvavFihqG7lmm3sm/
	dgALg20gX6PTi2SQ97xK25HTeY3AMDPAfdq6/kzR6U33njGkblw/Yb6nkXki/Kyj3uOr
	cA0bkJ5T9zNFu1f/XZbs1/IjTFSuYm+5vjzh3oMh9y5NyYlkrsWt6FnOjT1zmIe5ff4l
	y8QA==
MIME-Version: 1.0
X-Received: by 10.194.185.229 with SMTP id ff5mr1012501wjc.122.1415006238952; 
	Mon, 03 Nov 2014 01:17:18 -0800 (PST)
Received: by 10.217.141.70 with HTTP; Mon, 3 Nov 2014 01:17:18 -0800 (PST)
In-Reply-To: <CADwFkYdjkNrBGCJRMfc4JVg5j31461djp2sc9q9crSezHHzSUA@mail.gmail.com>
References: <CADwFkYdjkNrBGCJRMfc4JVg5j31461djp2sc9q9crSezHHzSUA@mail.gmail.com>
Date: Mon, 3 Nov 2014 17:17:18 +0800
Message-ID: <CADwFkYfm-TG4WH1ONn0LzH87YqP7yyc6BkyHC_Sb-M23D7wx1w@mail.gmail.com>
From: Yi Qingliang <niqingliang2003@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: where is the 'libGL.so.*"?
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
X-List-Received-Date: Mon, 03 Nov 2014 09:17:24 -0000
Content-Type: multipart/alternative; boundary=047d7bb03a9a3a51760506f0d001

--047d7bb03a9a3a51760506f0d001
Content-Type: text/plain; charset=UTF-8

I have removed 'x11' in 'DISTRO_FEATURE', I don't know if it is the reason.

On Mon, Nov 3, 2014 at 10:43 AM, Yi Qingliang <niqingliang2003@gmail.com>
wrote:

> Hello,
>     I'm using poky with 'meta-qt5'. when compiling qtbase, it said that
> can't find 'libGL.so'.
>     the mesa is the default provider of virtual/libgl, but there isn't
> 'libGL.so.*' in package 'libgl-mesa'.
>     any idea? thanks!
>
> Yi Qingliang
>

--047d7bb03a9a3a51760506f0d001
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have removed &#39;x11&#39; in &#39;DISTRO_FEATURE&#39;, =
I don&#39;t know if it is the reason.</div><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote">On Mon, Nov 3, 2014 at 10:43 AM, Yi Qingliang <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:niqingliang2003@gmail.com" target=3D"_=
blank">niqingliang2003@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr">Hello,<div>=C2=A0 =C2=A0 I&#39;m using poky =
with &#39;meta-qt5&#39;. when compiling qtbase, it said that can&#39;t find=
 &#39;libGL.so&#39;.<br></div><div>=C2=A0 =C2=A0 the mesa is the default pr=
ovider of virtual/libgl, but there isn&#39;t &#39;libGL.so.*&#39; in packag=
e &#39;libgl-mesa&#39;.</div><div>=C2=A0 =C2=A0 any idea? thanks!</div><spa=
n class=3D"HOEnZb"><font color=3D"#888888"><div><br></div><div>Yi Qingliang=
</div></font></span></div>
</blockquote></div><br></div>

--047d7bb03a9a3a51760506f0d001--
