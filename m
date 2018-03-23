Return-Path: <twoerner@gmail.com>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id C1EDD788B4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 15:05:15 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id e5-v6so18791948lfb.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 08:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dZxfBnliUVxCthJmKShLHvdA9tZZ4d9PPQIBcubmPVo=;
	b=Sgair7C5TIxcEnO10I+0sA30XgMvBQkXKADOnUtPmWwuqtK8st9JXy5vFhHUEg9QQI
	YNlP61Ax0FUBRzZBac/uiCWV2D2jNGgH1LumEzo9JZ+N8/A6K4kWPh5dUlRw4SlSMvSy
	jlXC8FlAiizSF2nKhiW1Pz8X4GYtM3bIGnBVJPgHty7TNHr/LsLfEsQ9WMojyT7jkBA/
	cJNKoYI2qZEa4ECSSGiw6sIbnZk6Jf2Mb2fOfDG+3yJd4gy6wFazsbEKkEKykt2UWndF
	zw6/YOoLxs/REG+RkAF6jY87dj1OvqlIr8wDILO7768hIr5l7KYpdTG7jUvd2L9FEm3C
	4D5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dZxfBnliUVxCthJmKShLHvdA9tZZ4d9PPQIBcubmPVo=;
	b=W92kzCLroOLD39+JDtrKZTzFDJkmBvIx7V6aFYTB9wFq5JuzgMVgQQCgHxx6Cqx5yi
	GVGakWwr6r5FDa5ga4B2r57XmG/cLxc6xMXgjmP8WRxkBbopHcv5j1sdtx/VhDa6X0NT
	/mSfDLIjpep2CiwSBEUqbpu6PmFbBo85I3ehk/EJpbzJoObdIxXUVBSU6u0xnSLU3wjm
	bSAx29a9N5sWqMn1v00QvhsDuPE1GtYsfWKdN8FbxSUcYuClHfvCs8Z7pEyGXf9rOvy3
	G/cc0lmPbzEu/ukqvJ3LZqx4z7GTcjZxVP3LF/TcbfHM+8p2rFzN7G1FEb8AiqI2FPAE
	r2+A==
X-Gm-Message-State: AElRT7Hc4m2wgKUas0j3Eq/xu9GmQbacL9r+o1hsbSPzyfNp8ETrOAB1
	gIE8wPlmUdgzf3RxY2tCucAfUVC0zXH8l4VCHdg=
X-Google-Smtp-Source: AG47ELtNqajNvo/TuQXqw2sXfowW2KvhGkb7ZEDWm5S5+ID/y+FYBK1kFl6YpZM8jjoJexsDCIvmHUESJgWynahq+po=
X-Received: by 10.46.16.85 with SMTP id j82mr17670353lje.139.1521817516408;
	Fri, 23 Mar 2018 08:05:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:d80f:0:0:0:0:0 with HTTP; Fri, 23 Mar 2018 08:05:15
	-0700 (PDT)
In-Reply-To: <CAJTo0LaAzpHbaqcDSNF3TQ0J+X=07be8YK8DKfLXpWSaGef=AQ@mail.gmail.com>
References: <b720c2022a0a49b08ea3159ef3fdf083@XBOX02.axis.com>
	<CAJTo0LaAzpHbaqcDSNF3TQ0J+X=07be8YK8DKfLXpWSaGef=AQ@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Fri, 23 Mar 2018 11:05:15 -0400
Message-ID: <CAHUNapTbEhnaLHsDUCE6v_pZVvA=c7=rZe4fesRMmbdkDbPZ5g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Oddness regarding file locks in package.bbclass
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
X-List-Received-Date: Fri, 23 Mar 2018 15:05:16 -0000
Content-Type: multipart/alternative; boundary="94eb2c1a5ed07a8a7c056815c06e"

--94eb2c1a5ed07a8a7c056815c06e
Content-Type: text/plain; charset="UTF-8"

This item doesn't appear to have a follow-up.

On Wed, Oct 4, 2017 at 11:10 AM, Burton, Ross <ross.burton@intel.com> wrote:

> On 3 October 2017 at 19:17, Peter Kjellerstedt <
> peter.kjellerstedt@axis.com> wrote:
>
>> > +     # Take shared lock since we're only reading, not writing
>> >       lf = bb.utils.lockfile(bb.data.expand("${PACKAGELOCK}", d))
>>
>> Here, however, it is not changed, even though a comment is added to
>> say that it is. Was this intentional, or just an oversight?
>>
>> > +     # Take shared lock since we're only reading, not writing
>> >       lf = bb.utils.lockfile(bb.data.expand("${PACKAGELOCK}", d))
>>
>> Here again a comment is added, but the code is not changed to match.
>
>
> I'm no expert on this piece of code but that definitely looks like an
> oversight.
>
>
>> Also, what is the ${PACKAGELOCK} lock file actually protecting? With
>>
> the exception of the two questionable cases above, I cannot see that
>> the lock is taken privately anywhere else. And since it looks as the
>> code in package_do_shlibs() and package_do_pkgconfig() is not what
>> needs protection (based on the added comments above), what is?
>>
>
> Good point.  The sstate locks are also shared.
>
> Richard was involved in all of these changes so lets wait for him to
> return from his holiday...
>
> Ross
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--94eb2c1a5ed07a8a7c056815c06e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This item doesn&#39;t appear to have a follow-up.<br></div=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Oct 4, 2=
017 at 11:10 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.=
burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><span class=3D"">On=
 3 October 2017 at 19:17, Peter Kjellerstedt <span dir=3D"ltr">&lt;<a href=
=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kjellersted=
t@axis.com</a>&gt;</span> wrote:<br></span><div class=3D"gmail_extra"><div =
class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-co=
lor:rgb(204,204,204);padding-left:1ex"><span class=3D"">&gt; +=C2=A0 =C2=A0=
 =C2=A0# Take shared lock since we&#39;re only reading, not writing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0lf =3D bb.utils.lockfile(bb.data.expa<wbr>nd=
(&quot;${PACKAGELOCK}&quot;, d))<br>
<br>
Here, however, it is not changed, even though a comment is added to<br>
say that it is. Was this intentional, or just an oversight?<br>
<br></span><span class=3D"">&gt; +=C2=A0 =C2=A0 =C2=A0# Take shared lock si=
nce we&#39;re only reading, not writing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0lf =3D bb.utils.lockfile(bb.data.expa<wbr>nd=
(&quot;${PACKAGELOCK}&quot;, d))<br>
<br>
Here again a comment is added, but the code is not changed to match.</span>=
</blockquote><div><br></div><div>I&#39;m no expert on this piece of code bu=
t that definitely looks like an oversight.</div><span class=3D""><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204,2=
04,204);padding-left:1ex">Also, what is the ${PACKAGELOCK} lock file actual=
ly protecting? With<br></blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex">
the exception of the two questionable cases above, I cannot see that<br>
the lock is taken privately anywhere else. And since it looks as the<br>
code in package_do_shlibs() and package_do_pkgconfig() is not what<br>
needs protection (based on the added comments above), what is?<br></blockqu=
ote><div><br></div></span><div>Good point.=C2=A0 The sstate locks are also =
shared.</div><div><br></div><div>Richard was involved in all of these chang=
es so lets wait for him to return from his holiday...</div><span class=3D"H=
OEnZb"><font color=3D"#888888"><div><br></div><div>Ross</div><div>=C2=A0</d=
iv></font></span></div></div></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--94eb2c1a5ed07a8a7c056815c06e--
