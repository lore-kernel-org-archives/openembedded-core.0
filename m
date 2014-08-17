Return-Path: <atul.singh008@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8F4CB60CFC;
	Sun, 17 Aug 2014 12:36:03 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id l13so5512878iga.13
	for <multiple recipients>; Sun, 17 Aug 2014 05:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=B+mg7oLxfR95f6eySgkAGdJbqP/pVb4fri4U27R4CHQ=;
	b=R9aI5jHgulFcPgSUmrXcc6NI3KnTH6c9HKxrJlDEmnrNHqXWrJzrrM8p/iCrjBC3ZE
	Ogzolh9m7CcJFAt9bmvQEy4E6ULGBqjGLECL6gLmSopqsViBTuATQQiZ64EWnCrUqKhK
	72EtMQmbGkEn3STIHY2DGunRfB8EleriGrBy8UbpjQXL0knMjosgJVKtOsiGSMVrQgQr
	o/qg/hg+Nlpx5F9nlcUyPzffn0Mk/NzuRxHMmWt076oyDaHUKaipy/JlbS1cPFxkfA3t
	kEQtthSMaKHoc2qtN3RejeQpulXBbaJ4j/Mjydn4JmWhY7co51D4oLnMCtUfHsn4UeWw
	hgeg==
MIME-Version: 1.0
X-Received: by 10.50.21.2 with SMTP id r2mr35712126ige.24.1408278964215; Sun,
	17 Aug 2014 05:36:04 -0700 (PDT)
Received: by 10.64.232.36 with HTTP; Sun, 17 Aug 2014 05:36:03 -0700 (PDT)
Received: by 10.64.232.36 with HTTP; Sun, 17 Aug 2014 05:36:03 -0700 (PDT)
In-Reply-To: <CAMKF1sp9Z6vj1Dz96_WYiHOtYFqa-zECrNHOFgb=dBUDJN2Z_g@mail.gmail.com>
References: <CAMKF1sp9Z6vj1Dz96_WYiHOtYFqa-zECrNHOFgb=dBUDJN2Z_g@mail.gmail.com>
Date: Sun, 17 Aug 2014 18:06:03 +0530
Message-ID: <CAH21_vEqEJT9SrP7AR3Z7_Wh_XDBjXQF2zQdYbCEKBb53ONhHA@mail.gmail.com>
From: atulkumar singh <atul.singh008@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>, musl@lists.openwall.com,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Announcing meta-musl OE/Yocto layer supporting musl C library
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
X-List-Received-Date: Sun, 17 Aug 2014 12:36:10 -0000
Content-Type: multipart/alternative; boundary=047d7b6dbc1c68263d0500d27fb7

--047d7b6dbc1c68263d0500d27fb7
Content-Type: text/plain; charset=UTF-8

Hi Khem,

It's really something new to test.
And as it's mention that will support only for core-image-minimal, so when
can i expect it to support for meta-toolchain.
As of now i will test it for core-image-minimal but i need it for
meta-toolchain as well.
So please update me regarding the same and in the meanwhile will test and
update for core-image-minimal in case found any issue.
I am really excited to test the same.

Thanks and regards,
Atul
On 17 Aug 2014 06:22, "Khem Raj" <raj.khem@gmail.com> wrote:

> Hello All
>
> musl <http://www.musl-libc.org/> is a newer implementation licensed
> under MIT licence
> A layer to support musl to supply your system C library as an
> alternative to uclibc and eglibc/glibc  is now available at
>
> https://github.com/kraj/meta-musl
>
> README describes way to get going with it.
>
> Few things to note
>
> * Supports gcc 4.9 in OE not 4.8
> * Current musl recipe is 1.1.4 based
> * You need latest master of OE-Core
> (106305227003761c3fc562c21bb859a5256f2b36) or          newer and
> bitbake
> * Its only able to build core-image-minimal
> * core-image-minimal boots on qemuarm, qemuppc, qemumips, qemux86,
> qemux86-64
>
> I will send a request to add it to layerindex soon and then you should
> be able to find it using
> layerindex.opernembedded.org as well
>
> If you try it out on your hardware and/or have feedback I am
> interested. Fork it from github, file bugs
> send patches ....
>
> Happy hacking
>
> -Khem
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7b6dbc1c68263d0500d27fb7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p>Hi Khem,</p>
<p>It&#39;s really something new to test.<br>
And as it&#39;s mention that will support only for core-image-minimal, so w=
hen can i expect it to support for meta-toolchain.<br>
As of now i will test it for core-image-minimal but i need it for meta-tool=
chain as well.<br>
So please update me regarding the same and in the meanwhile will test and u=
pdate for core-image-minimal in case found any issue.<br>
I am really excited to test the same.<br></p>
<p>Thanks and regards,<br>
Atul</p>
<div class=3D"gmail_quote">On 17 Aug 2014 06:22, &quot;Khem Raj&quot; &lt;<=
a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br t=
ype=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Hello All<br>
<br>
musl &lt;<a href=3D"http://www.musl-libc.org/" target=3D"_blank">http://www=
.musl-libc.org/</a>&gt; is a newer implementation licensed<br>
under MIT licence<br>
A layer to support musl to supply your system C library as an<br>
alternative to uclibc and eglibc/glibc=C2=A0 is now available at<br>
<br>
<a href=3D"https://github.com/kraj/meta-musl" target=3D"_blank">https://git=
hub.com/kraj/meta-musl</a><br>
<br>
README describes way to get going with it.<br>
<br>
Few things to note<br>
<br>
* Supports gcc 4.9 in OE not 4.8<br>
* Current musl recipe is 1.1.4 based<br>
* You need latest master of OE-Core<br>
(106305227003761c3fc562c21bb859a5256f2b36) or=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 newer and<br>
bitbake<br>
* Its only able to build core-image-minimal<br>
* core-image-minimal boots on qemuarm, qemuppc, qemumips, qemux86, qemux86-=
64<br>
<br>
I will send a request to add it to layerindex soon and then you should<br>
be able to find it using<br>
<a href=3D"http://layerindex.opernembedded.org" target=3D"_blank">layerinde=
x.opernembedded.org</a> as well<br>
<br>
If you try it out on your hardware and/or have feedback I am<br>
interested. Fork it from github, file bugs<br>
send patches ....<br>
<br>
Happy hacking<br>
<br>
-Khem<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</blockquote></div>

--047d7b6dbc1c68263d0500d27fb7--
