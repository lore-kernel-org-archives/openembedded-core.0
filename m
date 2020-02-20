Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
	[209.85.166.53])
	by mail.openembedded.org (Postfix) with ESMTP id B0C0B6073A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 12:45:21 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id s24so4500495iog.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 04:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6VjpQ/2bvjLWAnFZhI7XTUDv18vDNPrxX78hNx3drhU=;
	b=pP45zAIBLad3RfAqr47Ugcm7y8+iaEC0TCKqFrdKWP6Gwjp4KL/tUWT1aap+g7wSeZ
	k2OQlPQwjSXN4fLvdxZ+2Yjkef+GJof5qGB9/R+Kj1GBuL0EP43tr/Kf/Kl9VU5JpzZQ
	ERmg+TEUxfSVhIHwqPGfAXLoXaoulx8UjYAFtNTbKWOx4vjRExqpm7uR5HPBA/AXiXlG
	ufuq+ZetYvfYlwXqt2ULoZdziF7Ig596OlchOffFIZ49zK1SxbTay0WrRGxuIWgsT2Ea
	2GTG5rn+80iMe3CwZ6lOYEfTs4u1s8ubeSt3Q2A6CFFZbBzCtida//RfQhYfGQdivtQH
	9KGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6VjpQ/2bvjLWAnFZhI7XTUDv18vDNPrxX78hNx3drhU=;
	b=OXjt69o7sf6POdomjFqkcN0T1ent8L21EgFKHjY/rbaACZZgZU5A0pst6mWNOVnuP5
	zgJ8jXLqou+G68aJ9QyDjOdH3ykKsfCVPOtvZVeJDdWjgz0V/umLTXC+fYS+bpsJ4W6T
	cv5VsfBTvDA0cJ5PRyNADmHLSfhZaphcgb6S5JBe+PNlFeSCHr23gWino6nJJtKVBsGX
	2NI2HhtMRJN6i29ABV1CAh/NCXtog2RXf/5AL/JONAgh2QmnpA5x4rq8W1GkCQ3Naiod
	+cT/4oIhLmc1cjZD6yDykE1YWnQlG5kkDzVMbIUfqSYU8aqn4Aq4hEvkgZogvR1bsnXm
	HF2A==
X-Gm-Message-State: APjAAAX3MxmAcbZWFrMK21uyIVeRjXW1EVempKpzg4Oi32XxQhC7yyKQ
	nr/NIwKxBBiBmXVlWCd95oNccERZ/kxTk1q+PtM=
X-Google-Smtp-Source: APXvYqwi1Ffa4dE8PHv/BtLi/t14Hkozo0IX3Q0GGMsBGUCKqf+qoQ9V9aGrGCjpapt0Ws4BNjbcfP9gq3HhR5SSRvo=
X-Received: by 2002:a05:6602:2299:: with SMTP id
	d25mr24547969iod.267.1582202722617; 
	Thu, 20 Feb 2020 04:45:22 -0800 (PST)
MIME-Version: 1.0
References: <20200220002849.9126-1-schnitzeltony@gmail.com>
	<CANNYZj9pFMxP7nYkUOyQ4wcejkr4j+EBqa3OdJZXgEKB7ZtX=Q@mail.gmail.com>
In-Reply-To: <CANNYZj9pFMxP7nYkUOyQ4wcejkr4j+EBqa3OdJZXgEKB7ZtX=Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 20 Feb 2020 13:45:11 +0100
Message-ID: <CALbNGRTruaPGSJTNd816++UuYJTyL1=r2KHeKquENLTa=08UWA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][master-next] webkitgtk: add PACKAGECONFIG gobject-introspection
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
X-List-Received-Date: Thu, 20 Feb 2020 12:45:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 11:07 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> You need to at the same time drop the introspection enablement logic from=
 EXTRA_OECMAKE I think?
> This line:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-sato/web=
kit/webkitgtk_2.26.4.bb?h=3Dmaster-next#n70
>
> And for consistency, it would be good to do the same for gtk-doc.

This is odd: I fell over this because there was no gir created. Did
not notice it was few lines below. Need to check that - maybe I am a
bit off-sync to master or something is wrong elsewhere.

Will sync to master and send V2 then.

Andreas
>
> Alex
>
> ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=
=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \
>
> ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=
=3DON', '-DENABLE_INTROSPECTION=3DOFF', d)} \
>
>
> On Thu, 20 Feb 2020 at 01:29, Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>>
>> Enable if 'gobject-introspection-data' is in DISTRO_FEATURES. This is wh=
at
>> gobject-introspection.bbclass does automatically for projects build with
>> autotools and meson.
>>
>> It was checked: there are webkitgtk and libdnf inheriting gobject-intros=
pection
>> and cmake. Since libdnf cannot configure gir, webkitgtk seems the only p=
roject
>> requiring gir-auto-enabling. So handle at recipe / no common magic at
>> gobject-introspection.bbclass required.
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
>> ---
>>
>> This patch applies on top of master-next/Alex's patches sent
>>
>>  meta/recipes-sato/webkit/webkitgtk_2.26.4.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb b/meta/recipes=
-sato/webkit/webkitgtk_2.26.4.bb
>> index 585723772e..d5085620d2 100644
>> --- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
>> @@ -39,6 +39,7 @@ DEPENDS =3D "zlib libsoup-2.4 curl libxml2 cairo libxs=
lt libxt libidn libgcrypt \
>>            "
>>
>>  PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11=
', d)} \
>> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'gobject-int=
rospection-data', 'gobject-introspection', '' ,d)} \
>>                     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'w=
ebgl opengl', '' ,d)} \
>>                     enchant \
>>                     libsecret \
>> @@ -46,6 +47,7 @@ PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATUR=
ES', 'wayland x11', d)} \
>>
>>  PACKAGECONFIG[wayland] =3D "-DENABLE_WAYLAND_TARGET=3DON,-DENABLE_WAYLA=
ND_TARGET=3DOFF,wayland libwpe wpebackend-fdo wayland-native"
>>  PACKAGECONFIG[x11] =3D "-DENABLE_X11_TARGET=3DON,-DENABLE_X11_TARGET=3D=
OFF,virtual/libx11"
>> +PACKAGECONFIG[gobject-introspection] =3D "-DENABLE_INTROSPECTION=3DON,-=
DENABLE_INTROSPECTION=3DOFF"
>>  PACKAGECONFIG[geoclue] =3D "-DENABLE_GEOLOCATION=3DON,-DENABLE_GEOLOCAT=
ION=3DOFF,geoclue"
>>  PACKAGECONFIG[enchant] =3D "-DENABLE_SPELLCHECK=3DON,-DENABLE_SPELLCHEC=
K=3DOFF,enchant2"
>>  PACKAGECONFIG[gtk2] =3D "-DENABLE_PLUGIN_PROCESS_GTK2=3DON,-DENABLE_PLU=
GIN_PROCESS_GTK2=3DOFF,gtk+"
>> --
>> 2.21.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

