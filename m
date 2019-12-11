Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 916957F68B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 03:04:16 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id j5so4909864qtq.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2019 19:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=B/vn/cfmke90TcDKEfiFPsHZ6m+/4jR0UpQP/1YA0os=;
	b=Qzhs1xSCJBIhdFp7ufOCzIv+eKbwx7KYiERxHrEwF2IXPR0NCP+oBlA1m8D3Ei695a
	Xq4KdN3zCSrwbahyt4yPxd7H5IHsACO7oHbVXzM95XS8qSijg0bm7+nB3VyOJsT7kmg0
	nnyjh88sWf9GCJvOm59Fs0xZKNAIO0Un2c9h70IOUVcC1YMYEFqYQ7c0kEa+vZ7XsRou
	bAJCKNHNb1/4BdM8Z+tObAOABUjzHVo7ymCnH2u0c2KHS7C6sQEmQnwrtUB/pa0M0BzR
	yDFRlNIOvkj3Fz2Tgifu8vsIQBvljuADDvOZKQFbWEeVufU9qSPhlfihp6VrKe8Z0d9l
	785w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=B/vn/cfmke90TcDKEfiFPsHZ6m+/4jR0UpQP/1YA0os=;
	b=nwJxqX2mOX9fwfa4/5su0mgJFsR5J069hvaeFZYsqwtQ/vmU7BZSTjvKInDWIHTRVw
	oHbMyKl7k4+wabl7/VI/zrFTXwdk6qJp0x4EDla2W6qybFxPSnhzcYX3mJ/nJgwqDrWQ
	NH1kHaOtnKsNfMigWf4zg+55MMKMUqqiqHtAMk/ICmSl8X80ZBR2jJQG0eausm0H0Opn
	EQ6devC1BBQkIm63DjZG0RBe6dNoS1r9xkAm55U8ZCX3ya9YlJNcbu9bIkX4XXVE+zqf
	w0Or7DKksRqEmEbevLID+DIkVFAnTQtnKoCVGXLs0mOeX3f0zNELjNIe8buZlWwyWv7C
	Eyng==
X-Gm-Message-State: APjAAAXi97wzIv+qA7BmhuroG+Xxhj87traCTBx6CdWClgPKAGfihEmk
	NcJogIWtlLCN9a9mtAx7tuAd98rvh/w6nwTsY/s=
X-Google-Smtp-Source: APXvYqxt4D9+BN2d4XY03YugBusvLcUvLGuDE+xykypafsApbYorfmnBCspIf2Cs+fwCkHZ9rV9ttoCc1s1PQbaH/H4=
X-Received: by 2002:ac8:748:: with SMTP id k8mr940181qth.378.1576033457122;
	Tue, 10 Dec 2019 19:04:17 -0800 (PST)
MIME-Version: 1.0
References: <20191210234517.3749201-1-raj.khem@gmail.com>
	<CALbNGRRoz8UCLW3cSRbkHWM=wyLXOaofzgiFPkrNL+2cybFm1A@mail.gmail.com>
In-Reply-To: <CALbNGRRoz8UCLW3cSRbkHWM=wyLXOaofzgiFPkrNL+2cybFm1A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Dec 2019 19:03:51 -0800
Message-ID: <CAMKF1srufUVEU=qjehG3Arm3vEv6j4Az96wt+FSjgfdLeneXRQ@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpng: Correct SRC_URI path
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
X-List-Received-Date: Wed, 11 Dec 2019 03:04:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2019 at 4:59 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Wed, Dec 11, 2019 at 12:45 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Fixes fetcher warning
> > WARNING: libpng-1.6.37-r0 do_fetch: Failed to fetch URL https://downloa=
ds.sourceforge.net/project/libpng/libpng16/1.6.37/libpng-1.6.37.tar.xz, att=
empting MIRRORS if available
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-multimedia/libpng/libpng_1.6.37.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/rec=
ipes-multimedia/libpng/libpng_1.6.37.bb
> > index 78f3248d73..47287a0d55 100644
> > --- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
> > +++ b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
> > @@ -7,11 +7,11 @@ DEPENDS =3D "zlib"
> >
> >  LIBV =3D "16"
> >
> > -SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/${PV}/=
${BP}.tar.xz"
> > +SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/$${BPN}{LIBV}/${BP}.tar.xz"
> ^ is $$ intended?

its a typo. Good catch.

>
> Andreas

