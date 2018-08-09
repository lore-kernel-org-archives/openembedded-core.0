Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9B90F71ADD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Aug 2018 03:19:20 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n85-v6so3103300qke.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 20:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=j2pdl86/nUfCC5dWq5gCHihkxk3aLAvYcES+tC9awxQ=;
	b=qdDOvpZa3kjFXa+E41uMcn8PZ2bcteHuVkpqy2KZKM2GQu2gDJE2QSSA7E05aI3KAe
	iyMyTOBSrlxWviyzI55rEOKr9PgJt62pt/eJ14I6yRedagyXaPonAInKbXA8GjlCKHPR
	R+uuqwZ9l+uW/iwu5SIpiVv/K/dEz304b2Z0kLwa1GYHqsqGRzBM9VGjIIdIKudOKplb
	+kXO9tqjVO6C/W0huRGlFjA/D5Idgs5CZ5DNKZkcdH3CivP7i9sAQr2tSlxyqn0BWXER
	PdcPYWYcRqFnju+ex2jy4QzSOTM2tBb+VO/voMKGseoX6h89TXrMcPxRUUn3ffgAR4E1
	OJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=j2pdl86/nUfCC5dWq5gCHihkxk3aLAvYcES+tC9awxQ=;
	b=cNKwf78hF0yyGWyWU/udft/lHcZVZNpQLegIG/pnbiMYcPkb9cjsW5QLj64HjdWFje
	KE1fIUKOwEU3scuGii6dnPWUsXbKoRfwkhvzx0eUwUn1om/JaKlwN6m/qx994c/Z5p0t
	blv8K6BrjMBlSz2OFeMfo3LFSyikV6gSS7hQIbjQsJLO2GwfNbNnhu/YagJs2O/t1/fL
	p3+3HULKsgAfA/jdh1iknB3rAfPHPObrMgHRmdr7Ce3pA5yWwaAtNzx2yp/x95r3vkF/
	AcmzF2HymKHtPnxgwidGYeywqApssdUhcAe0pBKEm2JMJoVs3ZGoDSUsGyhbQuLtqEq9
	Urlg==
X-Gm-Message-State: AOUpUlGYnYvmt1Ea0sLu5M1hAB1lDVE8LrKMEm7r4b+TENOzxw3aoZFU
	XO+fc287j+Z1NuG39+jEIc3TQ1Ci01eFCYlQyoQ=
X-Google-Smtp-Source: AA+uWPyaUReROQJOd6uTfZIoVXLfMyD7HFE6G8qyhVz/VH4iZHCy5JugbCJvTBwbCPNt+gbR8TeFLhv2LG09x1TCv74=
X-Received: by 2002:a37:417:: with SMTP id 23-v6mr302260qke.12.1533784761323; 
	Wed, 08 Aug 2018 20:19:21 -0700 (PDT)
MIME-Version: 1.0
References: <1533781942-1567-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1533781942-1567-1-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Aug 2018 20:19:09 -0700
Message-ID: <CAMKF1srpwDCjKS3epUm8=SmawQNPD61zpkwXteSGJj2ZGvWNZQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: akuster@mvista.com, openembedded-core@lists.openembedded.org
Subject: Re: [ROCKO][PATCH] glibc: Update 2.26 to tip
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
X-List-Received-Date: Thu, 09 Aug 2018 03:19:20 -0000
Content-Type: multipart/alternative; boundary="000000000000dc54800572f81741"

--000000000000dc54800572f81741
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 8, 2018 at 7:33 PM Armin Kuster <akuster808@gmail.com> wrote:

> From: Armin Kuster <akuster@mvista.com>
>
> CVES: CVE-2018-11236, CVE-2017-18269,  CVE-2018-11237
>
> LIC_FILES_CHKSUM for LICENSE changed do to removal of
> "stdio-common/tst-printf.c is copyright C E Chew" text
>
> changelog:
> c9570bd x86: Populate COMMON_CPUID_INDEX_80000001 for Intel CPUs [BZ
> #23459]
> 86e0996 x86: Correct index_cpu_LZCNT [BZ #23456]
> cf6deb0 conform/conformtest.pl: Escape literal braces in regular
> expressions
> b12bed3 stdio-common/tst-printf.c: Remove part under a non-free license
> [BZ #23363]
> 20dc7a9 libio: Add tst-vtables, tst-vtables-interposed
> 4b10e69 Synchronize support/ infrastructure with master
> 762e9d6 NEWS: Reorder out-of-order bugs
> 2781bd5 libio: Disable vtable validation in case of interposition [BZ
> #23313]
> 74d16a5 Check length of ifname before copying it into to ifreq structure.
> 3aaf8bd getifaddrs: Don't return ifa entries with NULL names [BZ #21812]
> f958b45 Use _STRUCT_TIMESPEC as guard in <bits/types/struct_timespec.h>
> [BZ #23349]
> 81b994b Fix parameter type in C++ version of iseqsig (bug 23171)
> 7b52c8a libio: Avoid _allocate_buffer, _free_buffer function pointers [BZ
> #23236]
> 4df8479 Add NEWS entry for CVE-2018-11236
> a5bc5ec Add references to CVE-2018-11236, CVE-2017-18269
> 58ad5f8 Add a test case for [BZ #23196]
> 6b4362f Don't write beyond destination in __mempcpy_avx512_no_vzeroupper
> (bug 23196)
> af7519f Fix path length overflow in realpath [BZ #22786]
> 365722a Fix stack overflow with huge PT_NOTE segment [BZ #20419]
> be056fa Fix blocking pthread_join. [BZ #23137]
> 02f0dd8 Fix signed integer overflow in random_r (bug 17343).
> 3241353 i386: Fix i386 sigaction sa_restorer initialization (BZ#21269)
> 677e6d1 [BZ #22342] Fix netgroup cache keys.
> 71d339c Fix i386 memmove issue (bug 22644).
> 31e2d15 Fix crash in resolver on memory allocation failure (bug 23005)
> 1f7c474 getlogin_r: return early when linux sentinel value is set
> 7e7a5f0 resolv: Fully initialize struct mmsghdr in send_dg [BZ #23037]
>

This is ok



> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta/recipes-core/glibc/glibc_2.26.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc_2.26.bb
> b/meta/recipes-core/glibc/glibc_2.26.bb
> index 9d1e636..a1a4022 100644
> --- a/meta/recipes-core/glibc/glibc_2.26.bb
> +++ b/meta/recipes-core/glibc/glibc_2.26.bb
> @@ -1,13 +1,13 @@
>  require glibc.inc
>
> -LIC_FILES_CHKSUM = "file://LICENSES;md5=e9a558e243b36d3209f380deb394b213 \
> +LIC_FILES_CHKSUM = "file://LICENSES;md5=ebc14508894997e6daaad1b8ffd53a15\
>        file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>
>  file://posix/rxspencer/COPYRIGHT;md5=dc5485bb394a13b2332ec1c785f5d83a \
>        file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
>
>  DEPENDS += "gperf-native bison-native"
>
> -SRCREV ?= "d300041c533a3d837c9f37a099bcc95466860e98"
> +SRCREV ?= "c9570bd2f54abb68e4e3c767aca3a54e05d2c7f6"
>
>  SRCBRANCH ?= "release/${PV}/master"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000dc54800572f81741
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed,=
 Aug 8, 2018 at 7:33 PM Armin Kuster &lt;<a href=3D"mailto:akuster808@gmail=
.com">akuster808@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">From: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com" target=
=3D"_blank">akuster@mvista.com</a>&gt;<br>
<br>
CVES: CVE-2018-11236, CVE-2017-18269,=C2=A0 CVE-2018-11237<br>
<br>
LIC_FILES_CHKSUM for LICENSE changed do to removal of<br>
&quot;stdio-common/tst-printf.c is copyright C E Chew&quot; text<br>
<br>
changelog:<br>
c9570bd x86: Populate COMMON_CPUID_INDEX_80000001 for Intel CPUs [BZ #23459=
]<br>
86e0996 x86: Correct index_cpu_LZCNT [BZ #23456]<br>
cf6deb0 conform/<a href=3D"http://conformtest.pl" rel=3D"noreferrer" target=
=3D"_blank">conformtest.pl</a>: Escape literal braces in regular expression=
s<br>
b12bed3 stdio-common/tst-printf.c: Remove part under a non-free license [BZ=
 #23363]<br>
20dc7a9 libio: Add tst-vtables, tst-vtables-interposed<br>
4b10e69 Synchronize support/ infrastructure with master<br>
762e9d6 NEWS: Reorder out-of-order bugs<br>
2781bd5 libio: Disable vtable validation in case of interposition [BZ #2331=
3]<br>
74d16a5 Check length of ifname before copying it into to ifreq structure.<b=
r>
3aaf8bd getifaddrs: Don&#39;t return ifa entries with NULL names [BZ #21812=
]<br>
f958b45 Use _STRUCT_TIMESPEC as guard in &lt;bits/types/struct_timespec.h&g=
t; [BZ #23349]<br>
81b994b Fix parameter type in C++ version of iseqsig (bug 23171)<br>
7b52c8a libio: Avoid _allocate_buffer, _free_buffer function pointers [BZ #=
23236]<br>
4df8479 Add NEWS entry for CVE-2018-11236<br>
a5bc5ec Add references to CVE-2018-11236, CVE-2017-18269<br>
58ad5f8 Add a test case for [BZ #23196]<br>
6b4362f Don&#39;t write beyond destination in __mempcpy_avx512_no_vzerouppe=
r (bug 23196)<br>
af7519f Fix path length overflow in realpath [BZ #22786]<br>
365722a Fix stack overflow with huge PT_NOTE segment [BZ #20419]<br>
be056fa Fix blocking pthread_join. [BZ #23137]<br>
02f0dd8 Fix signed integer overflow in random_r (bug 17343).<br>
3241353 i386: Fix i386 sigaction sa_restorer initialization (BZ#21269)<br>
677e6d1 [BZ #22342] Fix netgroup cache keys.<br>
71d339c Fix i386 memmove issue (bug 22644).<br>
31e2d15 Fix crash in resolver on memory allocation failure (bug 23005)<br>
1f7c474 getlogin_r: return early when linux sentinel value is set<br>
7e7a5f0 resolv: Fully initialize struct mmsghdr in send_dg [BZ #23037]<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">This is ok</div>=
<div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com" targe=
t=3D"_blank">akuster@mvista.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.26.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.26.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.26.bb" rel=
=3D"noreferrer" target=3D"_blank">glibc_2.26.bb</a> b/meta/recipes-core/gli=
bc/<a href=3D"http://glibc_2.26.bb" rel=3D"noreferrer" target=3D"_blank">gl=
ibc_2.26.bb</a><br>
index 9d1e636..a1a4022 100644<br>
--- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.26.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.26.bb</a><br>
+++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.26.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.26.bb</a><br>
@@ -1,13 +1,13 @@<br>
=C2=A0require glibc.inc<br>
<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSES;md5=3De9a558e243b36d3209f380deb=
394b213 \<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSES;md5=3Debc14508894997e6daaad1b8f=
fd53a15\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4=
a4263 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0file://posix/rxspencer/COPYRIGHT;md5=3Ddc5485bb3=
94a13b2332ec1c785f5d83a \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0file://COPYING.LIB;md5=3D4fbd65380cdd25595107900=
8b364516c&quot;<br>
<br>
=C2=A0DEPENDS +=3D &quot;gperf-native bison-native&quot;<br>
<br>
-SRCREV ?=3D &quot;d300041c533a3d837c9f37a099bcc95466860e98&quot;<br>
+SRCREV ?=3D &quot;c9570bd2f54abb68e4e3c767aca3a54e05d2c7f6&quot;<br>
<br>
=C2=A0SRCBRANCH ?=3D &quot;release/${PV}/master&quot;<br>
<br>
-- <br>
2.7.4<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000dc54800572f81741--
