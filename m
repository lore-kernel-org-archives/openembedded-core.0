Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id A9F8B6018C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Mar 2016 11:19:09 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id vs8so45673327igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Mar 2016 03:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jgSBVfNjGRbEZMmbMH/ESCT/SFYo/uIy/gJh5S2lpCI=;
	b=1NDL8kF2IVRVIoXp/6Rc/727CArGqJRydWzgQKbQpARBgqIBKZ7YcsyVmLSuz4GMa3
	RfQ4BjGxrcLjIZQS+1lTrKMdiuhc2zpVG+CI6Am/XrAwhdiumgDNFcvoNrBmZts8FCeN
	ZO3+eDt77gXYsDC29Yn0aYvi1FYPQ/LIHgAWFCFYIEfVFU8hcJ/1l9gEvft6T0O8CNXy
	ZDHPOJLOe6krDws8N1HyfYGB6LKiJp/PqjsisokCv0TYxmg54J3/lQ+MlLRMcMd+CBti
	hwNTeAHfWOHWHgzaFEm3kE1VqQQfd4HP79p+oRfV2VY2SPllKKanXBTBttLMpsjA24aU
	Fjaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jgSBVfNjGRbEZMmbMH/ESCT/SFYo/uIy/gJh5S2lpCI=;
	b=QQlfJoCgOK9QMUWawevcEWEd/JBwOQDJz6XLyrixWLAR7g7Efw4y7FAf5DVrtRHRBd
	2oUrsNj6PQu8tGUHkAjBwVEV6htGRAFD2L+D1NpGTa+RQ/tcYR9a6nCKNRIGgIsMP4bZ
	UqeH1BbhWRV9zFUNxapgdM9JFen2v66q8VIN8TMH7L/TmuNhcUfsTI/dYpvgzkj1MUh8
	i96l5OWTzpUxouTjUNVNrIIHP81qDjljMQIwB8OsiSwnd0W1TuNURDPizqhhyKXTSbxv
	QVUVUlHEUayRUeGjc93/nv9Mx7mY8K3l9H0ZhrnDKXlhbUotfpMPpLXKTyg/TkxbnhWI
	zkbA==
X-Gm-Message-State: AD7BkJKNIJy60xZ4BY0Easy9imAhKwvZPvQGseGDgIiLxz5vXBNCNitwqVgjQ6ofSV/l3yLt4rV96vGuDaFnBnSG
X-Received: by 10.50.112.101 with SMTP id ip5mr16799933igb.52.1457435950548;
	Tue, 08 Mar 2016 03:19:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 8 Mar 2016 03:18:51 -0800 (PST)
In-Reply-To: <CAJTo0LasT7As+5SRFduxEtv7vKMkBTWnCGGSWzvxY0=+jS5Asw@mail.gmail.com>
References: <cover.1457373422.git.mark.hatle@windriver.com>
	<CAJTo0LasT7As+5SRFduxEtv7vKMkBTWnCGGSWzvxY0=+jS5Asw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Mar 2016 11:18:51 +0000
Message-ID: <CAJTo0LZ8gm7Vvo-GB-JG+1yJxnq-MPr__N7XGGqwJN-yXL25Yw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7 v4] Upgrade RPM to 5.4.16 (CVE HEAD)
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
X-List-Received-Date: Tue, 08 Mar 2016 11:19:10 -0000
Content-Type: multipart/alternative; boundary=047d7b3a84581d9634052d87c049

--047d7b3a84581d9634052d87c049
Content-Type: text/plain; charset=UTF-8

Erm, two problems.  One of the runs failed to configure rpm (
http://errors.yoctoproject.org/Errors/Details/54813/).

Ross

On 8 March 2016 at 11:10, Burton, Ross <ross.burton@intel.com> wrote:

> One problem - target rpmresolve now fails to link:
>
> | rpmresolve.c: In function 'getPackageStr':
> |
> /data/poky-master/tmp-glibc/sysroots/qemux86/usr/include/rpm/rpmdb.h:1427:13:
> warning: implicit declaration of function 'rpmioFreePoolItem'
> [-Wimplicit-function-declaration]
> |      ((rpmmi)rpmioFreePoolItem((rpmioItem)(_mi), __FUNCTION__, __FILE__,
> __LINE__))
> |              ^
> | rpmresolve.c:54:11: note: in expansion of macro 'rpmmiFree'
> |      (void)rpmmiFree(mi);
> |            ^
> | rpmresolve.c: In function 'printDepList':
> | rpmresolve.c:297:34: warning: assignment discards 'const' qualifier from
> pointer target type [-Wdiscarded-qualifiers]
> |                              prov = names[k];
> |                                   ^
> | rpmresolve.c: In function 'main':
> | rpmresolve.c:388:5: warning: implicit declaration of function
> 'rpmcliInit' [-Wimplicit-function-declaration]
> |      rpmcliInit(argc, argv, NULL);
> |      ^
> | /data/poky-master/tmp-glibc/sysroots/qemux86/usr/lib/../lib/librpmdb.so:
> undefined reference to `_ITM_WaWU4'
> | /data/poky-master/tmp-glibc/sysroots/qemux86/usr/lib/../lib/librpmio.so:
> undefined reference to `_ITM_beginTransaction'
> | /data/poky-master/tmp-glibc/sysroots/qemux86/usr/lib/../lib/librpmdb.so:
> undefined reference to `_ITM_RfWU4'
> | /data/poky-master/tmp-glibc/sysroots/qemux86/usr/lib/../lib/librpmio.so:
> undefined reference to `_ITM_commitTransaction'
> | /data/poky-master/tmp-glibc/sysroots/qemux86/usr/lib/../lib/librpmio.so:
> undefined reference to `_ITM_RU4'
> | /data/poky-master/tmp-glibc/sysroots/qemux86/usr/lib/../lib/librpmio.so:
> undefined reference to `_ITM_WU4'
> | collect2: error: ld returned 1 exit status
>
> The warnings are not great, but the fails are critical.
>
> Interestingly rpmresolve-native works fine.
>
> Ross
>
> On 7 March 2016 at 17:59, Mark Hatle <mark.hatle@windriver.com> wrote:
>
>> v4:
>> * Move large patches to externally downloaded
>>   - Included in a commit to be testable, but that commit should not be
>> merged
>> * Disable default stack-protector for popt
>> * Fix AddErase API breakage
>> * Break popt header dependency
>> * Allow popt to be built internal (does not yet work, note caveat in
>> recipe)
>> * Update 'security_flags.inc' to know about RPM
>> * rpmresolve remove unnecessary -lpopt
>>
>> V3:
>> * Update rpm-db5-or-db6.patch to remove potential host contamination
>> * Update rpm-disable-auto-stack-protector.patch to only disable the stack
>> protector
>> * Add new patch: rpm-atomic-ops.patch
>>   - Disable atomic operations in bson when the architecture does not
>> support them
>> * Add new patch: rpm-gnu-atomic.patch
>>   - Dynamically detect and disable when -fgnu-tm/libitm support is not
>> available
>> * Add new patch: rpm-tagname-type.patch and rpm-python-tagname.patch
>>   - Fix rpm-python legacy API regressions
>> * Add new patch: rpm-disable-blaketest.patch
>>   - Disable building the blake test apps, they appear to have dep issues
>> in large
>>     parallel builds.
>> * Update db-6.0.30 to make it clear that when it is updated, to also
>> update RPM5.
>>
>> V2:
>> Fixed three issues
>> - Added Apache 2.0 license for specific mongodb code
>>
>> - Switch SSE usage dynamically in rpmio/keccak.c
>>   See rpm-keccak-sse-intrin.patch
>>
>> - Add support for architectures that do not support sync_add_and_fetch_8
>>   See rpm-atomic-ops.patch
>>
>> All of those changes are made in patch 1/3.
>>
>> This has been built for all of the qemu* BSPs.
>>
>> V1:
>> There is not yet an official RPM 5.4.16 release, however one will be
>> coming
>> soon.  Until then, 4 distinct patches are used to upgrade RPM 5.4.15 to
>> 5.4.16.  These patches are part of the commit (compressed w/ .xz).
>> However
>> I am not sending them as part of the email as it's not very interesting
>> to review base64.  :P
>>
>> Many of the OE patches have been sent to the RPM 5 maintainer, and may be
>> part of the official 5.4.16 release.  When that release happens I expect a
>> simple rebase to remove the unnecessary patches.
>>
>> The following changes since commit
>> 380ee36811939d947024bf78de907e3c071b834f:
>>
>>   image creation: allow overriding .rootfs suffix (2016-03-07 17:16:53
>> +0000)
>>
>> are available in the git repository at:
>>
>>   git://git.openembedded.org/openembedded-core-contrib mhatle/rpm-5.4.16
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=mhatle/rpm-5.4.16
>>
>> Mark Hatle (7):
>>   rpm: Uprev to rpm-5.4.16 (pre) and rpm-5.4+cvs to current CVS head
>>   security_flags.inc: Special flags are needed for RPM
>>   rpm: Enable specific crypto and digest settings via variables
>>   rpm: A number of the patches have been submitted upstream
>>   rpmresolve: It is not necessary to manually specify -lpopt
>>   db: remove the NO_UPDATE_REASON and replace it a comment about RPM
>>   rpm: Temporarily provide the RPM patches (NOT NOT MERGE)
>>
>>  meta/conf/distro/include/security_flags.inc        |    2 +
>>  meta/lib/oe/package_manager.py                     |   14 +-
>>  .../rpm/rpm/0001-define-EM_AARCH64.patch           |    2 +-
>>  ...arseArgvString-to-parse-the-_gpg_check_pa.patch |    2 +-
>>  .../beecrypt-5.4.15-to-5.4.16-20160225.patch.gz    |  Bin 0 -> 42815
>> bytes
>>  meta/recipes-devtools/rpm/rpm/debugedit-segv.patch |   48 +-
>>  ...debugedit-valid-file-to-fix-segment-fault.patch |    2 +-
>>  .../rpm/rpm/fstack-protector-configure-check.patch |   21 -
>>  .../rpm/rpm/header-include-fix.patch               |   12 +-
>>  .../rpm/rpm/lua-5.4.15-to-5.4.16-20160225.patch.gz |  Bin 0 -> 269940
>> bytes
>>  .../rpm/rpm/makefile-am-exec-hook.patch            |    2 +-
>>  .../rpm/popt-disable-auto-stack-protector.patch    |   27 +
>>  .../rpm/rpm/python-rpm-rpmsense.patch              |   32 +-
>>  .../rpm/rpm/rpm-5.4.15-to-5.4.16-20160225.patch.gz |  Bin 0 -> 2239384
>> bytes
>>  meta/recipes-devtools/rpm/rpm/rpm-atomic-ops.patch |   73 ++
>>  meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch  |    2 +-
>>  meta/recipes-devtools/rpm/rpm/rpm-db5-or-db6.patch |   43 +-
>>  meta/recipes-devtools/rpm/rpm/rpm-db60.patch       |   56 +
>>  .../rpm/rpm/rpm-disable-Wno-override-init.patch    |   32 -
>>  .../rpm/rpm/rpm-disable-auto-stack-protector.patch |   24 +
>>  .../rpm/rpm/rpm-disable-blaketest.patch            |   28 +
>>  .../rpm/rpm/rpm-fix-logio-cp.patch                 |    2 +-
>>  .../rpm/rpm/rpm-fix-parseEmbedded.patch            |   27 +
>>  meta/recipes-devtools/rpm/rpm/rpm-gnu-atomic.patch |   61 ++
>>  .../rpm/rpm/rpm-hardlink-segfault-fix.patch        |    2 +-
>>  .../rpm/rpm/rpm-keccak-sse-intrin.patch            |   27 +
>>  ...ction.c-fix-file-conflicts-for-mips64-N32.patch |    2 +-
>>  meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch |    2 +-
>>  .../rpm/rpm/rpm-lsb-compatibility.patch            |    2 +-
>>  .../rpm/rpm/rpm-lua-fix-print.patch                |  104 --
>>  ...rpm-macros.in-disable-external-key-server.patch |   16 +-
>>  .../rpm/rpm/rpm-mongodb-sasl.patch                 |   69 ++
>>  meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch |    2 +-
>>  ...b-before-verifyscript-to-avoid-null-point.patch |    2 +-
>>  .../rpm/rpm/rpm-packageorigin.patch                |    2 +-
>>  .../rpm/rpm/rpm-payload-use-hashed-inode.patch     |   22 +-
>>  .../rpm/rpm/rpm-pkgconfigdeps.patch                |   10 +-
>>  .../rpm/rpm/rpm-platform-file-fix.patch            |    2 +-
>>  meta/recipes-devtools/rpm/rpm/rpm-platform.patch   |    2 +-
>>  meta/recipes-devtools/rpm/rpm/rpm-platform2.patch  |    4 +-
>>  meta/recipes-devtools/rpm/rpm/rpm-py-init.patch    |   16 +-
>>  .../rpm/rpm/rpm-python-AddErase.patch              |   35 +
>>  .../rpm/rpm/rpm-python-restore-origin.patch        |   49 +
>>  .../rpm/rpm/rpm-python-tagname.patch               |   24 +
>>  .../rpm/rpm/rpm-remove-sykcparse-decl.patch        |   14 -
>>  meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch |    2 +-
>>  .../rpm/rpm/rpm-rpmdb-grammar.patch                |  124 +++
>>  .../rpm/rpm/rpm-rpmfc.c-fix-for-N32-MIPS64.patch   |    2 +-
>>  .../rpm/rpm/rpm-rpmio-headers.patch                |   19 +
>>  meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch |   67 --
>>  .../recipes-devtools/rpm/rpm/rpm-rpmpgp-popt.patch |   26 +
>>  .../rpm/rpm/rpm-scriptletexechelper.patch          |   29 +-
>>  .../rpm/rpm/rpm-syck-fix-gram.patch                | 1081
>> ++++++++++++++++++++
>>  .../rpm-tag-generate-endian-conversion-fix.patch   |    2 +-
>>  .../rpm/rpm/rpm-tagname-type.patch                 |   25 +
>>  .../rpm/rpm/rpm-tools-mtree-LDFLAGS.patch          |    2 +-
>>  meta/recipes-devtools/rpm/rpm/rpmatch.patch        |   32 +-
>>  .../recipes-devtools/rpm/rpm/rpmqv_cc_b_gone.patch |   27 +-
>>  .../rpm/syck-5.4.15-to-5.4.16-20160225.patch.gz    |  Bin 0 -> 4837 bytes
>>  meta/recipes-devtools/rpm/rpm/uclibc-support.patch |   38 +-
>>  ...broken-logic-for-ghost-avoidance-Mark-Hat.patch |   38 -
>>  meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           |  302 +++++-
>>  .../rpm/{rpm_5.4.14.bb => rpm_5.4.16.bb}           |  197 +++-
>>  meta/recipes-devtools/rpm/rpmresolve_1.0.bb        |    2 +-
>>  meta/recipes-support/db/db_6.0.30.bb               |    2 +-
>>  65 files changed, 2368 insertions(+), 569 deletions(-)
>>  create mode 100644
>> meta/recipes-devtools/rpm/rpm/beecrypt-5.4.15-to-5.4.16-20160225.patch.gz
>>  delete mode 100644
>> meta/recipes-devtools/rpm/rpm/fstack-protector-configure-check.patch
>>  create mode 100644
>> meta/recipes-devtools/rpm/rpm/lua-5.4.15-to-5.4.16-20160225.patch.gz
>>  create mode 100644
>> meta/recipes-devtools/rpm/rpm/popt-disable-auto-stack-protector.patch
>>  create mode 100644
>> meta/recipes-devtools/rpm/rpm/rpm-5.4.15-to-5.4.16-20160225.patch.gz
>>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-atomic-ops.patch
>>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-db60.patch
>>  delete mode 100644
>> meta/recipes-devtools/rpm/rpm/rpm-disable-Wno-override-init.patch
>>  create mode 100644
>> meta/recipes-devtools/rpm/rpm/rpm-disable-auto-stack-protector.patch
>>  create mode 100644
>> meta/recipes-devtools/rpm/rpm/rpm-disable-blaketest.patch
>>  create mode 100644
>> meta/recipes-devtools/rpm/rpm/rpm-fix-parseEmbedded.patch
>>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-gnu-atomic.patch
>>  create mode 100644
>> meta/recipes-devtools/rpm/rpm/rpm-keccak-sse-intrin.patch
>>  delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-lua-fix-print.patch
>>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-mongodb-sasl.patch
>>  create mode 100644
>> meta/recipes-devtools/rpm/rpm/rpm-python-AddErase.patch
>>  create mode 100644
>> meta/recipes-devtools/rpm/rpm/rpm-python-restore-origin.patch
>>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-python-tagname.patch
>>  delete mode 100644
>> meta/recipes-devtools/rpm/rpm/rpm-remove-sykcparse-decl.patch
>>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmdb-grammar.patch
>>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmio-headers.patch
>>  delete mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-fix.patch
>>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-popt.patch
>>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-syck-fix-gram.patch
>>  create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-tagname-type.patch
>>  create mode 100644
>> meta/recipes-devtools/rpm/rpm/syck-5.4.15-to-5.4.16-20160225.patch.gz
>>  delete mode 100644
>> meta/recipes-devtools/rpm/rpm/verify-fix-broken-logic-for-ghost-avoidance-Mark-Hat.patch
>>  rename meta/recipes-devtools/rpm/{rpm_5.4.14.bb => rpm_5.4.16.bb} (81%)
>>
>> --
>> 2.5.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--047d7b3a84581d9634052d87c049
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Erm, two problems.=C2=A0 One of the runs failed to configu=
re rpm (<a href=3D"http://errors.yoctoproject.org/Errors/Details/54813/">ht=
tp://errors.yoctoproject.org/Errors/Details/54813/</a>).<div><br></div><div=
>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 March 2016 at 11:10, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">One proble=
m - target rpmresolve now fails to link:<div><br></div><div><div>| rpmresol=
ve.c: In function &#39;getPackageStr&#39;:</div><div>| /data/poky-master/tm=
p-glibc/sysroots/qemux86/usr/include/rpm/rpmdb.h:1427:13: warning: implicit=
 declaration of function &#39;rpmioFreePoolItem&#39; [-Wimplicit-function-d=
eclaration]</div><div>| =C2=A0 =C2=A0 =C2=A0((rpmmi)rpmioFreePoolItem((rpmi=
oItem)(_mi), __FUNCTION__, __FILE__, __LINE__))</div><div>| =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div><div>| rpmresolve.c:54:11: note: i=
n expansion of macro &#39;rpmmiFree&#39;</div><div>| =C2=A0 =C2=A0 =C2=A0(v=
oid)rpmmiFree(mi);</div><div>| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</=
div><div>| rpmresolve.c: In function &#39;printDepList&#39;:</div><div>| rp=
mresolve.c:297:34: warning: assignment discards &#39;const&#39; qualifier f=
rom pointer target type [-Wdiscarded-qualifiers]</div><div>| =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0prov =3D names[k];</div><div>| =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ^</div><div>| rpmresolve.c: In function &#39;main&#39;:</=
div><div>| rpmresolve.c:388:5: warning: implicit declaration of function &#=
39;rpmcliInit&#39; [-Wimplicit-function-declaration]</div><div>| =C2=A0 =C2=
=A0 =C2=A0rpmcliInit(argc, argv, NULL);</div><div>| =C2=A0 =C2=A0 =C2=A0^</=
div><div>| /data/poky-master/tmp-glibc/sysroots/qemux86/usr/lib/../lib/libr=
pmdb.so: undefined reference to `_ITM_WaWU4&#39;</div><div>| /data/poky-mas=
ter/tmp-glibc/sysroots/qemux86/usr/lib/../lib/librpmio.so: undefined refere=
nce to `_ITM_beginTransaction&#39;</div><div>| /data/poky-master/tmp-glibc/=
sysroots/qemux86/usr/lib/../lib/librpmdb.so: undefined reference to `_ITM_R=
fWU4&#39;</div><div>| /data/poky-master/tmp-glibc/sysroots/qemux86/usr/lib/=
../lib/librpmio.so: undefined reference to `_ITM_commitTransaction&#39;</di=
v><div>| /data/poky-master/tmp-glibc/sysroots/qemux86/usr/lib/../lib/librpm=
io.so: undefined reference to `_ITM_RU4&#39;</div><div>| /data/poky-master/=
tmp-glibc/sysroots/qemux86/usr/lib/../lib/librpmio.so: undefined reference =
to `_ITM_WU4&#39;</div><div>| collect2: error: ld returned 1 exit status</d=
iv></div><div><br></div><div>The warnings are not great, but the fails are =
critical.</div><div><br></div><div>Interestingly rpmresolve-native works fi=
ne.</div><span class=3D"HOEnZb"><font color=3D"#888888"><div><br></div><div=
>Ross</div></font></span></div><div class=3D"HOEnZb"><div class=3D"h5"><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 7 March 2016 at 17=
:59, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.hatle@windrive=
r.com" target=3D"_blank">mark.hatle@windriver.com</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">v4:<br>
* Move large patches to externally downloaded<br>
=C2=A0 - Included in a commit to be testable, but that commit should not be=
 merged<br>
* Disable default stack-protector for popt<br>
* Fix AddErase API breakage<br>
* Break popt header dependency<br>
* Allow popt to be built internal (does not yet work, note caveat in recipe=
)<br>
* Update &#39;security_flags.inc&#39; to know about RPM<br>
* rpmresolve remove unnecessary -lpopt<br>
<br>
V3:<br>
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
The following changes since commit 380ee36811939d947024bf78de907e3c071b834f=
:<br>
<br>
=C2=A0 image creation: allow overriding .rootfs suffix (2016-03-07 17:16:53=
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
Mark Hatle (7):<br>
=C2=A0 rpm: Uprev to rpm-5.4.16 (pre) and rpm-5.4+cvs to current CVS head<b=
r>
=C2=A0 security_flags.inc: Special flags are needed for RPM<br>
=C2=A0 rpm: Enable specific crypto and digest settings via variables<br>
=C2=A0 rpm: A number of the patches have been submitted upstream<br>
=C2=A0 rpmresolve: It is not necessary to manually specify -lpopt<br>
=C2=A0 db: remove the NO_UPDATE_REASON and replace it a comment about RPM<b=
r>
=C2=A0 rpm: Temporarily provide the RPM patches (NOT NOT MERGE)<br>
<br>
=C2=A0meta/conf/distro/include/security_flags.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A0 2 +<br>
=C2=A0meta/lib/oe/package_manager.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A014 +-<br>
=C2=A0.../rpm/rpm/0001-define-EM_AARCH64.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
=C2=A0...arseArgvString-to-parse-the-_gpg_check_pa.patch |=C2=A0 =C2=A0 2 +=
-<br>
=C2=A0.../beecrypt-5.4.15-to-5.4.16-20160225.patch.gz=C2=A0 =C2=A0 |=C2=A0 =
Bin 0 -&gt; 42815 bytes<br>
=C2=A0meta/recipes-devtools/rpm/rpm/debugedit-segv.patch |=C2=A0 =C2=A048 +=
-<br>
=C2=A0...debugedit-valid-file-to-fix-segment-fault.patch |=C2=A0 =C2=A0 2 +=
-<br>
=C2=A0.../rpm/rpm/fstack-protector-configure-check.patch |=C2=A0 =C2=A021 -=
<br>
=C2=A0.../rpm/rpm/header-include-fix.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A012 +-<br>
=C2=A0.../rpm/rpm/lua-5.4.15-to-5.4.16-20160225.patch.gz |=C2=A0 Bin 0 -&gt=
; 269940 bytes<br>
=C2=A0.../rpm/rpm/makefile-am-exec-hook.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
=C2=A0.../rpm/popt-disable-auto-stack-protector.patch=C2=A0 =C2=A0 |=C2=A0 =
=C2=A027 +<br>
=C2=A0.../rpm/rpm/python-rpm-rpmsense.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A032 +-<br>
=C2=A0.../rpm/rpm/rpm-5.4.15-to-5.4.16-20160225.patch.gz |=C2=A0 Bin 0 -&gt=
; 2239384 bytes<br>
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
=C2=A0.../rpm/rpm/rpm-python-AddErase.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A035 +<br>
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
=C2=A0.../recipes-devtools/rpm/rpm/rpm-rpmpgp-popt.patch |=C2=A0 =C2=A026 +=
<br>
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
=C2=A0.../rpm/syck-5.4.15-to-5.4.16-20160225.patch.gz=C2=A0 =C2=A0 |=C2=A0 =
Bin 0 -&gt; 4837 bytes<br>
=C2=A0meta/recipes-devtools/rpm/rpm/uclibc-support.patch |=C2=A0 =C2=A038 +=
-<br>
=C2=A0...broken-logic-for-ghost-avoidance-Mark-Hat.patch |=C2=A0 =C2=A038 -=
<br>
=C2=A0meta/recipes-devtools/rpm/rpm_5.4+<a href=3D"http://cvs.bb" rel=3D"no=
referrer" target=3D"_blank">cvs.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 302 +++++-<br>
=C2=A0.../rpm/{<a href=3D"http://rpm_5.4.14.bb" rel=3D"noreferrer" target=
=3D"_blank">rpm_5.4.14.bb</a> =3D&gt; <a href=3D"http://rpm_5.4.16.bb" rel=
=3D"noreferrer" target=3D"_blank">rpm_5.4.16.bb</a>}=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 197 +++-<br>
=C2=A0meta/recipes-devtools/rpm/<a href=3D"http://rpmresolve_1.0.bb" rel=3D=
"noreferrer" target=3D"_blank">rpmresolve_1.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 2 +-<br>
=C2=A0meta/recipes-support/db/<a href=3D"http://db_6.0.30.bb" rel=3D"norefe=
rrer" target=3D"_blank">db_6.0.30.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<br>
=C2=A065 files changed, 2368 insertions(+), 569 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/beecrypt-5.4.15-to-5=
.4.16-20160225.patch.gz<br>
=C2=A0delete mode 100644 meta/recipes-devtools/rpm/rpm/fstack-protector-con=
figure-check.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/lua-5.4.15-to-5.4.16=
-20160225.patch.gz<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/popt-disable-auto-st=
ack-protector.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-5.4.15-to-5.4.16=
-20160225.patch.gz<br>
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
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-python-AddErase.=
patch<br>
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
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-rpmpgp-popt.patc=
h<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-syck-fix-gram.pa=
tch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-tagname-type.pat=
ch<br>
=C2=A0create mode 100644 meta/recipes-devtools/rpm/rpm/syck-5.4.15-to-5.4.1=
6-20160225.patch.gz<br>
=C2=A0delete mode 100644 meta/recipes-devtools/rpm/rpm/verify-fix-broken-lo=
gic-for-ghost-avoidance-Mark-Hat.patch<br>
=C2=A0rename meta/recipes-devtools/rpm/{<a href=3D"http://rpm_5.4.14.bb" re=
l=3D"noreferrer" target=3D"_blank">rpm_5.4.14.bb</a> =3D&gt; <a href=3D"htt=
p://rpm_5.4.16.bb" rel=3D"noreferrer" target=3D"_blank">rpm_5.4.16.bb</a>} =
(81%)<br>
<span><font color=3D"#888888"><br>
--<br>
2.5.0<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--047d7b3a84581d9634052d87c049--
