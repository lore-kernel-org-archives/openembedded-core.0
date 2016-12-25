Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2566071B5F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Dec 2016 03:33:03 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id h201so21569069qke.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Dec 2016 19:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BjOBZ5amNxTLhpJvdkCaDIvJNny8d01DflubsZhji1g=;
	b=t/YT1BMSB02LXFUFAYHES/8fayjl6965N1UNIqK+fmLIx+PyE74YxwIlPApEPDAAmO
	cmYeU0I631p0PMpKE3N77IYxU64UL2weJAFBfEmEFlK2y8IryAYe96+jUqVIKeno22yZ
	d1PhS7dja6ooOEI9BpiCrh+y6GeVN1lVtdxhwNJkLrXkpL7rn8esPjo+Ydds4Wa5866Y
	xr7PVjnDzMRgAMJ+GkXxkjsuC/2fxZJdPmKgsICTLYCXyN1WO49SKsJa6AVlQugyQNMu
	8CPfUJHE0+LnC64G3CKq1VVGph/2lo1/RF8sgtFG8m+Ax4JkKCQ7EAkqdFJIGXII9e5C
	8A7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BjOBZ5amNxTLhpJvdkCaDIvJNny8d01DflubsZhji1g=;
	b=eDDClgYiy4ZwlWKy/XOd+GmIDXm+g1dVGQjkQcjcaD03qqB68DLTfdmpeX5EAb/wkT
	HljShOxA+QaCigonSc4b5wj2HOemDCXUOf9vN4XbReFsXm0liiy/wtA5FAE6qcFB7Cnv
	M/EO98eZQa0/XuzqJ9IyspqfJ4j4HYjoNLLyKptDotI2dXZIVoWRO7YJl06RO6N4kkNl
	dOV9iVUUlaASb+HoGZrGwM/GolEvO0lNIuGGyoTOY8xmdM3Z3hlaNpDrOgLsYrb7E31r
	048+K0TgufOf1tNDiVThEkUQclTRfHOY9KAZlQzKIEEfQtn1+gtOsTeSe6+0UcdsAME1
	fkZQ==
X-Gm-Message-State: AIkVDXKVDbsVP4ft5D+GU1zre/s2T+JOZWnwo+12p7BoeHRPXENXB3/opqrGgMsCdXsabfqNXjJfveOKj3TWKQ==
X-Received: by 10.55.77.134 with SMTP id a128mr24684073qkb.157.1482636784923; 
	Sat, 24 Dec 2016 19:33:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.129.227 with HTTP; Sat, 24 Dec 2016 19:33:04 -0800 (PST)
In-Reply-To: <CAHiDW_E+G1JAEODj3w6Xda4CJkjHGOnBB0h035p093ZGP7WTqA@mail.gmail.com>
References: <cover.1482415485.git.bruce.ashfield@windriver.com>
	<81c86de3aa3411f52e74b41b324c0713b347f245.1482415485.git.bruce.ashfield@windriver.com>
	<CAHiDW_E+G1JAEODj3w6Xda4CJkjHGOnBB0h035p093ZGP7WTqA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 24 Dec 2016 22:33:04 -0500
Message-ID: <CADkTA4O2Hm9yLxNk8wsvi-v0pHWrTqmnrqj0CR6xj0bsuD8hng@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] linux-libc-headers: introduce 4.9 headers
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
X-List-Received-Date: Sun, 25 Dec 2016 03:33:06 -0000
Content-Type: multipart/alternative; boundary=001a114884b2e578e0054473462c

--001a114884b2e578e0054473462c
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 23, 2016 at 5:23 AM, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> On 22 December 2016 at 16:49, Bruce Ashfield <bruce.ashfield@windriver.com>
> wrote:
> >
> > Bumping the linux-libc-headers to the 4.9 kernel variant. Since 4.9
> > will be a LTSI kernel, and there will be an associated linux-yocto
> > it is worth moving to these headers sooner rather than later.
> >
> > This commit also drops the 4.8 headers and sets 4.9 to be the default.
>
> The autobuilder run (ross/mut 1dc1894e05) with this had a couple of issues:
>
> *** ppp fails to build on musl: https://bugzilla.yoctoproject.
> org/show_bug.cgi?id=10853
>


Thanks for the update. Not knowing much about musl, others have jumped in
on these
in the past. I'll loop around and have a look at it if one of the musl
users doesn't have an
idea as to what is up with ppp.


>
>
> *** ncurses fails in several builds, all gnu/stubs.h related:
> ncurses was also upgraded in this AB run (CCing Huang Qiyu) but the
> failures seem more like libc related...
>
> x32:
> | nightly-x32/build/build/tmp/sysroots/qemux86-64/usr/include/gnu/stubs.h:10:27:
> fatal error: gnu/stubs-64.h: No such file or directory
> |  # include <gnu/stubs-64.h>
>
> arm:
> | nightly-arm/build/build/tmp/sysroots/beaglebone/usr/include/gnu/stubs.h:7:29:
> fatal error: gnu/stubs-soft.h: No such file or directory
> |  # include <gnu/stubs-soft.h>
>
> multilib:
> | nightly-multilib/build/build/tmp/sysroots/qemumips64/usr/include/gnu/stubs.h:35:33:
> fatal error: gnu/stubs-n64_hard.h: No such file or directory
> |  # include <gnu/stubs-n64_hard.h>
>
> The full build log links can be found in "nightly 1121" section here:
> https://wiki.yoctoproject.org/wiki/BuildLog#nightly_1121_-_r
> oss.2Fmut_1dc1894e05ef0f3aeeefa61ed89613f17bba2e83
>
>
I'll have a look at these when I'm back in the office in January. x32 isn't
something that I build, but I did build sato, so this is something specific
to that config. Should be easy enough to reproduce on my builder.

Cheers,

Bruce


>
> Cheers,
>   Jussi
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114884b2e578e0054473462c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Dec 23, 2016 at 5:23 AM, Jussi Kukkonen <span dir=3D"ltr">&lt;<=
a href=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen=
@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><span>On 22 December 2016 at 16:49, Bruce Ashfield &lt;<a href=3D"=
mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@windr=
iver.com</a>&gt; wrote:<br>&gt;<br>&gt; Bumping the linux-libc-headers to t=
he 4.9 kernel variant. Since 4.9<br>&gt; will be a LTSI kernel, and there w=
ill be an associated linux-yocto<br>&gt; it is worth moving to these header=
s sooner rather than later.<br>&gt;<br>&gt; This commit also drops the 4.8 =
headers and sets 4.9 to be the default.<br><br></span>The autobuilder run (=
ross/mut 1dc1894e05) with this had a couple of issues:<br><br>*** ppp fails=
 to build on musl: <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cg=
i?id=3D10853" target=3D"_blank">https://bugzilla.yoctoproject.<wbr>org/show=
_bug.cgi?id=3D10853</a></div></blockquote><div><br></div><div><br></div><di=
v>Thanks for the update. Not knowing much about musl, others have jumped in=
 on these</div><div>in the past. I&#39;ll loop around and have a look at it=
 if one of the musl users doesn&#39;t have an</div><div>idea as to what is =
up with ppp.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><br><br>*** ncurses fails in several builds, all gnu/stubs.h relat=
ed:<br>ncurses was also upgraded in this AB run (CCing Huang Qiyu) but the =
failures seem more like libc related...<br><br>x32:<br>| nightly-x32/build/=
build/tmp/sy<wbr>sroots/qemux86-64/usr/include/<wbr>gnu/stubs.h:10:27: fata=
l error: gnu/stubs-64.h: No such file or directory<br>| =C2=A0# include &lt=
;gnu/stubs-64.h&gt;<br><br>arm:<br>| nightly-arm/build/build/tmp/sy<wbr>sro=
ots/beaglebone/usr/include/<wbr>gnu/stubs.h:7:29: fatal error: gnu/stubs-so=
ft.h: No such file or directory<br>| =C2=A0# include &lt;gnu/stubs-soft.h&g=
t;<br><br>multilib:<br>| nightly-multilib/build/build/t<wbr>mp/sysroots/qem=
umips64/usr/inc<wbr>lude/gnu/stubs.h:35:33: fatal error: gnu/stubs-n64_hard=
.h: No such file or directory<br>| =C2=A0# include &lt;gnu/stubs-n64_hard.h=
&gt;<br><br>The full build log links can be found in &quot;nightly 1121&quo=
t; section here:<br><a href=3D"https://wiki.yoctoproject.org/wiki/BuildLog#=
nightly_1121_-_ross.2Fmut_1dc1894e05ef0f3aeeefa61ed89613f17bba2e83" target=
=3D"_blank">https://wiki.yoctoproject.org/<wbr>wiki/BuildLog#nightly_1121_-=
_r<wbr>oss.2Fmut_1dc1894e05ef0f3aeeef<wbr>a61ed89613f17bba2e83</a><br><br><=
/div></blockquote><div><br></div><div>I&#39;ll have a look at these when I&=
#39;m back in the office in January. x32 isn&#39;t something that I build, =
but I did build sato, so this is something specific to that config. Should =
be easy enough to reproduce on my builder.</div><div><br></div><div>Cheers,=
</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div dir=3D"ltr"><br>Cheers,<br>=C2=A0 Jussi</div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"m_-2806279877652530839gmail_signature" data-smartmail=3D"gmail_signat=
ure">&quot;Thou shalt not follow the NULL pointer, for chaos and madness aw=
ait thee at its end&quot;</div>
</div></div>

--001a114884b2e578e0054473462c--
