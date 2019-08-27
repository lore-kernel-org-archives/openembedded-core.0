Return-Path: <wesley.lindauer@gmail.com>
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com
	[209.85.221.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8566A6B436
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 17:34:24 +0000 (UTC)
Received: by mail-vk1-f181.google.com with SMTP id w20so5049vkd.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 10:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qeUDzqlFiwQgkWZl3fl3Fop5cE3eBBgcaOZvpDxQwJk=;
	b=mUX63PP3jozT148gCuWLJacyZeApSV0ZqdfkEMBGrKXOfRKVoeki0KUTrZN03mqoT/
	IOQZCuZX1PN9EppKzMi8le22Zir/lswty0fWPaNXLufMJPTGJd6aOm2C26KlsQlDsWVX
	raGh1g70fUqYC9T+uaVb1uoj2EqaqZ3XfaG68+LeLO1r8b+MDfk9g1oA0gnhkfCutcew
	5M+74nnx15WReiE4v9dJWXYSFZVgUoaCAw4sTiZ4PdD0euoeSEAORzft9p9rQpjnXZzC
	F2saPv4MERZOEObxtgiiAgft2jRn6iKReaDk3PnoHxn7wZ5/roqW/7QQpZucsybh4kfl
	AzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qeUDzqlFiwQgkWZl3fl3Fop5cE3eBBgcaOZvpDxQwJk=;
	b=lWE1iTjYgakJY/kKfU+QRxjfuTakWQ3wU4hWBWcXbVK4K7zOakij6d46ddEPibPYGS
	ixss27smsM9cwfqujrQ4qUtVg/4NsG04pgmEWW0V0bAzUkiDUopsU89iPBA8tKbKitIs
	hye66MvinKaWsW0KgUD39hbEoxLn/0I2hcV52OpIUdzrFoTCp+kLBHmfs/a1TyoXfjb0
	ppHvtLosrkVYyXpsUL23tXf2NJNrDiI4GyapZmwwuGuAjkM3g1UBJk+/b+lReSfM+YvA
	/HMXGJ2sCWMY/GzaKJnXTgOlnoiFsdzrOHeJwjyp9hCFPM3KTutq07jJ/rW80qydqfxS
	WUuA==
X-Gm-Message-State: APjAAAWudE9Hi+LxSmYbKEdulrB6LhC7HtwBKtaen3KxuXcgcakOiqrH
	6XfPgah/mwgSEXLiJ20OB6jdlxFltoYS9Esmndc=
X-Google-Smtp-Source: APXvYqyvqjuAONmQJsPUCwH0g7208LMbeoROqKv036v29YhtfrFluL8Xojv1tCopAh5a+IT7dyKFLvLHT7mQcEmneeM=
X-Received: by 2002:a1f:7383:: with SMTP id o125mr45844vkc.18.1566927265450;
	Tue, 27 Aug 2019 10:34:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190816194405.12751-1-wesley.lindauer@gmail.com>
	<20190816194405.12751-6-wesley.lindauer@gmail.com>
	<CAMKF1sruqPBcwobNNErkdHKAnP7zT8zda81O2FUP88u=5ZnmVg@mail.gmail.com>
In-Reply-To: <CAMKF1sruqPBcwobNNErkdHKAnP7zT8zda81O2FUP88u=5ZnmVg@mail.gmail.com>
From: Wes Lindauer <wesley.lindauer@gmail.com>
Date: Tue, 27 Aug 2019 13:34:14 -0400
Message-ID: <CALBQxSuz79WGNBgLET5X8-Wf02HjAiwx1HbaGmbUzKL1qv0Ymg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] xz: Remove GPLv3 license checksum
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
X-List-Received-Date: Tue, 27 Aug 2019 17:34:25 -0000
Content-Type: multipart/alternative; boundary="0000000000000bcda705911cafdd"

--0000000000000bcda705911cafdd
Content-Type: text/plain; charset="UTF-8"

Yes, I see that could be a valid concern. Is this a sign that poky needs
per-package LIC_FILES_CHKSUM variables the same way each package can set
different LICENSE values? I would like to continue to use Yocto to collect
licenses for compliance reasons, but in this case I am getting an incorrect
license file in my image. In my configuration, I am placing "GPLv3" in
INCOMPATIBLE_LICENSES. Is there any way to use this information at rootfs
time to exclude GPLv3 licenses from being collected? Do you have any
recommendations for how I should proceed with collecting accurate licenses
in my image?

Thanks for your help,
Wes L

On Fri, Aug 16, 2019 at 4:50 PM Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Aug 16, 2019 at 12:46 PM Wes Lindauer <wesley.lindauer@gmail.com>
> wrote:
> >
> > Although xz has some files that are GPLv3 licensed, none of them get
> > packaged up, and therefore none of it ends up in the final rootfs. Since
> > there is no GPLv3 code in the final image, we don't want to include it
> > when we collect licenses, as that would give the incorrect impression
> > that the image contains GPLv3 code.
>
> We will be distributing this in src packages though. Maybe these files
> should be deleted before the build even starts.
> >
> > Also fixes the endline for getopt.c which had a couple of non-license
> > text lines at the bottom.
> > ---
> >  meta/recipes-extended/xz/xz_5.2.4.bb | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-extended/xz/xz_5.2.4.bb
> b/meta/recipes-extended/xz/xz_5.2.4.bb
> > index 791746e1cf..e6725e5f12 100644
> > --- a/meta/recipes-extended/xz/xz_5.2.4.bb
> > +++ b/meta/recipes-extended/xz/xz_5.2.4.bb
> > @@ -17,9 +17,8 @@ LICENSE_liblzma = "PD"
> >
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=97d554a32881fee0aa283d96e47cb24a
> \
> >
> file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> > -
> file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
> >
> file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
> > -
> file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 \
> > +
> file://lib/getopt.c;endline=21;md5=32575ca1a42c5fa04aac6f08566ddf48 \
> >                      "
> >
> >  SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
> > --
> > 2.14.5
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000000bcda705911cafdd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes, I see that could be a valid concern. Is this a s=
ign that poky needs per-package LIC_FILES_CHKSUM variables the same way eac=
h package can set different LICENSE values? I would like to continue to use=
 Yocto to collect licenses for compliance reasons, but in this case I am ge=
tting an incorrect license file in my image. In my configuration, I am plac=
ing &quot;GPLv3&quot; in INCOMPATIBLE_LICENSES. Is there any way to use thi=
s information at rootfs time to exclude GPLv3 licenses from being collected=
? Do you have any recommendations for how I should proceed with collecting =
accurate licenses in my image?</div><div><br></div><div>Thanks for your hel=
p,</div><div>Wes L<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Aug 16, 2019 at 4:50 PM Khem Raj &lt;=
<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, Aug 16, 201=
9 at 12:46 PM Wes Lindauer &lt;<a href=3D"mailto:wesley.lindauer@gmail.com"=
 target=3D"_blank">wesley.lindauer@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Although xz has some files that are GPLv3 licensed, none of them get<b=
r>
&gt; packaged up, and therefore none of it ends up in the final rootfs. Sin=
ce<br>
&gt; there is no GPLv3 code in the final image, we don&#39;t want to includ=
e it<br>
&gt; when we collect licenses, as that would give the incorrect impression<=
br>
&gt; that the image contains GPLv3 code.<br>
<br>
We will be distributing this in src packages though. Maybe these files<br>
should be deleted before the build even starts.<br>
&gt;<br>
&gt; Also fixes the endline for getopt.c which had a couple of non-license<=
br>
&gt; text lines at the bottom.<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-extended/xz/<a href=3D"http://xz_5.2.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">xz_5.2.4.bb</a> | 3 +--<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-extended/xz/<a href=3D"http://xz_5.2.4.bb" r=
el=3D"noreferrer" target=3D"_blank">xz_5.2.4.bb</a> b/meta/recipes-extended=
/xz/<a href=3D"http://xz_5.2.4.bb" rel=3D"noreferrer" target=3D"_blank">xz_=
5.2.4.bb</a><br>
&gt; index 791746e1cf..e6725e5f12 100644<br>
&gt; --- a/meta/recipes-extended/xz/<a href=3D"http://xz_5.2.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">xz_5.2.4.bb</a><br>
&gt; +++ b/meta/recipes-extended/xz/<a href=3D"http://xz_5.2.4.bb" rel=3D"n=
oreferrer" target=3D"_blank">xz_5.2.4.bb</a><br>
&gt; @@ -17,9 +17,8 @@ LICENSE_liblzma =3D &quot;PD&quot;<br>
&gt;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D97d554a32881fee0=
aa283d96e47cb24a \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://COPYING.GPLv3;md5=3Dd32239bcb673463ab874e80d47fae504 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 file://COPYING.LGPLv2.1;md5=3D4fbd65380cdd255951079008b364516c \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://lib/getopt.c;endline=3D23;md5=3D2069b0ee710572c03bb3114e4532cd84 \<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 file://lib/getopt.c;endline=3D21;md5=3D32575ca1a42c5fa04aac6f08566ddf48 \<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"http://tukaani.org/xz/xz-$%7BPV%7D.=
tar.gz" rel=3D"noreferrer" target=3D"_blank">http://tukaani.org/xz/xz-${PV}=
.tar.gz</a>&quot;<br>
&gt; --<br>
&gt; 2.14.5<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000000bcda705911cafdd--
