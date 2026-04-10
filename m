Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00B3DE99066
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 09:44:30 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.152489.1775814267167707042
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 02:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=29X7tZtt;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so23981745e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 02:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775814265; x=1776419065; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaEZnGT+4rJdib/iSX6LrRWFaX18ngeTd8o1n5BxZj0=;
        b=29X7tZttRctqLtschW7MZxw/hMVCFb0l7ecb0AsokJrRlI52md54MaueTbEwAnw4KX
         IuCrXXdpI2ePzqKk3nppTs6JKr4DN5ayz07/7ZZiwvZoToLM5YiXqY7OVucA7ZP4vaMY
         aT560Ix7hWfR/40q1JV1YknxCWglydYnuGRvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775814265; x=1776419065;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EaEZnGT+4rJdib/iSX6LrRWFaX18ngeTd8o1n5BxZj0=;
        b=lPHWrg6+XG1J6MHOz0qYFf2kN5Y9mMw7dPI/ohMGlEGe+qz7gvMuoIS2Koo+/3RDyq
         hGYZX2YqmMaw7BdFemGkniR3+FyE/I7bdozvBCWLE6GblBemk7/BrjVDzDS7DxO066O6
         Lwp0ZbD+tQje7dX0WJJddqMLR74UmJ0adIo1rA2apCdzqv0ePFgrnzNpH4/j0oQBwLcZ
         zuzzDk9CT5b+UI0hU29YjxP7RKWIQ3swKbhrnbVqbyiPMIws7OC0GuB/ZGXRBRciVEjH
         hrLCuFNnTdPm+ZJ3YiSCAEmn4COJjPZVjYhZzdcq1M1DYwEvSCG9ygSs+snS4cKVI5a7
         9WIQ==
X-Gm-Message-State: AOJu0YzaNjpYAlFfsjycI8tULLPuGgqat8qyHVtQQahujvHmq3B7FBVn
	Iako2SxqhgYSK9XQZY4phKQI9jul3XcEsv2YTJqAIlDrjMjm+JXz716KLq4Kmf4vnSM=
X-Gm-Gg: AeBDietYwrr2uOQuvRr1bmao5R8AnmjiPVoh+heS1iT3qPMAG6K8Bq/h99nvhDkq6l7
	MSNVCyH3KG8x7uQq7PEbTBsS827M8/3MMvZ7L2106GPph4EZ43p/UeI5kj7SWRohPnTLfEcNc05
	Ut6mvkhVAOMK8JQxLGqA6iAMBBZgmdAYkOM8TlRjnqFZ6Cdc9l/LJMV8k7CY9o5GfLiZzxiLHDN
	Ogk0FKCxKjysuMo/GzmO9w9rFYEJy/yCOxqVuK6vPIzptYBjeV1VFdfDg9xjtE+rPSWfohqCZIy
	Mcox0b+WjpvpMImKnKd5+562xyRsXcsltdS+p2MwsnYf0/oPGb9rHsO+IB0J7fIkRn4V7lZJjKI
	uRDU+3mP0waTgpIk/ZQAS9LudJ/cE8gvOKuo58ryi8UpUxbbcwVmFoV4Ow1mU63s0Mh9YymvcOg
	d/7Iys0uqip2mdmgrmCY8WGAQM+DhNiMOPbRH4NefPXIaUNQPfGC3rJRH6q+7XMgw7r8PXJWZJs
	Od4slxCnJXVfNXk
X-Received: by 2002:a05:600c:19c8:b0:483:709e:f238 with SMTP id 5b1f17b1804b1-488d68ab2ccmr29223425e9.29.1775814265467;
        Fri, 10 Apr 2026 02:44:25 -0700 (PDT)
Received: from localhost (2a01cb001331aa00bcd4fc1a1ff2417c.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bcd4:fc1a:1ff2:417c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5cfd7d4sm24174415e9.0.2026.04.10.02.44.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 02:44:24 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Apr 2026 11:44:24 +0200
Message-Id: <DHPDMAYQ3JM8.3MDZOUUD9PA02@smile.fr>
Subject: Re: [OE-core] [whinlatter][PATCH 1/9] dtc: backport fix for build
 with glibc-2.43
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>, "Mathieu Dubois-Briand"
 <mathieu.dubois-briand@bootlin.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
To: "Martin Jansa" <martin.jansa@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260409152839.2894434-1-martin.jansa@gmail.com>
 <DHOV6DD1DEG9.2REH24GS0QYC3@smile.fr>
 <CA+chaQdA95XBr+n+-Zm2dE9sxFiaAjhthSpGvP-g+N60yj=MJQ@mail.gmail.com>
 <DHPB0K1HXR2T.1N8T3183RMIUJ@smile.fr>
 <CA+chaQcHomAk3+9-aJ5vKgnNE_q8EtacTMSv8v1Ns8n1gA0xPw@mail.gmail.com>
 <DHPDA3LTW9U8.2AC8TDM9LDC0L@smile.fr>
 <CA+chaQfMPZ3266azx2veSiK4nwXDXMQ_i4RoiKQuKicaU-L0Jw@mail.gmail.com>
In-Reply-To: <CA+chaQfMPZ3266azx2veSiK4nwXDXMQ_i4RoiKQuKicaU-L0Jw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 09:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235003

On Fri Apr 10, 2026 at 11:39 AM CEST, Martin Jansa wrote:
> On Fri, Apr 10, 2026 at 11:28=E2=80=AFAM Yoann Congal <yoann.congal@smile=
.fr> wrote:
>>
>> On Fri Apr 10, 2026 at 11:09 AM CEST, Martin Jansa wrote:
>> > On Fri, Apr 10, 2026 at 9:42=E2=80=AFAM Yoann Congal <yoann.congal@smi=
le.fr> wrote:
>> >>
>> >> On Thu Apr 9, 2026 at 11:29 PM CEST, Martin Jansa wrote:
>> >> > On Thu, Apr 9, 2026 at 9:17=E2=80=AFPM Yoann Congal <yoann.congal@s=
mile.fr> wrote:
>> >> >>
>> >> >> On Thu Apr 9, 2026 at 5:28 PM CEST, Martin Jansa via lists.openemb=
edded.org wrote:
>> >> >> > From: Martin Jansa <martin.jansa@gmail.com>
>> >> >> >
>> >> >> > glibc-2.43 isn't used in OE builds yet, but this fixes dtc-nativ=
e:
>> >> >> > https://errors.yoctoproject.org/Errors/Details/903983/
>> >> >> >
>> >> >> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c: In function =E2=80=98=
overlay_fixup_phandle=E2=80=99:
>> >> >> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:424:21: error: assignm=
ent discards =E2=80=98const=E2=80=99 qualifier from pointer target type [-W=
error=3Ddiscarded-qualifiers]
>> >> >> >   424 |                 sep =3D memchr(fixup_str, ':', fixup_len=
);
>> >> >> >       |                     ^
>> >> >> > ../sources/dtc-1.7.2/libfdt/fdt_overlay.c:434:21: error: assignm=
ent discards =E2=80=98const=E2=80=99 qualifier from pointer target type [-W=
error=3Ddiscarded-qualifiers]
>> >> >> >   434 |                 sep =3D memchr(name, ':', fixup_len);
>> >> >> >       |                     ^
>> >> >> > cc1: all warnings being treated as errors
>> >> >> >
>> >> >> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
>> >> >> > Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@boot=
lin.com>
>> >> >> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.or=
g>
>> >> >> > ---
>> >> >>
>> >> >> Hello,
>> >> >>
>> >> >> I've started a whinlatter bringup build on the new Ubuntu 26.04 wo=
rker
>> >> >> with this series applied:
>> >> >> https://autobuilder.yoctoproject.org/valkyrie/#/builders/96/builds=
/23
>> >> >>
>> >> >> It got 2 errors (Other errors are most likely consequences of thes=
e ones):
>> >> >>
>> >> >> ERROR: shadow-native-4.18.0-r0 do_configure: configure failed:
>> >> >> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/96/build=
s/23/steps/12/logs/stdio line 6269:
>> >> >> | checking for crypt in -lcrypt... no
>> >> >> | configure: error: crypt() not found
>> >> >> | NOTE: The following config.log files may provide further informa=
tion.
>> >> >> | NOTE: /srv/pokybuild/yocto-worker/bringup/build/build/tmp/work/x=
86_64-linux/shadow-native/4.18.0/build/config.log
>> >> >> | ERROR: configure failed
>> >> >> | WARNING: exit code 1 from a shell command.
>> >> >> NOTE: recipe shadow-native-4.18.0-r0: task do_configure: Failed
>> >> >
>> >> > Hello,
>> >> >
>> >> > for shadow please read
>> >> > https://lists.openembedded.org/g/openembedded-core/message/234119 t=
he
>> >> > important part:
>> >> > "libcrypt-dev is no longer installed as a dependency in my minimal =
docker image"
>> >> > I guess it's now missing on your ubuntu-26.04 host as well.
>> >> > It used to be typically installed by build-essential -> libc6-dev -=
>
>> >> > libcrypt-dev but not anymore since 2.42-7:
>> >> >
>> >> > 25.10 questing with 2.42-0ubuntu3.1:
>> >> > https://packages.ubuntu.com/questing/libc6-dev
>> >> > 26.04 resolute with 2.43-2ubuntu1:
>> >> > https://packages.ubuntu.com/resolute/libc6-dev
>> >> >
>> >> > https://changelogs.ubuntu.com/changelogs/pool/main/g/glibc/glibc_2.=
43-2ubuntu1/changelog:
>> >> > ...
>> >> > glibc (2.42-7) unstable; urgency=3Dmedium
>> >> >
>> >> >   [ Aurelien Jarno ]
>> >> >   * debian/control.in/libc, debian/rules.d/debhelper.mk: drop libcr=
ypt-dev
>> >> >     dependency from libc6-dev. Thanks to Helmut Grohne for proposin=
g that,
>> >> >     doing an archive rebuild and filling the bug reports.
>> >> >   * debian/control.in/main, debian/sysdeps/linux.mk: enable SystemT=
ap static
>> >> >     probes.
>> >> >   * debian/debhelper.in/libc-dev.NEWS: add a NEWS entry about the r=
emoval of
>> >> >     the obsolete termio interface.  Closes: #1124068.
>> >> >   * debian/rules.d/debhelper.mk: ensure that linker scripts work ev=
en when
>> >> >     /usr is unmerged.  Closes: #1120508
>> >> >   * debian/debhelper.in/libc-dev{,-alt}.lintian-overrides,
>> >> >     source/lintian-overrides, rules.d/debhelper.mk, salsa-ci.yml: d=
rop
>> >> >     unpack-message-for-{orig,source} overrides, fixed in lintian 2.=
128.0.
>> >> >   * debian/control.in/main: drop Rules-Requires-Root: no, this is n=
ow the
>> >> >     default.
>> >> >   * debian/libc6.symbols.i386, debian/libc6-i386.symbols.{amd64,x32=
}: remove
>> >> >     the workaround for GLIBC_ABI_GNU_TLS.  Closes: #1122038.
>> >> >   * debian/control.in/{libc,i386}: ensure that libdpkg-perl is fixe=
d wrt
>> >> >     GLIBC_ABI_GNU_TLS.
>> >> >
>> >> >  -- Aurelien Jarno <aurel32@debian.org>  Sun, 04 Jan 2026 10:07:24 =
+0100
>> >> > ...
>> >>
>> >> Hello,
>> >>
>> >> In that case, shouldn't we remove "virtual/crypt-native" from ASSUME_=
PROVIDED?
>> >> https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake=
.conf#n232
>> >>
>> >> I've tried it but then libxcrypt-native fails to build with:
>> >> | ../sources/libxcrypt-4.4.38/lib/crypt-gost-yescrypt.c: In function =
=E2=80=98_crypt_crypt_gost_yescrypt_rn=E2=80=99:
>> >> | ../sources/libxcrypt-4.4.38/lib/crypt-gost-yescrypt.c:134:16: error=
: initialization discards =E2=80=98const=E2=80=99 qualifier from pointer ta=
rget type [-Werror=3Ddiscarded-qualifiers]
>> >> |   134 |   char *hptr =3D strchr ((const char *) intbuf->retval + 3,=
 '$');
>> >> |       |                ^~~~~~
>> >> | cc1: all warnings being treated as errors
>> >>
>> >> It looks like the fixes for that are on master but the patches don't
>> >> apply.
>> >>
>> >> Can you send an update series with those fixes?
>> >
>> >
>> > Patches for building libxcrypt-native? I still see
>> > virtual/crypt-native in ASSUME_PROVIDED in master, that's why I've
>> > added libcrypt-dev into the ubuntu-26.04 image at least until the same
>> > is resolved in wrynose/master. The same issue is in current master.
>>
>> (Sorry, our mails crossed)
>>
>> I discussed that with Paul. He suggested to add libcrypt-dev as a host
>> dependency instead (ie. what you describe). I agree (sorry about the
>> sudden change of heart).
>>
>> Can you send the yocto-docs patch to do this?
>
> Yes, done:
> https://lists.yoctoproject.org/g/docs/message/9213

Awesome, thanks!
Next, I will ask helpdesk to install libcrypt-dev on the ubuntu 26.04
worker and start the build with the added patch=20
"virglrenderer: Fix build with glibc 2.43+"

--=20
Yoann Congal
Smile ECS


