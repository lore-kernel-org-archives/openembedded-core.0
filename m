Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D9E6C76188
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 15:17:59 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.132937.1680707877625468236
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Apr 2023 08:17:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=ig9GXWZg;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id e18so36567497wra.9
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 08:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680707876; x=1683299876;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pODkDYt+lKurRQBMB6F3jgzq+WRuoIA6VhgW/z0iTa8=;
        b=ig9GXWZgONL4kUPeckBtrOzfUS2xvls6ZnFzCzsp0nNtkKiIlP3OWzqESm7ycHNv0r
         Pf6gaqmC/0SidGcf8fqNVHcRPXa19NzHqZFpTkV7l+N8S4XT9wHHdf3IjtGfHJp9r5aJ
         nEORXJ8ktyI8TFDFjyBpNe+8cr4dYktZSj9MH6/XdQ9U5YQP5q4qPQAk8V99YGWnXLnB
         hanocTFRS5X+K0anI7UOzemOSC4jWSqSXV3wes7VX2dgdUE6qBnbuF10HuyDOFqekANX
         +JW5TkC9aomGr0VLpeNASN4dnz6H1GBxWu7W/x57pCKNqE/PihUx8WXd9Dw4n6mczC8V
         jJPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680707876; x=1683299876;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pODkDYt+lKurRQBMB6F3jgzq+WRuoIA6VhgW/z0iTa8=;
        b=jaxCug/daLMXQJpvFQgY6ZZ8PhNKRqUqbzYp4UyQv9aHW+dJEKp1aZaRzUX8r5F/qx
         mjnGLCgwRaIj37F28pW1CVAAit6alwc37gpAd+xyOQWDjhemkkyfhPnm42q5eShxd1V/
         oqYyv0m7kuIYDk/EnEujqepn2fSulHHM1qGAZ3hpqAf2hiOFkakvC5y0exy1JMz075KX
         4trN0XFRcwUilDImlX+L4eWD0PmGhw2HP+IPhCtyWLUi6PJlQfefPpg+ptN71WjEryfA
         o0WOKFssHLtopwfQC7BNKiND79nJwAR0MoR0UQf0w6PbrLcCAHwWYmEFVXkjbB/I9Pme
         U8Tw==
X-Gm-Message-State: AAQBX9fg8JqxcgwCJFbglKWkULaanEYIsS1y492E9Ykm9LTva51yhJ5E
	si/lfoDZ9cdW6BP8k+vF2ABQaofLH1A8XaUh/34=
X-Google-Smtp-Source: AKy350bt+E7jY9Opa7Y7kfIaSUEZoAEYTBibUXAQf/i7ZW6C3gnEeWDUUHwpPF8wUYfVNgngeCTE7E6AxJnvt+HclZM=
X-Received: by 2002:adf:e703:0:b0:2e5:820b:9287 with SMTP id
 c3-20020adfe703000000b002e5820b9287mr1422193wrm.1.1680707875960; Wed, 05 Apr
 2023 08:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1678709427.git.Martin.Jansa@gmail.com> <174BF9A290681E00.25836@lists.openembedded.org>
In-Reply-To: <174BF9A290681E00.25836@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 5 Apr 2023 17:17:36 +0200
Message-ID: <CA+chaQc8q39Ea_Uk9dsRDA=Tb1M=NvQbwcwaG6W6dH6URc4Bnw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 12/14] selftest: efibootpartition.py: fix
 QEMU_USE_KVM usage
To: Martin.Jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000eafd3605f8984ba1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Apr 2023 15:17:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179739

--000000000000eafd3605f8984ba1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 13, 2023 at 1:16=E2=80=AFPM Martin Jansa via lists.openembedded=
.org
<Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:

> * it's not in self.td causing:
>   2023-03-12 18:06:29,591 - oe-selftest - DEBUG - Checking if qemux86-64
> is not this MACHINE
>   2023-03-12 18:06:29,594 - oe-selftest - INFO -  ... ERROR
>   2023-03-12 18:06:29,594 - oe-selftest - INFO - Traceback (most recent
> call last):
>     File "/OE/build/poky/meta/lib/oeqa/core/decorator/__init__.py", line
> 35, in wrapped_f
>       return func(*args, **kwargs)
>              ^^^^^^^^^^^^^^^^^^^^^
>     File
> "/OE/build/poky/meta/lib/oeqa/selftest/cases/efibootpartition.py", line 1=
8,
> in test_boot_efi
>       if oe.types.qemu_use_kvm(self.td['QEMU_USE_KVM'], self.td
> ["TARGET_ARCH"]):
>                                ~~~~~~~^^^^^^^^^^^^^^^^
>   KeyError: 'QEMU_USE_KVM'
>
> [YOCTO #12937]
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/efibootpartition.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/efibootpartition.py
> b/meta/lib/oeqa/selftest/cases/efibootpartition.py
> index e17da9f9a0..d34698c6ad 100644
> --- a/meta/lib/oeqa/selftest/cases/efibootpartition.py
> +++ b/meta/lib/oeqa/selftest/cases/efibootpartition.py
> @@ -6,7 +6,7 @@
>  #
>
>  from oeqa.selftest.case import OESelftestTestCase
> -from oeqa.utils.commands import bitbake, runqemu
> +from oeqa.utils.commands import bitbake, get_bb_var, runqemu
>  from oeqa.core.decorator.data import skipIfNotMachine
>  import oe.types
>
> @@ -15,7 +15,7 @@ class GenericEFITest(OESelftestTestCase):
>      @skipIfNotMachine("qemux86-64", "test is qemux86-64 specific
> currently")
>      def test_boot_efi(self):
>          cmd =3D "runqemu nographic serial wic ovmf"
> -        if oe.types.qemu_use_kvm(self.td['QEMU_USE_KVM'], self.td
> ["TARGET_ARCH"]):
> +        if oe.types.qemu_use_kvm(get_bb_var('QEMU_USE_KVM'), self.td
> ["TARGET_ARCH"]):
>              cmd +=3D " kvm"
>          image =3D "core-image-minimal"
>
> --
> 2.39.2
>

This is still reproducible with latest poky master:
0e5bdb623b0 xdg-utils: Fix CVE number

with just these 5 lines in local.conf:

BB_NUMBER_THREADS =3D "8"
BB_NUMBER_PARSE_THREADS =3D "64"
PARALLEL_MAKE =3D "-j 70 -l 140"
DL_DIR =3D "/OE/build/downloads"
SANITY_TESTED_DISTROS =3D ""

2023-04-05 17:00:33,452 - oe-selftest - WARNING - meta-selftest layer not
found in BBLAYERS, adding it
2023-04-05 17:01:03,686 - oe-selftest - INFO - Adding layer libraries:
2023-04-05 17:01:03,686 - oe-selftest - INFO - /OE/build/poky/meta-poky/lib
2023-04-05 17:01:03,686 - oe-selftest - INFO - /OE/build/poky/meta/lib
2023-04-05 17:01:03,686 - oe-selftest - INFO -
/OE/build/poky/meta-yocto-bsp/lib
2023-04-05 17:01:03,687 - oe-selftest - INFO -
/OE/build/poky/meta-selftest/lib
2023-04-05 17:01:03,689 - oe-selftest - INFO - Running bitbake -e to test
the configuration is valid/parsable
2023-04-05 17:01:18,699 - oe-selftest - INFO - Adding: "include
selftest.inc" in /OE/build/poky/build-st/conf/local.conf
2023-04-05 17:01:18,699 - oe-selftest - INFO - Adding: "include
bblayers.inc" in bblayers.conf
2023-04-05 17:01:18,699 - oe-selftest - INFO - test_boot_efi
(efibootpartition.GenericEFITest.test_boot_efi)
2023-04-05 17:01:18,700 - oe-selftest - DEBUG - Checking if qemux86-64 is
not this MACHINE
2023-04-05 17:01:18,707 - oe-selftest - INFO -  ... ERROR
2023-04-05 17:01:18,708 - oe-selftest - INFO - Traceback (most recent call
last):
  File "/OE/build/poky/meta/lib/oeqa/core/decorator/__init__.py", line 35,
in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/OE/build/poky/meta/lib/oeqa/selftest/cases/efibootpartition.py",
line 18, in test_boot_efi
    if oe.types.qemu_use_kvm(self.td['QEMU_USE_KVM'], self.td
["TARGET_ARCH"]):
                             ~~~~~~~^^^^^^^^^^^^^^^^
KeyError: 'QEMU_USE_KVM'

2023-04-05 17:01:18,709 - oe-selftest - INFO -
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
2023-04-05 17:01:18,709 - oe-selftest - INFO - ERROR: test_boot_efi
(efibootpartition.GenericEFITest.test_boot_efi)
2023-04-05 17:01:18,709 - oe-selftest - INFO -
----------------------------------------------------------------------
2023-04-05 17:01:18,709 - oe-selftest - INFO - Traceback (most recent call
last):
  File "/OE/build/poky/meta/lib/oeqa/core/decorator/__init__.py", line 35,
in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/OE/build/poky/meta/lib/oeqa/selftest/cases/efibootpartition.py",
line 18, in test_boot_efi
    if oe.types.qemu_use_kvm(self.td['QEMU_USE_KVM'], self.td
["TARGET_ARCH"]):
                             ~~~~~~~^^^^^^^^^^^^^^^^
KeyError: 'QEMU_USE_KVM'

2023-04-05 17:01:18,710 - oe-selftest - INFO -
----------------------------------------------------------------------
2023-04-05 17:01:18,710 - oe-selftest - INFO - Ran 1 test in 7.873s
2023-04-05 17:01:18,710 - oe-selftest - INFO - FAILED
2023-04-05 17:01:18,710 - oe-selftest - INFO -  (errors=3D1)
2023-04-05 17:01:28,486 - oe-selftest - INFO - RESULTS:
2023-04-05 17:01:28,487 - oe-selftest - INFO - RESULTS -
efibootpartition.GenericEFITest.test_boot_efi: ERROR (0.01s)
2023-04-05 17:01:28,488 - oe-selftest - INFO - SUMMARY:
2023-04-05 17:01:28,488 - oe-selftest - INFO - oe-selftest () - Ran 1 test
in 7.875s
2023-04-05 17:01:28,488 - oe-selftest - INFO - oe-selftest - FAIL -
Required tests failed (successes=3D0, skipped=3D0, failures=3D0, errors=3D1=
)

I was just following what runqemu selftest already does:
meta/lib/oeqa/selftest/cases/runqemu.py:        kvm =3D
oe.types.qemu_use_kvm(get_bb_var('QEMU_USE_KVM'), self.td["TARGET_ARCH"])

I've discussed this with Ross (who introduced this in
https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djansa/pu=
ll&id=3D2bc2ee171f976807053b7da44c1eedbb07c10949)
and RP on IRC and also verified that adding:

QEMU_USE_KVM =3D "1"

to local.conf is possible work around, but still this fix is better as
selftest should work without any extra local.conf modifications.

Cheers,

--000000000000eafd3605f8984ba1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Mar 13, 2023 at 1:16=E2=80=AFPM M=
artin Jansa via <a href=3D"http://lists.openembedded.org">lists.openembedde=
d.org</a> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded=
.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">* it&#39=
;s not in <a href=3D"http://self.td" rel=3D"noreferrer" target=3D"_blank">s=
elf.td</a> causing:<br>
=C2=A0 2023-03-12 18:06:29,591 - oe-selftest - DEBUG - Checking if qemux86-=
64 is not this MACHINE<br>
=C2=A0 2023-03-12 18:06:29,594 - oe-selftest - INFO -=C2=A0 ... ERROR<br>
=C2=A0 2023-03-12 18:06:29,594 - oe-selftest - INFO - Traceback (most recen=
t call last):<br>
=C2=A0 =C2=A0 File &quot;/OE/build/poky/meta/lib/oeqa/core/decorator/__init=
__.py&quot;, line 35, in wrapped_f<br>
=C2=A0 =C2=A0 =C2=A0 return func(*args, **kwargs)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^^^^^^<br>
=C2=A0 =C2=A0 File &quot;/OE/build/poky/meta/lib/oeqa/selftest/cases/efiboo=
tpartition.py&quot;, line 18, in test_boot_efi<br>
=C2=A0 =C2=A0 =C2=A0 if oe.types.qemu_use_kvm(<a href=3D"http://self.td" re=
l=3D"noreferrer" target=3D"_blank">self.td</a>[&#39;QEMU_USE_KVM&#39;], <a =
href=3D"http://self.td" rel=3D"noreferrer" target=3D"_blank">self.td</a>[&q=
uot;TARGET_ARCH&quot;]):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~~~~~~~^^^^^^^^^^^^^^^^<br>
=C2=A0 KeyError: &#39;QEMU_USE_KVM&#39;<br>
<br>
[YOCTO #12937]<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/selftest/cases/efibootpartition.py | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/efibootpartition.py b/meta/lib/oe=
qa/selftest/cases/efibootpartition.py<br>
index e17da9f9a0..d34698c6ad 100644<br>
--- a/meta/lib/oeqa/selftest/cases/efibootpartition.py<br>
+++ b/meta/lib/oeqa/selftest/cases/efibootpartition.py<br>
@@ -6,7 +6,7 @@<br>
=C2=A0#<br>
<br>
=C2=A0from oeqa.selftest.case import OESelftestTestCase<br>
-from oeqa.utils.commands import bitbake, runqemu<br>
+from oeqa.utils.commands import bitbake, get_bb_var, runqemu<br>
=C2=A0from oeqa.core.decorator.data import skipIfNotMachine<br>
=C2=A0import oe.types<br>
<br>
@@ -15,7 +15,7 @@ class GenericEFITest(OESelftestTestCase):<br>
=C2=A0 =C2=A0 =C2=A0@skipIfNotMachine(&quot;qemux86-64&quot;, &quot;test is=
 qemux86-64 specific currently&quot;)<br>
=C2=A0 =C2=A0 =C2=A0def test_boot_efi(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D &quot;runqemu nographic serial wi=
c ovmf&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if oe.types.qemu_use_kvm(<a href=3D"http://sel=
f.td" rel=3D"noreferrer" target=3D"_blank">self.td</a>[&#39;QEMU_USE_KVM&#3=
9;], <a href=3D"http://self.td" rel=3D"noreferrer" target=3D"_blank">self.t=
d</a>[&quot;TARGET_ARCH&quot;]):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if oe.types.qemu_use_kvm(get_bb_var(&#39;QEMU_=
USE_KVM&#39;), <a href=3D"http://self.td" rel=3D"noreferrer" target=3D"_bla=
nk">self.td</a>[&quot;TARGET_ARCH&quot;]):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd +=3D &quot; kvm&quot;<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image =3D &quot;core-image-minimal&quot;<=
br>
<br>
-- <br>
2.39.2<br></blockquote><div><br></div><div>This is still reproducible with =
latest poky master:</div><div>0e5bdb623b0 xdg-utils: Fix CVE number<br></di=
v><div><br></div><div>with just these 5 lines in local.conf:</div><div><br>=
</div><div>BB_NUMBER_THREADS =3D &quot;8&quot;<br>BB_NUMBER_PARSE_THREADS =
=3D &quot;64&quot;<br>PARALLEL_MAKE =3D &quot;-j 70 -l 140&quot;<br>DL_DIR =
=3D &quot;/OE/build/downloads&quot;<br>SANITY_TESTED_DISTROS =3D &quot;&quo=
t;<br></div><div><br></div><div>2023-04-05 17:00:33,452 - oe-selftest - WAR=
NING - meta-selftest layer not found in BBLAYERS, adding it</div>2023-04-05=
 17:01:03,686 - oe-selftest - INFO - Adding layer libraries:<br>2023-04-05 =
17:01:03,686 - oe-selftest - INFO - 	/OE/build/poky/meta-poky/lib<br>2023-0=
4-05 17:01:03,686 - oe-selftest - INFO - 	/OE/build/poky/meta/lib<br>2023-0=
4-05 17:01:03,686 - oe-selftest - INFO - 	/OE/build/poky/meta-yocto-bsp/lib=
<br>2023-04-05 17:01:03,687 - oe-selftest - INFO - 	/OE/build/poky/meta-sel=
ftest/lib<br>2023-04-05 17:01:03,689 - oe-selftest - INFO - Running bitbake=
 -e to test the configuration is valid/parsable<br>2023-04-05 17:01:18,699 =
- oe-selftest - INFO - Adding: &quot;include selftest.inc&quot; in /OE/buil=
d/poky/build-st/conf/local.conf<br>2023-04-05 17:01:18,699 - oe-selftest - =
INFO - Adding: &quot;include bblayers.inc&quot; in bblayers.conf<br>2023-04=
-05 17:01:18,699 - oe-selftest - INFO - test_boot_efi (efibootpartition.Gen=
ericEFITest.test_boot_efi)<br>2023-04-05 17:01:18,700 - oe-selftest - DEBUG=
 - Checking if qemux86-64 is not this MACHINE<br>2023-04-05 17:01:18,707 - =
oe-selftest - INFO - =C2=A0... ERROR<br>2023-04-05 17:01:18,708 - oe-selfte=
st - INFO - Traceback (most recent call last):<br>=C2=A0 File &quot;/OE/bui=
ld/poky/meta/lib/oeqa/core/decorator/__init__.py&quot;, line 35, in wrapped=
_f<br>=C2=A0 =C2=A0 return func(*args, **kwargs)<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^^^^^^<br>=C2=A0 File &quot;/OE/build/po=
ky/meta/lib/oeqa/selftest/cases/efibootpartition.py&quot;, line 18, in test=
_boot_efi<br>=C2=A0 =C2=A0 if oe.types.qemu_use_kvm(<a href=3D"http://self.=
td">self.td</a>[&#39;QEMU_USE_KVM&#39;], <a href=3D"http://self.td">self.td=
</a>[&quot;TARGET_ARCH&quot;]):<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~~~~~~~^^=
^^^^^^^^^^^^^^<br>KeyError: &#39;QEMU_USE_KVM&#39;<br><br>2023-04-05 17:01:=
18,709 - oe-selftest - INFO - =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<br>2023-04-05 17:01:18,709 - oe-selftest - INFO - ERROR: te=
st_boot_efi (efibootpartition.GenericEFITest.test_boot_efi)<br>2023-04-05 1=
7:01:18,709 - oe-selftest - INFO - ----------------------------------------=
------------------------------<br>2023-04-05 17:01:18,709 - oe-selftest - I=
NFO - Traceback (most recent call last):<br>=C2=A0 File &quot;/OE/build/pok=
y/meta/lib/oeqa/core/decorator/__init__.py&quot;, line 35, in wrapped_f<br>=
=C2=A0 =C2=A0 return func(*args, **kwargs)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0^^^^^^^^^^^^^^^^^^^^^<br>=C2=A0 File &quot;/OE/build/poky/meta=
/lib/oeqa/selftest/cases/efibootpartition.py&quot;, line 18, in test_boot_e=
fi<br>=C2=A0 =C2=A0 if oe.types.qemu_use_kvm(<a href=3D"http://self.td">sel=
f.td</a>[&#39;QEMU_USE_KVM&#39;], <a href=3D"http://self.td">self.td</a>[&q=
uot;TARGET_ARCH&quot;]):<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~~~~~~~^^^^^^^^^=
^^^^^^^<br>KeyError: &#39;QEMU_USE_KVM&#39;<br><br>2023-04-05 17:01:18,710 =
- oe-selftest - INFO - ----------------------------------------------------=
------------------<br>2023-04-05 17:01:18,710 - oe-selftest - INFO - Ran 1 =
test in 7.873s<br>2023-04-05 17:01:18,710 - oe-selftest - INFO - FAILED<br>=
2023-04-05 17:01:18,710 - oe-selftest - INFO - =C2=A0(errors=3D1)<br>2023-0=
4-05 17:01:28,486 - oe-selftest - INFO - RESULTS:<br>2023-04-05 17:01:28,48=
7 - oe-selftest - INFO - RESULTS - efibootpartition.GenericEFITest.test_boo=
t_efi: ERROR (0.01s)<br>2023-04-05 17:01:28,488 - oe-selftest - INFO - SUMM=
ARY:<br>2023-04-05 17:01:28,488 - oe-selftest - INFO - oe-selftest () - Ran=
 1 test in 7.875s<br>2023-04-05 17:01:28,488 - oe-selftest - INFO - oe-self=
test - FAIL - Required tests failed (successes=3D0, skipped=3D0, failures=
=3D0, errors=3D1)<br></div><div class=3D"gmail_quote"><br></div><div class=
=3D"gmail_quote">I was just following what runqemu selftest already does:</=
div><div class=3D"gmail_quote">meta/lib/oeqa/selftest/cases/runqemu.py: =C2=
=A0 =C2=A0 =C2=A0 =C2=A0kvm =3D oe.types.qemu_use_kvm(get_bb_var(&#39;QEMU_=
USE_KVM&#39;), <a href=3D"http://self.td">self.td</a>[&quot;TARGET_ARCH&quo=
t;])<br></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quot=
e">I&#39;ve discussed this with Ross (who introduced this in=C2=A0<a href=
=3D"https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Djans=
a/pull&amp;id=3D2bc2ee171f976807053b7da44c1eedbb07c10949">https://git.opene=
mbedded.org/openembedded-core-contrib/commit/?h=3Djansa/pull&amp;id=3D2bc2e=
e171f976807053b7da44c1eedbb07c10949</a>) and RP on IRC and also verified th=
at adding:</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_qu=
ote">QEMU_USE_KVM =3D &quot;1&quot;<br></div><div class=3D"gmail_quote"><br=
></div><div class=3D"gmail_quote">to local.conf is possible work around, bu=
t still this fix is better as selftest should work without any extra local.=
conf modifications.</div><div class=3D"gmail_quote"><br></div><div class=3D=
"gmail_quote">Cheers,</div><div class=3D"gmail_quote"><br></div></div>

--000000000000eafd3605f8984ba1--

