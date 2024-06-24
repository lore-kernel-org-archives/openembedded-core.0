Return-Path: <sreejith.ravi087@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93287C2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 11:20:41 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web10.138162.1719228038057019011
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jun 2024 04:20:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M3KU42I+;
 spf=pass (domain: gmail.com, ip: 209.85.167.67, mailfrom: sreejith.ravi087@gmail.com)
Received: by mail-lf1-f67.google.com with SMTP id 2adb3069b0e04-52cdfb69724so1740348e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 04:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719228036; x=1719832836; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2Gqw0hRUUKD+MxMeYsA3Ju2ybJqLwOBY9zk9MLnwlKE=;
        b=M3KU42I+mELP6CBcmIqzvRDApAgASHX3YnQT9RU3METvtRXJMCC9v+c94iGXBX+qut
         FW/MYUabs7wxXGk9n4MMOCqQDkZ1mFXIa7AHbvCtQNbO3qbyVQB62qSkRYVWGqAwx8j+
         sy6qkHcFsYoVZZ5s5B5eZg7auTlZ2KvFwLL7UdAOW/ihYX2UcuzKHqynXLq6qHs6PzsG
         23Fl3k1Emj0kEAKwTS7is84hWhf82r5NZvgT819o4dr+BaKZrlRJQs05IBhrNaufBDUN
         FxNgPIb6kx45wJcnyV+kbMgMbTPP1fLxOyzZTS24JjYjhH8PSD4GumviE3etCdZLQnbi
         6zVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719228036; x=1719832836;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Gqw0hRUUKD+MxMeYsA3Ju2ybJqLwOBY9zk9MLnwlKE=;
        b=N9K9UEF21OrsbXYdGD/+8FOB/11YdBw/0Zj7hgHPj4TgBHoYlB91VBlr19pkiDlIfg
         Uxw2M9v83gS8UYr1Rc+Am6BZe0x3djSvWUynKdtzVJvJtjgx1qCEyKZxtq4ew5ZcyC/5
         e7t4x0Tz1mtU4boFAyGcTxIQyaG7xxFcTnjr8H7nau4Xu0UdSpYWeIlQqLtztA+LNQ5B
         u1urqQZ0RRaY4gZgCyLd66hoU4hfYumyNP4FyMwz9ZayPNbZss0BiCbawJmy/sWxBP3p
         v/BgJlWeRJCqbrpwcFyzsOiZR7Q7KoIPhdLmvasIx8TCLKu8WIZmp3IHLlEbZwJSHugq
         DgXA==
X-Gm-Message-State: AOJu0YzaDxq3TtJ6Flv9AdAlZ9qicvkEP4EXyN5eX5Ytqaqosei/nIOo
	HbvtJP96Cr2FcLe1+DeVH2mT54KtndmpwRN+RoMbCpD7IuDQjFIROCNGxdQJTaqSu3PdEJWUY7B
	TftwqJAnGQP7ySP0vl/+MWZAnKX0=
X-Google-Smtp-Source: AGHT+IE90E9+k7pvJZpemjgHchHfmKZ2WKCl/fyhbbyZq82zm8+kcfb1YRrMj8BpQzHnmuZvpoqvz4W6l2MlXs24Z7I=
X-Received: by 2002:a05:6512:324a:b0:52c:9e25:978d with SMTP id
 2adb3069b0e04-52ce185e46amr2121944e87.45.1719228035875; Mon, 24 Jun 2024
 04:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <QrUS.1719222991270481706.aFEU@lists.openembedded.org> <CANNYZj9TcPZ3oCiphS5v4X0s9qEHPxPm6EqjkayN-ZT3kWL2nQ@mail.gmail.com>
In-Reply-To: <CANNYZj9TcPZ3oCiphS5v4X0s9qEHPxPm6EqjkayN-ZT3kWL2nQ@mail.gmail.com>
From: Sreejith Ravi <sreejith.ravi087@gmail.com>
Date: Mon, 24 Jun 2024 12:20:24 +0100
Message-ID: <CAFt4JuGrWdtOjxOuJMkczL6AK3a0iiYtQGM34jk3Gr0Pf4JdOw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package.bbclass: Fix broken dev package dependency.
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005dcab0061ba0f842"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 11:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201077

--0000000000005dcab0061ba0f842
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The icu package is necessary for the compilation of libical; otherwise, the
build will fail. "Recommended" contains all the packages that are part of
the dependent build. If we try to install the recommended packages, it will
download and install many unnecessary packages, consuming hard disk space
and increasing download time. Referring to the Debian packages, icu-dev is
a dependent package, meaning it is required for the build. "Depends" is a
must-have, and "Recommends" is optional. In this case, the ICU package is a
must-have.

Sreejith

On Mon, Jun 24, 2024 at 12:08=E2=80=AFPM Alexander Kanavin <alex.kanavin@gm=
ail.com>
wrote:

> On Mon, 24 Jun 2024 at 11:56, Sreejith Ravi via lists.openembedded.org
> <sreejith.ravi087=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > Currently, the process_pkgconfig() would process only the "Requires" ke=
y
> field and ignore "Requires.private" while generating the dev dependency
> chain.
> >
> > Example: usr/lib/pkgconfig/libical.pc
> > ----------
> > Libs: -L${libdir} -lical -licalss -licalvcal
> > Libs.private: -lpthread
> > Requires.private: icu-i18n
> > ----------
> > Depends field generated for libical-dev
> > Depends: glib-2.0-dev, libical (=3D 3.0.7-r0)
> > ------------
> >
> > When trying to resolve the build time dependency with libical package
> using =E2=80=9C-dev=E2=80=9D ipk generated, it will throw the below error=
.
> > -----------
> > Package icu-i18n was not found in the pkg-config search path.
> > Perhaps you should add the directory containing `icu-i18n.pc'
> > to the PKG_CONFIG_PATH environment variable
> > Package 'icu-i18n', required by 'libical', not found
> > -----------
> >
> > This patch will add the packages listed in "Requires.private" to the
> dependency chain.
> >
> > -------
> > Depends field generated with this change for libical-dev
> > Depends: glib-2.0-dev, icu-dev, libical (=3D 3.0.7-r0)
> > -------
>
> The icu-dev package is already listed in the Recommends section that
> is formed from shared libraries libical uses, so you need to install
> the recommended packages:
>
> %package -n libical-dev
> Summary: iCal and scheduling (RFC 2445, 2446, 2447) library - Development
> files
> License: LGPL-2.1-only | MPL-2.0
> Group: devel
> Requires: glib-2.0-dev
> Requires: libical
> Recommends: glib-2.0-dev
> Recommends: glibc-dev
> Recommends: gobject-introspection-dev
> Recommends: icu-dev
> Recommends: libgcc-dev
> Recommends: libical =3D 3.0.18-r0
> Recommends: libicui18n-dev
> Recommends: libicuuc-dev
> Recommends: libstdc++-dev
> Recommends: libxml2-dev
> Recommends: vala-dev
>
> Seems like there's quite a bit more needed for a successful build than
> just icu-dev and glib-2.0-dev.
>
> Alex
>

--0000000000005dcab0061ba0f842
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>The icu package is necessary for the compilation of l=
ibical; otherwise, the build will fail. &quot;Recommended&quot; contains al=
l the packages that are part of the dependent build. If we try to install t=
he recommended packages, it will download and install many unnecessary pack=
ages, consuming hard disk space and increasing download time. Referring to =
the Debian packages, icu-dev is a dependent package, meaning it is required=
 for the build. &quot;Depends&quot; is a must-have, and &quot;Recommends&qu=
ot; is optional. In this case, the ICU package is a must-have.<br></div><di=
v><br></div><div>Sreejith</div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Mon, Jun 24, 2024 at 12:08=E2=80=AFPM Alexander=
 Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Mon, 24 Jun 2024 at 11:56, Sreejith Ravi via <a href=3D"http://lists.o=
penembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.or=
g</a><br>
&lt;sreejith.ravi087=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" =
target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Currently, the process_pkgconfig() would process only the &quot;Requir=
es&quot; key field and ignore &quot;Requires.private&quot; while generating=
 the dev dependency chain.<br>
&gt;<br>
&gt; Example: usr/lib/pkgconfig/libical.pc<br>
&gt; ----------<br>
&gt; Libs: -L${libdir} -lical -licalss -licalvcal<br>
&gt; Libs.private: -lpthread<br>
&gt; Requires.private: icu-i18n<br>
&gt; ----------<br>
&gt; Depends field generated for libical-dev<br>
&gt; Depends: glib-2.0-dev, libical (=3D 3.0.7-r0)<br>
&gt; ------------<br>
&gt;<br>
&gt; When trying to resolve the build time dependency with libical package =
using =E2=80=9C-dev=E2=80=9D ipk generated, it will throw the below error.<=
br>
&gt; -----------<br>
&gt; Package icu-i18n was not found in the pkg-config search path.<br>
&gt; Perhaps you should add the directory containing `icu-i18n.pc&#39;<br>
&gt; to the PKG_CONFIG_PATH environment variable<br>
&gt; Package &#39;icu-i18n&#39;, required by &#39;libical&#39;, not found<b=
r>
&gt; -----------<br>
&gt;<br>
&gt; This patch will add the packages listed in &quot;Requires.private&quot=
; to the dependency chain.<br>
&gt;<br>
&gt; -------<br>
&gt; Depends field generated with this change for libical-dev<br>
&gt; Depends: glib-2.0-dev, icu-dev, libical (=3D 3.0.7-r0)<br>
&gt; -------<br>
<br>
The icu-dev package is already listed in the Recommends section that<br>
is formed from shared libraries libical uses, so you need to install<br>
the recommended packages:<br>
<br>
%package -n libical-dev<br>
Summary: iCal and scheduling (RFC 2445, 2446, 2447) library - Development f=
iles<br>
License: LGPL-2.1-only | MPL-2.0<br>
Group: devel<br>
Requires: glib-2.0-dev<br>
Requires: libical<br>
Recommends: glib-2.0-dev<br>
Recommends: glibc-dev<br>
Recommends: gobject-introspection-dev<br>
Recommends: icu-dev<br>
Recommends: libgcc-dev<br>
Recommends: libical =3D 3.0.18-r0<br>
Recommends: libicui18n-dev<br>
Recommends: libicuuc-dev<br>
Recommends: libstdc++-dev<br>
Recommends: libxml2-dev<br>
Recommends: vala-dev<br>
<br>
Seems like there&#39;s quite a bit more needed for a successful build than<=
br>
just icu-dev and glib-2.0-dev.<br>
<br>
Alex<br>
</blockquote></div></div>

--0000000000005dcab0061ba0f842--

