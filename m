Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6C98078685
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 11:07:59 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id u62so2043404ita.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Dec 2017 03:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lRroVeZidQGIND3qlGuv8uprQbwd6Gu9DmHLainSfWE=;
	b=x4/UEpgkQL7SeEh598idPsRkzj40Snv9YrzKZQutZlj4CiPaptafAyiJiXPDppvKMu
	VF4uCa3+w8YQcdN0gw3mrWqvyNm03TVYwAHrQxrejSinLX1DYxF6DU+8auVPW3/eXhGJ
	5PKVrxtx+JorTcoh5znxg7aYaHPsdLbzphxMBeIhsDDx3/olSj/FSgupFDYcOvr/baqp
	ESVsa0L7HJfbugaVzx1NKIYaygET5N7AcQBvTiqooKa7F7k53CAAfQcYD4xoDSxl6ne7
	B+6zo5/x2ZXlFTto9Y7GC8nGANzWbJwKfwmg+tZ0NFnZwr0qKbvmlXlCp54X+Otz0Yql
	fekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lRroVeZidQGIND3qlGuv8uprQbwd6Gu9DmHLainSfWE=;
	b=JgCjpQBJJT+qwUuxG3QgauIZvIP29ZcFtMJ7UGlA7GkUZQujeFYU8DH7XBKzs10wyH
	ttvLowO0tK0WA2N7ZdbQPgpZpZXn6fYKW5rVNFJ3zAczUPhanFgPdeYhUXec5c1ALq4s
	qlpXi3sbzF/ZG5fVV7ONXF9re16eGdBg8CUdmrsPJbCPw00RWiYBvukO8Ic9T3Zu6Oe3
	3lDkSL5WVrDBnwePdWyWB1aW5M7428X9BDizXUmYWdxCdc2U7OZoAd5uQf9jEDY9/cMU
	UVS6/8IpkeTTo07HYkZPIhdI3T8UsNwuhMuciNN8jRUYI6MANds5Ygh0nXl2iZRtl6ip
	7+xw==
X-Gm-Message-State: AKGB3mITjQ1MZdiIFG/vhPw+hLz+2bwhzmDkHcwV60YNZ1TutD69p42/
	GQ5VNI1SJdLkWFeQIodlXJnsDVFVtJQRIBhD/n3HTA==
X-Google-Smtp-Source: AGs4zMYkR00td5A4aqg9tazPkeetaCRTF2sSLsPzq8Igwwsz+MBKZfg9y1g5RVW/pE1Xc2ioKtKPk5fc7bp6Ihgye7E=
X-Received: by 10.36.120.11 with SMTP id p11mr1345278itc.10.1512126480635;
	Fri, 01 Dec 2017 03:08:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.171.134 with HTTP; Fri, 1 Dec 2017 03:07:40 -0800 (PST)
In-Reply-To: <CAJ86T=VX0up-q-CSOafSno14+frTM3NxzwngffCkggMOTd6vCA@mail.gmail.com>
References: <1512073240-3830-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1soVy677jtDR5GNF-x7MdxVM7H=QhONKiZrgw9GgZp74=g@mail.gmail.com>
	<CAJ86T=VX0up-q-CSOafSno14+frTM3NxzwngffCkggMOTd6vCA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Dec 2017 11:07:40 +0000
Message-ID: <CAJTo0Lb4VsORo9110=Q8JSgQytcfoHpsRRSTWiJJ_BiPfYxvvA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: prevent errors if do_install is run more than once
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
X-List-Received-Date: Fri, 01 Dec 2017 11:07:59 -0000
Content-Type: multipart/alternative; boundary="001a114a9b5ebbefa7055f4561c6"

--001a114a9b5ebbefa7055f4561c6
Content-Type: text/plain; charset="UTF-8"

Extend lnr to have a --force option?

Ross

On 30 November 2017 at 22:59, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Thu, Nov 30, 2017 at 1:51 PM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Thu, Nov 30, 2017 at 12:20 PM, Andre McCurdy <armccurdy@gmail.com>
> wrote:
> >> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> >> ---
> >>  meta/recipes-core/musl/musl_git.bb | 3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta/recipes-core/musl/musl_git.bb
> b/meta/recipes-core/musl/musl_git.bb
> >> index 932c9a2..db26b4f 100644
> >> --- a/meta/recipes-core/musl/musl_git.bb
> >> +++ b/meta/recipes-core/musl/musl_git.bb
> >> @@ -57,10 +57,11 @@ do_install() {
> >>         oe_runmake install DESTDIR='${D}'
> >>
> >>         install -d ${D}${bindir}
> >> +       rm -f ${D}${bindir}/ldd
> >
> > Doesn't lnr take care of removing old file ?
>
> Apparently not:
>
>   $ touch foo
>   $ lnr xxx foo
>   Traceback (most recent call last):
>     File "/.../openembedded-core/scripts/lnr", line 21, in <module>
>       os.symlink(target, linkname)
>   FileExistsError: [Errno 17] File exists: 'xxx' -> 'foo'
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114a9b5ebbefa7055f4561c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Extend lnr to have a --force option?</div><div><br></=
div><div>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail=
_quote">On 30 November 2017 at 22:59, Andre McCurdy <span dir=3D"ltr">&lt;<=
a href=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, Nov 30, 20=
17 at 1:51 PM, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt; wrote:<br>
<span class=3D"">&gt; On Thu, Nov 30, 2017 at 12:20 PM, Andre McCurdy &lt;<=
a href=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br=
>
&gt;&gt; Signed-off-by: Andre McCurdy &lt;<a href=3D"mailto:armccurdy@gmail=
.com">armccurdy@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D=
"noreferrer" target=3D"_blank">musl_<wbr>git.bb</a> | 3 ++-<br>
&gt;&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-core/musl/<a href=3D"http://musl_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">musl_<wbr>git.bb</a> b/meta/recipes-c=
ore/musl/<a href=3D"http://musl_git.bb" rel=3D"noreferrer" target=3D"_blank=
">musl_<wbr>git.bb</a><br>
&gt;&gt; index 932c9a2..db26b4f 100644<br>
&gt;&gt; --- a/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D=
"noreferrer" target=3D"_blank">musl_<wbr>git.bb</a><br>
&gt;&gt; +++ b/meta/recipes-core/musl/<a href=3D"http://musl_git.bb" rel=3D=
"noreferrer" target=3D"_blank">musl_<wbr>git.bb</a><br>
&gt;&gt; @@ -57,10 +57,11 @@ do_install() {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake install DESTDIR=3D&#39=
;${D}&#39;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir}<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f ${D}${bindir}/ldd<br>
&gt;<br>
</span>&gt; Doesn&#39;t lnr take care of removing old file ?<br>
<br>
Apparently not:<br>
<br>
=C2=A0 $ touch foo<br>
=C2=A0 $ lnr xxx foo<br>
=C2=A0 Traceback (most recent call last):<br>
=C2=A0 =C2=A0 File &quot;/.../openembedded-core/<wbr>scripts/lnr&quot;, lin=
e 21, in &lt;module&gt;<br>
=C2=A0 =C2=A0 =C2=A0 os.symlink(target, linkname)<br>
=C2=A0 FileExistsError: [Errno 17] File exists: &#39;xxx&#39; -&gt; &#39;fo=
o&#39;<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a114a9b5ebbefa7055f4561c6--
