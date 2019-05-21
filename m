Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 613507E258
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 19:00:57 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id r7so17353048otn.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 12:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6J7DpOeo9iTMMTKkjCdw7SU1za7g/zzOvPflwvSnxO4=;
	b=Yrb/n8WC+VsFeHpKEoCAZVrDAfoUd1biQYeXwyD2aiTnFDobuXiaiTwk5aOEW4FzuE
	NKVGsALi/c9gNGTCC2lkka3YK3sWgtC1ZrYeffBkGNEOdgfOQFg0wGXNUcQRGSfAEr14
	21crA4ee5zY9UtelEuuAzO59PS2uxroNKs50e2i/s2wFqWq0CYd0TFlB7VPwXxJ4xN/b
	LLopLewstzegjp+8RMtGmNZioVBL0reEMY+mYtNDYP0sVjgB1AyEJwQi7QzMFojkyPiW
	TbqP6cCqDLrbFmHgL0U6dc/5AoLNtqO4VTdPwAREgGfU78PbKWnM0z2kVOtw8r5TSHMC
	bWYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6J7DpOeo9iTMMTKkjCdw7SU1za7g/zzOvPflwvSnxO4=;
	b=hJJRcLg/wNHlkDmom8wFmNqKGy6UEdJHpXbEyVuF7TKf8bfsuZmC/4CvUkGLlcZKLK
	ey7fRrMyZCHVytdtWrb8oftN+MQKRnDCnTKu+/TQvXJsdwCO0pj2MkGDQLAAWCEtBudw
	fnYkeD2KmwsnBVU5h+7mjsClxO7sEsnEtVrKNeDULittPNOMa101gzOKtt7kuU3n1AiR
	l7PHNW5MPnIs98m21FEs+uPkTuxZH87I0Y5ukZbWvnfYRh67YDjHOsQdrISuCyCWRnkS
	H0KtoMTIok3TJjAIVuJS5I7sQRZ+4Bb3N214IXuLcdckTyUfrYwucnl3Xk8sL2U9sYa7
	7Hsw==
X-Gm-Message-State: APjAAAWOYqER0uks31//lVoNshvcOvO4Z9CsRvp/G+wZo2AGVBkKtsE2
	MkPXGqHxz+xl2qkQJbUbFbjZZLrOihNVxjccu1aCWKHs
X-Google-Smtp-Source: APXvYqxI5aox4DBXgMva5NuZt3End2MqVFtHFWjtiEV3yUyqS0i+px74nxgImGgotbzVryGo78ew37ib4G89f94RXk4=
X-Received: by 2002:a9d:7dd5:: with SMTP id k21mr24153941otn.167.1558465258272;
	Tue, 21 May 2019 12:00:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
	<20190520141125.10805-32-alex.kanavin@gmail.com>
	<06cf651bb9729dab7f0ddec0f6cfc5f878773b06.camel@linuxfoundation.org>
In-Reply-To: <06cf651bb9729dab7f0ddec0f6cfc5f878773b06.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 May 2019 21:00:46 +0200
Message-ID: <CANNYZj_8kDSCn8w+JXQ_Z4O1AWpsRypcjRVOqNG15+Q_Cs_Y5A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 32/42] libdnf: upgrade 0.28.1 -> 0.33.0
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
X-List-Received-Date: Tue, 21 May 2019 19:00:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 21 May 2019 at 20:44, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2019-05-20 at 16:11 +0200, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  .../libdnf/{libdnf_0.28.1.bb =3D> libdnf_0.33.0.bb}               | 2
> > +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-devtools/libdnf/{libdnf_0.28.1.bb =3D>
> > libdnf_0.33.0.bb} (95%)
>
> libdnf-native build failure:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/850
>
> Could be caused by the other fix? :/

No, this looks different, and probably specific to the c++ compiler on
Debian 9 host - what gcc version does it have?

| FAILED: libdnf/CMakeFiles/libdnf.dir/sack/query.cpp.o
| /home/pokybuild/yocto-worker/build-appliance/build/build/tmp/hosttools/g+=
+
-DLIBDNF_UNSTABLE_API -D_FILE_OFFSET_BITS=3D64 -Dlibdnf_EXPORTS
-I/home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work/x86_64-=
linux/libdnf-native/0.33.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../..=
/../usr/include/gio-unix-2.0
-I/home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work/x86_64-=
linux/libdnf-native/0.33.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../..=
/../usr/include
-I/home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work/x86_64-=
linux/libdnf-native/0.33.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../..=
/../usr/include/libmount
-I/home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work/x86_64-=
linux/libdnf-native/0.33.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../..=
/../usr/include/blkid
-I/home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work/x86_64-=
linux/libdnf-native/0.33.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../..=
/../usr/include/uuid
-I/home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work/x86_64-=
linux/libdnf-native/0.33.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../..=
/../usr/lib/libffi-3.2.1/include
-I/home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work/x86_64-=
linux/libdnf-native/0.33.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../..=
/../usr/include/glib-2.0
-I/home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work/x86_64-=
linux/libdnf-native/0.33.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../..=
/../usr/lib/glib-2.0/include
-I/home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work/x86_64-=
linux/libdnf-native/0.33.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../..=
/../usr/include/json-c
-I/home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work/x86_64-=
linux/libdnf-native/0.33.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../..=
/../usr/include/libxml2
-I/home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work/x86_64-=
linux/libdnf-native/0.33.0-r0/git
-I/home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work/x86_64-=
linux/libdnf-native/0.33.0-r0/git/libdnf/utils
-I/home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work/x86_64-=
linux/libdnf-native/0.33.0-r0/git/libdnf/transaction
-isystem/home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work/x=
86_64-linux/libdnf-native/0.33.0-r0/recipe-sysroot-native/usr/include
-O2 -pipe -std=3Dc++11 -Wmissing-declarations -fPIC
-DPACKAGE_VERSION=3D\"0.33.0\" -DGETTEXT_DOMAIN=3D\"libdnf\"
-DG_LOG_DOMAIN=3D\"libdnf\"
-DTESTDATADIR=3D\"/home/pokybuild/yocto-worker/build-appliance/build/build/=
tmp/work/x86_64-linux/libdnf-native/0.33.0-r0/git/data/tests\"
-Wcast-align -Wno-uninitialized -Wredundant-decls -Wwrite-strings
-Wformat-nonliteral -Wmissing-format-attribute -Wsign-compare
-Wtype-limits -Wuninitialized -Wall
-Werror=3Dimplicit-function-declaration -Wl,--as-needed -MD -MT
libdnf/CMakeFiles/libdnf.dir/sack/query.cpp.o -MF
libdnf/CMakeFiles/libdnf.dir/sack/query.cpp.o.d -o
libdnf/CMakeFiles/libdnf.dir/sack/query.cpp.o -c
/home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work/x86_64-li=
nux/libdnf-native/0.33.0-r0/git/libdnf/sack/query.cpp
| /home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work/x86_64-=
linux/libdnf-native/0.33.0-r0/git/libdnf/sack/query.cpp:54:13:
error: specialization of =E2=80=98template<class _Tp> struct
std::default_delete=E2=80=99 in different namespace [-fpermissive]
| struct std::default_delete<DnfPackage> {
| ^~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /usr/include/c++/6/memory:81:0,
| from /home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work/x8=
6_64-linux/libdnf-native/0.33.0-r0/git/libdnf/sack/advisory.hpp:25,
| from /home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work/x8=
6_64-linux/libdnf-native/0.33.0-r0/git/libdnf/utils/utils.hpp:10,
| from /home/pokybuild/yocto-worker/build-appliance/build/build/tmp/work/x8=
6_64-linux/libdnf-native/0.33.0-r0/git/libdnf/sack/query.cpp:21:
| /usr/include/c++/6/bits/unique_ptr.h:54:12: error: from definition
of =E2=80=98template<class _Tp> struct std::default_delete=E2=80=99 [-fperm=
issive]
| struct default_delete
| ^~~~~~~~~~~~~~

Alex

