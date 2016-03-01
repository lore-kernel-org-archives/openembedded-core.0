Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 136C5731D9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 13:39:06 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id y8so20085469igp.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2016 05:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BDNsmz2/HmP8vUFtsJlQTXxbhYbm04D1jmqqYXC3VIk=;
	b=MxTlz9bCVlz+xkmvR5exMLQavMIO9zEodSSrsryd3Myfl6up26ccSkncoEu4ztJ/L8
	hmaZ0SQjLE9/047eAYDdzes/LSn91D6ZgPlk3A0wqEI0lMtV5KpgZpTjEWpqoAEK7D1F
	EAEz1LaVY4tyMlJgbUif6D2Wq/KteZ8T3KUFY5ddZgLPHLxPr8Yy7FmU5xaBsyXeuiQy
	a9nW+O+IFZNNEu4d4nMqRu8jovPGs16+Ge4VcTOlHZF098N8ad2sULo2TcALOQ988psh
	gifrrnErEzbwojoboiiu658+r/voWIi6f/dnafe3/G+daWApNUO6JLKMWG1IKmUSisvP
	d+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BDNsmz2/HmP8vUFtsJlQTXxbhYbm04D1jmqqYXC3VIk=;
	b=DvJXCTnjC/c1FhyOap6MqDXLD9ViTPpj2g46NKMtWBtweNI+mA8F1vYyRPCujVtZee
	BXTWdLFBAsmlOYoaYQcZh+ddzbNIoAqh2JR4HT64XHKQigK32CfVi5TgrIumvv7omTeC
	B60qv6DL0FMnEIPVyTzb2WoAiIItIJZgGpU6tNncs5Tyb9ywTQHFobimmjwrlLypo4Pt
	SpBbNadXMLwpi767ahSIt+1lf9OsZQo6FNtJasMF/VKddCBFCQwk2T47cYwvUG28zF/q
	Q6BQyN4PM1BVlN9iJ7M85lTGmZAZsF/625QM9k6L0S+DXbOy7DAEsfUVeC48pJ8f/FEB
	pN9w==
X-Gm-Message-State: AD7BkJIEplB4UL/YZISLcaIJ3efHW6JgeA5x0Xgg1WnmnZyUJx8XF35TwqOGpAhl49NrhuXVC63VGdr13jSP9GUi
X-Received: by 10.50.160.11 with SMTP id xg11mr398336igb.52.1456839546865;
	Tue, 01 Mar 2016 05:39:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 1 Mar 2016 05:38:47 -0800 (PST)
In-Reply-To: <cover.1456805147.git.mark.hatle@windriver.com>
References: <cover.1456805147.git.mark.hatle@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 1 Mar 2016 13:38:47 +0000
Message-ID: <CAJTo0LZTCidmPn6ewUPmu60s0ettwL_e2wZfWUJWd6=2kG2j=w@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Upgrade RPM to 5.4.16 (CVE HEAD)
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
X-List-Received-Date: Tue, 01 Mar 2016 13:39:07 -0000
Content-Type: multipart/alternative; boundary=001a1135e238afa7dd052cfce3ef

--001a1135e238afa7dd052cfce3ef
Content-Type: text/plain; charset=UTF-8

Sorry Mark...

http://errors.yoctoproject.org/Errors/Details/38890/:

/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x86-64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-rpm/5.4.16-r0/build/popt/.libs/libpopt.so:
undefined reference to `__stack_chk_guard'

I'm also seeing likely related errors locally (where I've enabled security
flags) when linking librpmio.so

|
/data/poky-master/tmp-glibc/sysroots/intel-corei7-64/usr/lib/libc_nonshared.a(elf-init.oS):
In function `__libc_csu_init':
| /usr/src/glibc/csu/elf-init.c:87: undefined reference to
`__init_array_start'
|
/data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/5.3.0/ld:
/data/poky-master/tmp-glibc/sysroots/intel-corei7-64/usr/lib/libc_nonshared.a(elf-init.oS):
relocation R_X86_64_PC32 against undefined hidden symbol
`__init_array_start' can not be used when making a shared object
|
/data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/5.3.0/ld:
final link failed: Bad value

I can share full logs if you'd like.

Ross

On 1 March 2016 at 04:14, Mark Hatle <mark.hatle@windriver.com> wrote:

> V3:
> * Update rpm-db5-or-db6.patch to remove potential host contamination
> * Update rpm-disable-auto-stack-protector.patch to only disable the stack
> protector
> * Add new patch: rpm-atomic-ops.patch
>   - Disable atomic operations in bson when the architecture does not
> support them
> * Add new patch: rpm-gnu-atomic.patch
>   - Dynamically detect and disable when -fgnu-tm/libitm support is not
> available
> * Add new patch: rpm-tagname-type.patch and rpm-python-tagname.patch
>   - Fix rpm-python legacy API regressions
> * Add new patch: rpm-disable-blaketest.patch
>   - Disable building the blake test apps, they appear to have dep issues
> in large
>     parallel builds.
> * Update db-6.0.30 to make it clear that when it is updated, to also
> update RPM5.
>
> V2:
> Fixed three issues
> - Added Apache 2.0 license for specific mongodb code
>
> - Switch SSE usage dynamically in rpmio/keccak.c
>   See rpm-keccak-sse-intrin.patch
>
> - Add support for architectures that do not support sync_add_and_fetch_8
>   See rpm-atomic-ops.patch
>
> All of those changes are made in patch 1/3.
>
> This has been built for all of the qemu* BSPs.
>
> V1:
> There is not yet an official RPM 5.4.16 release, however one will be coming
> soon.  Until then, 4 distinct patches are used to upgrade RPM 5.4.15 to
> 5.4.16.  These patches are part of the commit (compressed w/ .xz).  However
> I am not sending them as part of the email as it's not very interesting
> to review base64.  :P
>
> Many of the OE patches have been sent to the RPM 5 maintainer, and may be
> part of the official 5.4.16 release.  When that release happens I expect a
> simple rebase to remove the unnecessary patches.
>
> The following changes since commit
> 390bad905537820f49add855c95d726b5b55c8fa:
>
>   sanity: Fix int verses string reference (2016-02-28 22:54:06 +0000)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib mhatle/rpm-5.4.16
>
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=mhatle/rpm-5.4.16
>
> Mark Hatle (5):
>   rpm: Uprev to rpm-5.4.16 (pre) and rpm-5.4+cvs to current CVS head
>   rpm: Enable specific crypto and digest settings via variables
>   rpm: A number of the patches have been submitted upstream
>   gcc: Add support for atomic opertions (libitm) where available
>   db: remove the NO_UPDATE_REASON and replace it a comment about RPM
>
>  meta/lib/oe/package_manager.py                     |   14 +-
>  meta/recipes-devtools/gcc/gcc-5.3.inc              |    2 +
>  meta/recipes-devtools/gcc/gcc-runtime.inc          |   22 +-
>  .../rpm/rpm/0001-define-EM_AARCH64.patch           |    2 +-
>  ...arseArgvString-to-parse-the-_gpg_check_pa.patch |    2 +-
>  .../rpm/rpm/beecrypt-5.4.15-to-5.4.16.patch.gz     |  Bin 0 -> 42815 bytes
>  meta/recipes-devtools/rpm/rpm/debugedit-segv.patch |   48 +-
>  ...debugedit-valid-file-to-fix-segment-fault.patch |    2 +-
>  .../rpm/rpm/fstack-protector-configure-check.patch |   21 -
>  .../rpm/rpm/header-include-fix.patch               |   12 +-
>  .../rpm/rpm/lua-5.4.15-to-5.4.16.patch.gz          |  Bin 0 -> 269940
> bytes
>  .../rpm/rpm/makefile-am-exec-hook.patch            |    2 +-
>  .../rpm/rpm/python-rpm-rpmsense.patch              |   32 +-
>  .../rpm/rpm/rpm-5.4.15-to-5.4.16.patch.gz          |  Bin 0 -> 2239384
> bytes
>  meta/recipes-devtools/rpm/rpm/rpm-atomic-ops.patch |   73 ++
>  meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch  |    2 +-
>  meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch |   43 +-
>  meta/recipes-devtools/rpm/rpm/rpm-db60.patch       |   56 +
>  .../rpm/rpm/rpm-disable-Wno-override-init.patch    |   32 -
>  .../rpm/rpm/rpm-disable-auto-stack-protector.patch |   24 +
>  .../rpm/rpm/rpm-disable-blaketest.patch            |   28 +
>  .../rpm/rpm/rpm-fix-logio-cp.patch                 |    2 +-
>  .../rpm/rpm/rpm-fix-parseEmbedded.patch            |   27 +
>  meta/recipes-devtools/rpm/rpm/rpm-gnu-atomic.patch |   61 ++
>  .../rpm/rpm/rpm-hardlink-segfault-fix.patch        |    2 +-
>  .../rpm/rpm/rpm-keccak-sse-intrin.patch            |   27 +
>  ...ction.c-fix-file-conflicts-for-mips64-N32.patch |    2 +-
>  meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch |    2 +-
>  .../rpm/rpm/rpm-lsb-compatibility.patch            |    2 +-
>  .../rpm/rpm/rpm-lua-fix-print.patch                |  104 --
>  ...rpm-macros.in-disable-external-key-server.patch |   16 +-
>  .../rpm/rpm/rpm-mongodb-sasl.patch                 |   69 ++
>  meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch |    2 +-
>  ...b-before-verifyscript-to-avoid-null-point.patch |    2 +-
>  .../rpm/rpm/rpm-packageorigin.patch                |    2 +-
>  .../rpm/rpm/rpm-payload-use-hashed-inode.patch     |   22 +-
>  .../rpm/rpm/rpm-pkgconfigdeps.patch                |   10 +-
>  .../rpm/rpm/rpm-platform-file-fix.patch            |    2 +-
>  meta/recipes-devtools/rpm/rpm/rpm-platform.patch   |    2 +-
>  meta/recipes-devtools/rpm/rpm/rpm-platform2.patch  |    4 +-
>  meta/recipes-devtools/rpm/rpm/rpm-py-init.patch    |   16 +-
>  .../rpm/rpm/rpm-python-restore-origin.patch        |   49 +
>  .../rpm/rpm/rpm-python-tagname.patch               |   24 +
>  .../rpm/rpm/rpm-remove-sykcparse-decl.patch        |   14 -
>  meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch |    2 +-
>  .../rpm/rpm/rpm-rpmdb-grammar.patch                |  124 +++
>  .../rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch   |    2 +-
>  .../rpm/rpm/rpm-rpmio-headers.patch                |   19 +
>  meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch |   67 --
>  .../rpm/rpm/rpm-scriptletexechelper.patch          |   29 +-
>  .../rpm/rpm/rpm-syck-fix-gram.patch                | 1081
> ++++++++++++++++++++
>  .../rpm-tag-generate-endian-conversion-fix.patch   |    2 +-
>  .../rpm/rpm/rpm-tagname-type.patch                 |   25 +
>  .../rpm/rpm/rpm-tools-mtree-LDFLAGS.patch          |    2 +-
>  meta/recipes-devtools/rpm/rpm/rpmatch.patch        |   32 +-
>  .../recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch |   27 +-
>  .../rpm/rpm/syck-5.4.15-to-5.4.16.patch.gz         |  Bin 0 -> 4837 bytes
>  meta/recipes-devtools/rpm/rpm/uclibc-support.patch |   38 +-
>  ...broken-logic-for-ghost-avoidance-Mark-Hat.patch |   38 -
>  meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           |  294 +++++-
>  .../rpm/{rpm_5.4.14.bb => rpm_5.4.16.bb}           |  189 +++-
>  meta/recipes-support/db/db_6.0.30.bb               |    2 +-
>  62 files changed, 2284 insertions(+), 569 deletions(-)
>  create mode 100644
> meta/recipes-devtools/rpm/rpm/beecrypt-5.4.15-to-5.4.16.patch.gz
>  delete mode 100644
> meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch
>  create mode 100644
> meta/recipes-devtools/rpm/rpm/lua-5.4.15-to-5.4.16.patch.gz
>  create mode 100644
> meta/recipes-devtools/rpm/rpm/rpm-5.4.15-to-5.4.16.patch.gz
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-atomic-ops.patch
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-db60.patch
>  delete mode 100644
> meta/recipes-devtools/rpm/rpm/rpm-disable-Wno-override-init.patch
>  create mode 100644
> meta/recipes-devtools/rpm/rpm/rpm-disable-auto-stack-protector.patch
>  create mode 100644
> meta/recipes-devtools/rpm/rpm/rpm-disable-blaketest.patch
>  create mode 100644
> meta/recipes-devtools/rpm/rpm/rpm-fix-parseEmbedded.patch
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-gnu-atomic.patch
>  create mode 100644
> meta/recipes-devtools/rpm/rpm/rpm-keccak-sse-intrin.patch
>  delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lua-fix-print.patch
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-mongodb-sasl.patch
>  create mode 100644
> meta/recipes-devtools/rpm/rpm/rpm-python-restore-origin.patch
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-python-tagname.patch
>  delete mode 100644
> meta/recipes-devtools/rpm/rpm/rpm-remove-sykcparse-decl.patch
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmdb-grammar.patch
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmio-headers.patch
>  delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-syck-fix-gram.patch
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-tagname-type.patch
>  create mode 100644
> meta/recipes-devtools/rpm/rpm/syck-5.4.15-to-5.4.16.patch.gz
>  delete mode 100644
> meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch
>  rename meta/recipes-devtools/rpm/{rpm_5.4.14.bb => rpm_5.4.16.bb} (82%)
>
> --
> 2.5.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1135e238afa7dd052cfce3ef
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry Mark...<br><br><a href=3D"http://errors.yoctoproject=
.org/Errors/Details/38890/">http://errors.yoctoproject.org/Errors/Details/3=
8890/</a>:<br><br>/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-x8=
6-64/build/build/tmp/work/i686-nativesdk-pokysdk-linux/nativesdk-rpm/5.4.16=
-r0/build/popt/.libs/libpopt.so: undefined reference to `__stack_chk_guard&=
#39;<br><div><br></div><div>I&#39;m also seeing likely related errors local=
ly (where I&#39;ve enabled security flags) when linking librpmio.so</div><d=
iv><br></div><div><div>| /data/poky-master/tmp-glibc/sysroots/intel-corei7-=
64/usr/lib/libc_nonshared.a(elf-init.oS): In function `__libc_csu_init&#39;=
:</div><div>| /usr/src/glibc/csu/elf-init.c:87: undefined reference to `__i=
nit_array_start&#39;</div><div>| /data/poky-master/tmp-glibc/sysroots/x86_6=
4-linux/usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/5.3.0/ld: /data=
/poky-master/tmp-glibc/sysroots/intel-corei7-64/usr/lib/libc_nonshared.a(el=
f-init.oS): relocation R_X86_64_PC32 against undefined hidden symbol `__ini=
t_array_start&#39; can not be used when making a shared object</div><div>| =
/data/poky-master/tmp-glibc/sysroots/x86_64-linux/usr/libexec/x86_64-poky-l=
inux/gcc/x86_64-poky-linux/5.3.0/ld: final link failed: Bad value</div></di=
v><div><br></div><div>I can share full logs if you&#39;d like.</div><div><b=
r></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On 1 March 2016 at 04:14, Mark Hatle <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windri=
ver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">V3:<br>
* Update rpm-db5-or-db6.patch to remove potential host contamination<br>
* Update rpm-disable-auto-stack-protector.patch to only disable the stack p=
rotector<br>
* Add new patch: rpm-atomic-ops.patch<br>
=C2=A0 - Disable atomic operations in bson when the architecture does not s=
upport them<br>
* Add new patch: rpm-gnu-atomic.patch<br>
=C2=A0 - Dynamically detect and disable when -fgnu-tm/libitm support is not=
 available<br>
* Add new patch: rpm-tagname-type.patch and rpm-python-tagname.patch<br>
=C2=A0 - Fix rpm-python legacy API regressions<br>
* Add new patch: rpm-disable-blaketest.patch<br>
=C2=A0 - Disable building the blake test apps, they appear to have dep issu=
es in large<br>
=C2=A0 =C2=A0 parallel builds.<br>
* Update db-6.0.30 to make it clear that when it is updated, to also update=
 RPM5.<br>
<br>
V2:<br>
Fixed three issues<br>
- Added Apache 2.0 license for specific mongodb code<br>
<br>
- Switch SSE usage dynamically in rpmio/keccak.c<br>
=C2=A0 See rpm-keccak-sse-intrin.patch<br>
<br>
- Add support for architectures that do not support sync_add_and_fetch_8<br=
>
=C2=A0 See rpm-atomic-ops.patch<br>
<br>
All of those changes are made in patch 1/3.<br>
<br>
This has been built for all of the qemu* BSPs.<br>
<br>
V1:<br>
There is not yet an official RPM 5.4.16 release, however one will be coming=
<br>
soon.=C2=A0 Until then, 4 distinct patches are used to upgrade RPM 5.4.15 t=
o<br>
5.4.16.=C2=A0 These patches are part of the commit (compressed w/ .xz).=C2=
=A0 However<br>
I am not sending them as part of the email as it&#39;s not very interesting=
<br>
to review base64.=C2=A0 :P<br>
<br>
Many of the OE patches have been sent to the RPM 5 maintainer, and may be<b=
r>
part of the official 5.4.16 release.=C2=A0 When that release happens I expe=
ct a<br>
simple rebase to remove the unnecessary patches.<br>
<br>
The following changes since commit 390bad905537820f49add855c95d726b5b55c8fa=
:<br>
<br>
=C2=A0 sanity: Fix int verses string reference (2016-02-28 22:54:06 +0000)<=
br>
<br>
are available in the git repository at:<br>
<br>
=C2=A0 git://<a href=3D"http://git.openembedded.org/openembedded-core-contr=
ib" rel=3D"noreferrer" target=3D"_blank">git.openembedded.org/openembedded-=
core-contrib</a> mhatle/rpm-5.4.16<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/cgit.cgi/openembedded-core-c=
ontrib/log/?h=3Dmhatle/rpm-5.4.16" rel=3D"noreferrer" target=3D"_blank">htt=
p://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Dmhatl=
e/rpm-5.4.16</a><br>
<br>
Mark Hatle (5):<br>
=C2=A0 rpm: Uprev to rpm-5.4.16 (pre) and rpm-5.4+cvs to current CVS head<b=
r>
=C2=A0 rpm: Enable specific crypto and digest settings via variables<br>
=C2=A0 rpm: A number of the patches have been submitted upstream<br>
=C2=A0 gcc: Add support for atomic opertions (libitm) where available<br>
=C2=A0 db: remove the NO_UPDATE_REASON and replace it a comment about RPM<b=
r>
<br>
=C2=A0meta/lib/oe/package_manager.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A014 +-<br>
=C2=A0meta/recipes-devtools/gcc/gcc-5.3.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
=C2=A0meta/recipes-devtools/gcc/gcc-runtime.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A022 +-<br>
=C2=A0.../rpm/rpm/0001-define-EM_AARCH64.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
=C2=A0...arseArgvString-to-parse-the-_gpg_check_pa.patch |=C2=A0 =C2=A0 2 +=
-<br>
=C2=A0.../rpm/rpm/beecrypt-5.4.15-to-5.4.16.patch.gz=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 Bin 0 -&gt; 42815 bytes<br>
=C2=A0meta/recipes-devtools/rpm/rpm/debugedit-segv.patch |=C2=A0 =C2=A048 +=
-<br>
=C2=A0...debugedit-valid-file-to-fix-segment-fault.patch |=C2=A0 =C2=A0 2 +=
-<br>
=C2=A0.../rpm/rpm/fstack-protector-configure-check.patch |=C2=A0 =C2=A021 -=
<br>
=C2=A0.../rpm/rpm/header-include-fix.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A012 +-<br>
=C2=A0.../rpm/rpm/lua-5.4.15-to-5.4.16.patch.gz=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 Bin 0 -&gt; 269940 bytes<br>
=C2=A0.../rpm/rpm/makefile-am-exec-hook.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
=C2=A0.../rpm/rpm/python-rpm-rpmsense.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A032 +-<br>
=C2=A0.../rpm/rpm/rpm-5.4.15-to-5.4.16.patch.gz=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 Bin 0 -&gt; 2239384 bytes<br>
=C2=A0meta/recipes-devtools/rpm/rpm/rpm-atomic-ops.patch |=C2=A0 =C2=A073 +=
+<br>
=C2=A0meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch=C2=A0 |=C2=A0 =C2=
=A0 2 +-<br>
=C2=A0meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch |=C2=A0 =C2=A043 +=
-<br>
=C2=A0meta/recipes-devtools/rpm/rpm/rpm-db60.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A056 +<br>
=C2=A0.../rpm/rpm/rpm-disable-Wno-override-init.patch=C2=A0 =C2=A0 |=C2=A0 =
=C2=A032 -<br>
=C2=A0.../rpm/rpm/rpm-disable-auto-stack-protector.patch |=C2=A0 =C2=A024 +=
<br>
=C2=A0.../rpm/rpm/rpm-disable-blaketest.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A028 +<br>
=C2=A0.../rpm/rpm/rpm-fix-logio-cp.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
=C2=A0.../rpm/rpm/rpm-fix-parseEmbedded.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A027 +<br>
=C2=A0meta/recipes-devtools/rpm/rpm/rpm-gnu-atomic.patch |=C2=A0 =C2=A061 +=
+<br>
=C2=A0.../rpm/rpm/rpm-hardlink-segfault-fix.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 2 +-<br>
=C2=A0.../rpm/rpm/rpm-keccak-sse-intrin.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A027 +<br>
=C2=A0...ction.c-fix-file-conflicts-for-mips64-N32.patch |=C2=A0 =C2=A0 2 +=
-<br>
=C2=A0meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch |=C2=A0 =C2=A0 2 +=
-<br>
=C2=A0.../rpm/rpm/rpm-lsb-compatibility.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
=C2=A0.../rpm/rpm/rpm-lua-fix-print.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 104 --<br>
=C2=A0...rpm-macros.in-disable-external-key-server.patch |=C2=A0 =C2=A016 +=
-<br>
=C2=A0.../rpm/rpm/rpm-mongodb-sasl.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A069 ++<br>
=C2=A0meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch |=C2=A0 =C2=A0 2 +=
-<br>
=C2=A0...b-before-verifyscript-to-avoid-null-point.patch |=C2=A0 =C2=A0 2 +=
-<br>
=C2=A0.../rpm/rpm/rpm-packageorigin.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
=C2=A0.../rpm/rpm/rpm-payload-use-hashed-inode.patch=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A022 +-<br>
=C2=A0.../rpm/rpm/rpm-pkgconfigdeps.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A010 +-<br>
=C2=A0.../rpm/rpm/rpm-platform-file-fix.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/rpm/rpm/rpm-platform.patch=C2=A0 =C2=A0|=C2=A0 =
=C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/rpm/rpm/rpm-platform2.patch=C2=A0 |=C2=A0 =C2=
=A0 4 +-<br>
=C2=A0meta/recipes-devtools/rpm/rpm/rpm-py-init.patch=C2=A0 =C2=A0 |=C2=A0 =
=C2=A016 +-<br>
=C2=A0.../rpm/rpm/rpm-python-restore-origin.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A049 +<br>
=C2=A0.../rpm/rpm/rpm-python-tagname.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A024 +<br>
=C2=A0.../rpm/rpm/rpm-remove-sykcparse-decl.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A014 -<br>
=C2=A0meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch |=C2=A0 =C2=A0 2 +=
-<br>
=C2=A0.../rpm/rpm/rpm-rpmdb-grammar.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 124 +++<br>
=C2=A0.../rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch=C2=A0 =C2=A0|=C2=A0 =
=C2=A0 2 +-<br>
=C2=A0.../rpm/rpm/rpm-rpmio-headers.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A019 +<br>
=C2=A0meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch |=C2=A0 =C2=A067 -=
-<br>
=C2=A0.../rpm/rpm/rpm-scriptletexechelper.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A029 +-<br>
=C2=A0.../rpm/rpm/rpm-syck-fix-gram.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 1081 ++++++++++++++++++++<br>
=C2=A0.../rpm-tag-generate-endian-conversion-fix.patch=C2=A0 =C2=A0|=C2=A0 =
=C2=A0 2 +-<br>
=C2=A0.../rpm/rpm/rpm-tagname-type.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A025 +<br>
=C2=A0.../rpm/rpm/rpm-tools-mtree-LDFLAGS.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/rpm/rpm/rpmatch.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A032 +-<br>
=C2=A0.../recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch |=C2=A0 =C2=A027 +=
-<br>
=C2=A0.../rpm/rpm/syck-5.4.15-to-5.4.16.patch.gz=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 Bin 0 -&gt; 4837 bytes<br>
=C2=A0meta/recipes-devtools/rpm/rpm/uclibc-support.patch |=C2=A0 =C2=A038 +=
-<br>
=C2=A0...broken-logic-for-ghost-avoidance-Mark-Hat.patch |=C2=A0 =C2=A038 -=
<br>
=C2=A0meta/recipes-devtools/rpm/rpm_5.4+<a href=3D"http://cvs.bb" rel=3D"no=
referrer" target=3D"_blank">cvs.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 294 +++++-<br>
=C2=A0.../rpm/{<a href=3D"http://rpm_5.4.14.bb" rel=3D"noreferrer" target=
=3D"_blank">rpm_5.4.14.bb</a> =3D&gt; <a href=3D"http://rpm_5.4.16.bb" rel=
=3D"noreferrer" target=3D"_blank">rpm_5.4.16.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 189 +++-<br>
=C2=A0meta/recipes-support/db/<a href=3D"http://db_6.0.30.bb" rel=3D"norefe=
rrer" target=3D"_blank">db_6.0.30.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
=C2=A062 files changed, 2284 insertions(+), 569 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/beecrypt-5.4.15-to-5=
.4.16.patch.gz<br>
=C2=A0delete mode 100644 meta/recipes-devtools/rpm/rpm/fstack-protector-con=
figure-check.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/lua-5.4.15-to-5.4.16=
.patch.gz<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-5.4.15-to-5.4.16=
.patch.gz<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-atomic-ops.patch=
<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-db60.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-disable-Wno-over=
ride-init.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-disable-auto-sta=
ck-protector.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-disable-blaketes=
t.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-fix-parseEmbedde=
d.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-gnu-atomic.patch=
<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-keccak-sse-intri=
n.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lua-fix-print.pa=
tch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-mongodb-sasl.pat=
ch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-python-restore-o=
rigin.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-python-tagname.p=
atch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-remove-sykcparse=
-decl.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmdb-grammar.pa=
tch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmio-headers.pa=
tch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch=
<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-syck-fix-gram.pa=
tch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-tagname-type.pat=
ch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/syck-5.4.15-to-5.4.1=
6.patch.gz<br>
=C2=A0delete mode 100644 meta/recipes-devtools/rpm/rpm/verify-fix-broken-lo=
gic-for-ghost-avoidance-Mark-Hat.patch<br>
=C2=A0rename meta/recipes-devtools/rpm/{<a href=3D"http://rpm_5.4.14.bb" re=
l=3D"noreferrer" target=3D"_blank">rpm_5.4.14.bb</a> =3D&gt; <a href=3D"htt=
p://rpm_5.4.16.bb" rel=3D"noreferrer" target=3D"_blank">rpm_5.4.16.bb</a>} =
(82%)<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.5.0<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--001a1135e238afa7dd052cfce3ef--
