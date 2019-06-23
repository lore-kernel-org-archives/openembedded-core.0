Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 169D47E719
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 00:03:55 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id n11so10840029qtl.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Jun 2019 17:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jeekUPLS6d4w5kAe9lWs3Q6Ylcbw8F0t8LSCr3LHfaI=;
	b=rwhXGl6iJJ8l3bYN/qwIPJDa5wdQ7qtKNnho4itg90MTUeDToIdxjIz7YbEeSKQeXN
	KzNzQFLc1jYKc2Pr25XU+M1aGOOgQa1k5/6RyBVbmJYzq3XTeb2BNI18Z6AM8l2ZSKS5
	yntDhfdMWoxYE0e2cfjfmqe5vAMFHQ1ucAly85tXKJE1Tq7s3QTPL5kuY2KtMOMGr3uq
	OXtx1NMWbjqqYJ0B7jBtdRZaqN+21puY7Yz1is1DOwWFfDETcWVUoo9+nrt75NllXF8r
	vGwQecGi9rZkFafOTlJB1P8m0/QtHQVO0CQFiwFdw7nr2PDABB9k5g1AE8psilyUffuh
	rSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jeekUPLS6d4w5kAe9lWs3Q6Ylcbw8F0t8LSCr3LHfaI=;
	b=Ss0TjCS9YqWx8psd0qvDXjmj9ZXQpm9Lt/O3vslg8bOD3otbCU9q6J44GuH+fHn4tq
	NvXLXc3badMAaTKfekIsttf1aWoJMThRnKmApD7Wou6RyMxBbiu10ZtmplCnFW7B2MVW
	L/6kvOAmzs+IPV50adFghJQLSZLODa79yQMzSMYwM3e9nI07YWbvxE6AQCpIzDm0Rt7T
	pIRGQjb3flfnVmjr3ORRvqnxowfo7AZLR+TkT3ehR39TqEB6VSX0JRkkcfOflwYkGzvx
	eYhnpzMGTpfsth1q3Sy6phbS7zUbxyokxe2mG3hhl8d1V/Yr9ajb7eYwXWqNpe1ROy/R
	ihTw==
X-Gm-Message-State: APjAAAUtFC0wt+eacc2YycQwNdzsXmVuac4bMzF0kb5Rr7lCsDxVPOic
	8XDZHknB27N4arcNLIru46KdygLtADkYF6B67sU=
X-Google-Smtp-Source: APXvYqxVAfzfGnrbFVHnRtC9HEdIRkoXzmorLBvJHJUPSyOm4XtGIXqLY6TviW920RFRVLQ1QYGQO22iRn0TPvExAYg=
X-Received: by 2002:ac8:6b06:: with SMTP id w6mr39892388qts.80.1561248236672; 
	Sat, 22 Jun 2019 17:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1559950879.git.timothy.t.orling@linux.intel.com>
	<0f5adba2f96da9396faa1e70f9eed84118cf735e.1559950879.git.timothy.t.orling@linux.intel.com>
	<CAMKF1sq5aOZ+6CSP+G88+JCYd4zMb6ZSe5MP5KWSSofPRbe4Ow@mail.gmail.com>
	<CANx9H-DLg1_vSEi1bBSSLCmycdyEa2MiJjZ9d=Owsc5bsR-GBA@mail.gmail.com>
	<CAMKF1sr+Ffk0nCd3aVhGfsdRreFX7cpqEAqH8606LMqg=-ijww@mail.gmail.com>
	<20190622085840.GB9472@localhost>
In-Reply-To: <20190622085840.GB9472@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 22 Jun 2019 17:03:45 -0700
Message-ID: <CAMKF1sq7AwbG_pM3sivhvQjaJ_mwR6R-GDEv5J23rpEYjsMT2Q@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] scons.bbclass: use python3-scons
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
X-List-Received-Date: Sun, 23 Jun 2019 00:03:56 -0000
Content-Type: multipart/alternative; boundary="0000000000008d9c34058bf26e7d"

--0000000000008d9c34058bf26e7d
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 22, 2019 at 1:58 AM Adrian Bunk <bunk@stusta.de> wrote:

> On Thu, Jun 20, 2019 at 09:27:15PM -0600, Khem Raj wrote:
> > On Thu, Jun 20, 2019 at 6:18 PM Tim Orling <ticotimo@gmail.com> wrote:
> >...
> > > Latest mongo release appears to be 4.3.0 and appears to support
> python3:
> > >
> > >
> > >
> https://github.com/mongodb/mongo/blob/89e7419a897b2270931c9c029abf6de555d83e0f/SConstruct
> > >
> > > Is this an aceptable upgrade? I am not savvy on which versions are
> > > desirable.
> >
> > Yes for master this upgrade is fine
>
> Are you approving the changed licence for OE,
> or were you not aware that this was the question?
>

What has changed between 4.0.6 and 4.3.0 w.r.t. licensing ?


> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>
>

--0000000000008d9c34058bf26e7d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Jun 22, 2019 at 1:58 AM Adrian Bunk &lt;<a href=3D"=
mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">On Thu, Jun 20, 2019 at 09:27:15PM -0600, Khem Raj wrote:=
<br>
&gt; On Thu, Jun 20, 2019 at 6:18 PM Tim Orling &lt;<a href=3D"mailto:ticot=
imo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;...<br>
&gt; &gt; Latest mongo release appears to be 4.3.0 and appears to support p=
ython3:<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://github.com/mongodb/mongo/blob/89e7419a897b2270=
931c9c029abf6de555d83e0f/SConstruct" rel=3D"noreferrer" target=3D"_blank">h=
ttps://github.com/mongodb/mongo/blob/89e7419a897b2270931c9c029abf6de555d83e=
0f/SConstruct</a><br>
&gt; &gt;<br>
&gt; &gt; Is this an aceptable upgrade? I am not savvy on which versions ar=
e<br>
&gt; &gt; desirable.<br>
&gt;<br>
&gt; Yes for master this upgrade is fine<br>
<br>
Are you approving the changed licence for OE,<br>
or were you not aware that this was the question?<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">What has changed=
 between 4.0.6 and 4.3.0 w.r.t. licensing ?</div><div dir=3D"auto"><br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><br>
cu<br>
Adrian<br>
<br>
-- <br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Is there not promise of rain?&quot; Ling T=
an asked suddenly out<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 of the darkness. There had been need of rain fo=
r many days.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Only a promise,&quot; Lao Er said.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pearl S. =
Buck - Dragon Seed<br>
<br>
</blockquote></div></div>

--0000000000008d9c34058bf26e7d--
