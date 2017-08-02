Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8B2A36011C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Aug 2017 20:34:11 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r77so309160wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Aug 2017 13:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BASb10IOgPh7t1gQj82BCccOXMIcmVU9vs8Bl6aOA3s=;
	b=XEyT5LX9Y9nytytILoPqG4L/mtumR4IwqdlD/LVa3kJ7aakRPFZHywhV55XECwG+VD
	d8cZBpa086GMX7YwCj+GzzhXzh2CeP8E7pe4J65II2I8GnI+JG4Q7Yv8J60IB2RMx7jo
	Od/EEDq0xZoaTHneH3fPOAtryNNkl9yOj20vhp+fj+0R2HRyPSx5ig/b39kCcDO/9jUo
	8IVEwRnkLz6jB7CzaHbzXh8kw/GKuz7vOciTTaqgrgmfnqyD4ORauuLnYLt+LNBan+VU
	2vE5FZuOYXx4/eqYlyrlDj4QnjFbQtULflTc4myRfSdlcGdzqNz1YV8mNoF/mXCns8UJ
	9yGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BASb10IOgPh7t1gQj82BCccOXMIcmVU9vs8Bl6aOA3s=;
	b=mP+pDPUpQ7dXtWPEr12cdSY4OchMOSYyUwiu7NRcmaPrCNo6dwIf2MLPX8z5Qnj6gh
	pewDL9TF1dOjWW7CjFO98CVcWy0UazDGRc4EvA5eTvhLJGrC4lSFb+T6crAKZ7KjuwNW
	XqqT8WGIuJv0fsb0P/I3/TWWd3Ng77HN0uMNhNm9FSTw/ed4IduaPenEXr/FzZU6Niq9
	EPjpOOysFFP38O3P7DKnQ4uoWLU437V2N1vxNHl9GbP9Xdylglb7stS2PA4WOUEroqPr
	OYIh2v4u0kAM7B4AVpZQnPfBaheayYFdBeUP64eSniImb8kk1+Rh8Wb07OWZrK1clGuu
	PgNQ==
X-Gm-Message-State: AIVw111YizI2s+6HZ0/XWIsivLphpJiwtVIoKZmgtIbHwTY2OFMm3kQJ
	yF88FsPeUO+JxzZ0SPAyo09LKDHyQg==
X-Received: by 10.80.159.227 with SMTP id c90mr16054193edf.11.1501706052276;
	Wed, 02 Aug 2017 13:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20170801163443.10899-1-raj.khem@gmail.com>
	<CAJTo0LYexDbJbkWb0=v1L4cjpEMyw5gL8NmcSTQd9QXjnF4_aA@mail.gmail.com>
In-Reply-To: <CAJTo0LYexDbJbkWb0=v1L4cjpEMyw5gL8NmcSTQd9QXjnF4_aA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 02 Aug 2017 20:34:01 +0000
Message-ID: <CAMKF1sossdZYGd9QFunkAHKBxUUikus8N18MKa-fNckLpWerdw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Update to latest on 2.26 pre-release
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
X-List-Received-Date: Wed, 02 Aug 2017 20:34:12 -0000
Content-Type: multipart/alternative; boundary="94eb2c193a96cd95a90555cb2f00"

--94eb2c193a96cd95a90555cb2f00
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 2, 2017 at 8:13 AM Burton, Ross <ross.burton@intel.com> wrote:

> Various errors in glibc-locale:
>
> | LC_ADDRESS: language abbreviation `agr' not defined
> | LC_ADDRESS: terminology language code `azb' not defined
>
> | Makefile:175: recipe for target
> '/data/poky-tmp/master/build/work/corei7-64-poky-linux/glibc-locale/2.25.90-r0/locale-tree/usr/lib/locale/agr_PE'
> failed
>
> | Makefile:628: recipe for target
> '/data/poky-tmp/master/build/work/corei7-64-poky-linux/glibc-locale/2.25.90-r0/locale-tree/usr/lib/locale/az_IR'
> failed
>
> ERROR: Task
> (/home/ross/Yocto/poky/meta/recipes-core/glibc/glibc-locale_2.25.90.bb:do_package)
> failed with exit code '1'
>

How to reproduce it

>
> Ross
>
>
> On 1 August 2017 at 17:34, Khem Raj <raj.khem@gmail.com> wrote:
>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  .../glibc/cross-localedef-native_2.25.90.bb        |  2 +-
>>  ...ress-pedantic-warning-caused-by-statement.patch | 90
>> ++++++++++++++++++++++
>>  meta/recipes-core/glibc/glibc_2.25.90.bb           |  3 +-
>>  3 files changed, 93 insertions(+), 2 deletions(-)
>>  create mode 100644
>> meta/recipes-core/glibc/glibc/0026-assert-Suppress-pedantic-warning-caused-by-statement.patch
>>
>> diff --git a/meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb
>> b/meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb
>> index 5dd0c70400..6d84e52380 100644
>> --- a/meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb
>> +++ b/meta/recipes-core/glibc/cross-localedef-native_2.25.90.bb
>> @@ -22,7 +22,7 @@ SRCBRANCH ?= "master"
>>  GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
>>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.\d+)*)"
>>
>> -SRCREV_glibc ?= "43a9f537fc121a867981ca31ea9d79f33ce0fd24"
>> +SRCREV_glibc ?= "930324b356778b985d26f30fd0386163852a35fe"
>>  SRCREV_localedef ?= "dfb4afe551c6c6e94f9cc85417bd1f582168c843"
>>
>>  SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>> diff --git
>> a/meta/recipes-core/glibc/glibc/0026-assert-Suppress-pedantic-warning-caused-by-statement.patch
>> b/meta/recipes-core/glibc/glibc/0026-assert-Suppress-pedantic-warning-caused-by-statement.patch
>> new file mode 100644
>> index 0000000000..b2bb96b818
>> --- /dev/null
>> +++
>> b/meta/recipes-core/glibc/glibc/0026-assert-Suppress-pedantic-warning-caused-by-statement.patch
>> @@ -0,0 +1,90 @@
>> +From 037283cbc74739b72f36dfec827d120faa243406 Mon Sep 17 00:00:00 2001
>> +From: Florian Weimer <fweimer at redhat dot com>
>> +Date: Thu, 6 Jul 2017 11:50:55 +0200
>> +Subject: [PATCH 26/26] assert: Suppress pedantic warning caused by
>> statement
>> + expression [BZ# 21242]
>> +
>> +On 07/05/2017 10:15 PM, Zack Weinberg wrote:
>> +> On Wed, Jul 5, 2017 at 11:51 AM, Florian Weimer <fweimer@redhat.com>
>> wrote:
>> +>> On 07/05/2017 05:46 PM, Zack Weinberg wrote:
>> +>>> A problem occurs to me: expressions involving VLAs _are_ evaluated
>> +>>> inside sizeof.
>> +>>
>> +>> The type of the sizeof argument would still be int (due to the
>> +>> comparison against 0), so this doesn't actually occur.
>> +>
>> +> I rechecked what C99 says about sizeof and VLAs, and you're right -
>> +> the operand of sizeof is only evaluated when sizeof is _directly_
>> +> applied to a VLA.  So this is indeed safe, but I think this wrinkle
>> +> should be mentioned in the comment.  Perhaps
>> +>
>> +> /* The first occurrence of EXPR is not evaluated due to the sizeof,
>> +>    but will trigger any pedantic warnings masked by the __extension__
>> +>    for the second occurrence.  The explicit comparison against zero
>> +>    ensures that sizeof is not directly applied to a function pointer or
>> +>    bit-field (which would be ill-formed) or VLA (which would be
>> evaluated).  */
>> +>
>> +> zw
>> +
>> +What about the attached patch?
>> +
>> +Siddhesh, is this okay during the freeze?  I'd like to backport it to
>> +2.25 as well.
>> +
>> +Thanks,
>> +Florian
>> +
>> +assert: Suppress pedantic warning caused by statement expression
>> +
>> +2017-07-06  Florian Weimer  <fweimer@redhat.com>
>> +
>> +       [BZ #21242]
>> +       * assert/assert.h [__GNUC__ && !__STRICT_ANSI__] (assert):
>> +       Suppress pedantic warning resulting from statement expression.
>> +       (__ASSERT_FUNCTION): Add missing __extendsion__.
>> +---
>> +
>> +Upstream-Status: Submitted
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +
>> + assert/assert.h | 12 +++++++++---
>> + 1 file changed, 9 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/assert/assert.h b/assert/assert.h
>> +index 22f019537c..6801cfeb10 100644
>> +--- a/assert/assert.h
>> ++++ b/assert/assert.h
>> +@@ -91,13 +91,19 @@ __END_DECLS
>> +      ? __ASSERT_VOID_CAST (0)                                         \
>> +      : __assert_fail (#expr, __FILE__, __LINE__, __ASSERT_FUNCTION))
>> + # else
>> ++/* The first occurrence of EXPR is not evaluated due to the sizeof,
>> ++   but will trigger any pedantic warnings masked by the __extension__
>> ++   for the second occurrence.  The explicit comparison against zero is
>> ++   required to support function pointers and bit fields in this
>> ++   context, and to suppress the evaluation of variable length
>> ++   arrays.  */
>> + #  define assert(expr)
>>       \
>> +-    ({
>>       \
>> ++  ((void) sizeof ((expr) == 0), __extension__ ({                      \
>> +       if (expr)
>>        \
>> +         ; /* empty */                                                 \
>> +       else                                                            \
>> +         __assert_fail (#expr, __FILE__, __LINE__, __ASSERT_FUNCTION); \
>> +-    })
>> ++    }))
>> + # endif
>> +
>> + # ifdef       __USE_GNU
>> +@@ -113,7 +119,7 @@ __END_DECLS
>> +    C9x has a similar variable called __func__, but prefer the GCC one
>> since
>> +    it demangles C++ function names.  */
>> + # if defined __cplusplus ? __GNUC_PREREQ (2, 6) : __GNUC_PREREQ (2, 4)
>> +-#   define __ASSERT_FUNCTION  __PRETTY_FUNCTION__
>> ++#   define __ASSERT_FUNCTION  __extension__ __PRETTY_FUNCTION__
>> + # else
>> + #  if defined __STDC_VERSION__ && __STDC_VERSION__ >= 199901L
>> + #   define __ASSERT_FUNCTION  __func__
>> +--
>> +2.13.3
>> +
>> diff --git a/meta/recipes-core/glibc/glibc_2.25.90.bb
>> b/meta/recipes-core/glibc/glibc_2.25.90.bb
>> index caf1ff4138..6f373520bb 100644
>> --- a/meta/recipes-core/glibc/glibc_2.25.90.bb
>> +++ b/meta/recipes-core/glibc/glibc_2.25.90.bb
>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
>> "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
>>
>>  DEPENDS += "gperf-native"
>>
>> -SRCREV ?= "43a9f537fc121a867981ca31ea9d79f33ce0fd24"
>> +SRCREV ?= "930324b356778b985d26f30fd0386163852a35fe"
>>
>>  #SRCBRANCH ?= "release/${PV}/master"
>>  SRCBRANCH ?= "master"
>> @@ -41,6 +41,7 @@ SRC_URI =
>> "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>>             file://0023-Define-DUMMY_LOCALE_T-if-not-defined.patch \
>>
>> file://0024-elf-dl-deps.c-Make-_dl_build_local_scope-breadth-fir.patch \
>>             file://0025-locale-fix-hard-coded-reference-to-gcc-E.patch \
>> +
>>  file://0026-assert-Suppress-pedantic-warning-caused-by-statement.patch \
>>  "
>>
>>  NATIVESDKFIXES ?= ""
>>
> --
>> 2.13.3
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--94eb2c193a96cd95a90555cb2f00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Wed, Aug 2, 2017 a=
t 8:13 AM Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ross.bu=
rton@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>=
Various errors in glibc-locale:<div><br></div><div>| LC_ADDRESS: language a=
bbreviation `agr&#39; not defined<div>| LC_ADDRESS: terminology language co=
de `azb&#39; not defined</div><div><br><div>| Makefile:175: recipe for targ=
et &#39;/data/poky-tmp/master/build/work/corei7-64-poky-linux/glibc-locale/=
2.25.90-r0/locale-tree/usr/lib/locale/agr_PE&#39; failed<br></div><div><br>=
</div><div>| Makefile:628: recipe for target &#39;/data/poky-tmp/master/bui=
ld/work/corei7-64-poky-linux/glibc-locale/2.25.90-r0/locale-tree/usr/lib/lo=
cale/az_IR&#39; failed<br></div><div><br></div><div>ERROR: Task (/home/ross=
/Yocto/poky/meta/recipes-core/glibc/glibc-locale_2.25.90.bb:do_package) fai=
led with exit code &#39;1&#39;<br></div><div></div></div></div></div></bloc=
kquote><div dir=3D"auto"><br></div><div dir=3D"auto">How to reproduce it</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div><div><div><div><br></div><div>Ross</=
div></div></div><div><br></div></div><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote"></div></div><div class=3D"gmail_extra"><div class=3D"gm=
ail_quote">On 1 August 2017 at 17:34, Khem Raj <span>&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br></div></div><div class=3D"gmail_extra"><div class=3D"gmail_quote"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">Signed-off-by: Khem Raj &lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../glibc/<a href=3D"http://cross-localedef-native_2.25.90.bb" rel=3D=
"noreferrer" target=3D"_blank">cross-localedef-native_2.25.90.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0...ress-pedantic-warning-caused-by-statement.patch | 90 +++++++++++++=
+++++++++<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.25.90.bb" rel=3D"no=
referrer" target=3D"_blank">glibc_2.25.90.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 3 +-<br>
=C2=A03 files changed, 93 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-core/glibc/glibc/0026-assert-Suppress=
-pedantic-warning-caused-by-statement.patch<br>
<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://cross-localedef-nati=
ve_2.25.90.bb" rel=3D"noreferrer" target=3D"_blank">cross-localedef-native_=
2.25.90.bb</a> b/meta/recipes-core/glibc/<a href=3D"http://cross-localedef-=
native_2.25.90.bb" rel=3D"noreferrer" target=3D"_blank">cross-localedef-nat=
ive_2.25.90.bb</a><br>
index 5dd0c70400..6d84e52380 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://cross-localedef-native_2.25=
.90.bb" rel=3D"noreferrer" target=3D"_blank">cross-localedef-native_2.25.90=
.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://cross-localedef-native_2.25=
.90.bb" rel=3D"noreferrer" target=3D"_blank">cross-localedef-native_2.25.90=
.bb</a><br>
@@ -22,7 +22,7 @@ SRCBRANCH ?=3D &quot;master&quot;<br>
=C2=A0GLIBC_GIT_URI ?=3D &quot;git://<a href=3D"http://sourceware.org/git/g=
libc.git" rel=3D"noreferrer" target=3D"_blank">sourceware.org/git/glibc.git=
</a>&quot;<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;(?P&lt;pver&gt;\d+\.\d+(\.\d+)*)=
&quot;<br>
<br>
-SRCREV_glibc ?=3D &quot;43a9f537fc121a867981ca31ea9d79f33ce0fd24&quot;<br>
+SRCREV_glibc ?=3D &quot;930324b356778b985d26f30fd0386163852a35fe&quot;<br>
=C2=A0SRCREV_localedef ?=3D &quot;dfb4afe551c6c6e94f9cc85417bd1f582168c843&=
quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;${GLIBC_GIT_URI};branch=3D${SRCBRANCH};name=3Dglibc=
 \<br>
diff --git a/meta/recipes-core/glibc/glibc/0026-assert-Suppress-pedantic-wa=
rning-caused-by-statement.patch b/meta/recipes-core/glibc/glibc/0026-assert=
-Suppress-pedantic-warning-caused-by-statement.patch<br>
new file mode 100644<br>
index 0000000000..b2bb96b818<br>
--- /dev/null<br>
+++ b/meta/recipes-core/glibc/glibc/0026-assert-Suppress-pedantic-warning-c=
aused-by-statement.patch<br>
@@ -0,0 +1,90 @@<br>
+From 037283cbc74739b72f36dfec827d120faa243406 Mon Sep 17 00:00:00 2001<br>
+From: Florian Weimer &lt;fweimer at redhat dot com&gt;<br>
+Date: Thu, 6 Jul 2017 11:50:55 +0200<br>
+Subject: [PATCH 26/26] assert: Suppress pedantic warning caused by stateme=
nt<br>
+ expression [BZ# 21242]<br>
+<br>
+On 07/05/2017 10:15 PM, Zack Weinberg wrote:<br>
+&gt; On Wed, Jul 5, 2017 at 11:51 AM, Florian Weimer &lt;<a href=3D"mailto=
:fweimer@redhat.com" target=3D"_blank">fweimer@redhat.com</a>&gt; wrote:<br=
>
+&gt;&gt; On 07/05/2017 05:46 PM, Zack Weinberg wrote:<br>
+&gt;&gt;&gt; A problem occurs to me: expressions involving VLAs _are_ eval=
uated<br>
+&gt;&gt;&gt; inside sizeof.<br>
+&gt;&gt;<br>
+&gt;&gt; The type of the sizeof argument would still be int (due to the<br=
>
+&gt;&gt; comparison against 0), so this doesn&#39;t actually occur.<br>
+&gt;<br>
+&gt; I rechecked what C99 says about sizeof and VLAs, and you&#39;re right=
 -<br>
+&gt; the operand of sizeof is only evaluated when sizeof is _directly_<br>
+&gt; applied to a VLA.=C2=A0 So this is indeed safe, but I think this wrin=
kle<br>
+&gt; should be mentioned in the comment.=C2=A0 Perhaps<br>
+&gt;<br>
+&gt; /* The first occurrence of EXPR is not evaluated due to the sizeof,<b=
r>
+&gt;=C2=A0 =C2=A0 but will trigger any pedantic warnings masked by the __e=
xtension__<br>
+&gt;=C2=A0 =C2=A0 for the second occurrence.=C2=A0 The explicit comparison=
 against zero<br>
+&gt;=C2=A0 =C2=A0 ensures that sizeof is not directly applied to a functio=
n pointer or<br>
+&gt;=C2=A0 =C2=A0 bit-field (which would be ill-formed) or VLA (which woul=
d be evaluated).=C2=A0 */<br>
+&gt;<br>
+&gt; zw<br>
+<br>
+What about the attached patch?<br>
+<br>
+Siddhesh, is this okay during the freeze?=C2=A0 I&#39;d like to backport i=
t to<br>
+2.25 as well.<br>
+<br>
+Thanks,<br>
+Florian<br>
+<br>
+assert: Suppress pedantic warning caused by statement expression<br>
+<br>
+2017-07-06=C2=A0 Florian Weimer=C2=A0 &lt;<a href=3D"mailto:fweimer@redhat=
.com" target=3D"_blank">fweimer@redhat.com</a>&gt;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[BZ #21242]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* assert/assert.h [__GNUC__ &amp;&amp; !__STRIC=
T_ANSI__] (assert):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Suppress pedantic warning resulting from statem=
ent expression.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(__ASSERT_FUNCTION): Add missing __extendsion__=
.<br>
+---<br>
+<br>
+Upstream-Status: Submitted<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+<br>
+ assert/assert.h | 12 +++++++++---<br>
+ 1 file changed, 9 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/assert/assert.h b/assert/assert.h<br>
+index 22f019537c..6801cfeb10 100644<br>
+--- a/assert/assert.h<br>
++++ b/assert/assert.h<br>
+@@ -91,13 +91,19 @@ __END_DECLS<br>
+=C2=A0 =C2=A0 =C2=A0 ? __ASSERT_VOID_CAST (0)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 : __assert_fail (#expr, __FILE__, __LINE__, __ASSERT_=
FUNCTION))<br>
+ # else<br>
++/* The first occurrence of EXPR is not evaluated due to the sizeof,<br>
++=C2=A0 =C2=A0but will trigger any pedantic warnings masked by the __exten=
sion__<br>
++=C2=A0 =C2=A0for the second occurrence.=C2=A0 The explicit comparison aga=
inst zero is<br>
++=C2=A0 =C2=A0required to support function pointers and bit fields in this=
<br>
++=C2=A0 =C2=A0context, and to suppress the evaluation of variable length<b=
r>
++=C2=A0 =C2=A0arrays.=C2=A0 */<br>
+ #=C2=A0 define assert(expr)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \<br>
+-=C2=A0 =C2=A0 ({=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
++=C2=A0 ((void) sizeof ((expr) =3D=3D 0), __extension__ ({=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (expr)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0; /* empty */=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__assert_fail (#expr, __FILE__, __LINE__=
, __ASSERT_FUNCTION); \<br>
+-=C2=A0 =C2=A0 })<br>
++=C2=A0 =C2=A0 }))<br>
+ # endif<br>
+<br>
+ # ifdef=C2=A0 =C2=A0 =C2=A0 =C2=A0__USE_GNU<br>
+@@ -113,7 +119,7 @@ __END_DECLS<br>
+=C2=A0 =C2=A0 C9x has a similar variable called __func__, but prefer the G=
CC one since<br>
+=C2=A0 =C2=A0 it demangles C++ function names.=C2=A0 */<br>
+ # if defined __cplusplus ? __GNUC_PREREQ (2, 6) : __GNUC_PREREQ (2, 4)<br=
>
+-#=C2=A0 =C2=A0define __ASSERT_FUNCTION=C2=A0 __PRETTY_FUNCTION__<br>
++#=C2=A0 =C2=A0define __ASSERT_FUNCTION=C2=A0 __extension__ __PRETTY_FUNCT=
ION__<br>
+ # else<br>
+ #=C2=A0 if defined __STDC_VERSION__ &amp;&amp; __STDC_VERSION__ &gt;=3D 1=
99901L<br>
+ #=C2=A0 =C2=A0define __ASSERT_FUNCTION=C2=A0 __func__<br>
+--<br>
+2.13.3<br>
+<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.25.90.bb" re=
l=3D"noreferrer" target=3D"_blank">glibc_2.25.90.bb</a> b/meta/recipes-core=
/glibc/<a href=3D"http://glibc_2.25.90.bb" rel=3D"noreferrer" target=3D"_bl=
ank">glibc_2.25.90.bb</a><br>
index caf1ff4138..6f373520bb 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.25.90.bb" rel=3D"no=
referrer" target=3D"_blank">glibc_2.25.90.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.25.90.bb" rel=3D"no=
referrer" target=3D"_blank">glibc_2.25.90.bb</a><br>
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSES;md5=3De9a558e243=
b36d3209f380deb394b213 \<br>
<br>
=C2=A0DEPENDS +=3D &quot;gperf-native&quot;<br>
<br>
-SRCREV ?=3D &quot;43a9f537fc121a867981ca31ea9d79f33ce0fd24&quot;<br>
+SRCREV ?=3D &quot;930324b356778b985d26f30fd0386163852a35fe&quot;<br>
<br>
=C2=A0#SRCBRANCH ?=3D &quot;release/${PV}/master&quot;<br>
=C2=A0SRCBRANCH ?=3D &quot;master&quot;<br>
@@ -41,6 +41,7 @@ SRC_URI =3D &quot;${GLIBC_GIT_URI};branch=3D${SRCBRANCH};=
name=3Dglibc \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0023-Define-DUMMY_LOCALE_T=
-if-not-defined.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0024-elf-dl-deps.c-Make-_d=
l_build_local_scope-breadth-fir.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0025-locale-fix-hard-coded=
-reference-to-gcc-E.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0026-assert-Suppress-pedan=
tic-warning-caused-by-statement.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0NATIVESDKFIXES ?=3D &quot;&quot;<br>
</blockquote></div></div><div class=3D"gmail_extra"><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><span class=3D"m_-4219318886513053696HOE=
nZb"><font color=3D"#888888">--<br>
2.13.3<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div></div></blockquote></div></div>

--94eb2c193a96cd95a90555cb2f00--
