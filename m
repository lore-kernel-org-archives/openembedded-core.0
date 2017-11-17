Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3229F78399
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 00:35:41 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id u42so7124552ioi.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 16:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o9m1d8tS9wh29xw1HkznhsgZDKlHx0HTXIkeya2iebE=;
	b=x4v7WIyRf3RZMvdBn2Vrm/MjTsgnTVvwvbDkxSn560B8at2xS66VkpesR2cZVwDbsI
	USQ7Yplckbj3dh5idzGDpN3haAieBCooO9P4f+LPL7KHZlEOeQ+VcAAH7+QZB85vUI/J
	9L2FoltHsQm6ME+UL8dRvnZQtDhBYDLFpZIbL4ZP2rJOHCuYENfrCu+wFzjd2FjPQwhQ
	QuHCkT0C7j4H1BPir2vr/RM63gJdtFVE+Tm9AboZ+KrO9RH+ar1D9JUfFRhA0H9BNn89
	98PtUEkm5NDH790cesQXwzQQREJfHDA21z84cZI4ZLA3jjvyE7SmYXv8mvd6XUMFGCAG
	rnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o9m1d8tS9wh29xw1HkznhsgZDKlHx0HTXIkeya2iebE=;
	b=OYlAavEQg7wb04mOg7q+shvl68CSfQYysFAa1GSN3GCZTI1dQwZR2EeCOnCp4ZBd+O
	5aFYdHjgPzvCX6sO/lL/HVwWch9ATDTYwQuuliWsRoSdur70f+Wzg4DA6tduAknF6mSP
	WImKRQlIC90vwXEc/e1tWYBRqr2eNR1jy/6aABK3wkTlw02Kw3EGImA3ciCWt8ZtXXg0
	fSRxMJgUlH6vt3F5F4qZhbXVkez+2iwF32/BcZplZ7tWbOYc/AwVzs7DENdfs0W/ewo4
	2X+YTE6TNQSuNkpmNtHy6qKrLTX1Hk1DdpK/vF81hTOWThtZPDsKWQQBylpnJcqgVgZi
	F1NA==
X-Gm-Message-State: AJaThX41+if0scEffpJysAnQY2xGHVcZFaT8P5gXvMh6SELqxwylvoVW
	9KwUq2ioeZXSLd3hDpddFdY4Lsi+Wr28/pANa20wWg==
X-Google-Smtp-Source: AGs4zMZgs5uoaghkgObI3aSKBwiF7sieqRcMkpYS4oEND5iB9pZX2DyanFMyDUJf/mQ4sjVmTkjm2JzW3sqyS8Zx4fY=
X-Received: by 10.107.178.145 with SMTP id b139mr880378iof.52.1510878943073;
	Thu, 16 Nov 2017 16:35:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.196 with HTTP; Thu, 16 Nov 2017 16:35:22 -0800 (PST)
In-Reply-To: <CAJTo0LZLK6THGLwVAgZBaH0JZjyUukipy+LvTXWGHcn2cmaOrw@mail.gmail.com>
References: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
	<20171114145754.9643-18-alexander.kanavin@linux.intel.com>
	<CAJTo0LZLK6THGLwVAgZBaH0JZjyUukipy+LvTXWGHcn2cmaOrw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 17 Nov 2017 00:35:22 +0000
Message-ID: <CAJTo0Lb6_qzWqbCRk7tw=GwZJfgn+S=bjU2Eo_z49SJ7f+uqLQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 18/27] psmisc: update to 23.0
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
X-List-Received-Date: Fri, 17 Nov 2017 00:35:42 -0000
Content-Type: multipart/alternative; boundary="001a114ca162b37205055e22eafe"

--001a114ca162b37205055e22eafe
Content-Type: text/plain; charset="UTF-8"

Boom.

packages/corei7-64-poky-linux/psmisc: PACKAGES: removed "psmisc-locale",
added "psmisc-locale-uk psmisc-locale-sv psmisc-locale-el psmisc-locale-ro
psmisc-locale-da psmisc-locale-hr psmisc-locale-cs psmisc-locale-eo
psmisc-locale-id psmisc-locale-sr psmisc-locale-it psmisc-locale-pt-br
psmisc-locale-eu psmisc-locale-fi psmisc-locale-ca psmisc-locale-fr
psmisc-locale-zh-tw psmisc-locale-pt psmisc-locale-de psmisc-locale-nl
psmisc-locale-zh-cn psmisc-locale-bg psmisc-locale-vi psmisc-locale-nb
psmisc-locale-hu psmisc-locale-pl psmisc-locale-ja psmisc-locale-ru"

Upstream has a custom autogen.sh which invokes po/update-potfiles as they
don't ship a po/POTFILES.in (which is silly).  Without that file gettext
doesn't believe po/ is a gettext directory and won't generate po/Makefile.

We also disable autopoint by default in autotools.bbclass so that needs to
be re-enabled (I've a long-standing branch to fix that but need to finish
it off).

This fixes the build:

EXTRA_AUTORECONF=""
do_configure_prepend() {
    ( cd ${S} && po/update-potfiles )
}

Ross

On 17 November 2017 at 00:25, Burton, Ross <ross.burton@intel.com> wrote:

> I'm not sure that disabling translations entirely is a suitable fix for
> upstreams makefile being broken (or our recipe breaking)...
>
> Did you look at the upstream repo to see if they've a fix, or how
> complicated the fix would be?
>
> Ross
>
> On 14 November 2017 at 14:57, Alexander Kanavin <alexander.kanavin@linux.
> intel.com> wrote:
>
>> Switch to gitlab, as that's where development now happens.
>> Drop two upstreamed patches, add two patches to avoid newly
>> introduced build errors.
>>
>> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>> ---
>>  ...001-Typo-in-fuser-makes-M-on-all-the-time.patch | 46
>> ----------------------
>>  .../files/0002-Include-limits.h-for-PATH_MAX.patch | 29 --------------
>>  ...-create-src-directory-before-attempting-t.patch | 30 ++++++++++++++
>>  ...efile.am-do-not-recurse-into-po-directory.patch | 30 ++++++++++++++
>>  meta/recipes-extended/psmisc/psmisc_22.21.bb       | 12 ------
>>  meta/recipes-extended/psmisc/psmisc_23.0.bb        | 11 ++++++
>>  6 files changed, 71 insertions(+), 87 deletions(-)
>>  delete mode 100644 meta/recipes-extended/psmisc/f
>> iles/0001-Typo-in-fuser-makes-M-on-all-the-time.patch
>>  delete mode 100644 meta/recipes-extended/psmisc/f
>> iles/0002-Include-limits.h-for-PATH_MAX.patch
>>  create mode 100644 meta/recipes-extended/psmisc/p
>> smisc/0001-Makefile.am-create-src-directory-before-attempting-t.patch
>>  create mode 100644 meta/recipes-extended/psmisc/p
>> smisc/0001-Makefile.am-do-not-recurse-into-po-directory.patch
>>  delete mode 100644 meta/recipes-extended/psmisc/psmisc_22.21.bb
>>  create mode 100644 meta/recipes-extended/psmisc/psmisc_23.0.bb
>>
>> diff --git a/meta/recipes-extended/psmisc/files/0001-Typo-in-fuser-makes-M-on-all-the-time.patch
>> b/meta/recipes-extended/psmisc/files/0001-Typo-in-fuser-
>> makes-M-on-all-the-time.patch
>> deleted file mode 100644
>> index e57d60f6a34..00000000000
>> --- a/meta/recipes-extended/psmisc/files/0001-Typo-in-fuser-
>> makes-M-on-all-the-time.patch
>> +++ /dev/null
>> @@ -1,46 +0,0 @@
>> -From 3638cc55b4d08851faba46635d737b24d016665b Mon Sep 17 00:00:00 2001
>> -From: Brad Jorsch <anomie@users.sourceforge.net>
>> -Date: Fri, 28 Feb 2014 21:55:02 +1100
>> -Subject: [PATCH] Typo in fuser makes -M on all the time
>> -
>> -Brad found that fuser had the -M option on all the time.
>> -A simple but significant typo caused this, thanks the the patch.
>> -
>> -Bug-Debian: http://bugs.debian.org/740275
>> -
>> -Upstream-Status: Backport
>> -
>> -Signed-off-by: Craig Small <csmall@enc.com.au>
>> ----
>> - ChangeLog   | 4 ++++
>> - src/fuser.c | 2 +-
>> - 2 files changed, 5 insertions(+), 1 deletion(-)
>> -
>> -diff --git a/ChangeLog b/ChangeLog
>> -index fd1cccf..e5f784c 100644
>> ---- a/ChangeLog
>> -+++ b/ChangeLog
>> -@@ -1,3 +1,7 @@
>> -+Changes in 22.22
>> -+================
>> -+      * Fixed typo in fuser which has -M on Debian #740275
>> -+
>> - Changes in 22.21
>> - ================
>> -       * Missing comma in fuser(1) added Debian #702391
>> -diff --git a/src/fuser.c b/src/fuser.c
>> -index b485f65..389b302 100644
>> ---- a/src/fuser.c
>> -+++ b/src/fuser.c
>> -@@ -1174,7 +1174,7 @@ int main(int argc, char *argv[])
>> -               usage(_("No process specification given"));
>> -
>> -       /* Check if -M flag was used and if so check mounts */
>> --      if (opts * OPT_ISMOUNTPOINT) {
>> -+      if (opts & OPT_ISMOUNTPOINT) {
>> -           check_mountpoints(&mounts, &names_head, &names_tail);
>> -       }
>> -
>> ---
>> -1.8.4.2
>> -
>> diff --git a/meta/recipes-extended/psmisc/files/0002-Include-limits.h-for-PATH_MAX.patch
>> b/meta/recipes-extended/psmisc/files/0002-Include-limits.h-
>> for-PATH_MAX.patch
>> deleted file mode 100644
>> index c8afcac8a8b..00000000000
>> --- a/meta/recipes-extended/psmisc/files/0002-Include-limits.h-
>> for-PATH_MAX.patch
>> +++ /dev/null
>> @@ -1,29 +0,0 @@
>> -From aa66afecd8ba9cc4139f25ab15ec315173413a7d Mon Sep 17 00:00:00 2001
>> -From: Paul Barker <paul@paulbarker.me.uk>
>> -Date: Wed, 20 Aug 2014 10:31:37 +0000
>> -Subject: [PATCH] Include <limits.h> for PATH_MAX
>> -
>> -When building against musl libc, PATH_MAX is defined in <limits.h>.
>> -
>> -Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
>> -
>> -Upstream-Status: Accepted (Should be in next release after 22.21)
>> ----
>> - src/pstree.c | 1 +
>> - 1 file changed, 1 insertion(+)
>> -
>> -diff --git a/src/pstree.c b/src/pstree.c
>> -index 071e6c4..0d28260 100644
>> ---- a/src/pstree.c
>> -+++ b/src/pstree.c
>> -@@ -41,6 +41,7 @@
>> - #include <sys/types.h>
>> - #include <sys/stat.h>
>> - #include <sys/ioctl.h>
>> -+#include <limits.h>
>> -
>> - #include "i18n.h"
>> - #include "comm.h"
>> ---
>> -2.0.4
>> -
>> diff --git a/meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-
>> create-src-directory-before-attempting-t.patch
>> b/meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-
>> create-src-directory-before-attempting-t.patch
>> new file mode 100644
>> index 00000000000..4d44495fd3f
>> --- /dev/null
>> +++ b/meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-
>> create-src-directory-before-attempting-t.patch
>> @@ -0,0 +1,30 @@
>> +From 285877b7761d74736aca2687ed9bef2f78b82c33 Mon Sep 17 00:00:00 2001
>> +From: Alexander Kanavin <alex.kanavin@gmail.com>
>> +Date: Thu, 2 Nov 2017 16:21:22 +0200
>> +Subject: [PATCH] Makefile.am: create src directory before attempting to
>> write
>> + there
>> +
>> +Otherwise out of tree builds will fail.
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> +---
>> + Makefile.am | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/Makefile.am b/Makefile.am
>> +index 9f61ab4..b4ced7f 100644
>> +--- a/Makefile.am
>> ++++ b/Makefile.am
>> +@@ -79,7 +79,7 @@ EXTRA_DIST = src/signames.c README.md
>> + CLEANFILES = src/signames.h
>> +
>> + src/signames.h: src/signames.c Makefile
>> +-              export LC_ALL=C ; \
>> ++              export LC_ALL=C ; mkdir -p src ; \
>> +               @CPP@ -dM $< |\
>> +               tr -s '\t ' ' ' | sort -n -k 3 | sed \
>> +       's:#define SIG\([A-Z][A-Z]*[0-9]*\) \([0-9][0-9]*\).*$\:{\
>> \2,"\1" },:p;d' | \
>> +--
>> +2.14.2
>> +
>> diff --git a/meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-do-
>> not-recurse-into-po-directory.patch b/meta/recipes-extended/psmisc
>> /psmisc/0001-Makefile.am-do-not-recurse-into-po-directory.patch
>> new file mode 100644
>> index 00000000000..72f993a1702
>> --- /dev/null
>> +++ b/meta/recipes-extended/psmisc/psmisc/0001-Makefile.am-do-
>> not-recurse-into-po-directory.patch
>> @@ -0,0 +1,30 @@
>> +From bbd69f375a0eaeba3bfa17008f8ff41e836c1688 Mon Sep 17 00:00:00 2001
>> +From: Alexander Kanavin <alex.kanavin@gmail.com>
>> +Date: Thu, 2 Nov 2017 16:39:59 +0200
>> +Subject: [PATCH] Makefile.am: do not recurse into po directory
>> +
>> +Some broken autoconf logic results in a missing Makefile - let's
>> +just skip the directory with translations, as users of psmisc are
>> unlikely
>> +to need those anyway.
>> +
>> +Upstream-Status: Inappropriate [oe-core specific]
>> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> +---
>> + Makefile.am | 1 -
>> + 1 file changed, 1 deletion(-)
>> +
>> +diff --git a/Makefile.am b/Makefile.am
>> +index b4ced7f..0d343a6 100644
>> +--- a/Makefile.am
>> ++++ b/Makefile.am
>> +@@ -11,7 +11,6 @@ ACLOCAL_AMFLAGS = -I m4
>> +
>> + SUBDIRS = \
>> +         doc \
>> +-        po \
>> +         icons \
>> +         testsuite
>> +
>> +--
>> +2.14.2
>> +
>> diff --git a/meta/recipes-extended/psmisc/psmisc_22.21.bb
>> b/meta/recipes-extended/psmisc/psmisc_22.21.bb
>> deleted file mode 100644
>> index 1c6473ebf43..00000000000
>> --- a/meta/recipes-extended/psmisc/psmisc_22.21.bb
>> +++ /dev/null
>> @@ -1,12 +0,0 @@
>> -require psmisc.inc
>> -LICENSE = "GPLv2"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
>> -
>> -SRC_URI[md5sum] = "935c0fd6eb208288262b385fa656f1bf"
>> -SRC_URI[sha256sum] = "97323cad619210845b696d7d722c3
>> 83852b2acb5c49b5b0852c4f29c77a8145a"
>> -
>> -SRC_URI = "${SOURCEFORGE_MIRROR}/psmisc/psmisc-${PV}.tar.gz \
>> -           file://0001-Typo-in-fuser-makes-M-on-all-the-time.patch \
>> -           file://0002-Include-limits.h-for-PATH_MAX.patch \
>> -           file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
>> -           "
>> diff --git a/meta/recipes-extended/psmisc/psmisc_23.0.bb
>> b/meta/recipes-extended/psmisc/psmisc_23.0.bb
>> new file mode 100644
>> index 00000000000..e036ae25508
>> --- /dev/null
>> +++ b/meta/recipes-extended/psmisc/psmisc_23.0.bb
>> @@ -0,0 +1,11 @@
>> +require psmisc.inc
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
>> +
>> +SRC_URI = "git://gitlab.com/psmisc/psmisc.git;protocol=https \
>> +           file://0001-Use-UINTPTR_MAX-instead-of-__WORDSIZE.patch \
>> +          file://0001-Makefile.am-create-src-directory-before-attempti
>> ng-t.patch \
>> +           file://0001-Makefile.am-do-not-recurse-into-po-directory.patch
>> \
>> +           "
>> +SRCREV = "67b1da268f4c0ce6859980e3dfcfaec5b2448e80"
>> +S = "${WORKDIR}/git"
>> --
>> 2.15.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--001a114ca162b37205055e22eafe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Boom.<div><br></div><div>packages/corei7-64-poky-linux/psm=
isc: PACKAGES: removed &quot;psmisc-locale&quot;, added &quot;psmisc-locale=
-uk psmisc-locale-sv psmisc-locale-el psmisc-locale-ro psmisc-locale-da psm=
isc-locale-hr psmisc-locale-cs psmisc-locale-eo psmisc-locale-id psmisc-loc=
ale-sr psmisc-locale-it psmisc-locale-pt-br psmisc-locale-eu psmisc-locale-=
fi psmisc-locale-ca psmisc-locale-fr psmisc-locale-zh-tw psmisc-locale-pt p=
smisc-locale-de psmisc-locale-nl psmisc-locale-zh-cn psmisc-locale-bg psmis=
c-locale-vi psmisc-locale-nb psmisc-locale-hu psmisc-locale-pl psmisc-local=
e-ja psmisc-locale-ru&quot;<br></div><div><br></div><div>Upstream has a cus=
tom autogen.sh which invokes po/update-potfiles as they don&#39;t ship a po=
/POTFILES.in (which is silly).=C2=A0 Without that file gettext doesn&#39;t =
believe po/ is a gettext directory and won&#39;t generate po/Makefile.</div=
><div><br></div><div>We also disable autopoint by default in autotools.bbcl=
ass so that needs to be re-enabled (I&#39;ve a long-standing branch to fix =
that but need to finish it off).</div><div><br></div><div>This fixes the bu=
ild:</div><div><br></div><div><div>EXTRA_AUTORECONF=3D&quot;&quot;</div><di=
v>do_configure_prepend() {<br></div><div>=C2=A0 =C2=A0 ( cd ${S} &amp;&amp;=
 po/update-potfiles )</div><div>}</div></div><div><br></div><div>Ross</div>=
</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 17 Novem=
ber 2017 at 00:25, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ros=
s.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">I&#39;m not sure =
that disabling translations entirely is a suitable fix for upstreams makefi=
le being broken (or our recipe breaking)...<div><br></div><div>Did you look=
 at the upstream repo to see if they&#39;ve a fix, or how complicated the f=
ix would be?</div><span class=3D"HOEnZb"><font color=3D"#888888"><div><br><=
/div><div>Ross</div></font></span></div><div class=3D"HOEnZb"><div class=3D=
"h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 14 Novemb=
er 2017 at 14:57, Alexander Kanavin <span dir=3D"ltr">&lt;<a href=3D"mailto=
:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.kanavin@lin=
ux.<wbr>intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">S=
witch to gitlab, as that&#39;s where development now happens.<br>
Drop two upstreamed patches, add two patches to avoid newly<br>
introduced build errors.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@li=
nux.intel.com" target=3D"_blank">alexander.kanavin@linux.intel<wbr>.com</a>=
&gt;<br>
---<br>
=C2=A0...001-Typo-in-fuser-makes-M-<wbr>on-all-the-time.patch | 46 --------=
--------------<br>
=C2=A0.../files/0002-Include-<wbr>limits.h-for-PATH_MAX.patch | 29 --------=
------<br>
=C2=A0...-create-src-directory-befo<wbr>re-attempting-t.patch | 30 ++++++++=
++++++<br>
=C2=A0...efile.am-do-not-recurse-in<wbr>to-po-directory.patch | 30 ++++++++=
++++++<br>
=C2=A0meta/recipes-extended/psmisc/<a href=3D"http://psmisc_22.21.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>psmisc_22.21.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 12 ------<br>
=C2=A0meta/recipes-extended/psmisc/<a href=3D"http://psmisc_23.0.bb" rel=3D=
"noreferrer" target=3D"_blank"><wbr>psmisc_23.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 11 ++++++<br>
=C2=A06 files changed, 71 insertions(+), 87 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-extended/psmisc/f<wbr>iles/0001-Typo-=
in-fuser-makes-<wbr>M-on-all-the-time.patch<br>
=C2=A0delete mode 100644 meta/recipes-extended/psmisc/f<wbr>iles/0002-Inclu=
de-limits.h-for<wbr>-PATH_MAX.patch<br>
=C2=A0create mode 100644 meta/recipes-extended/psmisc/p<wbr>smisc/0001-Make=
file.am-create-<wbr>src-directory-before-attemptin<wbr>g-t.patch<br>
=C2=A0create mode 100644 meta/recipes-extended/psmisc/p<wbr>smisc/0001-Make=
file.am-do-not-<wbr>recurse-into-po-directory.patc<wbr>h<br>
=C2=A0delete mode 100644 meta/recipes-extended/psmisc/<a href=3D"http://psm=
isc_22.21.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>smisc_22.21.bb</a>=
<br>
=C2=A0create mode 100644 meta/recipes-extended/psmisc/<a href=3D"http://psm=
isc_23.0.bb" rel=3D"noreferrer" target=3D"_blank">p<wbr>smisc_23.0.bb</a><b=
r>
<br>
diff --git a/meta/recipes-extended/psmisc<wbr>/files/0001-Typo-in-fuser-<wb=
r>makes-M-on-all-the-time.patch b/meta/recipes-extended/psmisc<wbr>/files/0=
001-Typo-in-fuser-<wbr>makes-M-on-all-the-time.patch<br>
deleted file mode 100644<br>
index e57d60f6a34..00000000000<br>
--- a/meta/recipes-extended/psmisc<wbr>/files/0001-Typo-in-fuser-<wbr>makes=
-M-on-all-the-time.patch<br>
+++ /dev/null<br>
@@ -1,46 +0,0 @@<br>
-From 3638cc55b4d08851faba46635d737b<wbr>24d016665b Mon Sep 17 00:00:00 200=
1<br>
-From: Brad Jorsch &lt;<a href=3D"mailto:anomie@users.sourceforge.net" targ=
et=3D"_blank">anomie@users.sourceforge.net</a>&gt;<br>
-Date: Fri, 28 Feb 2014 21:55:02 +1100<br>
-Subject: [PATCH] Typo in fuser makes -M on all the time<br>
-<br>
-Brad found that fuser had the -M option on all the time.<br>
-A simple but significant typo caused this, thanks the the patch.<br>
-<br>
-Bug-Debian: <a href=3D"http://bugs.debian.org/740275" rel=3D"noreferrer" t=
arget=3D"_blank">http://bugs.debian.org/740275</a><br>
-<br>
-Upstream-Status: Backport<br>
-<br>
-Signed-off-by: Craig Small &lt;<a href=3D"mailto:csmall@enc.com.au" target=
=3D"_blank">csmall@enc.com.au</a>&gt;<br>
----<br>
- ChangeLog=C2=A0 =C2=A0| 4 ++++<br>
- src/fuser.c | 2 +-<br>
- 2 files changed, 5 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/ChangeLog b/ChangeLog<br>
-index fd1cccf..e5f784c 100644<br>
---- a/ChangeLog<br>
-+++ b/ChangeLog<br>
-@@ -1,3 +1,7 @@<br>
-+Changes in 22.22<br>
-+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-+=C2=A0 =C2=A0 =C2=A0 * Fixed typo in fuser which has -M on Debian #740275=
<br>
-+<br>
- Changes in 22.21<br>
- =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0* Missing comma in fuser(1) added Debian #70239=
1<br>
-diff --git a/src/fuser.c b/src/fuser.c<br>
-index b485f65..389b302 100644<br>
---- a/src/fuser.c<br>
-+++ b/src/fuser.c<br>
-@@ -1174,7 +1174,7 @@ int main(int argc, char *argv[])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usage(_(&quot;No pr=
ocess specification given&quot;));<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Check if -M flag was used and if so check mo=
unts */<br>
--=C2=A0 =C2=A0 =C2=A0 if (opts * OPT_ISMOUNTPOINT) {<br>
-+=C2=A0 =C2=A0 =C2=A0 if (opts &amp; OPT_ISMOUNTPOINT) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0check_mountpoints(&amp;mounts, &a=
mp;names_head, &amp;names_tail);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
---<br>
-1.8.4.2<br>
-<br>
diff --git a/meta/recipes-extended/psmisc<wbr>/files/0002-Include-limits.h-=
<wbr>for-PATH_MAX.patch b/meta/recipes-extended/psmisc<wbr>/files/0002-Incl=
ude-limits.h-<wbr>for-PATH_MAX.patch<br>
deleted file mode 100644<br>
index c8afcac8a8b..00000000000<br>
--- a/meta/recipes-extended/psmisc<wbr>/files/0002-Include-limits.h-<wbr>fo=
r-PATH_MAX.patch<br>
+++ /dev/null<br>
@@ -1,29 +0,0 @@<br>
-From aa66afecd8ba9cc4139f25ab15ec31<wbr>5173413a7d Mon Sep 17 00:00:00 200=
1<br>
-From: Paul Barker &lt;<a href=3D"mailto:paul@paulbarker.me.uk" target=3D"_=
blank">paul@paulbarker.me.uk</a>&gt;<br>
-Date: Wed, 20 Aug 2014 10:31:37 +0000<br>
-Subject: [PATCH] Include &lt;limits.h&gt; for PATH_MAX<br>
-<br>
-When building against musl libc, PATH_MAX is defined in &lt;limits.h&gt;.<=
br>
-<br>
-Signed-off-by: Paul Barker &lt;<a href=3D"mailto:paul@paulbarker.me.uk" ta=
rget=3D"_blank">paul@paulbarker.me.uk</a>&gt;<br>
-<br>
-Upstream-Status: Accepted (Should be in next release after 22.21)<br>
----<br>
- src/pstree.c | 1 +<br>
- 1 file changed, 1 insertion(+)<br>
-<br>
-diff --git a/src/pstree.c b/src/pstree.c<br>
-index 071e6c4..0d28260 100644<br>
---- a/src/pstree.c<br>
-+++ b/src/pstree.c<br>
-@@ -41,6 +41,7 @@<br>
- #include &lt;sys/types.h&gt;<br>
- #include &lt;sys/stat.h&gt;<br>
- #include &lt;sys/ioctl.h&gt;<br>
-+#include &lt;limits.h&gt;<br>
-<br>
- #include &quot;i18n.h&quot;<br>
- #include &quot;comm.h&quot;<br>
---<br>
-2.0.4<br>
-<br>
diff --git a/meta/recipes-extended/psmisc<wbr>/psmisc/0001-Makefile.am-<wbr=
>create-src-directory-before-<wbr>attempting-t.patch b/meta/recipes-extende=
d/psmisc<wbr>/psmisc/0001-Makefile.am-<wbr>create-src-directory-before-<wbr=
>attempting-t.patch<br>
new file mode 100644<br>
index 00000000000..4d44495fd3f<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/psmisc<wbr>/psmisc/0001-Makefile.am-<wbr>create=
-src-directory-before-<wbr>attempting-t.patch<br>
@@ -0,0 +1,30 @@<br>
+From 285877b7761d74736aca2687ed9bef<wbr>2f78b82c33 Mon Sep 17 00:00:00 200=
1<br>
+From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" targ=
et=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
+Date: Thu, 2 Nov 2017 16:21:22 +0200<br>
+Subject: [PATCH] Makefile.am: create src directory before attempting to wr=
ite<br>
+ there<br>
+<br>
+Otherwise out of tree builds will fail.<br>
+<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
+---<br>
+ Makefile.am | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/Makefile.am b/Makefile.am<br>
+index 9f61ab4..b4ced7f 100644<br>
+--- a/Makefile.am<br>
++++ b/Makefile.am<br>
+@@ -79,7 +79,7 @@ EXTRA_DIST =3D src/signames.c README.md<br>
+ CLEANFILES =3D src/signames.h<br>
+<br>
+ src/signames.h: src/signames.c Makefile<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export LC_ALL=3DC ; \<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 export LC_ALL=3DC ; mkdi=
r -p src ; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@CPP@ -dM $&lt; |\<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tr -s &#39;\t &#39;=
 &#39; &#39; | sort -n -k 3 | sed \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;s:#define SIG\([A-Z][A-Z]*[0-9]*\) \([0-9]=
[0-9]*\).*$\:{\ \2,&quot;\1&quot; },:p;d&#39; | \<br>
+--<br>
+2.14.2<br>
+<br>
diff --git a/meta/recipes-extended/psmisc<wbr>/psmisc/0001-Makefile.am-do-<=
wbr>not-recurse-into-po-directory.<wbr>patch b/meta/recipes-extended/psmisc=
<wbr>/psmisc/0001-Makefile.am-do-<wbr>not-recurse-into-po-directory.<wbr>pa=
tch<br>
new file mode 100644<br>
index 00000000000..72f993a1702<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/psmisc<wbr>/psmisc/0001-Makefile.am-do-<wbr>not=
-recurse-into-po-directory.<wbr>patch<br>
@@ -0,0 +1,30 @@<br>
+From bbd69f375a0eaeba3bfa17008f8ff4<wbr>1e836c1688 Mon Sep 17 00:00:00 200=
1<br>
+From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" targ=
et=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
+Date: Thu, 2 Nov 2017 16:39:59 +0200<br>
+Subject: [PATCH] Makefile.am: do not recurse into po directory<br>
+<br>
+Some broken autoconf logic results in a missing Makefile - let&#39;s<br>
+just skip the directory with translations, as users of psmisc are unlikely=
<br>
+to need those anyway.<br>
+<br>
+Upstream-Status: Inappropriate [oe-core specific]<br>
+Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
+---<br>
+ Makefile.am | 1 -<br>
+ 1 file changed, 1 deletion(-)<br>
+<br>
+diff --git a/Makefile.am b/Makefile.am<br>
+index b4ced7f..0d343a6 100644<br>
+--- a/Makefile.am<br>
++++ b/Makefile.am<br>
+@@ -11,7 +11,6 @@ ACLOCAL_AMFLAGS =3D -I m4<br>
+<br>
+ SUBDIRS =3D \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0doc \<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 po \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0icons \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0testsuite<br>
+<br>
+--<br>
+2.14.2<br>
+<br>
diff --git a/meta/recipes-extended/psmisc<wbr>/<a href=3D"http://psmisc_22.=
21.bb" rel=3D"noreferrer" target=3D"_blank">psmisc_22.21.bb</a> b/meta/reci=
pes-extended/psmisc<wbr>/<a href=3D"http://psmisc_22.21.bb" rel=3D"noreferr=
er" target=3D"_blank">psmisc_22.21.bb</a><br>
deleted file mode 100644<br>
index 1c6473ebf43..00000000000<br>
--- a/meta/recipes-extended/psmisc<wbr>/<a href=3D"http://psmisc_22.21.bb" =
rel=3D"noreferrer" target=3D"_blank">psmisc_22.21.bb</a><br>
+++ /dev/null<br>
@@ -1,12 +0,0 @@<br>
-require psmisc.inc<br>
-LICENSE =3D &quot;GPLv2&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D0636e73ff0<wbr>215e8d672dc=
4c32c317bb3&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;935c0fd6eb208288262b385fa656f<wbr>1bf&quot;<br>
-SRC_URI[sha256sum] =3D &quot;97323cad619210845b696d7d722c3<wbr>83852b2acb5=
c49b5b0852c4f29c77a<wbr>8145a&quot;<br>
-<br>
-SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/psmisc/<wbr>psmisc-${PV}.tar.gz \<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Typo-in-fuser-mak<wbr=
>es-M-on-all-the-time.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Include-limits.h-<wbr=
>for-PATH_MAX.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Use-UINTPTR_MAX-i<wbr=
>nstead-of-__WORDSIZE.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
diff --git a/meta/recipes-extended/psmisc<wbr>/<a href=3D"http://psmisc_23.=
0.bb" rel=3D"noreferrer" target=3D"_blank">psmisc_23.0.bb</a> b/meta/recipe=
s-extended/psmisc<wbr>/<a href=3D"http://psmisc_23.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">psmisc_23.0.bb</a><br>
new file mode 100644<br>
index 00000000000..e036ae25508<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/psmisc<wbr>/<a href=3D"http://psmisc_23.0.bb" r=
el=3D"noreferrer" target=3D"_blank">psmisc_23.0.bb</a><br>
@@ -0,0 +1,11 @@<br>
+require psmisc.inc<br>
+LICENSE =3D &quot;GPLv2&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D0636e73ff0<wbr>215e8d672dc=
4c32c317bb3&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://gitlab.com/psmisc/psmisc.git;pro=
tocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">gitlab.com/psmisc/psmis=
<wbr>c.git;protocol=3Dhttps</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Use-UINTPTR_MAX-i<wbr=
>nstead-of-__WORDSIZE.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Makefile.am-create<wbr>-src=
-directory-before-attempti<wbr>ng-t.patch=C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Makefile.am-do-no<wbr=
><a href=3D"http://t-recurse-into-po-directory.pa">t-recurse-into-po-direct=
ory.pa</a><wbr>tch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+SRCREV =3D &quot;67b1da268f4c0ce6859980e3dfcfa<wbr>ec5b2448e80&quot;<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
<span class=3D"m_-3080677120899070445HOEnZb"><font color=3D"#888888">--<br>
2.15.0<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--001a114ca162b37205055e22eafe--
