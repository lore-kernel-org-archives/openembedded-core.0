Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.6993.1610539571993417746
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jan 2021 04:06:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nxP9EsP9;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id f4so2696533ejx.7
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Jan 2021 04:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9fWVf734t1Q/GXPNuTa5YpptgVFsuKM9kuBnJNKLrQg=;
        b=nxP9EsP9QCEhyCpKMOKg4NJwQHm+w9ipx229tgp/AeV7PYe7CnMOvnscmaEpe2Rm/W
         M/MAF9mPD2hzJnlTyFiHNqU8/EmR5ws5AELv+mT6BXMrcR1SqwFxz/lZZh6Mg8+gLbiB
         W0Pgj73XKkIghoABxDX37Spc4WYQfDwO2P+XfLvUdfLWK6QKtw1OQ/JkEw+2VyKymAmc
         AM5y/uZ92j+EkDyX49IEygh7CD5T66p8jwoUtfoX6vW7kVIA/jjjxlnSh3F9QpTr1wkU
         z24vMKYvfiE/67NzxKu61k6wXpSz48cL1cb+E6J3SqD81aVjUSAUgCDO2E9SjeUAeZp5
         vJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9fWVf734t1Q/GXPNuTa5YpptgVFsuKM9kuBnJNKLrQg=;
        b=be62t7zkeCZz0AJXnuYe4DILWzkQGbE/m7P6TCa6zQ5GSbidh3R10wxZfOf7BwSMgC
         DvQnz+NN0WuN7vbFmt/dzO6ThktWuIVQ0ZEikruHbmIkvB0Avys3k97mqdAgAxI0S/mK
         CKCDpo3Hfbb4RBtvpCz7DNzpyUKsmYPmX/Mh70OSNhdmpq2LkUYNtuortWy7kjdI8+e2
         8TLl98iIOJF1dc0Z+ODyXFSL7QUhQDSfg5fWYOye6EjF6TNpWnQGi60p5IlZgrqwQPoH
         e2iNdigWTE0mAKKF6+6v99iayC7VtcegzFwfBIa55FIuvrxeY9P5cSNjFBDbp/Zzh2rM
         z2mQ==
X-Gm-Message-State: AOAM532t0DcUBts+1u1a7DIfuHx9svZWyXaZJbLBeki+gO4iPZOL7XJQ
	iny80GwhHuirvkSsQ3eZLfDMxzB5B71e01WUzE0=
X-Google-Smtp-Source: ABdhPJxTpvqVH8GtsJNSHOy9F8g7ey3+fIb9tRyRXaDGKxhH94zujDrypPRvwHAY/zRmNP4hmUZ6QNoCkqz/1ViaBa4=
X-Received: by 2002:a17:906:94d2:: with SMTP id d18mr1348037ejy.94.1610539570529;
 Wed, 13 Jan 2021 04:06:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1610079278.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1610079278.git.anuj.mittal@intel.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 13 Jan 2021 13:05:59 +0100
Message-ID: <CA+chaQdLVfrbn0ir0OCrE_3U2h92kLWU0Ktb3kw5xBWwgDamcA@mail.gmail.com>
Subject: Re: [OE-core] [gatesgarth][PATCH 00/30] patch review request
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ff8f6805b8c6f634"

--000000000000ff8f6805b8c6f634
Content-Type: text/plain; charset="UTF-8"

There is one pseudo related change missing in this pull:
https://git.openembedded.org/openembedded-core/commit/?id=39423a33595e7ade82fc88f55823660f8532cb84

I'll send cherry-pick to gatesgarth shortly.

On Fri, Jan 8, 2021 at 5:18 AM Anuj Mittal <anuj.mittal@intel.com> wrote:

> Please review these changes for gatesgarth. Builds cleanly on
> autobuilder.
>
> Thanks,
>
> Anuj
>
> The following changes since commit
> a2eebe92daf0e0fb11422ea17f7029aeab2bcb9e:
>
>   apr-util: Only specify --with-dbm=gdbm if gdbm support is enabled
> (2020-12-28 09:53:26 +0800)
>
> are available in the Git repository at:
>
>   git://push.openembedded.org/openembedded-core-contrib anujm/gatesgarth
>
> Alexander Kanavin (1):
>   devtool: gitsm:// should be handled same as git:// in upgrades
>
> Bruce Ashfield (8):
>   linux-yocto/cfg: qemuppc: set CONFIG_SCSI to '=y'
>   linux-yocto/5.4: update to v5.4.82
>   linux-yocto/cfg: qemuarm64-gfx.cfg: add CONFIG_INPUT_UINPUT
>   linux-yocto/5.4: update to v5.4.83
>   linux-yocto/5.8/cfg: fix -tiny warnings
>   linux-yocto/5.4/cfg: fix -tiny warnings
>   linux-yocto/5.4/cfg: fix FIRMWARE_LOADER warnings
>   linux-yocto/5.4: update to v5.4.85
>
> Changqing Li (1):
>   libexif: fix CVE-2020-0198; CVE-2020-0452
>
> Khem Raj (1):
>   initscripts: use quotes for shell variable comparision
>
> Lee Chee Yang (2):
>   glib-2.0: fix CVE-2020-35457
>   wic/direct/kparser: ensure fsuuid for vfat and msdos align with format
>
> Li Wang (2):
>   qemu: CVE-2020-25723
>   qemu: CVE-2020-28916
>
> Nathan Rossi (1):
>   coreutils: enable xattrs by default for nativesdk
>
> Ovidiu Panait (2):
>   timezone: upgrade to 2020e
>   timezone: upgrade to 2020f
>
> Paul Barker (1):
>   bitbake.conf: Prevent pyc file generation in pseudo context
>
> Peter Kjellerstedt (3):
>   lib/oe/path: Add canonicalize()
>   bitbake.conf: Canonicalize paths in PSEUDO_IGNORE_PATHS
>   wic: Pass canonicalized paths in PSEUDO_IGNORE_PATHS
>
> Richard Purdie (3):
>   grub: Further reproducibility fix
>   man-db: Fix reproducibility issue
>   oeqa/commands: Ensure sync can be found regardless of PATH
>
> Robert Joslyn (1):
>   openssl: Update to 1.1.1i
>
> Ross Burton (1):
>   diffstat: point the license checksum at the license
>
> Scott Murray (2):
>   grub: fix "CVE:" line in one of the patches
>   patch: fix CVE-2019-20633
>
> Steve Sakoman (1):
>   oeqa/selftest/cases/devtool.py: fix typo in ignore_patterns call
>
>  meta-selftest/lib/pseudo_pyc_test1.py         |  1 +
>  meta-selftest/lib/pseudo_pyc_test2.py         |  1 +
>  .../pseudo-pyc-test/pseudo-pyc-test.bb        | 15 +++++
>  meta/conf/bitbake.conf                        |  6 +-
>  meta/lib/oe/path.py                           | 21 ++++++
>  meta/lib/oeqa/selftest/cases/devtool.py       |  2 +-
>  meta/lib/oeqa/selftest/cases/pseudo.py        | 27 ++++++++
>  meta/lib/oeqa/utils/commands.py               |  3 +
>  ...low-checking-primitives-where-we-do-.patch |  2 +-
>  meta/recipes-bsp/grub/files/determinism.patch | 16 +++++
>  .../{openssl_1.1.1g.bb => openssl_1.1.1i.bb}  |  2 +-
>  meta/recipes-core/coreutils/coreutils_8.32.bb |  3 +
>  .../glib-2.0/glib-2.0/CVE-2020-35457.patch    | 41 ++++++++++++
>  meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb |  1 +
>  .../initscripts/initscripts-1.0/checkroot.sh  |  2 +-
>  .../diffstat/diffstat_1.63.bb                 |  4 +-
>  .../patch/patch/CVE-2019-20633.patch          | 31 +++++++++
>  meta/recipes-devtools/patch/patch_2.7.6.bb    |  1 +
>  meta/recipes-devtools/qemu/qemu.inc           |  2 +
>  .../qemu/qemu/CVE-2020-25723.patch            | 51 ++++++++++++++
>  .../qemu/qemu/CVE-2020-28916.patch            | 49 ++++++++++++++
>  meta/recipes-extended/man-db/man-db_2.9.3.bb  |  1 +
>  meta/recipes-extended/timezone/timezone.inc   |  6 +-
>  .../linux/linux-yocto-rt_5.4.bb               |  6 +-
>  .../linux/linux-yocto-rt_5.8.bb               |  2 +-
>  .../linux/linux-yocto-tiny_5.4.bb             |  8 +--
>  .../linux/linux-yocto-tiny_5.8.bb             |  2 +-
>  meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++----
>  meta/recipes-kernel/linux/linux-yocto_5.8.bb  |  2 +-
>  .../libexif/files/CVE-2020-0198.patch         | 66 +++++++++++++++++++
>  .../libexif/files/CVE-2020-0452.patch         | 39 +++++++++++
>  .../recipes-support/libexif/libexif_0.6.22.bb |  2 +
>  scripts/lib/devtool/upgrade.py                |  4 +-
>  scripts/lib/wic/ksparser.py                   | 17 +++++
>  scripts/lib/wic/partition.py                  | 12 +++-
>  scripts/lib/wic/plugins/imager/direct.py      |  7 ++
>  36 files changed, 440 insertions(+), 37 deletions(-)
>  create mode 100644 meta-selftest/lib/pseudo_pyc_test1.py
>  create mode 100644 meta-selftest/lib/pseudo_pyc_test2.py
>  create mode 100644 meta-selftest/recipes-test/pseudo-pyc-test/
> pseudo-pyc-test.bb
>  create mode 100644 meta/lib/oeqa/selftest/cases/pseudo.py
>  rename meta/recipes-connectivity/openssl/{openssl_1.1.1g.bb =>
> openssl_1.1.1i.bb} (98%)
>  create mode 100644
> meta/recipes-core/glib-2.0/glib-2.0/CVE-2020-35457.patch
>  create mode 100644 meta/recipes-devtools/patch/patch/CVE-2019-20633.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-25723.patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-28916.patch
>  create mode 100644 meta/recipes-support/libexif/files/CVE-2020-0198.patch
>  create mode 100644 meta/recipes-support/libexif/files/CVE-2020-0452.patch
>
> --
> 2.29.2
>
>
> 
>
>

--000000000000ff8f6805b8c6f634
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">There is one pseudo related change missing in this pull:<d=
iv><a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D3=
9423a33595e7ade82fc88f55823660f8532cb84">https://git.openembedded.org/opene=
mbedded-core/commit/?id=3D39423a33595e7ade82fc88f55823660f8532cb84</a><br><=
/div><div><br></div><div>I&#39;ll send cherry-pick to gatesgarth shortly.</=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Fri, Jan 8, 2021 at 5:18 AM Anuj Mittal &lt;<a href=3D"mailto:anuj.m=
ittal@intel.com">anuj.mittal@intel.com</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Please review these changes for gates=
garth. Builds cleanly on<br>
autobuilder.<br>
<br>
Thanks,<br>
<br>
Anuj<br>
<br>
The following changes since commit a2eebe92daf0e0fb11422ea17f7029aeab2bcb9=
e:<br>
<br>
=C2=A0 apr-util: Only specify --with-dbm=3Dgdbm if gdbm support is enabled=
 (2020-12-28 09:53:26 +0800)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://push.openembedded.org/openembedded-core-con=
trib" rel=3D"noreferrer" target=3D"_blank">push.openembedded.org/openembedd=
ed-core-contrib</a> anujm/gatesgarth<br>
<br>
Alexander Kanavin (1):<br>
=C2=A0 devtool: gitsm:// should be handled same as git:// in upgrades<br>
<br>
Bruce Ashfield (8):<br>
=C2=A0 linux-yocto/cfg: qemuppc: set CONFIG_SCSI to &#39;=3Dy&#39;<br>
=C2=A0 linux-yocto/5.4: update to v5.4.82<br>
=C2=A0 linux-yocto/cfg: qemuarm64-gfx.cfg: add CONFIG_INPUT_UINPUT<br>
=C2=A0 linux-yocto/5.4: update to v5.4.83<br>
=C2=A0 linux-yocto/5.8/cfg: fix -tiny warnings<br>
=C2=A0 linux-yocto/5.4/cfg: fix -tiny warnings<br>
=C2=A0 linux-yocto/5.4/cfg: fix FIRMWARE_LOADER warnings<br>
=C2=A0 linux-yocto/5.4: update to v5.4.85<br>
<br>
Changqing Li (1):<br>
=C2=A0 libexif: fix CVE-2020-0198; CVE-2020-0452<br>
<br>
Khem Raj (1):<br>
=C2=A0 initscripts: use quotes for shell variable comparision<br>
<br>
Lee Chee Yang (2):<br>
=C2=A0 glib-2.0: fix CVE-2020-35457<br>
=C2=A0 wic/direct/kparser: ensure fsuuid for vfat and msdos align with for=
mat<br>
<br>
Li Wang (2):<br>
=C2=A0 qemu: CVE-2020-25723<br>
=C2=A0 qemu: CVE-2020-28916<br>
<br>
Nathan Rossi (1):<br>
=C2=A0 coreutils: enable xattrs by default for nativesdk<br>
<br>
Ovidiu Panait (2):<br>
=C2=A0 timezone: upgrade to 2020e<br>
=C2=A0 timezone: upgrade to 2020f<br>
<br>
Paul Barker (1):<br>
=C2=A0 bitbake.conf: Prevent pyc file generation in pseudo context<br>
<br>
Peter Kjellerstedt (3):<br>
=C2=A0 lib/oe/path: Add canonicalize()<br>
=C2=A0 bitbake.conf: Canonicalize paths in PSEUDO_IGNORE_PATHS<br>
=C2=A0 wic: Pass canonicalized paths in PSEUDO_IGNORE_PATHS<br>
<br>
Richard Purdie (3):<br>
=C2=A0 grub: Further reproducibility fix<br>
=C2=A0 man-db: Fix reproducibility issue<br>
=C2=A0 oeqa/commands: Ensure sync can be found regardless of PATH<br>
<br>
Robert Joslyn (1):<br>
=C2=A0 openssl: Update to 1.1.1i<br>
<br>
Ross Burton (1):<br>
=C2=A0 diffstat: point the license checksum at the license<br>
<br>
Scott Murray (2):<br>
=C2=A0 grub: fix &quot;CVE:&quot; line in one of the patches<br>
=C2=A0 patch: fix CVE-2019-20633<br>
<br>
Steve Sakoman (1):<br>
=C2=A0 oeqa/selftest/cases/devtool.py: fix typo in ignore_patterns call<br=
>
<br>
=C2=A0meta-selftest/lib/pseudo_pyc_test1.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0|=C2=A0 1 +<br>
=C2=A0meta-selftest/lib/pseudo_pyc_test2.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0|=C2=A0 1 +<br>
=C2=A0.../pseudo-pyc-test/<a href=3D"http://pseudo-pyc-test.bb" rel=3D"nor=
eferrer" target=3D"_blank">pseudo-pyc-test.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 15 +++++<br>
=C2=A0meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 6 +-<br>
=C2=A0meta/lib/oe/path.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 21 ++++++<br>
=C2=A0meta/lib/oeqa/selftest/cases/devtool.py=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 2 +-<br>
=C2=A0meta/lib/oeqa/selftest/cases/pseudo.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
27 ++++++++<br>
=C2=A0meta/lib/oeqa/utils/commands.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +<br>
=C2=A0...low-checking-primitives-where-we-do-.patch |=C2=A0 2 +-<br>
=C2=A0meta/recipes-bsp/grub/files/determinism.patch | 16 +++++<br>
=C2=A0.../{<a href=3D"http://openssl_1.1.1g.bb" rel=3D"noreferrer" target=
=3D"_blank">openssl_1.1.1g.bb</a> =3D&gt; <a href=3D"http://openssl_1.1.1i=
.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1i.bb</a>}=C2=A0 |=C2=
=
=A0 2 +-<br>
=C2=A0meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.32.bb" rel=
=
=3D"noreferrer" target=3D"_blank">coreutils_8.32.bb</a> |=C2=A0 3 +<br>
=C2=A0.../glib-2.0/glib-2.0/CVE-2020-35457.patch=C2=A0 =C2=A0 | 41 +++++++=
+++++<br>
=C2=A0meta/recipes-core/glib-2.0/<a href=3D"http://glib-2.0_2.64.5.bb" rel=
=
=3D"noreferrer" target=3D"_blank">glib-2.0_2.64.5.bb</a> |=C2=A0 1 +<br>
=C2=A0.../initscripts/initscripts-1.0/checkroot.sh=C2=A0 |=C2=A0 2 +-<br>
=C2=A0.../diffstat/<a href=3D"http://diffstat_1.63.bb" rel=3D"noreferrer" =
target=3D"_blank">diffstat_1.63.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 +-<br>
=C2=A0.../patch/patch/CVE-2019-20633.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 31 +++++++++<br>
=C2=A0meta/recipes-devtools/patch/<a href=3D"http://patch_2.7.6.bb" rel=3D=
"noreferrer" target=3D"_blank">patch_2.7.6.bb</a>=C2=A0 =C2=A0 |=C2=A0 1 +<=
br>
=C2=A0meta/recipes-devtools/qemu/qemu.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 +<br>
=C2=A0.../qemu/qemu/CVE-2020-25723.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 51 ++++++++++++++<br>
=C2=A0.../qemu/qemu/CVE-2020-28916.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 | 49 ++++++++++++++<br>
=C2=A0meta/recipes-extended/man-db/<a href=3D"http://man-db_2.9.3.bb" rel=
=3D"noreferrer" target=3D"_blank">man-db_2.9.3.bb</a>=C2=A0 |=C2=A0 1 +<br=
>
=C2=A0meta/recipes-extended/timezone/timezone.inc=C2=A0 =C2=A0|=C2=A0 6 +-=
<br>
=C2=A0.../linux/<a href=3D"http://linux-yocto-rt_5.4.bb" rel=3D"noreferrer=
" target=3D"_blank">linux-yocto-rt_5.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +-<br>
=C2=A0.../linux/<a href=3D"http://linux-yocto-rt_5.8.bb" rel=3D"noreferrer=
" target=3D"_blank">linux-yocto-rt_5.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0.../linux/<a href=3D"http://linux-yocto-tiny_5.4.bb" rel=3D"noreferr=
er" target=3D"_blank">linux-yocto-tiny_5.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 +--<br>
=C2=A0.../linux/<a href=3D"http://linux-yocto-tiny_5.8.bb" rel=3D"noreferr=
er" target=3D"_blank">linux-yocto-tiny_5.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.4.bb</a>=C2=A0 | 22 +++---=
-<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.8.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.8.bb</a>=C2=A0 |=C2=A0 2 +=
-<br>
=C2=A0.../libexif/files/CVE-2020-0198.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0| 66 +++++++++++++++++++<br>
=C2=A0.../libexif/files/CVE-2020-0452.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0| 39 +++++++++++<br>
=C2=A0.../recipes-support/libexif/<a href=3D"http://libexif_0.6.22.bb" rel=
=
=3D"noreferrer" target=3D"_blank">libexif_0.6.22.bb</a> |=C2=A0 2 +<br>
=C2=A0scripts/lib/devtool/upgrade.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 |=C2=A0 4 +-<br>
=C2=A0scripts/lib/wic/ksparser.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 17 +++++<br>
=C2=A0scripts/lib/wic/partition.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 12 +++-<br>
=C2=A0scripts/lib/wic/plugins/imager/direct.py=C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 7 ++<br>
=C2=A036 files changed, 440 insertions(+), 37 deletions(-)<br>
=C2=A0create mode 100644 meta-selftest/lib/pseudo_pyc_test1.py<br>
=C2=A0create mode 100644 meta-selftest/lib/pseudo_pyc_test2.py<br>
=C2=A0create mode 100644 meta-selftest/recipes-test/pseudo-pyc-test/<a hre=
f=3D"http://pseudo-pyc-test.bb" rel=3D"noreferrer" target=3D"_blank">pseudo=
-pyc-test.bb</a><br>
=C2=A0create mode 100644 meta/lib/oeqa/selftest/cases/pseudo.py<br>
=C2=A0rename meta/recipes-connectivity/openssl/{<a href=3D"http://openssl_=
1.1.1g.bb" rel=3D"noreferrer" target=3D"_blank">openssl_1.1.1g.bb</a> =3D&g=
t; <a href=3D"http://openssl_1.1.1i.bb" rel=3D"noreferrer" target=3D"_blank=
">openssl_1.1.1i.bb</a>} (98%)<br>
=C2=A0create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2020-3545=
7.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/patch/patch/CVE-2019-20633.=
patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-25723.pa=
tch<br>
=C2=A0create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-28916.pa=
tch<br>
=C2=A0create mode 100644 meta/recipes-support/libexif/files/CVE-2020-0198.=
patch<br>
=C2=A0create mode 100644 meta/recipes-support/libexif/files/CVE-2020-0452.=
patch<br>
<br>
-- <br>
2.29.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000ff8f6805b8c6f634--
