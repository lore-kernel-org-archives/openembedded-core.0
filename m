Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7ED6EB64DA
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 12:00:15 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.11089.1689854407359163999
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 05:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=InMKlmoQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2b6f0508f54so9828461fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 05:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689854405; x=1690459205;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TD344bFL45l63ZDJPA0bPLbNEjQCJldadHKIxX9uK9s=;
        b=InMKlmoQ6htQO+MRjeqXErbdL7N0314Lt17vnntFVk+3qMWazenNAEDBACqilz417d
         oT0cXbgiuurxMnOqyNX88XCYoWlokGz+dg0LxqFHTjWubivY+i+gk7FUy1sf9g1sbBjj
         DX9eISd5HfYZfgWANdetn/S83nJzv89FPqFJzt15/2/Sfy4OwfUzgn+W1EUtcxWCdkMw
         M4krzEiv6vA+G+WeJpLx+5ihp7zJvk6FlSgy1tprLfYrHuxQmedK7To0VUaLg4/LmQ7p
         XvB7qe1znknUpop+KoM/UOoEtjqc96L0SaK5vwRmX5MQ9JLnFH4Pwd0vMdizvpB+FyOT
         U8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689854405; x=1690459205;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TD344bFL45l63ZDJPA0bPLbNEjQCJldadHKIxX9uK9s=;
        b=gxkfHH97I090Yw7UEEqQc0O5gPLIHvreWG6wLwIYY/I/3wNkLBrF9IKyRGCmtjozHK
         HBoG6Tm0/sPKXDnAVGC1me+l1/hjvpyN72SrUxmFbxnpLtRoAKaBWEe2HrL4cqWnZdBh
         VOtZxoXer1TsiLgPLoKfPsr5IsQvE89m0sItQDCbQK+V1HfoRkdqDNlShaU/ujDC7Nzp
         r4oP26T9SnYfhRy4SMQgX/kySXJ1+yYrLS40RgedAQwmn6gNziTG6FpnUCK2Eaf8wJCY
         groa+jRna+vTH0p2166O7bOvulApPnctz4117S7TIKsGP4BvXWpSdA2oeVenLtCr2aaD
         UuWg==
X-Gm-Message-State: ABy/qLZUapTEBRiFs3LL2srmu7Zs2DniRxNXbQhLfpjqg9AiaHoZxzqa
	pVZ0dqdRt4A9vUB/qMQA5ogBRbon5VzzVumUZpr6b7+hB8Y=
X-Google-Smtp-Source: APBJJlGqWjHxJIVHc4PojEFoGTQw/BWRxDYnEtJRraK7nWwpRuzm97y9xGb3fCfRtnYWoUjqQMeShx3AS4kuSzdnvy0=
X-Received: by 2002:a2e:8401:0:b0:2b6:c236:b040 with SMTP id
 z1-20020a2e8401000000b002b6c236b040mr1546372ljg.12.1689854404324; Thu, 20 Jul
 2023 05:00:04 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 20 Jul 2023 13:59:52 +0200
Message-ID: <CA+cAkep373DyqPF_TZyH5iVwQDHrsN2Hz1BaYYg+rfww-S2+bg@mail.gmail.com>
Subject: About requirements on cross compiling rust package
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Randy MacLeod <Randy.MacLeod@windriver.com>
Content-Type: multipart/alternative; boundary="0000000000007df11a0600e9e358"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 12:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184635

--0000000000007df11a0600e9e358
Content-Type: text/plain; charset="UTF-8"

Hello list,

In the course of YOCTO #15104
<https://bugzilla.yoctoproject.org/show_bug.cgi?id=15104>  , I finally
found the issue was due to a missing Cargo.lock file at the root of the
project (which is pretty usual for a Rust project from git since Cargo.lock
is only required when publishing on the crates registry).

With a Cargo.lock correctly placed, the patch process made by
cargo_common.bbclass works perfectly fine even with a virtual manifest.

I often encountered issues that were in the end due to a missing Cargo.lock
and I think we all agree on this list (I didn't crawl the mail archives, I
talked from my memory) that this file is absolutely required when building
a rust project under yocto.
(especially for reproducible build)

I'm currently testing a patch which will replace --offline cargo build
flags with --frozen (which supersedes --offline mode since it prevents
network access but also Cargo.lock to be present and up to date).

I have two questions though:
  1) rust-hello-world doesn't embed a Cargo.lock (and doesn't need to since
it had zero dependencies) , considering that we now have a more "real"
recipe (zvariant) that is used within selftest, would it be acceptable to
suppress rust-hello-world ?
  2) below is kind of message we will have when using --frozen with an
absent Cargo.lock:

| error: failed to get `glib` as a dependency of package `zvariant v3.12.0
(/home/fmartinsons/TAPOS_build/build-tapos/tmp/work/corei7-64-tapos-linux/zbus/3.11.0-r0/git/zvariant)`
|
| Caused by:
|   failed to load source for dependency `glib`
|
| Caused by:
|   Unable to update https://github.com/gtk-rs/glib?rev=c9ee583cea0
|
| Caused by:
|   failed to fetch into:
/home/fmartinsons/TAPOS_build/build-tapos/tmp/work/corei7-64-tapos-linux/zbus/3.11.0-r0/cargo_home/git/db/glib-928cf7b282977403
|
| Caused by:
|   attempting to update a git repository, but --frozen was specified

I think it is not very clear that the root cause is a missing Cargo.lock ,
so I'm wondering if a specific bitbake ops (do_compile_prepend) would not
be  better to check for Cargo.lock and output an explicit message (it
doesn't prevent to keep --frozen anyway). What do you think ?

PS: I copied Randy as the maintainer of rust-hello-world but also  the
ticket assignee.

--0000000000007df11a0600e9e358
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello list,<div><br></div><div>In the course=C2=A0of=C2=A0=
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15104">YOCTO=
 #15104</a>=C2=A0 , I finally found the issue was due to a missing Cargo.lo=
ck file at the root of the project (which is pretty usual for a Rust projec=
t from git since Cargo.lock is only required when publishing on the crates =
registry).=C2=A0</div><div><br></div><div>With a Cargo.lock correctly place=
d, the patch process made by cargo_common.bbclass works perfectly fine even=
 with a virtual manifest.</div><div><br></div><div>I often encountered issu=
es that were in the end due to a missing Cargo.lock and I think we all agre=
e on this list (I didn&#39;t crawl the mail archives, I talked from my memo=
ry) that this file is absolutely required when building a rust project unde=
r yocto.</div><div>(especially for reproducible build)</div><div><br></div>=
<div>I&#39;m currently testing a patch which will replace --offline cargo b=
uild flags with --frozen (which supersedes=C2=A0--offline mode since it pre=
vents network access but also Cargo.lock to be present and up to date).</di=
v><div><br></div><div>I have two questions though:</div><div>=C2=A0 1) rust=
-hello-world doesn&#39;t embed a Cargo.lock (and doesn&#39;t need to since =
it had zero dependencies) , considering that we now have a more &quot;real&=
quot; recipe (zvariant) that is used within selftest, would it be acceptabl=
e to suppress rust-hello-world ?</div><div>=C2=A0 2) below is kind of messa=
ge we will have when using --frozen with an absent Cargo.lock:</div><div><b=
r></div><div>| error: failed to get `glib` as a dependency of package `zvar=
iant v3.12.0 (/home/fmartinsons/TAPOS_build/build-tapos/tmp/work/corei7-64-=
tapos-linux/zbus/3.11.0-r0/git/zvariant)`<br>| <br>| Caused by:<br>| =C2=A0=
 failed to load source for dependency `glib`<br>| <br>| Caused by:<br>| =C2=
=A0 Unable to update <a href=3D"https://github.com/gtk-rs/glib?rev=3Dc9ee58=
3cea0">https://github.com/gtk-rs/glib?rev=3Dc9ee583cea0</a><br>| <br>| Caus=
ed by:<br>| =C2=A0 failed to fetch into: /home/fmartinsons/TAPOS_build/buil=
d-tapos/tmp/work/corei7-64-tapos-linux/zbus/3.11.0-r0/cargo_home/git/db/gli=
b-928cf7b282977403<br>| <br>| Caused by:<br>| =C2=A0 attempting to update a=
 git repository, but --frozen was specified<br></div><div><br></div><div>I =
think it is not very clear that the root cause is a missing Cargo.lock , so=
 I&#39;m wondering if a specific bitbake ops (do_compile_prepend) would not=
 be=C2=A0 better to check for Cargo.lock and output an explicit message (it=
 doesn&#39;t prevent to keep --frozen anyway). What do you think ?</div><di=
v><br></div><div>PS: I copied Randy as the maintainer of rust-hello-world b=
ut also=C2=A0 the ticket assignee.</div></div>

--0000000000007df11a0600e9e358--

