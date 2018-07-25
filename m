Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id A5C1777DC9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 16:34:51 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id h4-v6so8242029qtj.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 09:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3c8d554U54VxXixqDP4pVeeHPOcyw8dZBmqQqYM/GIw=;
	b=TxqMUzt1qryan75zT1Xgw6YN3kL+c1+8URGw1twNPcxCq4+iE30dqC3IzjCDhi9M1t
	qmExrHfPCxnvNDJ3O/pvySqX/b7+7yJR4fgf6pOnybsE/Jmwp7sWKVFLR6jv05b0GQwk
	ywLl3cPyIsnpekHCntLLsjRs5oWHswR1lfLgkQHHn+3vi2IHkCHuXvshqaGih71SFEC1
	tV+eESSvZhOQZpAd8FIkPu1t5sCC1f4qgmWvJaEPT4LCXCwiJZIb8iJMuQ+BzkPqik3M
	rdwZ83h1DdxZvtzlx67cSY3BtwIGdYMAyaMgqQHnxHy2w020iQwbYHZZgWeYcrI8MT0U
	lw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3c8d554U54VxXixqDP4pVeeHPOcyw8dZBmqQqYM/GIw=;
	b=JOhjP5/6SeoWr/RynI/MhEWZTI6HelygnOLTz6bun7YMVjB1lpNFQN606OJyh3IGZ5
	P/D414waKkaZ6c/1y4wKMlKsnP0zdpoIE1YQ0GlXnvQn4jzBgPofIxm4iWg/kLxWx5j8
	KGdHs674VDMfDLEchJggv2SL4ASwWcwdD07KQr7sEJtrNaB9fNgzLdvaEs6xuC5W6R5J
	ImyQ2CrpJ6iqkcsbSx688cPYyTBjj5gOd1Fcfblrd80Hni6y65ppwVQZ/RW/Cjc3QooY
	dKLd9v2RFNtI8GujbxRA0W8HIViN0uEfegCI9tdTDTLSO2HrXoyMw8H4U6mIMdz29308
	LaaQ==
X-Gm-Message-State: AOUpUlEvdTW8utB38fpN/WnrOG06wFz2WsTzPO1+Dnc0L+Qs1dYYntZx
	Q1HGQMBoDBDkr4HCkyvyZ87gyt0qzUZLT31H0V0=
X-Google-Smtp-Source: AAOMgpfUusxDOG04hJZXuCUaclzKqs5OBJptCMWDBpJ1KaW2X+x1vrdZD0rI2TjrlMGRkYQMeZs5B+NBDtuVGr/kj+E=
X-Received: by 2002:ac8:3209:: with SMTP id
	x9-v6mr21963405qta.128.1532536492212; 
	Wed, 25 Jul 2018 09:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAFeBWL4WvT2CJkd25BVwje6_KvKZ5wquM6+YyPeHzywdMTT_iA@mail.gmail.com>
	<CAJ86T=W-DOtSSpBb_tK_XuiPJAxteirR8xeCvWz5q9Hv3Q3-xg@mail.gmail.com>
In-Reply-To: <CAJ86T=W-DOtSSpBb_tK_XuiPJAxteirR8xeCvWz5q9Hv3Q3-xg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Jul 2018 09:34:41 -0700
Message-ID: <CAMKF1sqORifnSdwyUiQdGpEA1k1xxokSSAi17Z1z2OgSwe7c+g@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Setting include path in a recipe
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
X-List-Received-Date: Wed, 25 Jul 2018 16:34:51 -0000
Content-Type: multipart/alternative; boundary="0000000000003948b50571d57552"

--0000000000003948b50571d57552
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 24, 2018 at 10:51 AM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Tue, Jul 24, 2018 at 6:52 AM, Adam Lee <adam.yh.lee@gmail.com> wrote:
> >
> > How do I defined a custom include path for an autotools recipe?
> >
> > This may as well be explained somewhere in the reference manual, but I
> can't
> > seem to find it.
>
> Assuming you want to add a custom directory which is within sysroot:
>
> CPPFLAGS += "-I=/usr/include/specialheaders"
> --


-I= is gcc specific using STAGING_INCDIR would be portable

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000003948b50571d57552
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Tue,=
 Jul 24, 2018 at 10:51 AM Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gma=
il.com">armccurdy@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">On Tue, Jul 24, 2018 at 6:52 AM, Adam Lee &lt;<a href=3D"mailto:ada=
m.yh.lee@gmail.com" target=3D"_blank">adam.yh.lee@gmail.com</a>&gt; wrote:<=
br>
&gt;<br>
&gt; How do I defined a custom include path for an autotools recipe?<br>
&gt;<br>
&gt; This may as well be explained somewhere in the reference manual, but I=
 can&#39;t<br>
&gt; seem to find it.<br>
<br>
Assuming you want to add a custom directory which is within sysroot:<br>
<br>
CPPFLAGS +=3D &quot;-I=3D/usr/include/specialheaders&quot;<br>
-- </blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">-I=3D is gcc =
specific using STAGING_INCDIR would be portable=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000003948b50571d57552--
