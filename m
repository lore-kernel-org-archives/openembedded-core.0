Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.529.1608561216092700262
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Dec 2020 06:33:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ln++ufJC;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id q22so13748053eja.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Dec 2020 06:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NgRqgbY40//JjiGfz7udEaHgYKF2lbPAG6fqwN8q/Ao=;
        b=ln++ufJCcvID1Zv3p7n5NY6yCnK144BNlXSWLaP6m3HZExgND95BXZibzo+SybIV38
         86ZnYF475xoMJqZCqISIiBiSo/Y26G0r2W4Rtsuusc1Nz/f2PYCuKk3UY5DGXqegbNak
         whKz8WK8NEOuuZnGI15juRyFxvA88fSr//X4y6SjZ+Qrl5yw1cDPTReKOZI8c43CO86W
         rByshBP/RjwGaPVS1rUvJ3SquajHIO2HE/6McaV1HNOjanCveOYvuiPP+eApaFc0OG20
         x+FU9I83pAI9xczbsUjK+BzLOTrxFUv2Uo+6/jkaW/Tnfa/0NIWTUOTzpO/DD8r52bGN
         84Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NgRqgbY40//JjiGfz7udEaHgYKF2lbPAG6fqwN8q/Ao=;
        b=RHpWhoMfWmkwS6hsrMc6+bTfLy4lJEgzjpj5u6lfQIpDOAVAeV3zvxohIjXy21KMbF
         y7iEZwzO7R2WlQN5uR7tXWUeimZiCD8RzY3tQit0hFKUr5XvZ7JThB0guz/mSeFP3EPP
         BanRa5oHIHj8HyQo+bp9OTzALrKWNDCtRmt34ICfJfGCDuWDa4D0HtTM8wXETV2QHhe6
         E6gBQ43d53WyrLPSdrlckF+A3o3/XHyBpDHilsAktPzUA7iZvXWsZ4+gS2mXTqu8yDVw
         0klqx/OwhjNrtpyl5uHvS6UXOJLHMowrZpTaMRxzV4/iWSWLi08gFJhoQAP+Yj/MQnjI
         1J3A==
X-Gm-Message-State: AOAM530hMc4xYwAOSioI6sSiyD8qos8ovB7JN9lbrgi1rhdlEuWhkmaN
	kA11WDs5wbbu5Hqdnp8VAOPNVBEADsvQOs+2Ejs=
X-Google-Smtp-Source: ABdhPJzs/ws9z2mRUgDpols2zLV/UxaryU4+CfrbZTCKcRzcVJi5/KkRbHNXll/9MsKbzQWDjHlHU/hRMtgQlHHuuZE=
X-Received: by 2002:a17:906:7f13:: with SMTP id d19mr15988071ejr.54.1608561214522;
 Mon, 21 Dec 2020 06:33:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1607007208.git.steve@sakoman.com>
In-Reply-To: <cover.1607007208.git.steve@sakoman.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 21 Dec 2020 15:33:23 +0100
Message-ID: <CA+chaQeEFu6++N5J2qkEjU9HZPqjAahuDVGZAcfsma-9zjDLZw@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/28] Patch review - pseudo file mode corruption fix series
To: Steve Sakoman <steve@sakoman.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ca88c705b6fa5737"

--000000000000ca88c705b6fa5737
Content-Type: text/plain; charset="UTF-8"

Just curious, is this PR on hold or rejected completely?

I don't have strong opinion either way, I was just wondering about this one
when other newer PRs were already merged.

On Thu, Dec 3, 2020 at 4:08 PM Steve Sakoman <steve@sakoman.com> wrote:

> Issues with undetected file mode corruption in pseudo have been identified.
>
> Fixes have been merged into master and gatesgarth over the past couple of
> months and
> things seem to have stabilized enough that we can consider backporting
> these fixes
> to dunfell.
>
> This is a somewhat more invasive change than normal. Specifically the user
> will
> be required to clean TMPDIR after this merge. It may also expose issues
> with
> other layers, though master and gategarth have probably helped to pave the
> way for
> this change.
>
> Personally I think that this fixes a serious enough issue that we should
> consider
> this series for dunfell.
>
> Please have comments back by Monday morning.
>
> The following changes since commit
> 071806feb195961e59069f778c9ae8f27a739d9a:
>
>   e2fsprogs: Fix a ptest permissions determinism issue (2020-11-30
> 12:05:57 -1000)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
>
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut
>
> Jacob Kroon (1):
>   bitbake.conf: Remove TERM from default BB_HASHBASE_WHITELIST
>
> Joe Slater (1):
>   pseudo: fix renaming to self
>
> Martin Jansa (1):
>   base.bbclass: use os.path.normpath instead of just comparing WORKDIR
>     and S as strings
>
> Mingli Yu (2):
>   tcl: adapt to potential pseudo changes
>   bitbake.conf: Exclude ${CCACHE_DIR} from pseudo database
>
> Ricardo Ribalda Delgado (3):
>   wic: Fix permissions when using exclude or include path
>   wic: Fix multi images .wks with bitbake
>   wic: Avoid creating invalid pseudo directory
>
> Richard Purdie (19):
>   pseudo: Switch to oe-core branch in git repo
>   pseudo: merge in fixes for setfacl issue
>   pseudo: Update to add OFC fcntl lock updates
>   pseudo: Ignore mismatched inodes from the db
>   pseudo: Add support for ignoring paths from the pseudo DB
>   pseudo: Abort on mismatch patch
>   psuedo: Add tracking of linked files for fds
>   pseudo: Fix xattr segfault
>   pseudo: Add may unlink patch
>   pseudo: Add pathfix patch
>   base/bitbake.conf: Enable pseudo path filtering
>   wic: Handle new PSEUDO_IGNORE_PATHS variable
>   pseudo: Fix statx function usage
>   bitbake.conf: Extend PSEUDO_IGNORE_PATHS to ${COREBASE}/meta
>   abi_version,sanity: Tell users TMPDIR must be clean after pseudo
>     changes
>   pseudo: Update to account for patches merged on branch
>   pseudo: Upgrade to include mkostemp64 wrapper
>   oeqa/selftest/runtime_test: Exclude gpg directory from pseudo database
>   uninative: Don't use single sstate for pseudo-native
>
> Ross Burton (1):
>   devtool: remove unused variable
>
>  meta/classes/archiver.bbclass                 |   2 +-
>  meta/classes/base.bbclass                     |   6 +
>  meta/classes/image_types_wic.bbclass          |  12 +-
>  meta/classes/populate_sdk_base.bbclass        |   2 +
>  meta/classes/sanity.bbclass                   |   3 +
>  meta/classes/sstate.bbclass                   |   4 +
>  meta/conf/abi_version.conf                    |   2 +-
>  meta/conf/bitbake.conf                        |  13 +-
>  meta/lib/oe/sstatesig.py                      |   4 +-
>  meta/lib/oeqa/selftest/cases/runtime_test.py  |   1 +
>  .../pseudo/files/0001-Add-statx.patch         | 106 --------------
>  ...001-maketables-wrappers-use-Python-3.patch |  34 -----
>  ...ixup-remove-files-that-do-not-exist-.patch |  49 -------
>  .../0001-pseudo_ipc.h-Fix-enum-typedef.patch  |  31 ----
>  ...1-realpath.c-Remove-trailing-slashes.patch |  57 --------
>  ...xattr-adjust-for-attr-2.4.48-release.patch |  48 ------
>  .../pseudo/files/moreretries.patch            |  19 ---
>  .../pseudo/files/seccomp.patch                | 137 ------------------
>  .../pseudo/files/toomanyfiles.patch           |  71 ---------
>  .../pseudo/files/xattr_version.patch          |  54 -------
>  meta/recipes-devtools/pseudo/pseudo_git.bb    |  14 +-
>  meta/recipes-devtools/tcltk/tcl_8.6.10.bb     |   1 +
>  scripts/lib/devtool/standard.py               |   1 -
>  scripts/lib/wic/partition.py                  |  23 +--
>  scripts/lib/wic/plugins/source/rootfs.py      |  37 ++++-
>  scripts/postinst-intercepts/update_font_cache |   2 +
>  26 files changed, 89 insertions(+), 644 deletions(-)
>  delete mode 100644 meta/recipes-devtools/pseudo/files/0001-Add-statx.patch
>  delete mode 100644
> meta/recipes-devtools/pseudo/files/0001-maketables-wrappers-use-Python-3.patch
>  delete mode 100644
> meta/recipes-devtools/pseudo/files/0001-pseudo-On-a-DB-fixup-remove-files-that-do-not-exist-.patch
>  delete mode 100644
> meta/recipes-devtools/pseudo/files/0001-pseudo_ipc.h-Fix-enum-typedef.patch
>  delete mode 100644
> meta/recipes-devtools/pseudo/files/0001-realpath.c-Remove-trailing-slashes.patch
>  delete mode 100644
> meta/recipes-devtools/pseudo/files/0006-xattr-adjust-for-attr-2.4.48-release.patch
>  delete mode 100644 meta/recipes-devtools/pseudo/files/moreretries.patch
>  delete mode 100644 meta/recipes-devtools/pseudo/files/seccomp.patch
>  delete mode 100644 meta/recipes-devtools/pseudo/files/toomanyfiles.patch
>  delete mode 100644 meta/recipes-devtools/pseudo/files/xattr_version.patch
>
> --
> 2.17.1
>
>
> 
>
>

--000000000000ca88c705b6fa5737
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Just curious, is this PR on hold or rejected completely?<d=
iv><br></div><div>I don&#39;t have strong opinion either way, I was just wo=
ndering about this one when other newer PRs were already merged.</div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Th=
u, Dec 3, 2020 at 4:08 PM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman=
.com">steve@sakoman.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">Issues with undetected file mode corruption in pseud=
o have been identified.<br>
<br>
Fixes have been merged into master and gatesgarth over the past couple of =
months and<br>
things seem to have stabilized enough that we can consider backporting the=
se fixes<br>
to dunfell.<br>
<br>
This is a somewhat more invasive change than normal. Specifically the user=
 will<br>
be required to clean TMPDIR after this merge. It may also expose issues wi=
th<br>
other layers, though master and gategarth have probably helped to pave the=
 way for<br>
this change.<br>
<br>
Personally I think that this fixes a serious enough issue that we should c=
onsider<br>
this series for dunfell.<br>
<br>
Please have comments back by Monday morning.<br>
<br>
The following changes since commit 071806feb195961e59069f778c9ae8f27a739d9=
a:<br>
<br>
=C2=A0 e2fsprogs: Fix a ptest permissions determinism issue (2020-11-30 12=
:05:57 -1000)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/openembedded-core-cont=
rib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/openembedded=
-core-contrib</a> stable/dunfell-nut<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/openembedded-core-contrib/l=
og/?h=3Dstable/dunfell-nut" rel=3D"noreferrer" target=3D"_blank">http://cgi=
t.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/dunfell-nut</a=
><br>
<br>
Jacob Kroon (1):<br>
=C2=A0 bitbake.conf: Remove TERM from default BB_HASHBASE_WHITELIST<br>
<br>
Joe Slater (1):<br>
=C2=A0 pseudo: fix renaming to self<br>
<br>
Martin Jansa (1):<br>
=C2=A0 base.bbclass: use os.path.normpath instead of just comparing WORKDI=
R<br>
=C2=A0 =C2=A0 and S as strings<br>
<br>
Mingli Yu (2):<br>
=C2=A0 tcl: adapt to potential pseudo changes<br>
=C2=A0 bitbake.conf: Exclude ${CCACHE_DIR} from pseudo database<br>
<br>
Ricardo Ribalda Delgado (3):<br>
=C2=A0 wic: Fix permissions when using exclude or include path<br>
=C2=A0 wic: Fix multi images .wks with bitbake<br>
=C2=A0 wic: Avoid creating invalid pseudo directory<br>
<br>
Richard Purdie (19):<br>
=C2=A0 pseudo: Switch to oe-core branch in git repo<br>
=C2=A0 pseudo: merge in fixes for setfacl issue<br>
=C2=A0 pseudo: Update to add OFC fcntl lock updates<br>
=C2=A0 pseudo: Ignore mismatched inodes from the db<br>
=C2=A0 pseudo: Add support for ignoring paths from the pseudo DB<br>
=C2=A0 pseudo: Abort on mismatch patch<br>
=C2=A0 psuedo: Add tracking of linked files for fds<br>
=C2=A0 pseudo: Fix xattr segfault<br>
=C2=A0 pseudo: Add may unlink patch<br>
=C2=A0 pseudo: Add pathfix patch<br>
=C2=A0 base/bitbake.conf: Enable pseudo path filtering<br>
=C2=A0 wic: Handle new PSEUDO_IGNORE_PATHS variable<br>
=C2=A0 pseudo: Fix statx function usage<br>
=C2=A0 bitbake.conf: Extend PSEUDO_IGNORE_PATHS to ${COREBASE}/meta<br>
=C2=A0 abi_version,sanity: Tell users TMPDIR must be clean after pseudo<br=
>
=C2=A0 =C2=A0 changes<br>
=C2=A0 pseudo: Update to account for patches merged on branch<br>
=C2=A0 pseudo: Upgrade to include mkostemp64 wrapper<br>
=C2=A0 oeqa/selftest/runtime_test: Exclude gpg directory from pseudo datab=
ase<br>
=C2=A0 uninative: Don&#39;t use single sstate for pseudo-native<br>
<br>
Ross Burton (1):<br>
=C2=A0 devtool: remove unused variable<br>
<br>
=C2=A0meta/classes/archiver.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0meta/classes/base.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +<br>
=C2=A0meta/classes/image_types_wic.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 12 +-<br>
=C2=A0meta/classes/populate_sdk_base.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +<br>
=C2=A0meta/classes/sanity.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0meta/classes/sstate.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +<br>
=C2=A0meta/conf/abi_version.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
=C2=A0meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 13 +-<br>
=C2=A0meta/lib/oe/sstatesig.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0meta/lib/oeqa/selftest/cases/runtime_test.py=C2=A0 |=C2=A0 =C2=A01 +=
<br>
=C2=A0.../pseudo/files/0001-Add-statx.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0| 106 --------------<br>
=C2=A0...001-maketables-wrappers-use-Python-3.patch |=C2=A0 34 -----<br>
=C2=A0...ixup-remove-files-that-do-not-exist-.patch |=C2=A0 49 -------<br>
=C2=A0.../0001-pseudo_ipc.h-Fix-enum-typedef.patch=C2=A0 |=C2=A0 31 ----<b=
r>
=C2=A0...1-realpath.c-Remove-trailing-slashes.patch |=C2=A0 57 --------<br=
>
=C2=A0...xattr-adjust-for-attr-2.4.48-release.patch |=C2=A0 48 ------<br>
=C2=A0.../pseudo/files/moreretries.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 19 ---<br>
=C2=A0.../pseudo/files/seccomp.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 | 137 ------------------<br>
=C2=A0.../pseudo/files/toomanyfiles.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 71 ---------<br>
=C2=A0.../pseudo/files/xattr_version.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 54 -------<br>
=C2=A0meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_git.bb" rel=3D=
"noreferrer" target=3D"_blank">pseudo_git.bb</a>=C2=A0 =C2=A0 |=C2=A0 14 +-=
<br>
=C2=A0meta/recipes-devtools/tcltk/<a href=3D"http://tcl_8.6.10.bb" rel=3D"=
noreferrer" target=3D"_blank">tcl_8.6.10.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=
=C2=A01 +<br>
=C2=A0scripts/lib/devtool/standard.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 -<br>
=C2=A0scripts/lib/wic/partition.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 23 +--<br>
=C2=A0scripts/lib/wic/plugins/source/rootfs.py=C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 37 ++++-<br>
=C2=A0scripts/postinst-intercepts/update_font_cache |=C2=A0 =C2=A02 +<br>
=C2=A026 files changed, 89 insertions(+), 644 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/pseudo/files/0001-Add-statx=
.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/pseudo/files/0001-maketable=
s-wrappers-use-Python-3.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo-On=
-a-DB-fixup-remove-files-that-do-not-exist-.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/pseudo/files/0001-pseudo_ip=
c.h-Fix-enum-typedef.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/pseudo/files/0001-realpath.=
c-Remove-trailing-slashes.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/pseudo/files/0006-xattr-adj=
ust-for-attr-2.4.48-release.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/pseudo/files/moreretries.pa=
tch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/pseudo/files/seccomp.patch<=
br>
=C2=A0delete mode 100644 meta/recipes-devtools/pseudo/files/toomanyfiles.p=
atch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/pseudo/files/xattr_version.=
patch<br>
<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000ca88c705b6fa5737--
