Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id EB55C71AA7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 16:07:43 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id x190so226286460qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 08:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Xw94qFBMa3uzbiYF4mMKbxSbVQtgj7Ggk47S7XsPJpg=;
	b=O/x30jVta5eGDVmyZO8WAXRXErW4DtNnIHvCLR5X824FFB3E4wtWpgmBVCcq5wzCJ2
	JKq2wnG0/Xp1s66SHgblnjEjNGm59O9A0KKP+p8DtaC1Ko6RgEKIjQac1wcRrODUqXmx
	5GlftQBBSg5k+GX1eFY5+QbsFoPHrfxvGaf/wk6lDU4/Ea+RZtzYaJfdvjy1efAj/gRu
	lvnSczWHqGq5r0zwx95IuWSBYMiVM0eoVnUFS3MJiyRtUIQpyuujdTZWfmYm5jqrQkrp
	eioVkk8leFoFu+S6hn9J3Ypfp1H5vmQF42Onvt9E08bjazEwR23mTv3FH4bCyscew1+S
	JWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Xw94qFBMa3uzbiYF4mMKbxSbVQtgj7Ggk47S7XsPJpg=;
	b=BjYB6tUpqf4XSO/rFlY9AMQRCM6wHFsgaU22+O27A4VzdD/u3SF3Yl8xci8zgeBgRR
	qH7PAKmwd12IrBOUr7hPlFoap5pqHivRFzPLf65UBYK5926KMDBcO7TmukmcoQ57yp0c
	LbmZ96CmmBl/vXgt+RdSZkbvbPcbZmFgWHvmej7aSk1DFIuHlH7X/qu3zzAHX/XxEs3q
	PzP0TgIV7nWfhcPsQ5CB/1oIfbV/XbTFL0q6o7kl/OfB37r/p15Id9ZJZO2c/fNQGS00
	TOMzHDfLWdTwq5KTOT8/5fL2MLsSneQar8SZ7j0qSXmi+P8kY8HvOXRyK2OKZMPoB/K0
	DmeA==
X-Gm-Message-State: AKaTC02+7Xcb68rFZ+R5lsuiVZVs9wXbBC/vl4kRvkYEabrTkcRzb9g2htOXb+LRJs22qt2voAA0iRpdwN92GjWN
X-Received: by 10.55.75.17 with SMTP id y17mr4093545qka.26.1479398864454; Thu,
	17 Nov 2016 08:07:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Thu, 17 Nov 2016 08:07:24 -0800 (PST)
In-Reply-To: <1479397835-26630-1-git-send-email-ross.burton@intel.com>
References: <1479397835-26630-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Nov 2016 16:07:24 +0000
Message-ID: <CAJTo0LaAbacSMaEfipu-g8UMdXUdmM3DY=UEbhXeafD6=u6QuQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] classes: add gitupstream class
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
X-List-Received-Date: Thu, 17 Nov 2016 16:07:44 -0000
Content-Type: multipart/alternative; boundary=001a114a88c8cc39cb05418163b9

--001a114a88c8cc39cb05418163b9
Content-Type: text/plain; charset=UTF-8

On 17 November 2016 at 15:50, Ross Burton <ross.burton@intel.com> wrote:

>  BBCLASSEXTEND = "gitupstream"
>  SRC_URI_class-gitupstream = "git://git.example.com/example"
>  SRCREV_class-gitupstream = "abcd1234"
>

This isn't quite right, if you don't want to patch bitbake then use
BBCLASSEXTEND="gitupstream:foo".

I have patches to extend this to native recipes but they're rather ugly so
are not ready yet.

Ross

--001a114a88c8cc39cb05418163b9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 November 2016 at 15:50, Ross Burton <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2jt" class=
=3D"a3s aXjCH m15872fb93addecb4">=C2=A0BBCLASSEXTEND =3D &quot;gitupstream&=
quot;<br>
=C2=A0SRC_URI_class-gitupstream =3D &quot;git://<a href=3D"http://git.examp=
le.com/example" rel=3D"noreferrer" target=3D"_blank">git.example.com/exampl=
e</a><wbr>&quot;<br>
=C2=A0SRCREV_class-gitupstream =3D &quot;abcd1234&quot;</div></blockquote><=
/div><br>This isn&#39;t quite right, if you don&#39;t want to patch bitbake=
 then use BBCLASSEXTEND=3D&quot;gitupstream:foo&quot;.</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">I have patches to extend t=
his to native recipes but they&#39;re rather ugly so are not ready yet.</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--001a114a88c8cc39cb05418163b9--
