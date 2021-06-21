Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web09.226.1624296649205471775
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jun 2021 10:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BRkXDMrH;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: ticotimo@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id g22so3007844iom.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jun 2021 10:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0DLFvzW030QtNWn+E18YT9r5IRU/lLNxanAMgDmN4CM=;
        b=BRkXDMrHYc8Ydr5OOClyU6xuuzeWyA/RN0eLfagUUzVjkL8tIshhrLKpWsqHEdAb5b
         xCh1nlU4zuKnDVrqWyE8ivTHjieJ2ZPgIlskfgEEZej5Q9edXb/uIp9nQFqnRy+ARfJ4
         V6nh3l5/qq4BVgx2Eo6ZxQ9H3o8Arhckj0ha/KfCjOh57dLu5WcaQ1CyFXT/VhnZNMe7
         MFwoS0yXLOBaOU/q8voiO6qTJf7hCGyebtIMa7DzGLzsRBUn/SagSkwJcNigEkSk77/J
         JJorjbzYWE7/vsCLbOxacMfkhuQQGdEN1/BNV1IeIT35cyuFVV0PECvU/05e7YcYThfe
         7IRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0DLFvzW030QtNWn+E18YT9r5IRU/lLNxanAMgDmN4CM=;
        b=aM7q4/e9mU9dnrVI3qPd1ONfzIPw5g6TvDpURi+z4dUpUKOMJWwuNJNNheeAWJLx2b
         hoZSMq5sJWryNy8VYXpPOWFWZOV084kR+J5HJVrc0ALk0q38TYiywwaG1Uei9DiQ4Z4w
         kzpoyRDEUPsmJ/Wv1lPiSQLoRFBopnXt07OHvJajcPiIDQruBKGKVqRcZQHlfvL2QjDj
         K/VogcbF5gTwBhQwrZly6olHIxYg6+sXIEKoKO/Xlc8MaG/CKLOWS6STHo5fuK1Z8VOQ
         5JRLoacovaUqecIBVDFqp24XmQuM8BRbHSByYuu7uLAfizh5aCs9trn0wzH/6udOX9hJ
         rXWA==
X-Gm-Message-State: AOAM532QxHCP9KszfkscBPrk/6jEm1PzZSMxyhHB/IcOzkpLr96uuiRk
	Rg9PWJ2Js9qFh6YwDnZwGil2ABD3fSg/LK8BXTo=
X-Google-Smtp-Source: ABdhPJxP/ChyLXJOZRGM37DmhQOCBcZcEhWVtpUJwcZu4AgV+YbTKp7dzpcsJglpUSBO01f96GxZda5UOwW6N3/LtyM=
X-Received: by 2002:a02:ba0a:: with SMTP id z10mr10413219jan.10.1624296648448;
 Mon, 21 Jun 2021 10:30:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1624060313.git.timothy.t.orling@intel.com>
 <4207e03bcbbfd8b6113c04bc7c35ceb516af31f6.1624060313.git.timothy.t.orling@intel.com>
 <CANNYZj8diO0prd1g6ixjhXVc6NFB0otk8dr8yY-Fw2OMEjJjSA@mail.gmail.com>
In-Reply-To: <CANNYZj8diO0prd1g6ixjhXVc6NFB0otk8dr8yY-Fw2OMEjJjSA@mail.gmail.com>
From: "Tim Orling" <ticotimo@gmail.com>
Date: Mon, 21 Jun 2021 10:30:36 -0700
Message-ID: <CANx9H-D3cnMKVNJq5-xu-kNGPDKCMqhggmfxFY8K22iDsTfYWw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/1] python3: skip tests requiring tools-sdk
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Tim Orling <timothy.t.orling@intel.com>
Content-Type: multipart/alternative; boundary="000000000000bda12505c54a0827"

--000000000000bda12505c54a0827
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 21, 2021 at 5:00 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> Wait. How does this work, if IMAGE_FEATURES are set from image recipes,
> and not globally?
>
> I'm afraid this may have to be reverted, as it just made it to master.
>
>
These tests have only been passing (since.python3 3.9.0 upgrade) because
the AB ptest images in one way or another have included
packagegroup-core-buildessential.

I asked RP about adding packagegroup-core-buildessential as RDEPENDS for
python3-ptest and he was concerned about build performance. I tried to
narrow the scope to gcc-symlinks and binutils-symlinks, but that was not
enough to make the tests pass.

As I see it, we have two options, this patch which skips the tests
conditionally, or we UNCONDITIONALLY skip the tests.
If you run python3-ptest (and nothing else) on core-image-minimal, these
test cases will fail, which means we do not have proper RDEPENDS for
python3-ptest.

Open to other ideas.


> Alex
>
> On Sat, 19 Jun 2021 at 02:00, Tim Orling <ticotimo@gmail.com> wrote:
>
>> Conditionally skip test_ctypes.test_find unless
>> IMAGE_FEATURES contains 'tools-sdk' as these test
>> cases require full packagegroup-core-buildessential
>>
>> Fixes:
>>   AssertionError: Failed ptests:
>>   {'python3': ['test_find_library_with_gcc', 'test_find_library_with_ld']}
>>
>> Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
>> ---
>>  ...pes.test_find-skip-without-tools-sdk.patch | 33 +++++++++++++++++++
>>  meta/recipes-devtools/python/python3_3.9.5.bb |  1 +
>>  2 files changed, 34 insertions(+)
>>  create mode 100644
>> meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
>>
>> diff --git
>> a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
>> b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
>> new file mode 100644
>> index 00000000000..7d684b3c43c
>> --- /dev/null
>> +++
>> b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip-without-tools-sdk.patch
>> @@ -0,0 +1,33 @@
>> +From 7a2bddfa437be633bb6945d0e6b7d6f27da870ad Mon Sep 17 00:00:00 2001
>> +From: Tim Orling <timothy.t.orling@intel.com>
>> +Date: Fri, 18 Jun 2021 11:56:50 -0700
>> +Subject: [PATCH] test_ctypes.test_find: skip without tools-sdk
>> +
>> +These tests need full packagegroup-core-buildessential, the
>> +easiest way to dynamically check for that is looking for
>> +'tools-sdk' in IMAGE_FEATURES.
>> +
>> +Upstream-Status: Inappropriate [oe-specific]
>> +
>> +Signed-off-by: Tim Orling <timothy.t.orlign@intel.com>
>> +---
>> + Lib/ctypes/test/test_find.py | 2 ++
>> + 1 file changed, 2 insertions(+)
>> +
>> +diff --git a/Lib/ctypes/test/test_find.py b/Lib/ctypes/test/test_find.py
>> +index 92ac184..0d009d1 100644
>> +--- a/Lib/ctypes/test/test_find.py
>> ++++ b/Lib/ctypes/test/test_find.py
>> +@@ -112,10 +112,12 @@ class FindLibraryLinux(unittest.TestCase):
>> +                 # LD_LIBRARY_PATH)
>> +                 self.assertEqual(find_library(libname), 'lib%s.so' %
>> libname)
>> +
>> ++    @unittest.skip("Needs IMAGE_FEATURE += \"tools-sdk\"")
>> +     def test_find_library_with_gcc(self):
>> +         with unittest.mock.patch("ctypes.util._findSoname_ldconfig",
>> lambda *args: None):
>> +             self.assertNotEqual(find_library('c'), None)
>> +
>> ++    @unittest.skip("Needs IMAGE_FEATURE += \"tools-sdk\"")
>> +     def test_find_library_with_ld(self):
>> +         with unittest.mock.patch("ctypes.util._findSoname_ldconfig",
>> lambda *args: None), \
>> +              unittest.mock.patch("ctypes.util._findLib_gcc", lambda
>> *args: None):
>> diff --git a/meta/recipes-devtools/python/python3_3.9.5.bb
>> b/meta/recipes-devtools/python/python3_3.9.5.bb
>> index f4002f2516f..1717ff737d4 100644
>> --- a/meta/recipes-devtools/python/python3_3.9.5.bb
>> +++ b/meta/recipes-devtools/python/python3_3.9.5.bb
>> @@ -31,6 +31,7 @@ SRC_URI = "
>> http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>>
>> file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
>>
>> file://0001-Lib-sysconfig.py-use-libdir-values-from-configuratio.patch \
>>
>> file://0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch \
>> +           ${@bb.utils.contains('IMAGE_FEATURES', 'tools-sdk', '',
>> 'file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch', d)} \
>>             "
>>
>>  SRC_URI_append_class-native = " \
>> --
>> 2.30.2
>>
>>
>> 
>>
>>

--000000000000bda12505c54a0827
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 21, 2021 at 5:00 AM Alexa=
nder Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr"><div>Wait. How does this work, if IMAGE_FEATURES are=
 set from image recipes, and not globally?</div><div><br></div><div>I&#39;m=
 afraid this may have to be reverted, as it just made it to master.<br></di=
v><div><br></div></div></blockquote><div><br></div><div>These tests have on=
ly been passing (since.python3 3.9.0 upgrade) because the AB ptest images i=
n one way or another have included packagegroup-core-buildessential.</div><=
div><br></div><div>I asked RP about adding packagegroup-core-buildessential=
 as RDEPENDS for python3-ptest and he was concerned about build performance=
. I tried to narrow the scope to gcc-symlinks and binutils-symlinks, but th=
at was not enough to make the tests pass.</div><div><br></div><div>As I see=
 it, we have two options, this patch which skips the tests conditionally, o=
r we UNCONDITIONALLY skip the tests.</div><div>If you run python3-ptest=C2=
=A0(and nothing else) on core-image-minimal, these test cases will fail, w=
hich means we do not have proper RDEPENDS for python3-ptest.</div><div><br>=
</div><div>Open to other ideas.</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex"><div dir=3D"ltr"><div></div><div>Alex<br></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Sat, 19 Jun 2021 at 02:00, Tim Orling &lt;<a href=3D"mailto:ticotimo@gm=
ail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Conditionally skip test_ctypes=
.test_find unless<br>
IMAGE_FEATURES contains &#39;tools-sdk&#39; as these test<br>
cases require full packagegroup-core-buildessential<br>
<br>
Fixes:<br>
=C2=A0 AssertionError: Failed ptests:<br>
=C2=A0 {&#39;python3&#39;: [&#39;test_find_library_with_gcc&#39;, &#39;tes=
t_find_library_with_ld&#39;]}<br>
<br>
Signed-off-by: Tim Orling &lt;<a href=3D"mailto:timothy.t.orling@intel.com=
" target=3D"_blank">timothy.t.orling@intel.com</a>&gt;<br>
---<br>
=C2=A0...pes.test_find-skip-without-tools-sdk.patch | 33 +++++++++++++++++=
++<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3_3.9.5.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3_3.9.5.bb</a> |=C2=A0 1 +<br>
=C2=A02 files changed, 34 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3/0001-test_ct=
ypes.test_find-skip-without-tools-sdk.patch<br>
<br>
diff --git a/meta/recipes-devtools/python/python3/0001-test_ctypes.test_fi=
nd-skip-without-tools-sdk.patch b/meta/recipes-devtools/python/python3/0001=
-test_ctypes.test_find-skip-without-tools-sdk.patch<br>
new file mode 100644<br>
index 00000000000..7d684b3c43c<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/python/python3/0001-test_ctypes.test_find-skip=
-without-tools-sdk.patch<br>
@@ -0,0 +1,33 @@<br>
+From 7a2bddfa437be633bb6945d0e6b7d6f27da870ad Mon Sep 17 00:00:00 2001<br=
>
+From: Tim Orling &lt;<a href=3D"mailto:timothy.t.orling@intel.com" target=
=
=3D"_blank">timothy.t.orling@intel.com</a>&gt;<br>
+Date: Fri, 18 Jun 2021 11:56:50 -0700<br>
+Subject: [PATCH] test_ctypes.test_find: skip without tools-sdk<br>
+<br>
+These tests need full packagegroup-core-buildessential, the<br>
+easiest way to dynamically check for that is looking for<br>
+&#39;tools-sdk&#39; in IMAGE_FEATURES.<br>
+<br>
+Upstream-Status: Inappropriate [oe-specific]<br>
+<br>
+Signed-off-by: Tim Orling &lt;<a href=3D"mailto:timothy.t.orlign@intel.co=
m" target=3D"_blank">timothy.t.orlign@intel.com</a>&gt;<br>
+---<br>
+ Lib/ctypes/test/test_find.py | 2 ++<br>
+ 1 file changed, 2 insertions(+)<br>
+<br>
+diff --git a/Lib/ctypes/test/test_find.py b/Lib/ctypes/test/test_find.py<=
br>
+index 92ac184..0d009d1 100644<br>
+--- a/Lib/ctypes/test/test_find.py<br>
++++ b/Lib/ctypes/test/test_find.py<br>
+@@ -112,10 +112,12 @@ class FindLibraryLinux(unittest.TestCase):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# LD_LIBRAR=
Y_PATH)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assert=
Equal(find_library(libname), &#39;lib%s.so&#39; % libname)<br>
+ <br>
++=C2=A0 =C2=A0 @unittest.skip(&quot;Needs IMAGE_FEATURE +=3D \&quot;tools=
-sdk\&quot;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0def test_find_library_with_gcc(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with unittest.mock.patch(&quot;ctypes.u=
til._findSoname_ldconfig&quot;, lambda *args: None):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertNotEqual(find_=
library(&#39;c&#39;), None)<br>
+ <br>
++=C2=A0 =C2=A0 @unittest.skip(&quot;Needs IMAGE_FEATURE +=3D \&quot;tools=
-sdk\&quot;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0def test_find_library_with_ld(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with unittest.mock.patch(&quot;ctypes.u=
til._findSoname_ldconfig&quot;, lambda *args: None), \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unittest.mock.patch(&quo=
t;ctypes.util._findLib_gcc&quot;, lambda *args: None):<br>
diff --git a/meta/recipes-devtools/python/<a href=3D"http://python3_3.9.5.=
bb" rel=3D"noreferrer" target=3D"_blank">python3_3.9.5.bb</a> b/meta/recipe=
s-devtools/python/<a href=3D"http://python3_3.9.5.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">python3_3.9.5.bb</a><br>
index f4002f2516f..1717ff737d4 100644<br>
--- a/meta/recipes-devtools/python/<a href=3D"http://python3_3.9.5.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3_3.9.5.bb</a><br>
+++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.9.5.bb" rel=
=
=3D"noreferrer" target=3D"_blank">python3_3.9.5.bb</a><br>
@@ -31,6 +31,7 @@ SRC_URI =3D &quot;<a href=3D"http://www.python.org/ftp/p=
ython/$%7BPV%7D/Python-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blan=
k">http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0020-configure.ac-setup.p=
y-do-not-add-a-curses-include-pa.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Lib-sysconfig.py-use=
-libdir-values-from-configuratio.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Skip-failing-tests-d=
ue-to-load-variability-on-YP-AB.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;IMAGE_=
FEATURES&#39;, &#39;tools-sdk&#39;, &#39;&#39;, &#39;file://0001-test_ctype=
s.test_find-skip-without-tools-sdk.patch&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI_append_class-native =3D &quot; \<br>
-- <br>
2.30.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>
</blockquote></div></div>

--000000000000bda12505c54a0827--
