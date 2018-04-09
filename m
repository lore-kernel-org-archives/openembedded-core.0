Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6D9D374A41
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 22:03:16 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id t67so22254407wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2018 15:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MWUYEoaX1w1HVSqcrJ9quGReVTDtEXEy51ZEHE6slOk=;
	b=d1h+grNfZ70psjBYGWKdCyitVephYCflTquFlMHvIGKdTjJgjxgHJX3EBde5POZk4k
	Q+osRtJ2mZieMGjv3jiqGciqQYn3F3JZ7IVYdXotYZb7dA7bsKjfokpwNA/tBWTX3hm9
	+cX/qxBvOvDH+wu45xWisgSwhvBixYQeU9UQe/u/iZOZQyG9uGfV0ZZ/X7Hqd4sV+xZn
	gAtuCl+D9vuCwZeHZeT+jrZgL0eiV04TnKfoW/haSX10J3cUn5cX7aGxe5Sd/nd7+cSu
	17qSOlk+UC80kMCaPuPNqFa2lf1yPcOnhoHNBRitYYurKH19SJ3F1Ex5UKWacZ5Te4rv
	sOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MWUYEoaX1w1HVSqcrJ9quGReVTDtEXEy51ZEHE6slOk=;
	b=iCLozK4p/t5AawbwP4ejNzHcBmN8tEYjV8sA8dQiydM9LIdcWc+V0gdptoLUBeSm9y
	57Z1NTgC8rD62CdDsSh5nkIdMr5go+Tch7GHrd7LLxqjdghcpRN7qw1TbNG2VqMwhZLk
	JuBCqIPVWADnc0Uz6HNMM6LU0sblTdugJwSdzkUQo2CVSWz56kG0lwqaMq65ZVBkrCyB
	OjpY7QL6WrNbSkSTY2G4K2iYxoRd2G1N6RAXKkvI3He0dXrQwRz6TkhkK/eH+/IKeKOG
	pDklcZHKajCMyh7yvXyFE/Z0nNbErp6VJHlHj24ksx0g9EBia5oUw8gN+SwTDINfIFtX
	C2zQ==
X-Gm-Message-State: ALQs6tCf5H3LegtvpbnytBhEoEsbD/yplJXYwR6aAamq74KMYzaJGYWk
	Fy8j3+G180z3e6EMGdY6yim0XLSzMPVPmcwZkWZOig==
X-Google-Smtp-Source: AIpwx48wnjoEPSVHXs3fSojOp36z+fY0bmCBQX0h/IMXlOifkNAsXrBJxVLLqxu3h89b/qo+wohfSH8SeYILsexE/6g=
X-Received: by 10.28.156.4 with SMTP id f4mr1104136wme.79.1523311397895; Mon,
	09 Apr 2018 15:03:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.126.12 with HTTP; Mon, 9 Apr 2018 15:03:17 -0700 (PDT)
In-Reply-To: <391d78d5-ec72-f717-7b7f-9e4e11db1958@gmail.com>
References: <CA+chaQeNd3F9oXBYFsj4YaxfJ+k3uvXDcdcHy-AP32MWaHT8aQ@mail.gmail.com>
	<20180409075141.27481-1-Martin.Jansa@gmail.com>
	<391d78d5-ec72-f717-7b7f-9e4e11db1958@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 10 Apr 2018 00:03:17 +0200
Message-ID: <CA+chaQeOxiQDJhTNbh+u20a1X-SYoB4ipcL=HOSh-a8surPhAQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxcrypt: add -std=gnu99 to BUILD_CPPFLAGS
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
X-List-Received-Date: Mon, 09 Apr 2018 22:03:17 -0000
Content-Type: multipart/alternative; boundary="001a114b2de6c103cf056971921b"

--001a114b2de6c103cf056971921b
Content-Type: text/plain; charset="UTF-8"

The anonymous python bellow this chunk limits this whole recipe only
for nativesdk (I don't know why it uses BBCLASSEXTEND + anonymous python
instead of just inheritting nativesdk directly from nativesdk-libxcrypt
recipe to make it more obvious ...).

On Mon, Apr 9, 2018 at 11:59 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On 4/9/18 12:51 AM, Martin Jansa wrote:
> > * add it to allow older distributions e.g. Ubuntu 14.04 with gcc 4.8
> >   to build this, otherwise it fails with:
> >   ../git/gen-des-tables.c: In function 'write_table_u8':
> >   ../git/gen-des-tables.c:307:3: error: 'for' loop initial declarations
> are only allowed in C99 mode
> >      for (size_t i = 0; i < m; i++)
> >      ^
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
> b/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
> > index b1982c1991..a1be4be7ef 100644
> > --- a/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
> > +++ b/meta/recipes-core/libxcrypt/libxcrypt_4.0.0.bb
> > @@ -20,7 +20,7 @@ FILES_${PN} = "${libdir}/libcrypt*.so.*
> ${libdir}/libcrypt-*.so ${libdir}/libowc
> >
> >  S = "${WORKDIR}/git"
> >
> > -BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE}"
> > +BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE} -std=gnu99"
>
> This might change behaviour with gcc5+ e.g. where default is gnu11
> in anycase, I think if we could limit this to native version can limit
> the impact.
>
> >  TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
> >
> >  python () {
> >
>
>

--001a114b2de6c103cf056971921b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The anonymous python bellow this chunk limits this whole r=
ecipe only for=C2=A0nativesdk (I don&#39;t know why it uses=C2=A0BBCLASSEXT=
END + anonymous python instead of just inheritting nativesdk directly from =
nativesdk-libxcrypt recipe to make it more obvious ...).</div><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Apr 9, 2018 at 11:59 P=
M, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><span class=3D"">On 4/9/18 12:51 AM, Martin Jansa wrote:<br>
&gt; * add it to allow older distributions e.g. Ubuntu 14.04 with gcc 4.8<b=
r>
&gt;=C2=A0 =C2=A0to build this, otherwise it fails with:<br>
&gt;=C2=A0 =C2=A0../git/gen-des-tables.c: In function &#39;write_table_u8&#=
39;:<br>
&gt;=C2=A0 =C2=A0../git/gen-des-tables.c:307:3: error: &#39;for&#39; loop i=
nitial declarations are only allowed in C99 mode<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for (size_t i =3D 0; i &lt; m; i++)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ^<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/libxcrypt/<a href=3D"http://libxcrypt_4.0.0.bb=
" rel=3D"noreferrer" target=3D"_blank">li<wbr>bxcrypt_4.0.0.bb</a> | 2 +-<b=
r>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/libxcrypt/<a href=3D"http://libxcrypt_4=
.0.0.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>libxcrypt_4.0.0.bb</a> b=
/meta/recipes-core/libxcrypt/<a href=3D"http://libxcrypt_4.0.0.bb" rel=3D"n=
oreferrer" target=3D"_blank"><wbr>libxcrypt_4.0.0.bb</a><br>
&gt; index b1982c1991..a1be4be7ef 100644<br>
&gt; --- a/meta/recipes-core/libxcrypt/<a href=3D"http://libxcrypt_4.0.0.bb=
" rel=3D"noreferrer" target=3D"_blank"><wbr>libxcrypt_4.0.0.bb</a><br>
&gt; +++ b/meta/recipes-core/libxcrypt/<a href=3D"http://libxcrypt_4.0.0.bb=
" rel=3D"noreferrer" target=3D"_blank"><wbr>libxcrypt_4.0.0.bb</a><br>
&gt; @@ -20,7 +20,7 @@ FILES_${PN} =3D &quot;${libdir}/libcrypt*.so.* ${lib=
dir}/libcrypt-*.so ${libdir}/libowc<br>
&gt;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; -BUILD_CPPFLAGS =3D &quot;-I${STAGING_INCDIR_NATIVE}&quot;<br>
&gt; +BUILD_CPPFLAGS =3D &quot;-I${STAGING_INCDIR_NATIVE} -std=3Dgnu99&quot=
;<br>
<br>
</span>This might change behaviour with gcc5+ e.g. where default is gnu11<b=
r>
in anycase, I think if we could limit this to native version can limit<br>
the impact.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;=C2=A0 TARGET_CPPFLAGS =3D &quot;-I${STAGING_DIR_TARGET}${<wbr>included=
ir}&quot;<br>
&gt;<br>
&gt;=C2=A0 python () {<br>
&gt;<br>
<br>
</div></div></blockquote></div><br></div>

--001a114b2de6c103cf056971921b--
