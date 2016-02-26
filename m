Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 19A7277499
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 23:11:47 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id xg9so44288639igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 15:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=A/mPB1VbCysQOy1Y72fQbsaeF4HEDLEz+aRl6wkJtQw=;
	b=ReFFBUycrjciZqIo6+73RKHJ/wui3jZn737rx8ViCsnJ2F/SHXWtGDFoMmFaJY0eTv
	IZXwUXx5scpP1HAGUjWBrBZJRP2AAIIUVlosEWqXWLEix00ylFYazAzHE3s5uPvnTx53
	Fy6jc78fGcTaWloYM1KdkRuKywL2EXBDPxDX7tLqrmWpLa+Jmzxd4lASCLrob/U0ugqC
	EC8i3ILz3Sr9fEqRAJmTDQP1mM62X7NfGKXdbO69pwI6j4J8ugeAiDRYJF8ubmyP+rLP
	0k933DsE0Oz2BK9gAYcKyDRBt9QBw1GF9hOSUJ1CPUAS820AClLmELNcRtVK//6tKCyu
	vrdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=A/mPB1VbCysQOy1Y72fQbsaeF4HEDLEz+aRl6wkJtQw=;
	b=Kchvit1IkKZ8acqfAaIvpWB8s9k0Fqx/gniJ5CuQEOB1T8TZch1UB12dGcnLDIJIvi
	fdAuLzrlvCyRGmtVUnDrhacKw0zTHQ5jtAlraxSdQLZOCxt39zz/RMLXqEdS/fbF7518
	1rc0JNtarZRbuiNsJYkW9taqE9ufFPwwOFzwjRX+h1G69oKc+0uWIG3W/DpwcFZDpJK3
	IJg4N/pK7f0+IKVU4dxRC3o6kv3N4UcR3Swi1wUMx6VIaK4fmErkl734Tngr7cgOxTvR
	LBTWae+YMiCH2ia+bEQWXCZNsjJExt4O81G462rr6AbyP330W7PJT1G5dG/ikXIdzJRK
	tW5Q==
X-Gm-Message-State: AD7BkJIqZVDIZl8tm0J+8ccm+AOCBN7A1kwL//4LZNfFiHWI8cMPkO/6F/oaSk9hyKfuti5uH5TS1rmjvYfeGUTC
X-Received: by 10.50.97.71 with SMTP id dy7mr427239igb.78.1456528308341; Fri,
	26 Feb 2016 15:11:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 26 Feb 2016 15:11:29 -0800 (PST)
In-Reply-To: <cover.1456456877.git.mark.hatle@windriver.com>
References: <cover.1456456877.git.mark.hatle@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Feb 2016 23:11:29 +0000
Message-ID: <CAJTo0LYDSo_oEMQEhHUWZEO2AGZ516JFevNH7oZ-yTKP_S8_sw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3 v2] Upgrade RPM 5 to 5.4.16 (CVS HEAD)
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
X-List-Received-Date: Fri, 26 Feb 2016 23:11:49 -0000
Content-Type: multipart/alternative; boundary=047d7b10cfc16caee4052cb46cda

--047d7b10cfc16caee4052cb46cda
Content-Type: text/plain; charset=UTF-8

Sorry Mark...

| In file included from ../../rpm-5.4.15/rpmio/rpmiotypes.h:8:0,
|                  from ../../rpm-5.4.15/rpmio/rpmsq.c:14:
| ../../rpm-5.4.15/rpmio/rpmsq.c: In function '_rpm_insque':
| ../../rpm-5.4.15/rpmio/rpmutil.h:115:30: error: '__transaction_atomic'
without transactional memory support enabled
|  #  define RPM_GNUC_TM_ATOMIC __transaction_atomic /* XXX [[outer]] */
|                               ^
| ../../rpm-5.4.15/rpmio/rpmsq.c:70:3: note: in expansion of macro
'RPM_GNUC_TM_ATOMIC'
|    RPM_GNUC_TM_ATOMIC {
|    ^
| ../../rpm-5.4.15/rpmio/rpmsq.c: In function '_rpm_remque':
| ../../rpm-5.4.15/rpmio/rpmutil.h:115:30: error: '__transaction_atomic'
without transactional memory support enabled
|  #  define RPM_GNUC_TM_ATOMIC __transaction_atomic /* XXX [[outer]] */
|                               ^
| ../../rpm-5.4.15/rpmio/rpmsq.c:81:3: note: in expansion of macro
'RPM_GNUC_TM_ATOMIC'
|    RPM_GNUC_TM_ATOMIC {
|    ^
| Makefile:2167: recipe for target 'rpmsq.lo' failed

on qemux86.

Ross

On 26 February 2016 at 03:28, Mark Hatle <mark.hatle@windriver.com> wrote:

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
> 205b446f3fc4a9885179a66a8dab9d81bcc63dca:
>
>   uclibc: Do not use immediate expansion operator (2016-02-22 20:42:34
> +0000)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib mhatle/rpm-5.4.16
>
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=mhatle/rpm-5.4.16
>
> Mark Hatle (3):
>   rpm: Uprev to rpm-5.4.16 (pre) and rpm-5.4+cvs to current CVS head
>   rpm: Enable specific crypto and digest settings via variables
>   rpm: A number of the patches have been submitted upstream
>
>  meta/lib/oe/package_manager.py                     |   14 +-
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
>  meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch |   39 +-
>  meta/recipes-devtools/rpm/rpm/rpm-db60.patch       |   56 +
>  .../rpm/rpm/rpm-disable-Wno-override-init.patch    |   32 -
>  .../rpm/rpm/rpm-disable-auto-stack-protector.patch |   32 +
>  .../rpm/rpm/rpm-fix-logio-cp.patch                 |    2 +-
>  .../rpm/rpm/rpm-fix-parseEmbedded.patch            |   27 +
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
>  .../rpm/rpm/rpm-tools-mtree-LDFLAGS.patch          |    2 +-
>  meta/recipes-devtools/rpm/rpm/rpmatch.patch        |   32 +-
>  .../recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch |   27 +-
>  .../rpm/rpm/syck-5.4.15-to-5.4.16.patch.gz         |  Bin 0 -> 4837 bytes
>  meta/recipes-devtools/rpm/rpm/uclibc-support.patch |   38 +-
>  ...broken-logic-for-ghost-avoidance-Mark-Hat.patch |   38 -
>  meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           |  290 +++++-
>  .../rpm/{rpm_5.4.14.bb => rpm_5.4.16.bb}           |  185 +++-
>  55 files changed, 2120 insertions(+), 565 deletions(-)
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
> meta/recipes-devtools/rpm/rpm/rpm-fix-parseEmbedded.patch
>  create mode 100644
> meta/recipes-devtools/rpm/rpm/rpm-keccak-sse-intrin.patch
>  delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lua-fix-print.patch
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-mongodb-sasl.patch
>  create mode 100644
> meta/recipes-devtools/rpm/rpm/rpm-python-restore-origin.patch
>  delete mode 100644
> meta/recipes-devtools/rpm/rpm/rpm-remove-sykcparse-decl.patch
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmdb-grammar.patch
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmio-headers.patch
>  delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch
>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-syck-fix-gram.patch
>  create mode 100644
> meta/recipes-devtools/rpm/rpm/syck-5.4.15-to-5.4.16.patch.gz
>  delete mode 100644
> meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch
>  rename meta/recipes-devtools/rpm/{rpm_5.4.14.bb => rpm_5.4.16.bb} (83%)
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

--047d7b10cfc16caee4052cb46cda
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry Mark...<div><br></div><div><div>| In file included f=
rom ../../rpm-5.4.15/rpmio/rpmiotypes.h:8:0,</div><div>| =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from ../../rpm-5.4.15/rpmio/rp=
msq.c:14:</div><div>| ../../rpm-5.4.15/rpmio/rpmsq.c: In function &#39;_rpm=
_insque&#39;:</div><div>| ../../rpm-5.4.15/rpmio/rpmutil.h:115:30: error: &=
#39;__transaction_atomic&#39; without transactional memory support enabled<=
/div><div>| =C2=A0# =C2=A0define RPM_GNUC_TM_ATOMIC __transaction_atomic /*=
 XXX [[outer]] */</div><div>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div>| .=
./../rpm-5.4.15/rpmio/rpmsq.c:70:3: note: in expansion of macro &#39;RPM_GN=
UC_TM_ATOMIC&#39;</div><div>| =C2=A0 =C2=A0RPM_GNUC_TM_ATOMIC {</div><div>|=
 =C2=A0 =C2=A0^</div><div>| ../../rpm-5.4.15/rpmio/rpmsq.c: In function &#3=
9;_rpm_remque&#39;:</div><div>| ../../rpm-5.4.15/rpmio/rpmutil.h:115:30: er=
ror: &#39;__transaction_atomic&#39; without transactional memory support en=
abled</div><div>| =C2=A0# =C2=A0define RPM_GNUC_TM_ATOMIC __transaction_ato=
mic /* XXX [[outer]] */</div><div>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><=
div>| ../../rpm-5.4.15/rpmio/rpmsq.c:81:3: note: in expansion of macro &#39=
;RPM_GNUC_TM_ATOMIC&#39;</div><div>| =C2=A0 =C2=A0RPM_GNUC_TM_ATOMIC {</div=
><div>| =C2=A0 =C2=A0^</div><div>| Makefile:2167: recipe for target &#39;rp=
msq.lo&#39; failed</div></div><div><br></div><div>on qemux86.</div><div><br=
></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gm=
ail_quote">On 26 February 2016 at 03:28, Mark Hatle <span dir=3D"ltr">&lt;<=
a href=3D"mailto:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@win=
driver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">V2:<br>
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
<span class=3D"">There is not yet an official RPM 5.4.16 release, however o=
ne will be coming<br>
soon.=C2=A0 Until then, 4 distinct patches are used to upgrade RPM 5.4.15 t=
o<br>
5.4.16.=C2=A0 These patches are part of the commit (compressed w/ .xz).=C2=
=A0 However<br>
I am not sending them as part of the email as it&#39;s not very interesting=
<br>
to review base64.=C2=A0 :P<br>
<br>
</span><span class=3D"">Many of the OE patches have been sent to the RPM 5 =
maintainer, and may be<br>
part of the official 5.4.16 release.=C2=A0 When that release happens I expe=
ct a<br>
simple rebase to remove the unnecessary patches.<br>
<br>
The following changes since commit 205b446f3fc4a9885179a66a8dab9d81bcc63dca=
:<br>
<br>
=C2=A0 uclibc: Do not use immediate expansion operator (2016-02-22 20:42:34=
 +0000)<br>
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
</span><span class=3D"">Mark Hatle (3):<br>
=C2=A0 rpm: Uprev to rpm-5.4.16 (pre) and rpm-5.4+cvs to current CVS head<b=
r>
=C2=A0 rpm: Enable specific crypto and digest settings via variables<br>
=C2=A0 rpm: A number of the patches have been submitted upstream<br>
<br>
=C2=A0meta/lib/oe/package_manager.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A014 +-<br>
=C2=A0.../rpm/rpm/0001-define-EM_AARCH64.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
=C2=A0...arseArgvString-to-parse-the-_gpg_check_pa.patch |=C2=A0 =C2=A0 2 +=
-<br>
</span>=C2=A0.../rpm/rpm/beecrypt-5.4.15-to-5.4.16.patch.gz=C2=A0 =C2=A0 =
=C2=A0|=C2=A0 Bin 0 -&gt; 42815 bytes<br>
<span class=3D"">=C2=A0meta/recipes-devtools/rpm/rpm/debugedit-segv.patch |=
=C2=A0 =C2=A048 +-<br>
=C2=A0...debugedit-valid-file-to-fix-segment-fault.patch |=C2=A0 =C2=A0 2 +=
-<br>
=C2=A0.../rpm/rpm/fstack-protector-configure-check.patch |=C2=A0 =C2=A021 -=
<br>
=C2=A0.../rpm/rpm/header-include-fix.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A012 +-<br>
</span>=C2=A0.../rpm/rpm/lua-5.4.15-to-5.4.16.patch.gz=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 Bin 0 -&gt; 269940 bytes<br>
<span class=3D"">=C2=A0.../rpm/rpm/makefile-am-exec-hook.patch=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
=C2=A0.../rpm/rpm/python-rpm-rpmsense.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A032 +-<br>
</span>=C2=A0.../rpm/rpm/rpm-5.4.15-to-5.4.16.patch.gz=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 Bin 0 -&gt; 2239384 bytes<br>
=C2=A0meta/recipes-devtools/rpm/rpm/rpm-atomic-ops.patch |=C2=A0 =C2=A073 +=
+<br>
<span class=3D"">=C2=A0meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch=C2=
=A0 |=C2=A0 =C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch |=C2=A0 =C2=A039 +=
-<br>
=C2=A0meta/recipes-devtools/rpm/rpm/rpm-db60.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A056 +<br>
=C2=A0.../rpm/rpm/rpm-disable-Wno-override-init.patch=C2=A0 =C2=A0 |=C2=A0 =
=C2=A032 -<br>
=C2=A0.../rpm/rpm/rpm-disable-auto-stack-protector.patch |=C2=A0 =C2=A032 +=
<br>
=C2=A0.../rpm/rpm/rpm-fix-logio-cp.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
=C2=A0.../rpm/rpm/rpm-fix-parseEmbedded.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A027 +<br>
=C2=A0.../rpm/rpm/rpm-hardlink-segfault-fix.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 2 +-<br>
</span>=C2=A0.../rpm/rpm/rpm-keccak-sse-intrin.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A027 +<br>
<div><div class=3D"h5">=C2=A0...ction.c-fix-file-conflicts-for-mips64-N32.p=
atch |=C2=A0 =C2=A0 2 +-<br>
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
=C2=A0.../rpm/rpm/rpm-tools-mtree-LDFLAGS.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/rpm/rpm/rpmatch.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A032 +-<br>
=C2=A0.../recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch |=C2=A0 =C2=A027 +=
-<br>
</div></div>=C2=A0.../rpm/rpm/syck-5.4.15-to-5.4.16.patch.gz=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 Bin 0 -&gt; 4837 bytes<br>
<span class=3D"">=C2=A0meta/recipes-devtools/rpm/rpm/uclibc-support.patch |=
=C2=A0 =C2=A038 +-<br>
=C2=A0...broken-logic-for-ghost-avoidance-Mark-Hat.patch |=C2=A0 =C2=A038 -=
<br>
</span>=C2=A0meta/recipes-devtools/rpm/rpm_5.4+<a href=3D"http://cvs.bb" re=
l=3D"noreferrer" target=3D"_blank">cvs.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 290 +++++-<br>
=C2=A0.../rpm/{<a href=3D"http://rpm_5.4.14.bb" rel=3D"noreferrer" target=
=3D"_blank">rpm_5.4.14.bb</a> =3D&gt; <a href=3D"http://rpm_5.4.16.bb" rel=
=3D"noreferrer" target=3D"_blank">rpm_5.4.16.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 185 +++-<br>
=C2=A055 files changed, 2120 insertions(+), 565 deletions(-)<br>
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
<span class=3D"">=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm=
-db60.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-disable-Wno-over=
ride-init.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-disable-auto-sta=
ck-protector.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-fix-parseEmbedde=
d.patch<br>
</span>=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-keccak-ss=
e-intrin.patch<br>
<span class=3D"">=C2=A0delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm=
-lua-fix-print.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-mongodb-sasl.pat=
ch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-python-restore-o=
rigin.patch<br>
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
</span>=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/syck-5.4.15-t=
o-5.4.16.patch.gz<br>
<div class=3D"HOEnZb"><div class=3D"h5">=C2=A0delete mode 100644 meta/recip=
es-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.pa=
tch<br>
=C2=A0rename meta/recipes-devtools/rpm/{<a href=3D"http://rpm_5.4.14.bb" re=
l=3D"noreferrer" target=3D"_blank">rpm_5.4.14.bb</a> =3D&gt; <a href=3D"htt=
p://rpm_5.4.16.bb" rel=3D"noreferrer" target=3D"_blank">rpm_5.4.16.bb</a>} =
(83%)<br>
<br>
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
</div></div></blockquote></div><br></div>

--047d7b10cfc16caee4052cb46cda--
