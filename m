Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 0BD76787FF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 17:32:43 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id z6so2918651iob.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 09:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PS5BdpKjS2z7wZ7xQXgNktY/xc8K1SzuHTBRWBFfto4=;
	b=HNqDTS/obc8AxKyf0YgxwGLueKieqyFR7SrAHkztTmGoWqlWnglDkbI6ZW12MM6W7H
	VcX3cSBLaPZViis7aZ5rOSfUCcbrM5ZHD6Rruzj7gEufv/FAp7qFsvqVJsCyDQvOC1f1
	kjcX2cKA99oPRuUg7MmhPWLfJ/fmyhxgo+LLtPLImext1wHyUeZwekixv5pSGkIVIJ6w
	IbMgsIsHnu/+wM8l/RHqzEjfRIfscKsyqbVh0ySAeWq59jCQ2FycxLI91QsYkhcIio1t
	U5JXWHa+5ySSvHS5qB22n3k9903xkNVjjWHSxVMkTUZhypyoqOOP1UkPRbSaJYIbXbBR
	nDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PS5BdpKjS2z7wZ7xQXgNktY/xc8K1SzuHTBRWBFfto4=;
	b=q9buh5sELK9QLY5aLKDflaOt81IH7vf3JtFjCLTgXGi4aGB7mbWrDI2+Kv92Np6lLS
	dEgMw/+7COazFRxNsT/4wrlFQScHib7IrGDaE6ieqxUi0H+nYv1fH3ANEIaHdEY7jWzJ
	lhh9w4na/B/vlM3Tilsu6rXBzuw2QhcgOZEFKXGTHFdIeLXPzbr1fRMkD6vcKLVpMnnb
	nZMbo6TQ+tPiNmU8LvkWVUFGagOIOMBUybzLPQOItfddV/EP1H2XGgaMz1PMGZ2xyfu/
	InUYGcVO0cK8ESzQ8Cp0I4eE24V2Fbjg1XCUD2ZspL+xCBDCFPEof3K0S2WBsmceHUaM
	6k0g==
X-Gm-Message-State: AKwxyteGvjci8b0rTkn/1IEZAYXT2vvR5hAFHpnYFpO2i9UJXflNokSe
	fXY/HZvdfCV+4IOAaZrtEbX0A9mVuOMPt2+g1v5idw==
X-Google-Smtp-Source: ACJfBov1AvGZnZXRrkli4JujN5g4sMV8cTdwo4CBU9p3ayBkVfJZAKwdqW4CMTeZatDav4lIAeOc8JomeKjlo3jXtM4=
X-Received: by 10.107.186.86 with SMTP id k83mr19145273iof.208.1516383165186; 
	Fri, 19 Jan 2018 09:32:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Fri, 19 Jan 2018 09:32:24 -0800 (PST)
In-Reply-To: <97F7C8E70D26E94FA7E05578493F65C63B59397A@G08CNEXMBPEKD03.g08.fujitsu.local>
References: <1513757451-829-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<97F7C8E70D26E94FA7E05578493F65C63B59397A@G08CNEXMBPEKD03.g08.fujitsu.local>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 Jan 2018 17:32:24 +0000
Message-ID: <CAJTo0LYQKNFQ5Dr3_xva_XUCsxL-zz=Mi44aWeHgmoKqtXcgYw@mail.gmail.com>
To: "Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc:CVE-2017-17426
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
X-List-Received-Date: Fri, 19 Jan 2018 17:32:44 -0000
Content-Type: multipart/alternative; boundary="94eb2c076a70e7a82d05632477f5"

--94eb2c076a70e7a82d05632477f5
Content-Type: text/plain; charset="UTF-8"

This needs rebasing to master, and I suspect your email servers are
corrupting your mails as I often have to go and fix up your patches which
have had long lines wrapped:

Applying: glibc:CVE-2017-17426
error: corrupt patch at line 64

Ross

On 17 January 2018 at 02:46, Huang, Qiyu <huangqy.fnst@cn.fujitsu.com>
wrote:

> ping
>
>
> > -----Original Message-----
> > From: Huang, Qiyu
> > Sent: Wednesday, December 20, 2017 4:11 PM
> > To: openembedded-core@lists.openembedded.org
> > Cc: Huang, Qiyu <huangqy.fnst@cn.fujitsu.com>
> > Subject: [OE-core][PATCH] glibc:CVE-2017-17426
> >
> > Fix the CVE-2017-17426.
> >
> > Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> > ---
> >  ...-overflow-in-malloc-when-tcache-is-enable.patch | 52
> > ++++++++++++++++++++++
> >  meta/recipes-core/glibc/glibc_2.26.bb              |  1 +
> >  2 files changed, 53 insertions(+)
> >  create mode 100644
> > meta/recipes-core/glibc/glibc/0029-Fix-integer-overflow-in-
> malloc-when-tcache
> > -is-enable.patch
> >
> > diff --git
> > a/meta/recipes-core/glibc/glibc/0029-Fix-integer-
> overflow-in-malloc-when-tcac
> > he-is-enable.patch
> > b/meta/recipes-core/glibc/glibc/0029-Fix-integer-
> overflow-in-malloc-when-tcac
> > he-is-enable.patch
> > new file mode 100644
> > index 0000000..623bed7
> > --- /dev/null
> > +++ b/meta/recipes-core/glibc/glibc/0029-Fix-integer-overflow-in-malloc-
> > +++ when-tcache-is-enable.patch
> > @@ -0,0 +1,52 @@
> > +From 34697694e8a93b325b18f25f7dcded55d6baeaf6 Mon Sep 17 00:00:00
> > 2001
> > +From: Arjun Shankar <arjun@redhat.com>
> > +Date: Thu, 30 Nov 2017 13:31:45 +0100
> > +Subject: [PATCH] Fix integer overflow in malloc when tcache is enabled
> > +[BZ  #22375]
> > +
> > +When the per-thread cache is enabled, __libc_malloc uses request2size
> > +(which does not perform an overflow check) to calculate the chunk size
> > +from the requested allocation size. This leads to an integer overflow
> > +causing malloc to incorrectly return the last successfully allocated
> > +block when called with a very large size argument (close to SIZE_MAX).
> > +
> > +This commit uses checked_request2size instead, removing the overflow.
> > +
> > +Upstream-status: Backport
> > +---
> > + ChangeLog       | 6 ++++++
> > + malloc/malloc.c | 3 ++-
> > + 2 files changed, 8 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/ChangeLog b/ChangeLog
> > +index b55ed22..888f9fb 100644
> > +--- a/ChangeLog
> > ++++ b/ChangeLog
> > +@@ -1,3 +1,9 @@
> > ++2017-11-30  Arjun Shankar  <arjun@redhat.com>
> > ++
> > ++    [BZ #22375]
> > ++    * malloc/malloc.c (__libc_malloc): Use checked_request2size
> > ++    instead of request2size.
> > ++
> > + 2017-08-02  Siddhesh Poyarekar  <siddhesh@sourceware.org>
> > +
> > +     * sysdeps/sparc/sparc32/sparcv9/fpu/multiarch/s_llrint.S
> > +diff --git a/malloc/malloc.c b/malloc/malloc.c index 79f0e9e..0c9e074
> > +100644
> > +--- a/malloc/malloc.c
> > ++++ b/malloc/malloc.c
> > +@@ -3050,7 +3050,8 @@ __libc_malloc (size_t bytes)
> > +     return (*hook)(bytes, RETURN_ADDRESS (0));  #if USE_TCACHE
> > +   /* int_free also calls request2size, be careful to not pad twice.
> > +*/
> > +-  size_t tbytes = request2size (bytes);
> > ++  size_t tbytes;
> > ++  checked_request2size (bytes, tbytes);
> > +   size_t tc_idx = csize2tidx (tbytes);
> > +
> > +   MAYBE_INIT_TCACHE ();
> > +--
> > +2.7.4
> > +
> > diff --git a/meta/recipes-core/glibc/glibc_2.26.bb
> > b/meta/recipes-core/glibc/glibc_2.26.bb
> > index 135ec4f..36b2004 100644
> > --- a/meta/recipes-core/glibc/glibc_2.26.bb
> > +++ b/meta/recipes-core/glibc/glibc_2.26.bb
> > @@ -43,6 +43,7 @@ SRC_URI =
> > "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
> >
> > file://0026-assert-Suppress-pedantic-warning-caused-by-statement.patch \
> >             file://0027-glibc-reset-dl-load-write-lock-after-forking.patch
> \
> >             file://0028-Bug-4578-add-ld.so-lock-while-fork.patch \
> > +
> > + file://0029-Fix-integer-overflow-in-malloc-when-tcache-is-enable.patch
> > + \
> >  "
> >
> >  NATIVESDKFIXES ?= ""
> > --
> > 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c076a70e7a82d05632477f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This needs rebasing to master, and I suspect your email se=
rvers are corrupting your mails as I often have to go and fix up your patch=
es which have had long lines wrapped:<div><br></div><div><div>Applying: gli=
bc:CVE-2017-17426</div><div>error: corrupt patch at line 64</div></div><div=
><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On 17 January 2018 at 02:46, Huang, Qiyu <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:huangqy.fnst@cn.fujitsu.com" target=3D"_blank">huang=
qy.fnst@cn.fujitsu.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">ping<br>
<div><div class=3D"h5"><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: Huang, Qiyu<br>
&gt; Sent: Wednesday, December 20, 2017 4:11 PM<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org">openem=
bedded-core@lists.<wbr>openembedded.org</a><br>
&gt; Cc: Huang, Qiyu &lt;<a href=3D"mailto:huangqy.fnst@cn.fujitsu.com">hua=
ngqy.fnst@cn.fujitsu.com</a>&gt;<br>
&gt; Subject: [OE-core][PATCH] glibc:CVE-2017-17426<br>
&gt;<br>
&gt; Fix the CVE-2017-17426.<br>
&gt;<br>
&gt; Signed-off-by: Huang Qiyu &lt;<a href=3D"mailto:huangqy.fnst@cn.fujits=
u.com">huangqy.fnst@cn.fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 ...-overflow-in-malloc-when-<wbr>tcache-is-enable.patch | 52<br>
&gt; ++++++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-core/glibc/<a href=3D"http://glibc_2.26.bb" rel=3D"=
noreferrer" target=3D"_blank">glibc_<wbr>2.26.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 2 files changed, 53 insertions(+)<br>
&gt;=C2=A0 create mode 100644<br>
&gt; meta/recipes-core/glibc/glibc/<wbr>0029-Fix-integer-overflow-in-<wbr>m=
alloc-when-tcache<br>
&gt; -is-enable.patch<br>
&gt;<br>
&gt; diff --git<br>
&gt; a/meta/recipes-core/glibc/<wbr>glibc/0029-Fix-integer-<wbr>overflow-in=
-malloc-when-tcac<br>
&gt; he-is-enable.patch<br>
&gt; b/meta/recipes-core/glibc/<wbr>glibc/0029-Fix-integer-<wbr>overflow-in=
-malloc-when-tcac<br>
&gt; he-is-enable.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..623bed7<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/glibc/<wbr>glibc/0029-Fix-integer-<wbr>overflo=
w-in-malloc-<br>
</div></div>&gt; +++ when-tcache-is-enable.patch<br>
<span class=3D"">&gt; @@ -0,0 +1,52 @@<br>
&gt; +From 34697694e8a93b325b18f25f7dcded<wbr>55d6baeaf6 Mon Sep 17 00:00:0=
0<br>
&gt; 2001<br>
&gt; +From: Arjun Shankar &lt;<a href=3D"mailto:arjun@redhat.com">arjun@red=
hat.com</a>&gt;<br>
&gt; +Date: Thu, 30 Nov 2017 13:31:45 +0100<br>
&gt; +Subject: [PATCH] Fix integer overflow in malloc when tcache is enable=
d<br>
</span>&gt; +[BZ=C2=A0 #22375]<br>
<span class=3D"">&gt; +<br>
&gt; +When the per-thread cache is enabled, __libc_malloc uses request2size=
<br>
</span>&gt; +(which does not perform an overflow check) to calculate the ch=
unk size<br>
&gt; +from the requested allocation size. This leads to an integer overflow=
<br>
&gt; +causing malloc to incorrectly return the last successfully allocated<=
br>
&gt; +block when called with a very large size argument (close to SIZE_MAX)=
.<br>
<span class=3D"">&gt; +<br>
&gt; +This commit uses checked_request2size instead, removing the overflow.=
<br>
&gt; +<br>
&gt; +Upstream-status: Backport<br>
&gt; +---<br>
&gt; + ChangeLog=C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 ++++++<br>
&gt; + malloc/malloc.c | 3 ++-<br>
&gt; + 2 files changed, 8 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/ChangeLog b/ChangeLog<br>
&gt; +index b55ed22..888f9fb 100644<br>
&gt; +--- a/ChangeLog<br>
&gt; ++++ b/ChangeLog<br>
&gt; +@@ -1,3 +1,9 @@<br>
&gt; ++2017-11-30=C2=A0 Arjun Shankar=C2=A0 &lt;<a href=3D"mailto:arjun@red=
hat.com">arjun@redhat.com</a>&gt;<br>
&gt; ++<br>
&gt; ++=C2=A0 =C2=A0 [BZ #22375]<br>
&gt; ++=C2=A0 =C2=A0 * malloc/malloc.c (__libc_malloc): Use checked_request=
2size<br>
&gt; ++=C2=A0 =C2=A0 instead of request2size.<br>
&gt; ++<br>
&gt; + 2017-08-02=C2=A0 Siddhesh Poyarekar=C2=A0 &lt;<a href=3D"mailto:sidd=
hesh@sourceware.org">siddhesh@sourceware.org</a>&gt;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* sysdeps/sparc/sparc32/sparcv9/<wbr>fpu/multiarc=
h/s_llrint.S<br>
</span>&gt; +diff --git a/malloc/malloc.c b/malloc/malloc.c index 79f0e9e..=
0c9e074<br>
&gt; +100644<br>
<span class=3D"">&gt; +--- a/malloc/malloc.c<br>
&gt; ++++ b/malloc/malloc.c<br>
&gt; +@@ -3050,7 +3050,8 @@ __libc_malloc (size_t bytes)<br>
</span>&gt; +=C2=A0 =C2=A0 =C2=A0return (*hook)(bytes, RETURN_ADDRESS (0));=
=C2=A0 #if USE_TCACHE<br>
<span class=3D"">&gt; +=C2=A0 =C2=A0/* int_free also calls request2size, be=
 careful to not pad twice.<br>
</span>&gt; +*/<br>
<span class=3D"">&gt; +-=C2=A0 size_t tbytes =3D request2size (bytes);<br>
&gt; ++=C2=A0 size_t tbytes;<br>
&gt; ++=C2=A0 checked_request2size (bytes, tbytes);<br>
&gt; +=C2=A0 =C2=A0size_t tc_idx =3D csize2tidx (tbytes);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0MAYBE_INIT_TCACHE ();<br>
&gt; +--<br>
&gt; +2.7.4<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.26.bb" =
rel=3D"noreferrer" target=3D"_blank">glib<wbr>c_2.26.bb</a><br>
&gt; b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.26.bb" rel=3D"nore=
ferrer" target=3D"_blank">glib<wbr>c_2.26.bb</a><br>
&gt; index 135ec4f..36b2004 100644<br>
&gt; --- a/meta/recipes-core/glibc/<a href=3D"http://glibc_2.26.bb" rel=3D"=
noreferrer" target=3D"_blank">glib<wbr>c_2.26.bb</a><br>
&gt; +++ b/meta/recipes-core/glibc/<a href=3D"http://glibc_2.26.bb" rel=3D"=
noreferrer" target=3D"_blank">glib<wbr>c_2.26.bb</a><br>
&gt; @@ -43,6 +43,7 @@ SRC_URI =3D<br>
&gt; &quot;${GLIBC_GIT_URI};branch=3D${<wbr>SRCBRANCH};name=3Dglibc \<br>
&gt;<br>
&gt; file://0026-assert-Suppress-<wbr>pedantic-warning-caused-by-<wbr>state=
ment.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0027-glibc-reset=
-dl-<wbr>load-write-lock-after-forking.<wbr>patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0028-Bug-4578-ad=
d-ld.<wbr>so-lock-while-fork.patch \<br>
&gt; +<br>
</span>&gt; + file://0029-Fix-integer-<wbr>overflow-in-malloc-when-<wbr>tca=
che-is-enable.patch<br>
&gt; + \<br>
<div class=3D"HOEnZb"><div class=3D"h5">&gt;=C2=A0 &quot;<br>
&gt;<br>
&gt;=C2=A0 NATIVESDKFIXES ?=3D &quot;&quot;<br>
&gt; --<br>
&gt; 2.7.4<br>
<br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--94eb2c076a70e7a82d05632477f5--
