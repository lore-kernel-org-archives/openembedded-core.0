Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0E324781D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 17:33:16 +0000 (UTC)
Received: by mail-yb0-f194.google.com with SMTP id 130so3295072ybl.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 May 2017 10:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xHtgUluUOx/JOOx1i9jFJ83sYiX7RyhUkNUy1rimBRc=;
	b=VDubH2O3W8htTSrHjJwAq2N3pjVSbTF8VUe9/K+H8bbLHFtJdwWEnLQ/IcAXTFQhYP
	qfNWlBrav+c4Rq4OpGqy17+0Eim+Jx6zmZLNwPRmOunytC/O0oi06tb6aVHs6etpwCCe
	D5O83bjnd57omq4t6aefL7P5l5KvXSUaEGEq+aXMlxM8B2woxj07bwljW/UKY97jjZja
	WCiF/rnbnhlnTcz5iQ497gGdkahc1rZMEknyrr5eQC5Q2boW9qcAJV4DMVyFKMtONE+8
	kBRrVjwNtmuYkd1rDuGtQmija/6eQ3yGBsR16SiYWDC/venKUEm5DeftQ4uynQzz73J1
	669A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xHtgUluUOx/JOOx1i9jFJ83sYiX7RyhUkNUy1rimBRc=;
	b=TSnnYVL3eJ6VzpI974j+Bj8+lI3VNTtzZC5LRQaKUPTE+OosYRGd3jk7nUl47tjsND
	DjoQf1pl5NQlWL39vO++psQZXoqoqy0/Yxv1UxZwq7koxBvz4Qi7A9SFC3mtmhJ8Bf9v
	zlHzMgNn8xHSPDnHgKCCFbE5A4fTrhyz0tyaLnRm6ib8HNzK82/Pd0SGidNLfOPi1Euy
	bVO9KT+gg4ayZ3HbrAN0rqFWAqUxK09aQZcLvu9NdXwNpojRolv3o/iu9eJ1AWbvHHca
	Rba4RTJu6Q6uqAjxou2yde4s39kHgg7HqDuDgFRNSTXDSyKK8cpTO71Z8VFa1hDTu3Vu
	EaIA==
X-Gm-Message-State: AODbwcBv5RQ9v/d9oexj5MeBs7U4uy2gUMIU9GVjpoJCx9yAoMtw6e6Q
	SPkJki5XzcVvPRGoR5MwOnvyJ2B8Ag==
X-Received: by 10.37.252.2 with SMTP id v2mr10714264ybd.80.1496165598161; Tue,
	30 May 2017 10:33:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.162.38 with HTTP; Tue, 30 May 2017 10:33:17 -0700 (PDT)
In-Reply-To: <CAJ86T=W=pf1ie8TEe6+pnHU_JaHf1wb-5Odv73=6em2iQYX98w@mail.gmail.com>
References: <20170530080836.25342-1-Martin.Jansa@gmail.com>
	<CAJ86T=XbqdaxFrWzd1RN-5Y0E8B+Ndj9fHAy8XU0v+q1OYMp6Q@mail.gmail.com>
	<3feaadad-607b-0ae4-61b4-158f86816786@windriver.com>
	<CAJ86T=W=pf1ie8TEe6+pnHU_JaHf1wb-5Odv73=6em2iQYX98w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 30 May 2017 19:33:17 +0200
Message-ID: <CA+chaQfy11sKg7njwvg3-Sg=-8_q4JmjEEbydiGRSAw+urQ5mQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes: Replace "cp -a" with "cp -R --no-dereference --preserve=mode, links"
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
X-List-Received-Date: Tue, 30 May 2017 17:33:18 -0000
Content-Type: multipart/alternative; boundary="f403045db88000f5b70550c1330a"

--f403045db88000f5b70550c1330a
Content-Type: text/plain; charset="UTF-8"

I cannot find the exact message in MLs, but this combination of parameters
was suggested by someone and approved by others back in 2015, when I did
this change and similar in other layers like:
https://patchwork.openembedded.org/patch/116525/

So I'm just using the same everywhere.

But I'm open to change it to some other form if there are technical reasons
to do so (other than personal preference).

On Tue, May 30, 2017 at 6:30 PM, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Tue, May 30, 2017 at 8:41 AM, Mark Hatle <mark.hatle@windriver.com>
> wrote:
> > On 5/30/17 9:45 AM, Andre McCurdy wrote:
> >> On Tue, May 30, 2017 at 1:08 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >>> * Using "cp -a" leaks UID of user running the builds, causing
> >>>   many QA warnings.
> >>> * See this thread for details:
> >>>   http://lists.openembedded.org/pipermail/openembedded-core/
> 2015-November/112904.html
> >>
> >> Using "cp -av --no-preserve=ownership" is a slightly cleaner solution.
> >
> > I personally prefer Martin's version since '-a' is not supported
> everywhere.
> > (Unless you using gnu cp, which 99% of the Linux world uses.. but
> non-Linux
> > systems rarely do.)
>
> Which versions of cp do you know of that support
> "--preserve=mode,links" without supporting "-a" ?
>
> A quick google of manpages suggests that FreeBSD supports "-a" but not
> "--preserve=XXX". OpenBSD doesn't seem to support either.
>
> Which non-Linux host systems does OE support?
>
> > --Mark
> >
> >>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >>> ---
> >>>  meta/recipes-core/coreutils/coreutils_8.27.bb       | 2 +-
> >>>  meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb | 4 ++--
> >>>  meta/recipes-extended/mdadm/mdadm_4.0.bb            | 2 +-
> >>>  3 files changed, 4 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/meta/recipes-core/coreutils/coreutils_8.27.bb
> b/meta/recipes-core/coreutils/coreutils_8.27.bb
> >>> index 667e0af560..ea8740a2d1 100644
> >>> --- a/meta/recipes-core/coreutils/coreutils_8.27.bb
> >>> +++ b/meta/recipes-core/coreutils/coreutils_8.27.bb
> >>> @@ -99,7 +99,7 @@ do_install_append() {
> >>>         install -t ${D}/${mandir}/man1 ${S}/man/*.1
> >>>         # prebuilt man pages don't do a separate man page for [ vs
> test.
> >>>         # see comment above r.e. sed and update-alternatives
> >>> -       cp -a ${D}${mandir}/man1/test.1 ${D}${mandir}/man1/lbracket.1.
> ${BPN}
> >>> +       cp -R --no-dereference --preserve=mode,links -v
> ${D}${mandir}/man1/test.1 ${D}${mandir}/man1/lbracket.1.${BPN}
> >>>  }
> >>>
> >>>  inherit update-alternatives
> >>> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
> b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
> >>> index 5216c7027c..7c8809a41e 100644
> >>> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
> >>> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
> >>> @@ -106,7 +106,7 @@ do_compile_ptest() {
> >>>  }
> >>>
> >>>  do_install_ptest() {
> >>> -       cp -a ${B}/tests ${D}${PTEST_PATH}/test
> >>> -       cp -a ${S}/tests/* ${D}${PTEST_PATH}/test
> >>> +       cp -R --no-dereference --preserve=mode,links -v ${B}/tests
> ${D}${PTEST_PATH}/test
> >>> +       cp -R --no-dereference --preserve=mode,links -v ${S}/tests/*
> ${D}${PTEST_PATH}/test
> >>>         sed -e 's!../e2fsck/e2fsck!e2fsck!g' -i
> ${D}${PTEST_PATH}/test/*/expect*
> >>>  }
> >>> diff --git a/meta/recipes-extended/mdadm/mdadm_4.0.bb
> b/meta/recipes-extended/mdadm/mdadm_4.0.bb
> >>> index 98a10a8b15..506b0bc315 100644
> >>> --- a/meta/recipes-extended/mdadm/mdadm_4.0.bb
> >>> +++ b/meta/recipes-extended/mdadm/mdadm_4.0.bb
> >>> @@ -55,7 +55,7 @@ do_compile_ptest() {
> >>>  }
> >>>
> >>>  do_install_ptest() {
> >>> -       cp -a ${S}/tests ${D}${PTEST_PATH}/tests
> >>> +       cp -R --no-dereference --preserve=mode,links -v ${S}/tests
> ${D}${PTEST_PATH}/tests
> >>>         cp ${S}/test ${D}${PTEST_PATH}
> >>>         sed -e 's!sleep 0.*!sleep 1!g; s!/var/tmp!/!g' -i
> ${D}${PTEST_PATH}/test
> >>>         ln -s ${base_sbindir}/mdadm ${D}${PTEST_PATH}/mdadm
> >>> --
> >>> 2.13.0
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>

--f403045db88000f5b70550c1330a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I cannot find the exact message in MLs, but this combinati=
on of parameters was suggested by someone and approved by others back in 20=
15, when I did this change and similar in other layers like:<div><a href=3D=
"https://patchwork.openembedded.org/patch/116525/">https://patchwork.openem=
bedded.org/patch/116525/</a><br></div><div><br></div><div>So I&#39;m just u=
sing the same everywhere.</div><div><br></div><div>But I&#39;m open to chan=
ge it to some other form if there are technical reasons to do so (other tha=
n personal preference).</div></div><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">On Tue, May 30, 2017 at 6:30 PM, Andre McCurdy <span dir=
=3D"ltr">&lt;<a href=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armcc=
urdy@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><spa=
n class=3D"">On Tue, May 30, 2017 at 8:41 AM, Mark Hatle &lt;<a href=3D"mai=
lto:mark.hatle@windriver.com">mark.hatle@windriver.com</a>&gt; wrote:<br>
&gt; On 5/30/17 9:45 AM, Andre McCurdy wrote:<br>
&gt;&gt; On Tue, May 30, 2017 at 1:08 AM, Martin Jansa &lt;<a href=3D"mailt=
o:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt; * Using &quot;cp -a&quot; leaks UID of user running the builds=
, causing<br>
&gt;&gt;&gt;=C2=A0 =C2=A0many QA warnings.<br>
&gt;&gt;&gt; * See this thread for details:<br>
&gt;&gt;&gt;=C2=A0 =C2=A0<a href=3D"http://lists.openembedded.org/pipermail=
/openembedded-core/2015-November/112904.html" rel=3D"noreferrer" target=3D"=
_blank">http://lists.openembedded.org/<wbr>pipermail/openembedded-core/<wbr=
>2015-November/112904.html</a><br>
&gt;&gt;<br>
&gt;&gt; Using &quot;cp -av --no-preserve=3Downership&quot; is a slightly c=
leaner solution.<br>
&gt;<br>
&gt; I personally prefer Martin&#39;s version since &#39;-a&#39; is not sup=
ported everywhere.<br>
&gt; (Unless you using gnu cp, which 99% of the Linux world uses.. but non-=
Linux<br>
&gt; systems rarely do.)<br>
<br>
</span>Which versions of cp do you know of that support<br>
&quot;--preserve=3Dmode,links&quot; without supporting &quot;-a&quot; ?<br>
<br>
A quick google of manpages suggests that FreeBSD supports &quot;-a&quot; bu=
t not<br>
&quot;--preserve=3DXXX&quot;. OpenBSD doesn&#39;t seem to support either.<b=
r>
<br>
Which non-Linux host systems does OE support?<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; --Mark<br>
&gt;<br>
&gt;&gt;&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa=
@gmail.com">Martin.Jansa@gmail.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 meta/recipes-core/coreutils/<a href=3D"http://coreutils_=
8.27.bb" rel=3D"noreferrer" target=3D"_blank">co<wbr>reutils_8.27.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;&gt;&gt;=C2=A0 meta/recipes-devtools/<wbr>e2fsprogs/<a href=3D"http://e=
2fsprogs_1.43.4.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.43.4.b=
b</a> | 4 ++--<br>
&gt;&gt;&gt;=C2=A0 meta/recipes-extended/mdadm/<a href=3D"http://mdadm_4.0.=
bb" rel=3D"noreferrer" target=3D"_blank">md<wbr>adm_4.0.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
&gt;&gt;&gt;=C2=A0 3 files changed, 4 insertions(+), 4 deletions(-)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/meta/recipes-core/coreutils/<a href=3D"http://cor=
eutils_8.27.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>coreutils_8.27.bb=
</a> b/meta/recipes-core/coreutils/<a href=3D"http://coreutils_8.27.bb" rel=
=3D"noreferrer" target=3D"_blank"><wbr>coreutils_8.27.bb</a><br>
&gt;&gt;&gt; index 667e0af560..ea8740a2d1 100644<br>
&gt;&gt;&gt; --- a/meta/recipes-core/coreutils/<a href=3D"http://coreutils_=
8.27.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>coreutils_8.27.bb</a><br=
>
&gt;&gt;&gt; +++ b/meta/recipes-core/coreutils/<a href=3D"http://coreutils_=
8.27.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>coreutils_8.27.bb</a><br=
>
&gt;&gt;&gt; @@ -99,7 +99,7 @@ do_install_append() {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -t ${D}/${mandir}/man=
1 ${S}/man/*.1<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# prebuilt man pages don&#39;=
t do a separate man page for [ vs test.<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# see comment above r.e. sed =
and update-alternatives<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a ${D}${mandir}/man1/test.1 ${=
D}${mandir}/man1/lbracket.1.<wbr>${BPN}<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -R --no-dereference --preserve=
=3Dmode,links -v ${D}${mandir}/man1/test.1 ${D}${mandir}/man1/lbracket.1.<w=
br>${BPN}<br>
&gt;&gt;&gt;=C2=A0 }<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 inherit update-alternatives<br>
&gt;&gt;&gt; diff --git a/meta/recipes-devtools/<wbr>e2fsprogs/<a href=3D"h=
ttp://e2fsprogs_1.43.4.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1=
.43.4.bb</a> b/meta/recipes-devtools/<wbr>e2fsprogs/<a href=3D"http://e2fsp=
rogs_1.43.4.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.43.4.bb</a=
><br>
&gt;&gt;&gt; index 5216c7027c..7c8809a41e 100644<br>
&gt;&gt;&gt; --- a/meta/recipes-devtools/<wbr>e2fsprogs/<a href=3D"http://e=
2fsprogs_1.43.4.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.43.4.b=
b</a><br>
&gt;&gt;&gt; +++ b/meta/recipes-devtools/<wbr>e2fsprogs/<a href=3D"http://e=
2fsprogs_1.43.4.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.43.4.b=
b</a><br>
&gt;&gt;&gt; @@ -106,7 +106,7 @@ do_compile_ptest() {<br>
&gt;&gt;&gt;=C2=A0 }<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 do_install_ptest() {<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a ${B}/tests ${D}${PTEST_PATH}=
/test<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a ${S}/tests/* ${D}${PTEST_PAT=
H}/test<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -R --no-dereference --preserve=
=3Dmode,links -v ${B}/tests ${D}${PTEST_PATH}/test<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -R --no-dereference --preserve=
=3Dmode,links -v ${S}/tests/* ${D}${PTEST_PATH}/test<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &#39;s!../e2fsck/e2fsc=
k!e2fsck!g&#39; -i ${D}${PTEST_PATH}/test/*/<wbr>expect*<br>
&gt;&gt;&gt;=C2=A0 }<br>
&gt;&gt;&gt; diff --git a/meta/recipes-extended/mdadm/<a href=3D"http://mda=
dm_4.0.bb" rel=3D"noreferrer" target=3D"_blank"><wbr>mdadm_4.0.bb</a> b/met=
a/recipes-extended/mdadm/<a href=3D"http://mdadm_4.0.bb" rel=3D"noreferrer"=
 target=3D"_blank"><wbr>mdadm_4.0.bb</a><br>
&gt;&gt;&gt; index 98a10a8b15..506b0bc315 100644<br>
&gt;&gt;&gt; --- a/meta/recipes-extended/mdadm/<a href=3D"http://mdadm_4.0.=
bb" rel=3D"noreferrer" target=3D"_blank"><wbr>mdadm_4.0.bb</a><br>
&gt;&gt;&gt; +++ b/meta/recipes-extended/mdadm/<a href=3D"http://mdadm_4.0.=
bb" rel=3D"noreferrer" target=3D"_blank"><wbr>mdadm_4.0.bb</a><br>
&gt;&gt;&gt; @@ -55,7 +55,7 @@ do_compile_ptest() {<br>
&gt;&gt;&gt;=C2=A0 }<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 do_install_ptest() {<br>
&gt;&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a ${S}/tests ${D}${PTEST_PATH}=
/tests<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -R --no-dereference --preserve=
=3Dmode,links -v ${S}/tests ${D}${PTEST_PATH}/tests<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${S}/test ${D}${PTEST_PATH=
}<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &#39;s!sleep 0.*!sleep=
 1!g; s!/var/tmp!/!g&#39; -i ${D}${PTEST_PATH}/test<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ln -s ${base_sbindir}/mdadm $=
{D}${PTEST_PATH}/mdadm<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; 2.13.0<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Op=
enembedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/open=
embedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedd=
ed.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;<br>
</div></div></blockquote></div><br></div>

--f403045db88000f5b70550c1330a--
