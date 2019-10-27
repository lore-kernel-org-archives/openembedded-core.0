Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id B34D87CFE9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 19:26:27 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id o3so11485212qtj.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 12:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Jm5zy0yg8W8NlNaN+TYwWYbGcArUNgeaodZL5IQqB+Y=;
	b=OOurU84dCR9lJXd4zCATkUgX2NEpHRJBA3a7N4Y8Bgx96mkx+sipdqHa6oH+1OW2qE
	jJAD6fT/FfMvLENd25JkBNhheK8Zrj/T2SIR2SkTmWYCpWzXrlNg80A6J6/CSoS8NyuJ
	PT3/kMEeq8a2taXhK8BpfSmm8cuBOirNi5FSXaZCcl898/gudDc+DaXX1GMqmBH1Dt9O
	C0cL4TC+qfIPyx6tQIU7nyCD8OdqdcB4pswfZwIViBCV6zoFo7oikl8jPLZAQ7XtU6cL
	kruqeHJ2kVbGELRTXirqPvg9Q3AWbvAdaJlFx8fcRI233nFFfh5XHq3yLtRtGvOORg6Z
	jOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Jm5zy0yg8W8NlNaN+TYwWYbGcArUNgeaodZL5IQqB+Y=;
	b=DM86LEc21XvXatzCFZ8tI06DUjGD7lsVlnB5YyQDv+1qGG6tbykvuSHDWCyFf1tixW
	5MW9YZVHSCvOPvlwP7wQ5C3fjDSJD9dE5nH2oiNdi7tvx3AmPnN489zF+gWK2v8hBTal
	hUmyBWI28v2dxizguCO7JBQ2Th7hPwnaWyScy+KJFtJ2P935JAwa7Cw90Cjo8OEfO29A
	ZYSQ5FH9VkT5Ra4XbdIKyQWLEobJTTpwBGDaqO+Qt9uY9NQJieW7vSa4SePI8znskW+I
	s2vBbUmqOoi2vFIUmG1ekRdlvgVv0+42m3SrsadlfpaKfhAozzf4/tW89sbzN4g5y0JA
	13Tw==
X-Gm-Message-State: APjAAAVlRtIm/0CjbDs3BpmRW6xO1Vll7sOSNVxeV3kTQUe2tRlzxs3Z
	wUIQVwIS21q0vmCV4M24oXM03FbymYJcG7uPEw0=
X-Google-Smtp-Source: APXvYqwXHONDh78tuhAn0HQppskJL7ZRiZaxJqeVNN1dTfbs9sL8/YeL1yGlOQ3LsfOz1b8dOWKKAMWTNi1IEV9k9pQ=
X-Received: by 2002:ac8:6054:: with SMTP id k20mr3651675qtm.88.1572204388155; 
	Sun, 27 Oct 2019 12:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <a5bb0fd6ed961516f649139e41cbdddf42ce17e2.camel@linuxfoundation.org>
	<52271207-9556-e9cb-667b-0b2d9916a0d1@gmail.com>
	<2bf2e46efd847d3771fa62f0cfe9cc508f0b4c2d.camel@linuxfoundation.org>
In-Reply-To: <2bf2e46efd847d3771fa62f0cfe9cc508f0b4c2d.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Oct 2019 20:26:17 +0100
Message-ID: <CAMKF1sr1VP2buKXC0p4WgZvmY8+6Ok9u6QOCo8hhKoYHArV6LA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: qemu rebuild contamination
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
X-List-Received-Date: Sun, 27 Oct 2019 19:26:27 -0000
Content-Type: multipart/alternative; boundary="0000000000001203dd0595e95cad"

--0000000000001203dd0595e95cad
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 27, 2019 at 7:19 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sun, 2019-10-27 at 07:56 -0700, akuster808 wrote:
> >
> > On 10/27/19 2:57 AM, Richard Purdie wrote:
> > > I've been trying to figure out why we get a weird build failure
> > > with
> > > hash equivalence enabled. Armin has also been searching for an odd
> > > issue with warrior and the qemu tests. I may have a lead.
> > >
> > > If you build a standard qemu:
> > >
> > > "bitbake qemu-system-native"
> > >
> > > and save off the resulting qemu-system-XXX binaries, then add:
> > >
> > > PACKAGECONFIG_append_pn-qemu-system-native = " gtk+"
> > > PACKAGECONFIG_append_pn-qemu-system-native = " virglrenderer"
> > > PACKAGECONFIG_append_pn-qemu-system-native = " glx"
> > >
> > > to local.conf, then:
> > >
> > > "bitbake qemu-system-native"
> > >
> > > it rebuilds as expected, save off the qemu-system-XXX binaries,
> > >
> > > then remove the local.conf entries and:
> > >
> > > "bitbake qemu-system-native -c configure -f"
> > > "bitbake qemu-system-native"
> > >
> > > then save off the resulting qemu-system-XXX binaries, you'll find
> > > that
> > > whilst these first and last sets should match, they don't. Its
> > > obvious
> > > with "ldd qemu-system-x86_64" that the linked libraries persist
> > > from
> > > the second to third set when they should not.
> > >
> > > The reason is that when configuration changes, autotools.bbclass
> > > will
> > > wipe out ${B} however qemu doesn't use the autotools class and
> > > hence B
> > > is not cleaned for changes in configuration.
> > >
> > > We could abstract the pieces of autotools.bbclass which do this
> > > into a
> > > separate class, or, easier, have qemu's do_configure wipe ${B}.
> > >
> > > Armin: This may be the issue you're searching for with warrior?
> > You mean the virgl failure? I did set the native packconfig to make
> > the
> > selftest and that had no affect. In facted, Zeus has the same
> > mismatch.
> > Alex's patches I believe align them to match.
> >
> > The virgl failure is fixed using an updated version of libdrm. I
> > thought I sent an email about that.
>
> I'm travelling so a little out of sync, I see the email now. I think I
> managed to hit the rebuild issue when I tried to debug it which is why
> it seemed related to me.
>
> For the libdrm issue in warrior, we could:
>
> a) Break policy and upgrade libdrm
> b) Just upgrade libdrm-native and nativesdk
> c) Mark f30 as broken in warrior for qemugl and not expected to work.
>
> Any thougts?


I support c ad well but I think there is some hope to identify a fix that
can be backported

>
>
> I'm tempted by c).
>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000001203dd0595e95cad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Oct 27, 2019 at 7:19 PM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Sun, 2019-=
10-27 at 07:56 -0700, akuster808 wrote:<br>
&gt; <br>
&gt; On 10/27/19 2:57 AM, Richard Purdie wrote:<br>
&gt; &gt; I&#39;ve been trying to figure out why we get a weird build failu=
re<br>
&gt; &gt; with<br>
&gt; &gt; hash equivalence enabled. Armin has also been searching for an od=
d<br>
&gt; &gt; issue with warrior and the qemu tests. I may have a lead.<br>
&gt; &gt; <br>
&gt; &gt; If you build a standard qemu:<br>
&gt; &gt; <br>
&gt; &gt; &quot;bitbake qemu-system-native&quot;<br>
&gt; &gt; <br>
&gt; &gt; and save off the resulting qemu-system-XXX binaries, then add:<br=
>
&gt; &gt; <br>
&gt; &gt; PACKAGECONFIG_append_pn-qemu-system-native =3D &quot; gtk+&quot;<=
br>
&gt; &gt; PACKAGECONFIG_append_pn-qemu-system-native =3D &quot; virglrender=
er&quot;<br>
&gt; &gt; PACKAGECONFIG_append_pn-qemu-system-native =3D &quot; glx&quot;<b=
r>
&gt; &gt; <br>
&gt; &gt; to local.conf, then:<br>
&gt; &gt; <br>
&gt; &gt; &quot;bitbake qemu-system-native&quot;<br>
&gt; &gt; <br>
&gt; &gt; it rebuilds as expected, save off the qemu-system-XXX binaries,<b=
r>
&gt; &gt; <br>
&gt; &gt; then remove the local.conf entries and:<br>
&gt; &gt; <br>
&gt; &gt; &quot;bitbake qemu-system-native -c configure -f&quot;<br>
&gt; &gt; &quot;bitbake qemu-system-native&quot;<br>
&gt; &gt; <br>
&gt; &gt; then save off the resulting qemu-system-XXX binaries, you&#39;ll =
find<br>
&gt; &gt; that<br>
&gt; &gt; whilst these first and last sets should match, they don&#39;t. It=
s<br>
&gt; &gt; obvious<br>
&gt; &gt; with &quot;ldd qemu-system-x86_64&quot; that the linked libraries=
 persist<br>
&gt; &gt; from<br>
&gt; &gt; the second to third set when they should not.<br>
&gt; &gt; <br>
&gt; &gt; The reason is that when configuration changes, autotools.bbclass<=
br>
&gt; &gt; will<br>
&gt; &gt; wipe out ${B} however qemu doesn&#39;t use the autotools class an=
d<br>
&gt; &gt; hence B<br>
&gt; &gt; is not cleaned for changes in configuration.<br>
&gt; &gt; <br>
&gt; &gt; We could abstract the pieces of autotools.bbclass which do this<b=
r>
&gt; &gt; into a<br>
&gt; &gt; separate class, or, easier, have qemu&#39;s do_configure wipe ${B=
}.<br>
&gt; &gt; <br>
&gt; &gt; Armin: This may be the issue you&#39;re searching for with warrio=
r?<br>
&gt; You mean the virgl failure? I did set the native packconfig to make<br=
>
&gt; the<br>
&gt; selftest and that had no affect. In facted, Zeus has the same<br>
&gt; mismatch.<br>
&gt; Alex&#39;s patches I believe align them to match.<br>
&gt; <br>
&gt; The virgl failure is fixed using an updated version of libdrm. I<br>
&gt; thought I sent an email about that.<br>
<br>
I&#39;m travelling so a little out of sync, I see the email now. I think I<=
br>
managed to hit the rebuild issue when I tried to debug it which is why<br>
it seemed related to me.<br>
<br>
For the libdrm issue in warrior, we could:<br>
<br>
a) Break policy and upgrade libdrm<br>
b) Just upgrade libdrm-native and nativesdk<br>
c) Mark f30 as broken in warrior for qemugl and not expected to work.<br>
<br>
Any thougts?</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">I su=
pport c ad well but I think there is some hope to identify a fix that can b=
e backported=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
<br>
I&#39;m tempted by c).<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000001203dd0595e95cad--
