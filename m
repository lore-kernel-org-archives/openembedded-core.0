Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id E27A060125
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Oct 2015 09:58:22 +0000 (UTC)
Received: by pacfv12 with SMTP id fv12so17413263pac.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Oct 2015 02:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=SSGa3bi0H85XPu8r0XxQOErHMG+7ZkUGaHebvLTCyzE=;
	b=jjViajJg89mu3h+UVpwXgl7Aq/hFqyvy4LQuh8ga39hE/Uax1y430f4oZuIx6U/xMv
	p3q4q0w+KASha0kcaa8FsAt3UkmuKPEugVpTzW4Pt0vkmmM6FuLc3tVd8RynC5dKkt8b
	BErNEtWTosgpMy/Q0+V07qKlzzxccSZzujcI/y2I0vaG1lIFYW2/7j5EYBIlNIytlXT+
	QKtv6H12xp6jiao0Zs0VL4gz1C1lEE+Ki7mGVZMaC0woa1qdqNTdRkxeOpniZ5M38j4J
	dw8icAZTvRrtXi6JVUq4WGnTqgjzeu6xPOQud5BUhNp/bwl3L10zZvgTfdCwwxU/H9Ih
	d1jw==
MIME-Version: 1.0
X-Received: by 10.68.65.13 with SMTP id t13mr121895pbs.43.1444211902497; Wed,
	07 Oct 2015 02:58:22 -0700 (PDT)
Received: by 10.66.53.236 with HTTP; Wed, 7 Oct 2015 02:58:22 -0700 (PDT)
In-Reply-To: <5613BE22.7020801@linux.intel.com>
References: <5613BE22.7020801@linux.intel.com>
Date: Wed, 7 Oct 2015 18:58:22 +0900
Message-ID: <CACrLJgDYYBBaxnmbJm-EWpadOgDpi9YdmT1RhfE-ZcWWrqaPmw@mail.gmail.com>
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: "tomas@sleepfive.com" <tomas@sleepfive.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: gobject introspection to oe-core
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
X-List-Received-Date: Wed, 07 Oct 2015 09:58:24 -0000
Content-Type: multipart/alternative; boundary=001a1137f0bc6dcefd052180c9f4

--001a1137f0bc6dcefd052180c9f4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi

Thanks for your suggestion. I also would like to support gir in oe-core.
However, I need to cleanup the recipes now as you said. I will think about
it because of my schedule :(.

I'll contact you when I'm ready for it.
Thanks

2015=EB=85=84 10=EC=9B=94 6=EC=9D=BC =ED=99=94=EC=9A=94=EC=9D=BC, Alexander=
 Kanavin<alexander.kanavin@linux.intel.com>=EB=8B=98=EC=9D=B4
=EC=9E=91=EC=84=B1=ED=95=9C =EB=A9=94=EC=8B=9C=EC=A7=80:

> Hello,
>
> I'm looking into the possibility of adding gobject introspection support
> directly to oe-core for Yocto 2.1 release (Spring 2016). This work would =
of
> course be based on meta-gir, but with the mandatory goal of producing
> patches of sufficient quality that can be sent upstream.
>
> I know the upstream tarball is a mess that mashes together several
> different things and was never designed for cross-compiling; and meta-gir
> is also difficult to understand: autotools-based build files are patched
> using undocumented patchfiles, then again patched from the recipe using
> sed, with no comments anywhere - all that needs to be sorted.
>
> What's your take on this? Is it realistic? Would you be able to help out?
>
> Regards,
> Alexander
>

--001a1137f0bc6dcefd052180c9f4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi<div><br></div><div>Thanks for your suggestion. I also would like to supp=
ort gir in oe-core. However, I need to cleanup the recipes now as you said.=
 I will think about it because of my schedule :(.</div><div><br></div><div>=
I&#39;ll contact you when I&#39;m ready for it.</div><div>Thanks<span></spa=
n><br><br>2015=EB=85=84 10=EC=9B=94 6=EC=9D=BC =ED=99=94=EC=9A=94=EC=9D=BC,=
 Alexander Kanavin&lt;<a href=3D"mailto:alexander.kanavin@linux.intel.com">=
alexander.kanavin@linux.intel.com</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1=ED=95=9C =EB=A9=94=EC=8B=9C=EC=A7=80:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>Hello,<br>
<br>
I&#39;m looking into the possibility of adding gobject introspection suppor=
t directly to oe-core for Yocto 2.1 release (Spring 2016). This work would =
of course be based on meta-gir, but with the mandatory goal of producing pa=
tches of sufficient quality that can be sent upstream.<br>
<br>
I know the upstream tarball is a mess that mashes together several differen=
t things and was never designed for cross-compiling; and meta-gir is also d=
ifficult to understand: autotools-based build files are patched using undoc=
umented patchfiles, then again patched from the recipe using sed, with no c=
omments anywhere - all that needs to be sorted.<br>
<br>
What&#39;s your take on this? Is it realistic? Would you be able to help ou=
t?<br>
<br>
Regards,<br>
Alexander<br>
</blockquote></div>

--001a1137f0bc6dcefd052180c9f4--
