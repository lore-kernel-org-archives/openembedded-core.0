Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B65BFC433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 07:42:20 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.24546.1658130134531055447
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 00:42:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KMPl8YVB;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id p4so6610681wms.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 00:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HkRHD7kBpoKWCdsjARi0kILbZejHxPoCbfiFi3BRpmU=;
        b=KMPl8YVB7f7vdIUVaYxzkwA2m/boCurd+wXN6UQqdHPyUrJNkRA7ULelZZT9p0Lfbw
         6psIwW2BVpMJM2yc/7jr3qptYKLT4RtkDynZiEF9DYSybSRNNwW/b0FvaDAx2G8MX1vs
         Xl7u3jusuruOyO6LQBhiyVuPRKR4gTNKabIPKy4yBfbE+dmJ8vDvyMURAyKCgqhQp1RH
         7TWmCTqaA3y7y4IdAo9z35SsuNmgxio5Md6CyfXUBbjaM3K1wvVGX7ryhou4fTAm0Ncu
         9Wv2+FJIt+BzHBnfUDve8ffsEZ+vFcl6ya24rH/9mbCVYy2qJpy9pQXGbkpQV9VsGK91
         33xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HkRHD7kBpoKWCdsjARi0kILbZejHxPoCbfiFi3BRpmU=;
        b=HBnv4qbG6Ev1ywi83hINbRwoAW/6XPP5JTIHL4WelZdgfNvG4YKv0cTW31N1RommA1
         XIKQgjarzzqJupTZI7gOPLwfEdnHKNzDIWl5psGYlzG+Utlp4CdUuhgqzPLkjL9VSRZh
         pxdJj2BEtas41TFW63gh3QvNI5Qs6HEHHGZMizkYlFS4gvwnFZhQg2yjiPAuPGVSYpua
         dspYawd+fyR7LqO7aXtHsuvi8Jyk2UALKwInYwgermzjbSw1hU20uMIubFmbfqE2sqCf
         JLGDkQYnwXDCU4rAwiZDP7O8suRNtLOoJdYhYoAr3SDOsa4tADF1/iI+SJWQf9HnUEKC
         nzAA==
X-Gm-Message-State: AJIora/g+UpK3GEsxC+DArOeME8pEFggxZQdy/rNaf1hx4SG9MCxrEXy
	Pu83ggpaESk26cTXtr8OwRkN7oASZ6t3XNgZXSg=
X-Google-Smtp-Source: 
 AGRyM1viz8KbVx6UBd+MR0sFhTjQpp/H7wpCOgjhfUBOP238JBv9PUcc6NluGYYtJtHa6NL7U/soPH6PpXA9AKipYZs=
X-Received: by 2002:a7b:ce13:0:b0:3a3:102c:23d3 with SMTP id
 m19-20020a7bce13000000b003a3102c23d3mr11775667wmc.67.1658130132951; Mon, 18
 Jul 2022 00:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220712143734.204094-1-ross.burton@arm.com>
In-Reply-To: <20220712143734.204094-1-ross.burton@arm.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 18 Jul 2022 09:42:00 +0200
Message-ID: 
 <CA+chaQfdXZ4b2duzorAdT6+aWMj8ghv2VJLG78jV5vPNjJf45w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ltp: fix builds when host ld doesn't know about
 target ELF formats
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Content-Type: multipart/alternative; boundary="00000000000090e53805e40f81fd"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 07:42:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168193

--00000000000090e53805e40f81fd
Content-Type: text/plain; charset="UTF-8"

FYI: This might be causing build issues with ld-is-gold:

| i686-webos-linux-ld: error: kvm_pagefault01-payload.bin:1:1: invalid
character
| ltp/20220527-r0/git/testcases/kernel/kvm/Makefile:55: recipe for target
'kvm_pagefault01-payload.o' failed
| make[3]: *** [kvm_pagefault01-payload.o] Error 1

The previous patch to use bfd:
https://git.openembedded.org/openembedded-core/commit/?id=674fd0c423f3a8911d73b4319ab23bd9b3f1bbac
was doing it only through -fuse-ld=bfd in LDFLAGS which doesn't seem to be
used here.

Will check if it was really caused by this change after my builder gets
online again (now in memtest86 with sad results).

Cheers,

On Tue, Jul 12, 2022 at 4:37 PM Ross Burton <ross.burton@arm.com> wrote:

> The kvm tests use the host ld, which doesn't necessarily know about the
> target ELF format.  It should be using the cross ld we built, so call
> $(LD) instead.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ...-kvm-use-LD-instead-of-hardcoding-ld.patch | 37 +++++++++++++++++++
>  meta/recipes-extended/ltp/ltp_20220527.bb     |  1 +
>  2 files changed, 38 insertions(+)
>  create mode 100644
> meta/recipes-extended/ltp/ltp/0001-kvm-use-LD-instead-of-hardcoding-ld.patch
>
> diff --git
> a/meta/recipes-extended/ltp/ltp/0001-kvm-use-LD-instead-of-hardcoding-ld.patch
> b/meta/recipes-extended/ltp/ltp/0001-kvm-use-LD-instead-of-hardcoding-ld.patch
> new file mode 100644
> index 00000000000..23634d0c860
> --- /dev/null
> +++
> b/meta/recipes-extended/ltp/ltp/0001-kvm-use-LD-instead-of-hardcoding-ld.patch
> @@ -0,0 +1,37 @@
> +Upstream-Status: Submitted [
> https://github.com/linux-test-project/ltp/pull/948]
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +From 7670233e43df2aed6d44b96c51b034f8e2d28a19 Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@arm.com>
> +Date: Tue, 12 Jul 2022 15:03:54 +0100
> +Subject: [PATCH] kvm: use $(LD) instead of hardcoding ld
> +
> +In cross-compiled builds the host ld may not know the required ELF format,
> +so ensure we use $(LD) which will be the cross-capable ld binary.
> +
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +---
> + testcases/kernel/kvm/Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/testcases/kernel/kvm/Makefile b/testcases/kernel/kvm/Makefile
> +index 69a9946fe..4ddef9f95 100644
> +--- a/testcases/kernel/kvm/Makefile
> ++++ b/testcases/kernel/kvm/Makefile
> +@@ -50,11 +50,11 @@ include $(top_srcdir)/include/mk/
> generic_leaf_target.mk
> + ifdef VERBOSE
> +       $(CC) $(GUEST_CPPFLAGS) $(GUEST_CFLAGS) $(GUEST_LDFLAGS) -o
> $*-payload.elf $^ $(GUEST_LDLIBS)
> +       objcopy -O binary -j .init.boot -j .text -j .data -j .init -j
> .preinit_array -j .init_array --gap-fill=0 $*-payload.elf $*-payload.bin
> +-      ld -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT)
> -o $@ $*-payload.bin
> ++      $(LD) -r -T $(abs_srcdir)/linker/payload.lds
> --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
> + else
> +       @$(CC) $(GUEST_CPPFLAGS) $(GUEST_CFLAGS) $(GUEST_LDFLAGS) -o
> $*-payload.elf $^ $(GUEST_LDLIBS)
> +       @objcopy -O binary -j .init.boot -j .text -j .data -j .init -j
> .preinit_array -j .init_array --gap-fill=0 $*-payload.elf $*-payload.bin
> +-      @ld -r -T $(abs_srcdir)/linker/payload.lds --oformat=$(BIN_FORMAT)
> -o $@ $*-payload.bin
> ++      @$(LD) -r -T $(abs_srcdir)/linker/payload.lds
> --oformat=$(BIN_FORMAT) -o $@ $*-payload.bin
> +       @echo KVM_CC $(target_rel_dir)$@
> + endif
> +       @rm $*-payload.elf $*-payload.bin
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-extended/ltp/ltp_20220527.bb
> b/meta/recipes-extended/ltp/ltp_20220527.bb
> index 56fa83f5a03..094251ec811 100644
> --- a/meta/recipes-extended/ltp/ltp_20220527.bb
> +++ b/meta/recipes-extended/ltp/ltp_20220527.bb
> @@ -28,6 +28,7 @@ SRCREV = "6f88e0f6f1d6eb12c48c902f50f47ecbd3b0f18a"
>  SRC_URI = "git://
> github.com/linux-test-project/ltp.git;branch=master;protocol=https \
>             file://0001-Remove-OOM-tests-from-runtest-mm.patch \
>             file://disable_hanging_tests.patch \
> +           file://0001-kvm-use-LD-instead-of-hardcoding-ld.patch \
>             "
>
>  S = "${WORKDIR}/git"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167929):
> https://lists.openembedded.org/g/openembedded-core/message/167929
> Mute This Topic: https://lists.openembedded.org/mt/92334178/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000090e53805e40f81fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FYI: This might be causing build issues with ld-is-gold:<d=
iv><br></div><div>| i686-webos-linux-ld: error: kvm_pagefault01-payload.bin=
:1:1: invalid character<br>| ltp/20220527-r0/git/testcases/kernel/kvm/Makef=
ile:55: recipe for target &#39;kvm_pagefault01-payload.o&#39; failed<br>| m=
ake[3]: *** [kvm_pagefault01-payload.o] Error 1<br></div><div><br></div><di=
v>The previous patch to use bfd:</div><div><a href=3D"https://git.openembed=
ded.org/openembedded-core/commit/?id=3D674fd0c423f3a8911d73b4319ab23bd9b3f1=
bbac">https://git.openembedded.org/openembedded-core/commit/?id=3D674fd0c42=
3f3a8911d73b4319ab23bd9b3f1bbac</a><br></div><div>was doing it only through=
 -fuse-ld=3Dbfd in LDFLAGS which doesn&#39;t seem to be used here.</div><di=
v><br></div><div>Will check if it was really caused by this change after my=
 builder gets online again (now in memtest86 with sad results).</div><div><=
br></div><div>Cheers,</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Tue, Jul 12, 2022 at 4:37 PM Ross Burton &lt;=
<a href=3D"mailto:ross.burton@arm.com">ross.burton@arm.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">The kvm tests use=
 the host ld, which doesn&#39;t necessarily know about the<br>
target ELF format.=C2=A0 It should be using the cross ld we built, so call<=
br>
$(LD) instead.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0...-kvm-use-LD-instead-of-hardcoding-ld.patch | 37 ++++++++++++++++++=
+<br>
=C2=A0meta/recipes-extended/ltp/<a href=3D"http://ltp_20220527.bb" rel=3D"n=
oreferrer" target=3D"_blank">ltp_20220527.bb</a>=C2=A0 =C2=A0 =C2=A0|=C2=A0=
 1 +<br>
=C2=A02 files changed, 38 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-extended/ltp/ltp/0001-kvm-use-LD-inst=
ead-of-hardcoding-ld.patch<br>
<br>
diff --git a/meta/recipes-extended/ltp/ltp/0001-kvm-use-LD-instead-of-hardc=
oding-ld.patch b/meta/recipes-extended/ltp/ltp/0001-kvm-use-LD-instead-of-h=
ardcoding-ld.patch<br>
new file mode 100644<br>
index 00000000000..23634d0c860<br>
--- /dev/null<br>
+++ b/meta/recipes-extended/ltp/ltp/0001-kvm-use-LD-instead-of-hardcoding-l=
d.patch<br>
@@ -0,0 +1,37 @@<br>
+Upstream-Status: Submitted [<a href=3D"https://github.com/linux-test-proje=
ct/ltp/pull/948" rel=3D"noreferrer" target=3D"_blank">https://github.com/li=
nux-test-project/ltp/pull/948</a>]<br>
+Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
+<br>
+From 7670233e43df2aed6d44b96c51b034f8e2d28a19 Mon Sep 17 00:00:00 2001<br>
+From: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" target=3D"_bl=
ank">ross.burton@arm.com</a>&gt;<br>
+Date: Tue, 12 Jul 2022 15:03:54 +0100<br>
+Subject: [PATCH] kvm: use $(LD) instead of hardcoding ld<br>
+<br>
+In cross-compiled builds the host ld may not know the required ELF format,=
<br>
+so ensure we use $(LD) which will be the cross-capable ld binary.<br>
+<br>
+Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targ=
et=3D"_blank">ross.burton@arm.com</a>&gt;<br>
+---<br>
+ testcases/kernel/kvm/Makefile | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/testcases/kernel/kvm/Makefile b/testcases/kernel/kvm/Makefile=
<br>
+index 69a9946fe..4ddef9f95 100644<br>
+--- a/testcases/kernel/kvm/Makefile<br>
++++ b/testcases/kernel/kvm/Makefile<br>
+@@ -50,11 +50,11 @@ include $(top_srcdir)/include/mk/<a href=3D"http://gen=
eric_leaf_target.mk" rel=3D"noreferrer" target=3D"_blank">generic_leaf_targ=
et.mk</a><br>
+ ifdef VERBOSE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(CC) $(GUEST_CPPFLAGS) $(GUEST_CFLAGS) $(GUEST=
_LDFLAGS) -o $*-payload.elf $^ $(GUEST_LDLIBS)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0objcopy -O binary -j .init.boot -j .text -j .da=
ta -j .init -j .preinit_array -j .init_array --gap-fill=3D0 $*-payload.elf =
$*-payload.bin<br>
+-=C2=A0 =C2=A0 =C2=A0 ld -r -T $(abs_srcdir)/linker/payload.lds --oformat=
=3D$(BIN_FORMAT) -o $@ $*-payload.bin<br>
++=C2=A0 =C2=A0 =C2=A0 $(LD) -r -T $(abs_srcdir)/linker/payload.lds --oform=
at=3D$(BIN_FORMAT) -o $@ $*-payload.bin<br>
+ else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@$(CC) $(GUEST_CPPFLAGS) $(GUEST_CFLAGS) $(GUES=
T_LDFLAGS) -o $*-payload.elf $^ $(GUEST_LDLIBS)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@objcopy -O binary -j .init.boot -j .text -j .d=
ata -j .init -j .preinit_array -j .init_array --gap-fill=3D0 $*-payload.elf=
 $*-payload.bin<br>
+-=C2=A0 =C2=A0 =C2=A0 @ld -r -T $(abs_srcdir)/linker/payload.lds --oformat=
=3D$(BIN_FORMAT) -o $@ $*-payload.bin<br>
++=C2=A0 =C2=A0 =C2=A0 @$(LD) -r -T $(abs_srcdir)/linker/payload.lds --ofor=
mat=3D$(BIN_FORMAT) -o $@ $*-payload.bin<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo KVM_CC $(target_rel_dir)$@<br>
+ endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0@rm $*-payload.elf $*-payload.bin<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20220527.bb" r=
el=3D"noreferrer" target=3D"_blank">ltp_20220527.bb</a> b/meta/recipes-exte=
nded/ltp/<a href=3D"http://ltp_20220527.bb" rel=3D"noreferrer" target=3D"_b=
lank">ltp_20220527.bb</a><br>
index 56fa83f5a03..094251ec811 100644<br>
--- a/meta/recipes-extended/ltp/<a href=3D"http://ltp_20220527.bb" rel=3D"n=
oreferrer" target=3D"_blank">ltp_20220527.bb</a><br>
+++ b/meta/recipes-extended/ltp/<a href=3D"http://ltp_20220527.bb" rel=3D"n=
oreferrer" target=3D"_blank">ltp_20220527.bb</a><br>
@@ -28,6 +28,7 @@ SRCREV =3D &quot;6f88e0f6f1d6eb12c48c902f50f47ecbd3b0f18a=
&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/linux-test-proje=
ct/ltp.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_=
blank">github.com/linux-test-project/ltp.git;branch=3Dmaster;protocol=3Dhtt=
ps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Remove-OOM-tests-from=
-runtest-mm.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://disable_hanging_tests.patc=
h \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-kvm-use-LD-instead-of=
-hardcoding-ld.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#167929): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/167929" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/167929</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92334178/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92334178/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--00000000000090e53805e40f81fd--

