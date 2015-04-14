Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2709A6ABF7
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 23:39:19 +0000 (UTC)
Received: by wizk4 with SMTP id k4so133528797wiz.1
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 16:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=9l4kjfAAx9NJ/RZeDd4s6QdQ5M6pAqJQUt7h2lhzdc8=;
	b=ny29O9qUsoZBIlqEWqAC/iqcMMNs80rahaa0f5/E6GyrOxM6EsWyPqjiGHDAt/do/M
	xOSH3U/wSgWKEYumU9fuT2l5au1WuiqeJbTHIVjXnwBECQ3MEdB8b1o6DPGBRIW7Vh4e
	n5hseTGheaYhbJcCcaM2WVLh+/RB28ksF1mV//jNftr0gZKChzCJ9mO0f34k1LGM9GFD
	NQ6QnAO/de2w2isMEY/IZqWNsw3ahR8hif+2KFTAVEmMgCw9tdLPZJjR/Io73kUgh7jb
	Pd6DQ+xziyt3C2jeBF8LpnUlP1nJqA9IqkOjqYYAE3+92wPzaLp08htrOM2qmGcYEe5L
	iiMw==
MIME-Version: 1.0
X-Received: by 10.194.80.40 with SMTP id o8mr42903733wjx.34.1429054760432;
	Tue, 14 Apr 2015 16:39:20 -0700 (PDT)
Received: by 10.28.157.17 with HTTP; Tue, 14 Apr 2015 16:39:20 -0700 (PDT)
In-Reply-To: <CAJ86T=Uw=yOfYCmEcx5Ro5of7jKksjxq6WSBOaxPOjMHFp8LoA@mail.gmail.com>
References: <CAJ86T=Uw=yOfYCmEcx5Ro5of7jKksjxq6WSBOaxPOjMHFp8LoA@mail.gmail.com>
Date: Wed, 15 Apr 2015 01:39:20 +0200
Message-ID: <CA+chaQfLz-OgjHwce6yoeCQXgMwKEJnuo3ZBThSS=yK7hAXc5Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <Openembedded-core@lists.openembedded.org>
Subject: Re: autom4te segfault in Dumper.so when configuring intltool
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
X-List-Received-Date: Tue, 14 Apr 2015 23:39:20 -0000
Content-Type: multipart/alternative; boundary=047d7bb04d0e5c3a950513b7bdd1

--047d7bb04d0e5c3a950513b7bdd1
Content-Type: text/plain; charset=UTF-8

Yes, I see it very often since this patch almost 3 years ago:
http://lists.openembedded.org/pipermail/openembedded-core/2012-August/066282.html

On Tue, Apr 14, 2015 at 11:34 PM, Andre McCurdy <armccurdy@gmail.com> wrote:

> I'm seeing messages such as the following appear in syslog when
> building intltool or intltool-native from fido:
>
>   [1049484.121948] autom4te[16180]: segfault at 1 ip 00007fea41a7e7fe
> sp 00007fff3c666080 error 4 in Dumper.so[7fea41a77000+8000]
>   [1049567.199028] autom4te[17012]: segfault at 1 ip 00007f34acc007fe
> sp 00007fff5ed84db0 error 4 in Dumper.so[7f34acbf9000+8000]
>
> The segfault happens reproducibly when configuring intltool or
> intltool-native (one segfault every time I run or re-run the
> run.do_configure script).
>
> There are no obvious errors in config.log and the intltool build
> succeeds over-all.
>
> If I hack the intltool run.do_configure script so that the host
> machine's perl (v5.18.2) is found instead of perl-native from sysroot
> then the segfaults stop.
>
> Is anyone else seeing the same issue?
>
> Andre
> --
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--047d7bb04d0e5c3a950513b7bdd1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, I see it very often since this patch almost 3 years a=
go:<div><a href=3D"http://lists.openembedded.org/pipermail/openembedded-cor=
e/2012-August/066282.html">http://lists.openembedded.org/pipermail/openembe=
dded-core/2012-August/066282.html</a><br></div></div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On Tue, Apr 14, 2015 at 11:34 PM, Andre=
 McCurdy <span dir=3D"ltr">&lt;<a href=3D"mailto:armccurdy@gmail.com" targe=
t=3D"_blank">armccurdy@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">I&#39;m seeing messages such as the following appear in syslo=
g when<br>
building intltool or intltool-native from fido:<br>
<br>
=C2=A0 [1049484.121948] autom4te[16180]: segfault at 1 ip 00007fea41a7e7fe<=
br>
sp 00007fff3c666080 error 4 in Dumper.so[7fea41a77000+8000]<br>
=C2=A0 [1049567.199028] autom4te[17012]: segfault at 1 ip 00007f34acc007fe<=
br>
sp 00007fff5ed84db0 error 4 in Dumper.so[7f34acbf9000+8000]<br>
<br>
The segfault happens reproducibly when configuring intltool or<br>
intltool-native (one segfault every time I run or re-run the<br>
run.do_configure script).<br>
<br>
There are no obvious errors in config.log and the intltool build<br>
succeeds over-all.<br>
<br>
If I hack the intltool run.do_configure script so that the host<br>
machine&#39;s perl (v5.18.2) is found instead of perl-native from sysroot<b=
r>
then the segfaults stop.<br>
<br>
Is anyone else seeing the same issue?<br>
<br>
Andre<br>
--<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div><br></div>

--047d7bb04d0e5c3a950513b7bdd1--
