Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6D05A75518
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 21:49:02 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id b77-v6so4588198vkb.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 14:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WwxhfHq6oPFmXEby2SwQj1c7mhU0bosVsEMKBniVJaY=;
	b=XJM150QdWPbHmwj6suHz1hDaQJ4LzApM4UInuDRe5kv78YUlXxl8j3OuJAfF9GjtYZ
	iQsPihNcJp8pEQ4duJWzKcS17kTKSY03RMGBIwlAOHgY2dOJHmcg3PpsYgfqUdrGp/0k
	Y73Zr7pD/EH3Il4v4CJ7z0csjE5/X7VK7q4qQjjlZFGuuj0wxbRTjhCnwAFYMqAWcX+S
	tOkPg9LHMHh6P7lkkAVdI/7n9YYRn+mj0Xh/ycWVd+E22JRp3z0AwEqgVWU3oR0OKdmp
	uCE+ZFsx5CwVyEh1r5IrD1pwGaDL6q3Tg2oYd9m5KRO/hn5uah4xC7BG640UEg1/MYXB
	6tXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WwxhfHq6oPFmXEby2SwQj1c7mhU0bosVsEMKBniVJaY=;
	b=H65kJuHdaaXkTqHhmXnOivcrtsGkkTVL0SBHDdc5loVJYIcEwehuwZrDyMhP8oqVY0
	DBEHDwop88PHZRsN+mmmSjXZWAnhsdbQeka46SNwAALmFUFRCsjPTG58vkT9romrmBZg
	I/YwISI/zsn0FAcPZSfb/+Es9/vLzrSV2sSkabq4g4RNCDjBCBs4BA8E43+figGRlljX
	vZnrhFlG+lO//eanVuej12dcQ8UicAaHzsYXqiw4vAM3IenGr8pPibIkHlTT3JlzJxLq
	uaFdGO/OaduOUjKTfgkCYabXBpnEmOE/AfeWzJDzQ+wivACtqKWDsQsTx0sGG4DoDXfQ
	2fzQ==
X-Gm-Message-State: APt69E24mDTKPPL4vBkp2MLCwK/77qjTCzrZJBEMAIrqTOCT3DsVVy2l
	ditb7IaoGVm/Ee6I2hV4fwpn2ukPJs7Z3BJIl/c=
X-Google-Smtp-Source: ADUXVKKZZKquv6bbzdbth+zsbj1YHpGsbHDlxs7SfogtkZVZ5yVuSB1j06urhMurDF0GcMgfZqg2JMj1+jZBS/WPID8=
X-Received: by 2002:a1f:4b86:: with SMTP id
	y128-v6mr2576040vka.146.1529012943060; 
	Thu, 14 Jun 2018 14:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <1528977321-8121-1-git-send-email-ovidiu.panait@windriver.com>
	<002e01d403d8$b811f1b0$2835d510$@neuf.fr>
	<20da1542-9903-d4fc-b38f-8f0ad3b2d4a1@gmail.com>
	<CAJ86T=UjDUYfQ3wAb4YCT954HjBfZMz1fnFkBxUV40xj=aBgow@mail.gmail.com>
	<CAMKF1spJGLVW_HKD9YEgDY6aidz6q_TvjohfoJHnXHDiyc3vtg@mail.gmail.com>
	<CAJ86T=U7Uk0uajnnu=1P_dSxGrO3thQDp9655KC1EEYesPa3_Q@mail.gmail.com>
In-Reply-To: <CAJ86T=U7Uk0uajnnu=1P_dSxGrO3thQDp9655KC1EEYesPa3_Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Jun 2018 14:48:51 -0700
Message-ID: <CAMKF1srPwWebGHZcmnV5vaNhRgSjrp2DG0CgT44zyUqfnFBf_A@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] db: disable the ARM assembler mutex code
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
X-List-Received-Date: Thu, 14 Jun 2018 21:49:02 -0000
Content-Type: multipart/alternative; boundary="00000000000054063d056ea1113f"

--00000000000054063d056ea1113f
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 14, 2018 at 1:01 PM Andre McCurdy <armccurdy@gmail.com> wrote:

> On Thu, Jun 14, 2018 at 12:24 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Thu, Jun 14, 2018 at 12:12 PM Andre McCurdy <armccurdy@gmail.com>
> wrote:
> >>
> >> On Thu, Jun 14, 2018 at 9:40 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >> > On 6/14/18 5:10 AM, Herve Jourdain wrote:
> >> >> Hi,
> >> >>
> >> >> I believe I solved that same problem by just adding, in the case of
> armv8
> >> >> (which I believe may be the new architecture you're referring to):
> >> >> MUTEX_armv8 = ""
> >> >> This way, it allows previous versions to work just like they did
> before,
> >> >> without having to disable ARM assembler mutex code for architectures
> that
> >> >> support it correctly - up to armv7ve I believe.
> >> >> Of course, we might need to also have a good definition for armv8,
> which is
> >> >> the object of another thread.
> >> >
> >> > right thats a better approach.
> >>
> >> SWP is not guaranteed to work on SMP systems... and even if it does,
> >> performance is likely to be worse than the pthreads version (which can
> >> take advantage of the newer instructions).
> >>
> >>
> https://community.arm.com/processors/b/blog/posts/locks-swps-and-two-smoking-barriers
> >>
> >> In general, use of hand optimised assembler mutex implementations in
> >> user space isn't something to be encouraged - use pthreads (or maybe a
> >> gcc intrinsic) instead.
> >>
> >
> > question is about disabling it on old arm machines, do we have data where
> > we know that other sync methods without swp works better on armv5 and
> lower ?
>
> On armv5 and below a hand optimised implementation using SWP is likely
> to be faster than pthreads. No one is suggesting otherwise.
>
> On SMP (highly likely nowadays for armv7 and above), SWP simply might
> not work (aside from the fact that if it does work, it's likely to be
> slower than pthreads). It's not really a question of performance
> there, so the proposal to only disable SWP for armv8 doesn't seem like
> a safe solution.
>

Suggestion is not to just do it for armv8 but
To keep it there where its beneficial

>
> Using pthreads unconditionally is safe and easy. Unless you can prove
> that hand optimised SWP is really a big win for armv5 (is anyone
> really running a performance critical database on an armv5 system?)
> why not keep the recipe simple and use pthreads everywhere?
>
> >> I think the original patch is good.
> >>
> >> >> Cheers,
> >> >> Herve
> >> >>
> >> >> -----Original Message-----
> >> >> From: openembedded-core-bounces@lists.openembedded.org
> >> >> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of
> >> >> Ovidiu Panait
> >> >> Sent: jeudi 14 juin 2018 13:55
> >> >> To: openembedded-core@lists.openembedded.org
> >> >> Subject: [OE-core] [PATCH 1/1] db: disable the ARM assembler mutex
> code
> >> >>
> >> >> The swpb in macro MUTEX_SET will cause "undefined instruction" error
> on the
> >> >> new arm arches which don't support this assembly instruction any
> more. If
> >> >> use ldrex/strex to replace swpb, the old arm arches don't support
> them. So
> >> >> to avoid this issue, just disable the ARM assembler mutex code, and
> use the
> >> >> default pthreads mutex.
> >> >>
> >> >> Signed-off-by: Li Zhou <li.zhou@windriver.com>
> >> >> Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
> >> >> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> >> >> ---
> >> >>  meta/recipes-support/db/db_5.3.28.bb | 13 +------------
> >> >>  1 file changed, 1 insertion(+), 12 deletions(-)
> >> >>
> >> >> diff --git a/meta/recipes-support/db/db_5.3.28.bb
> >> >> b/meta/recipes-support/db/db_5.3.28.bb
> >> >> index 093ee44909..15b4155a29 100644
> >> >> --- a/meta/recipes-support/db/db_5.3.28.bb
> >> >> +++ b/meta/recipes-support/db/db_5.3.28.bb
> >> >> @@ -59,18 +59,7 @@ FILES_SOLIBSDEV = "${libdir}/libdb.so
> >> >> ${libdir}/libdb_cxx.so"
> >> >>  # All the --disable-* options replace --enable-smallbuild, which
> breaks a
> >> >> bunch of stuff (eg. postfix)  DB5_CONFIG ?= "--enable-o_direct
> >> >> --disable-cryptography --disable-queue --disable-replication
> >> >> --disable-verify --disable-compat185 --disable-sql"
> >> >>
> >> >> -EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx
> --with-sysroot"
> >> >> -
> >> >> -# Override the MUTEX setting here, the POSIX library is -# the
> default -
> >> >> "POSIX/pthreads/library".
> >> >> -# Don't ignore the nice SWP instruction on the ARM:
> >> >> -# These enable the ARM assembler mutex code, this won't -# work
> with thumb
> >> >> compilation...
> >> >> -ARM_MUTEX = "--with-mutex=ARM/gcc-assembly"
> >> >> -MUTEX = ""
> >> >> -MUTEX_arm = "${ARM_MUTEX}"
> >> >> -MUTEX_armeb = "${ARM_MUTEX}"
> >> >> -EXTRA_OECONF += "${MUTEX} STRIP=true"
> >> >> +EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx
> --with-sysroot
> >> >> STRIP=true"
> >> >>  EXTRA_OEMAKE += "LIBTOOL='./${HOST_SYS}-libtool'"
> >> >>
> >> >>  EXTRA_AUTORECONF += "--exclude=autoheader  -I ${S}/dist/aclocal
> >> >> -I${S}/dist/aclocal_java"
> >> >> --
> >> >> 2.17.1
> >> >>
> >> >> --
> >> >> _______________________________________________
> >> >> Openembedded-core mailing list
> >> >> Openembedded-core@lists.openembedded.org
> >> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >> >>
> >> >
> >> >
> >> >
> >> > --
> >> > _______________________________________________
> >> > Openembedded-core mailing list
> >> > Openembedded-core@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >> >
>

--00000000000054063d056ea1113f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Thu=
, Jun 14, 2018 at 1:01 PM Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gma=
il.com">armccurdy@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">On Thu, Jun 14, 2018 at 12:24 PM, Khem Raj &lt;<a href=3D"mailto:ra=
j.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; On Thu, Jun 14, 2018 at 12:12 PM Andre McCurdy &lt;<a href=3D"mailto:a=
rmccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt; wrote:<br=
>
&gt;&gt;<br>
&gt;&gt; On Thu, Jun 14, 2018 at 9:40 AM, Khem Raj &lt;<a href=3D"mailto:ra=
j.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; On 6/14/18 5:10 AM, Herve Jourdain wrote:<br>
&gt;&gt; &gt;&gt; Hi,<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; I believe I solved that same problem by just adding, in t=
he case of armv8<br>
&gt;&gt; &gt;&gt; (which I believe may be the new architecture you&#39;re r=
eferring to):<br>
&gt;&gt; &gt;&gt; MUTEX_armv8 =3D &quot;&quot;<br>
&gt;&gt; &gt;&gt; This way, it allows previous versions to work just like t=
hey did before,<br>
&gt;&gt; &gt;&gt; without having to disable ARM assembler mutex code for ar=
chitectures that<br>
&gt;&gt; &gt;&gt; support it correctly - up to armv7ve I believe.<br>
&gt;&gt; &gt;&gt; Of course, we might need to also have a good definition f=
or armv8, which is<br>
&gt;&gt; &gt;&gt; the object of another thread.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; right thats a better approach.<br>
&gt;&gt;<br>
&gt;&gt; SWP is not guaranteed to work on SMP systems... and even if it doe=
s,<br>
&gt;&gt; performance is likely to be worse than the pthreads version (which=
 can<br>
&gt;&gt; take advantage of the newer instructions).<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0<a href=3D"https://community.arm.com/processors/b/blog=
/posts/locks-swps-and-two-smoking-barriers" rel=3D"noreferrer" target=3D"_b=
lank">https://community.arm.com/processors/b/blog/posts/locks-swps-and-two-=
smoking-barriers</a><br>
&gt;&gt;<br>
&gt;&gt; In general, use of hand optimised assembler mutex implementations =
in<br>
&gt;&gt; user space isn&#39;t something to be encouraged - use pthreads (or=
 maybe a<br>
&gt;&gt; gcc intrinsic) instead.<br>
&gt;&gt;<br>
&gt;<br>
&gt; question is about disabling it on old arm machines, do we have data wh=
ere<br>
&gt; we know that other sync methods without swp works better on armv5 and =
lower ?<br>
<br>
On armv5 and below a hand optimised implementation using SWP is likely<br>
to be faster than pthreads. No one is suggesting otherwise.<br>
<br>
On SMP (highly likely nowadays for armv7 and above), SWP simply might<br>
not work (aside from the fact that if it does work, it&#39;s likely to be<b=
r>
slower than pthreads). It&#39;s not really a question of performance<br>
there, so the proposal to only disable SWP for armv8 doesn&#39;t seem like<=
br>
a safe solution.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Suggestion is no=
t to just do it for armv8 but</div><div dir=3D"auto">To keep it there where=
 its beneficial=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Using pthreads unconditionally is safe and easy. Unless you can prove<br>
that hand optimised SWP is really a big win for armv5 (is anyone<br>
really running a performance critical database on an armv5 system?)<br>
why not keep the recipe simple and use pthreads everywhere?<br>
<br>
&gt;&gt; I think the original patch is good.<br>
&gt;&gt;<br>
&gt;&gt; &gt;&gt; Cheers,<br>
&gt;&gt; &gt;&gt; Herve<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; -----Original Message-----<br>
&gt;&gt; &gt;&gt; From: <a href=3D"mailto:openembedded-core-bounces@lists.o=
penembedded.org" target=3D"_blank">openembedded-core-bounces@lists.openembe=
dded.org</a><br>
&gt;&gt; &gt;&gt; [mailto:<a href=3D"mailto:openembedded-core-bounces@lists=
.openembedded.org" target=3D"_blank">openembedded-core-bounces@lists.openem=
bedded.org</a>] On Behalf Of<br>
&gt;&gt; &gt;&gt; Ovidiu Panait<br>
&gt;&gt; &gt;&gt; Sent: jeudi 14 juin 2018 13:55<br>
&gt;&gt; &gt;&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedde=
d.org" target=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; &gt;&gt; Subject: [OE-core] [PATCH 1/1] db: disable the ARM assemb=
ler mutex code<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; The swpb in macro MUTEX_SET will cause &quot;undefined in=
struction&quot; error on the<br>
&gt;&gt; &gt;&gt; new arm arches which don&#39;t support this assembly inst=
ruction any more. If<br>
&gt;&gt; &gt;&gt; use ldrex/strex to replace swpb, the old arm arches don&#=
39;t support them. So<br>
&gt;&gt; &gt;&gt; to avoid this issue, just disable the ARM assembler mutex=
 code, and use the<br>
&gt;&gt; &gt;&gt; default pthreads mutex.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Signed-off-by: Li Zhou &lt;<a href=3D"mailto:li.zhou@wind=
river.com" target=3D"_blank">li.zhou@windriver.com</a>&gt;<br>
&gt;&gt; &gt;&gt; Signed-off-by: Catalin Enache &lt;<a href=3D"mailto:catal=
in.enache@windriver.com" target=3D"_blank">catalin.enache@windriver.com</a>=
&gt;<br>
&gt;&gt; &gt;&gt; Signed-off-by: Ovidiu Panait &lt;<a href=3D"mailto:ovidiu=
.panait@windriver.com" target=3D"_blank">ovidiu.panait@windriver.com</a>&gt=
;<br>
&gt;&gt; &gt;&gt; ---<br>
&gt;&gt; &gt;&gt;=C2=A0 meta/recipes-support/db/<a href=3D"http://db_5.3.28=
.bb" rel=3D"noreferrer" target=3D"_blank">db_5.3.28.bb</a> | 13 +----------=
--<br>
&gt;&gt; &gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 12 deletions(-)<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; diff --git a/meta/recipes-support/db/<a href=3D"http://db=
_5.3.28.bb" rel=3D"noreferrer" target=3D"_blank">db_5.3.28.bb</a><br>
&gt;&gt; &gt;&gt; b/meta/recipes-support/db/<a href=3D"http://db_5.3.28.bb"=
 rel=3D"noreferrer" target=3D"_blank">db_5.3.28.bb</a><br>
&gt;&gt; &gt;&gt; index 093ee44909..15b4155a29 100644<br>
&gt;&gt; &gt;&gt; --- a/meta/recipes-support/db/<a href=3D"http://db_5.3.28=
.bb" rel=3D"noreferrer" target=3D"_blank">db_5.3.28.bb</a><br>
&gt;&gt; &gt;&gt; +++ b/meta/recipes-support/db/<a href=3D"http://db_5.3.28=
.bb" rel=3D"noreferrer" target=3D"_blank">db_5.3.28.bb</a><br>
&gt;&gt; &gt;&gt; @@ -59,18 +59,7 @@ FILES_SOLIBSDEV =3D &quot;${libdir}/li=
bdb.so<br>
&gt;&gt; &gt;&gt; ${libdir}/libdb_cxx.so&quot;<br>
&gt;&gt; &gt;&gt;=C2=A0 # All the --disable-* options replace --enable-smal=
lbuild, which breaks a<br>
&gt;&gt; &gt;&gt; bunch of stuff (eg. postfix)=C2=A0 DB5_CONFIG ?=3D &quot;=
--enable-o_direct<br>
&gt;&gt; &gt;&gt; --disable-cryptography --disable-queue --disable-replicat=
ion<br>
&gt;&gt; &gt;&gt; --disable-verify --disable-compat185 --disable-sql&quot;<=
br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; -EXTRA_OECONF =3D &quot;${DB5_CONFIG} --enable-shared --e=
nable-cxx --with-sysroot&quot;<br>
&gt;&gt; &gt;&gt; -<br>
&gt;&gt; &gt;&gt; -# Override the MUTEX setting here, the POSIX library is =
-# the default -<br>
&gt;&gt; &gt;&gt; &quot;POSIX/pthreads/library&quot;.<br>
&gt;&gt; &gt;&gt; -# Don&#39;t ignore the nice SWP instruction on the ARM:<=
br>
&gt;&gt; &gt;&gt; -# These enable the ARM assembler mutex code, this won&#3=
9;t -# work with thumb<br>
&gt;&gt; &gt;&gt; compilation...<br>
&gt;&gt; &gt;&gt; -ARM_MUTEX =3D &quot;--with-mutex=3DARM/gcc-assembly&quot=
;<br>
&gt;&gt; &gt;&gt; -MUTEX =3D &quot;&quot;<br>
&gt;&gt; &gt;&gt; -MUTEX_arm =3D &quot;${ARM_MUTEX}&quot;<br>
&gt;&gt; &gt;&gt; -MUTEX_armeb =3D &quot;${ARM_MUTEX}&quot;<br>
&gt;&gt; &gt;&gt; -EXTRA_OECONF +=3D &quot;${MUTEX} STRIP=3Dtrue&quot;<br>
&gt;&gt; &gt;&gt; +EXTRA_OECONF =3D &quot;${DB5_CONFIG} --enable-shared --e=
nable-cxx --with-sysroot<br>
&gt;&gt; &gt;&gt; STRIP=3Dtrue&quot;<br>
&gt;&gt; &gt;&gt;=C2=A0 EXTRA_OEMAKE +=3D &quot;LIBTOOL=3D&#39;./${HOST_SYS=
}-libtool&#39;&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 EXTRA_AUTORECONF +=3D &quot;--exclude=3Dautoheader=
=C2=A0 -I ${S}/dist/aclocal<br>
&gt;&gt; &gt;&gt; -I${S}/dist/aclocal_java&quot;<br>
&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; 2.17.1<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; --<br>
&gt;&gt; &gt;&gt; _______________________________________________<br>
&gt;&gt; &gt;&gt; Openembedded-core mailing list<br>
&gt;&gt; &gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.or=
g" target=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; &gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo=
/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.opene=
mbedded.org/mailman/listinfo/openembedded-core</a><br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; _______________________________________________<br>
&gt;&gt; &gt; Openembedded-core mailing list<br>
&gt;&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" t=
arget=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt;&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/ope=
nembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembed=
ded.org/mailman/listinfo/openembedded-core</a><br>
&gt;&gt; &gt;<br>
</blockquote></div></div>

--00000000000054063d056ea1113f--
