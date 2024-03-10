Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800E4C54E58
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 12:31:32 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.34443.1710073887488612475
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 05:31:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OHjsqT34;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: max.oss.09@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-513a81b717cso138787e87.0
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 05:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710073885; x=1710678685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FsCBuKY54g6yQWpyoQQidwGQlcGSw+rrJ0yTU6NXMYE=;
        b=OHjsqT349Hl8XQt4bsCRzAf0CWeOmWgifL3OUyZm/jPst5Mmt89zS38pHUJCAiBG0A
         BRz9vfLt550YBd9hSW1UuaaGEGRgjFWGmdRJnzOUmnItNAgGvk+5PC4g3SOpZIJzeKuP
         3OfocKxIRU3PpJaTKpe5IX0eOcKoxyeGsiPQ+47LJ2gXudGJcXq8LPDt00KrVWBSukVu
         PKZF5w7cxhOz14wQxwot3941h1Tl0saPX5uM21PWOTbAZr1jlhW8BJ5dNcX39nyI4dn6
         mV9CmHYe9jXMJZCszXLfXA30ihhIcWCAkjJ1yoAC4g5hbCI7gbh1Wi26D4eRqjIQiZnz
         oU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710073885; x=1710678685;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FsCBuKY54g6yQWpyoQQidwGQlcGSw+rrJ0yTU6NXMYE=;
        b=h+GGD5KbYIw+e0DhBw/eNNvygNUVKadWKqUaOr5pdxc9Kp6RbIPl+j1R5ALNrrI4fS
         SbajNbZap4COP0vJgPZi0Sa8j6JyhLcjXIFJe9YUEzZsEywPSCAuKHxZ9XamLcLom7Wx
         K6xzWldR+Amhb66816V1ORSM16XIP4WU00lSuFOfyS0dS36UVcdJwvOPxxIRriNoCPY5
         xkd/Vnjo1vsokdKhZActvKDtgUYTiwx1y58CstYtpF3AN5zXzEwu1CQYgCso0o/sZ6lN
         Q+8OebMlFu9Fo/dLCp+AjGdAxB+Y5wOHSj9IiTC9DenrhYcMZIAzmD++HNpHKprrgt+S
         NSjg==
X-Gm-Message-State: AOJu0YxbP4v+oGRUTCnmDUeLD0ZXq06aZDAO1a/iwwHBvzO1At7QuvI9
	aFoiX7DUCC4cdOW4AVoawLRlnzbbF/DVs0iqO7TmgClbs8tgbSz8
X-Google-Smtp-Source: AGHT+IHw5P6Hx/guT3JFjFvgxFi4oXiOU9WoTGr0c/CsPp1zR4bTSLQP8xlftrhT77KEXV5r3vsjKA==
X-Received: by 2002:ac2:4189:0:b0:513:8368:7aac with SMTP id z9-20020ac24189000000b0051383687aacmr2444743lfh.26.1710073885060;
        Sun, 10 Mar 2024 05:31:25 -0700 (PDT)
Received: from [192.168.0.7] ([194.191.226.159])
        by smtp.googlemail.com with ESMTPSA id jx24-20020a170907761800b00a45fefe57d5sm1807353ejc.96.2024.03.10.05.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 05:31:24 -0700 (PDT)
Message-ID: <d3359086952367d978a794500c474a472e6bc1cb.camel@gmail.com>
Subject: Re: [OE-core] [REGRESSION] linux (git/curl-native) and autorev
From: Max <max.oss.09@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Richard Purdie
	 <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, Max Krummenacher
	 <max.krummenacher@toradex.com>
Date: Sun, 10 Mar 2024 13:31:24 +0100
In-Reply-To: <CADkTA4PBJDhGub=P0JbuhKHj0d2tXt8kx2SXDyvXRy6c2M7iww@mail.gmail.com>
References: <20240309175750.2621579-1-max.oss.09@gmail.com>
	 <CADkTA4PBJDhGub=P0JbuhKHj0d2tXt8kx2SXDyvXRy6c2M7iww@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 12:31:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196881

Am Samstag, dem 09.03.2024 um 13:04 -0800 schrieb Bruce Ashfield:
> On Sat, Mar 9, 2024 at 12:58=E2=80=AFPM <max.oss.09@gmail.com> wrote:
> >=20
> > From: Max Krummenacher <max.krummenacher@toradex.com>
> >=20
> > Hello
> >=20
> > If one builds a kernel using AUTOREV invoking bitbake only works once.
> > Any subsequent bitbake invocation fails parsing the meta data.
> >=20
> > Reproducable with:
> > - latest poky, b5624ee564
> > - Kernel with SRCREV =3D "AUTOREV", e.g. in local.conf
> >   `SRCREV_machine:pn-linux-yocto:forcevariable =3D "${AUTOREV}"`
> > - bitbake virtual/kernel; bitbake virtual/kernel
> >=20
> > On the second invocation parsing fails when the fetcher tries to
> > evaluate the latest SRCREV:
> >=20
> > > ERROR: ExpansionError during parsing meta/recipes-kernel/linux/linux-=
yocto_6.6.bb
> > > Traceback (most recent call last):
> > >   File "bitbake/lib/bb/fetch2/__init__.py", line 1245, in srcrev_inte=
rnal_helper(ud=3D<bb.fetch2.FetchData object at 0x7f8e26f5f290>, d=3D<bb.da=
ta_smart.DataSmart object at 0x7f8e26195890>, name=3D'machine'):
> > >              d.setVar("__BBAUTOREV_ACTED_UPON", True)
> > >     >        srcrev =3D ud.method.latest_revision(ud, d, name)
> > >=20
> > >   File "bitbake/lib/bb/fetch2/__init__.py", line 1667, in Git.latest_=
revision(ud=3D<bb.fetch2.FetchData object at 0x7f8e26f5f290>, d=3D<bb.data_=
smart.DataSmart object at 0x7f8e26195890>, name=3D'machine'):
> > >              except KeyError:
> > >     >            revs[key] =3D rev =3D self._latest_revision(ud, d, n=
ame)
> > >                  return rev
> > >   File "bitbake/lib/bb/fetch2/git.py", line 850, in Git._latest_revis=
ion(ud=3D<bb.fetch2.FetchData object at 0x7f8e26f5f290>, d=3D<bb.data_smart=
.DataSmart object at 0x7f8e26195890>, name=3D'machine'):
> > >=20
> > >     >        output =3D self._lsremote(ud, d, "")
> > >              # Tags of the form ^{} may not work, need to fallback to=
 other form
> > >   File "bitbake/lib/bb/fetch2/git.py", line 833, in Git._lsremote(ud=
=3D<bb.fetch2.FetchData object at 0x7f8e26f5f290>, d=3D<bb.data_smart.DataS=
mart object at 0x7f8e26195890>, search=3D''):
> > >                      bb.fetch2.check_network_access(d, cmd, repourl)
> > >     >            output =3D runfetchcmd(cmd, d, True)
> > >                  if not output:
> > >   File "bitbake/lib/bb/fetch2/__init__.py", line 957, in runfetchcmd(=
cmd=3D'export PSEUDO_DISABLED=3D1; export DBUS_SESSION_BUS_ADDRESS=3D"unix:=
path=3D/run/user/1003/bus"; export PATH=3D"build/tmp/sysroots-uninative/x86=
_64-linux/usr/bin:scripts:build/tmp/work/qemux86_64-poky-linux/linux-yocto/=
6.6.20+git/recipe-sysroot-native/usr/bin/x86_64-poky-linux:build/tmp/work/q=
emux86_64-poky-linux/linux-yocto/6.6.20+git/recipe-sysroot/usr/bin/crossscr=
ipts:build/tmp/work/qemux86_64-poky-linux/linux-yocto/6.6.20+git/recipe-sys=
root-native/usr/sbin:build/tmp/work/qemux86_64-poky-linux/linux-yocto/6.6.2=
0+git/recipe-sysroot-native/usr/bin:build/tmp/work/qemux86_64-poky-linux/li=
nux-yocto/6.6.20+git/recipe-sysroot-native/sbin:build/tmp/work/qemux86_64-p=
oky-linux/linux-yocto/6.6.20+git/recipe-sysroot-native/bin:bitbake/bin:buil=
d/tmp/hosttools"; export HOME=3D"/home/krm"; git -c gc.autoDetach=3Dfalse -=
c core.pager=3Dcat -c safe.bareRepository=3Dall ls-remote https://git.yocto=
project.org/linux-yocto.git ', d=3D<bb.data_smart.DataSmart object at 0x7f8=
e26195890>, quiet=3DTrue, cleanup=3D[], log=3DNone, workdir=3DNone):
> > >=20
> > >     >        raise FetchError(error_message)
> > >=20
> > > bb.data_smart.ExpansionError: Failure expanding variable fetcher_hash=
es_dummyfunc[vardepvalue], expression was ${@bb.fetch.get_hashvalue(d)} whi=
ch triggered exception FetchError: Fetcher failure: Fetch command export PS=
EUDO_DISABLED=3D1; export DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/run/user=
/1003/bus"; export PATH=3D"build/tmp/sysroots-uninative/x86_64-linux/usr/bi=
n:scripts:/var/home/krm/build/poky/build/tmp/work/qemux86_64-poky-linux/lin=
ux-yocto/6.6.20+git/recipe-sysroot-native/usr/bin/x86_64-poky-linux:build/t=
mp/work/qemux86_64-poky-linux/linux-yocto/6.6.20+git/recipe-sysroot/usr/bin=
/crossscripts:build/tmp/work/qemux86_64-poky-linux/linux-yocto/6.6.20+git/r=
ecipe-sysroot-native/usr/sbin:build/tmp/work/qemux86_64-poky-linux/linux-yo=
cto/6.6.20+git/recipe-sysroot-native/usr/bin:build/tmp/work/qemux86_64-poky=
-linux/linux-yocto/6.6.20+git/recipe-sysroot-native/sbin:build/tmp/work/qem=
ux86_64-poky-linux/linux-yocto/6.6.20+git/recipe-sysroot-native/bin:bitbake=
/bin:build/tmp/hosttools"; export HOME=3D"/home/krm"; git -c gc.autoDetach=
=3Dfalse -c core.pager=3Dcat -c safe.bareRepository=3Dall ls-remote https:/=
/git.yoctoproject.org/linux-yocto.git  failed with exit code 128, output:
> > > fatal: unable to access 'https://git.yoctoproject.org/linux-yocto.git=
/': error setting certificate file: build/tmp/work/x86_64-linux/curl-native=
/8.6.0/recipe-sysroot-native/etc/ssl/certs/ca-certificates.crt
> > >=20
> > > The variable dependency chain for the failure is: fetcher_hashes_dumm=
yfunc[vardepvalue]
> >=20
> > Note:
> > One gets out of that parser error by deleting the git binary in the
> > kernel's work recipe-sysroot-native
> > `rm tmp/work/qemux86_64-poky-linux/linux-yocto/6.6.20+git/recipe-sysroo=
t-native/usr/bin/git`
> >=20
> > Bisecting poky leads to commit
> > f7fa98cca8 ("kern-tools: depend on git-replacement-native")
> > Reverting it on top of b5624ee564 makes the parsing pass.
> >=20
> > I assume that `git-replacement-native` does not work with https, the
> > fetch error also goes away if changing in SRC_URI from https to git.
> >=20
> > Any comments?
>=20
> I didn't even know that curl was coming into play :)
>=20
> Adding DEPENDS:class-native +=3D "ca-certificates" to the curl recipe
> should resolve the issue.

Looks like curl-native resp. libcurl hardcodes the lookup to its own
work directory, i.e.:
x86_64-linux/curl-native/8.6.0/recipe-sysroot-native/etc/ssl/certs/ca-certi=
ficates.crt

So even if DEPENDS/RDEPENDS will install ca-certificates in the kernel's
recipe-sysroot-native the parsing will fail if the curl-native directory
is not/no longer populated, e.g. because curl-native came from sstate or
rm_work is in INHERIT.

Max

>=20
> I also tried exporting the SSL_CERT_DIR in the git-native wrapper, but
> that didn't help
> since of course it is curl that is looking for the certs.
>=20
> I also thought we could export the SSL_CERT_DIR from within the
> kern-tools, but really,
> it does seem like curl should know that this is a dependency when used
> as a native
> tool (it already has ca-certficates as a RRECOMMENDS).
>=20
> I haven't done a patch for it, because the intricacies of the native
> classes and where
> we should actually add that depends is someone lost on me.
>=20
> Richard will likely know the right place to fix it .. and then I'm
> happy to spin a patch.
>=20
> Bruce
>=20
> >=20
> > Cheers
> > Max
>=20
>=20
>=20
>=20
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196873): https://lists.openembedded.org/g/openembedde=
d-core/message/196873
> Mute This Topic: https://lists.openembedded.org/mt/104831542/3617484
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
x.oss.09@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


