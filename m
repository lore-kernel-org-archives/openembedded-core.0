Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mail.openembedded.org (Postfix) with ESMTP id C76436018C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 13:44:40 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id bg3so14578107obb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 06:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=6qPvjH3S1a4UanuaC5CijPTVyazif/TQCwC+/2kW9UU=;
	b=c4ho08slkMsllO97c/qMGgVgFw5s7/Fk37mooqJKTLCcy6NHGibQO/TMe3YLbAbNGu
	Is0YtFnlNE0hphcTjG9ptahhraySlUdKPaPXNQW51m1KMh3CT8eJ0jLTGSfgPubt/ID3
	A1gLmFbbYWpyu3gKZ6msuHdOUZhW8eN7nQLqo+hsRbWPLhqFbtC/QMqEjLI7pHuFq/kH
	Ub59hXmo8av9KyJdgaPrMynnfDiMDDxApQB4jKqG+R0549ZX5r5NzcE11kc7H6I4jGC/
	CfhmfLDWf2Sh0LpWuDli+Wph50WN2hP8zqDnrujH3v2wBmcgsFxBhiMLgfPQEgy4RlMk
	Dc5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=6qPvjH3S1a4UanuaC5CijPTVyazif/TQCwC+/2kW9UU=;
	b=gqZlbNA5nZKSGEJ9iKkjJHU++tdRP/vz+kgO24CEMO40f1P61CMZ3xFu5rtQNt0Mvx
	FzrBvbG8mQP03RKeZ4RDwGNlx3+gsTRG7x/ZonMyXKuyIEoPmh15rYN5/75R1bdC2HXn
	C/sdet+U8Kj7n48s0QI8ez/vpRPb7+GwmACP+4P0WBhSM/ChuUWNfswU7T5/8B59ZDx8
	CMa61bXs6fXE4vCcQvJMA2/lxH/Zb+xplnLcPK5xLEK9btrUkCDuLL7jU66hTpvPSRw1
	WpQywnrzn7FUMldhpVO5UucUB7sHJE4D6Pjg1l12Wzpjdm3jCENeFwBiS5cxesRA98hV
	aicw==
X-Gm-Message-State: AOPr4FVdCKoDyNK0qRX7BciWVpVHHsYkT+9AGSEBZSt3I3nsHZKcKllvYQgl418rid7FfELabBnILWC1y2puEg==
MIME-Version: 1.0
X-Received: by 10.60.118.73 with SMTP id kk9mr1161664oeb.64.1461073481362;
	Tue, 19 Apr 2016 06:44:41 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Tue, 19 Apr 2016 06:44:41 -0700 (PDT)
In-Reply-To: <1461070645-22857-1-git-send-email-ross.burton@intel.com>
References: <1461070645-22857-1-git-send-email-ross.burton@intel.com>
Date: Tue, 19 Apr 2016 09:44:41 -0400
Message-ID: <CADkTA4NkFmfxOznuWpJkK7unkLOckwxswtmVWgjaX20mfUNkVA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: pass DESTDIR in EXTRA_OEMAKE
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
X-List-Received-Date: Tue, 19 Apr 2016 13:44:42 -0000
Content-Type: multipart/alternative; boundary=047d7b41cbccd8f3220530d6ad01

--047d7b41cbccd8f3220530d6ad01
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 19, 2016 at 8:57 AM, Ross Burton <ross.burton@intel.com> wrote:

> Instead of passing DESTDIR just in the make install invocation, pass it in
> EXTRA_OEMAKE.  This appears to stop perf from rebuilding at instal time
> for me,
> which appears to be the trigger for the random build failure.
>

This also passed my local build tests, but then again, in two weeks of
trying (off and
on), I've never reproduced the race condition .. so I can't comment if it
actually fixes
it or not.

Having a the destdir be consistent for all phases makes sense though, so I
see no
problem with the change as-is.

I'll suspend my nasty perf Makefile hacks to serialize parts of the build
to see if this
holds as a permanent fix for the problem.

Tested-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Bruce


>
> [ YOCTO #9182 ]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-kernel/perf/perf.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/
> perf.bb
> index c43f39c..3d6ffb3 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -88,6 +88,7 @@ EXTRA_OEMAKE = '\
>  '
>
>  EXTRA_OEMAKE += "\
> +    'DESTDIR=${D}' \
>      'prefix=${prefix}' \
>      'bindir=${bindir}' \
>      'sharedir=${datadir}' \
> @@ -110,7 +111,7 @@ do_compile() {
>  do_install() {
>         # Linux kernel build system is expected to do the right thing
>         unset CFLAGS
> -       oe_runmake DESTDIR=${D} install
> +       oe_runmake install
>         # we are checking for this make target to be compatible with older
> perf versions
>         if [ "${@perf_feature_enabled('perf-scripting', 1, 0, d)}" = "1" ]
> && grep -q install-python_ext ${S}/tools/perf/Makefile*; then
>                 oe_runmake DESTDIR=${D} install-python_ext
> --
> 2.8.0.rc3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--047d7b41cbccd8f3220530d6ad01
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, Apr 19, 2016 at 8:57 AM, Ross Burton <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Instead of passin=
g DESTDIR just in the make install invocation, pass it in<br>
EXTRA_OEMAKE.=C2=A0 This appears to stop perf from rebuilding at instal tim=
e for me,<br>
which appears to be the trigger for the random build failure.<br></blockquo=
te><div><br></div><div>This also passed my local build tests, but then agai=
n, in two weeks of trying (off and</div><div>on), I&#39;ve never reproduced=
 the race condition .. so I can&#39;t comment if it actually fixes</div><di=
v>it or not.</div><div><br></div><div>Having a the destdir be consistent fo=
r all phases makes sense though, so I see no</div><div>problem with the cha=
nge as-is.</div><div><br></div><div>I&#39;ll suspend my nasty perf Makefile=
 hacks to serialize parts of the build to see if this</div><div>holds as a =
permanent fix for the problem.</div><div><br></div><div>Tested-by: Bruce As=
hfield &lt;<a href=3D"mailto:bruce.ashfield@windriver.com">bruce.ashfield@w=
indriver.com</a>&gt;</div><div><br></div><div>Bruce</div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">
<br>
[ YOCTO #9182 ]<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a> | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"nor=
eferrer" target=3D"_blank">perf.bb</a> b/meta/recipes-kernel/perf/<a href=
=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">perf.bb</a><br>
index c43f39c..3d6ffb3 100644<br>
--- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
+++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
@@ -88,6 +88,7 @@ EXTRA_OEMAKE =3D &#39;\<br>
=C2=A0&#39;<br>
<br>
=C2=A0EXTRA_OEMAKE +=3D &quot;\<br>
+=C2=A0 =C2=A0 &#39;DESTDIR=3D${D}&#39; \<br>
=C2=A0 =C2=A0 =C2=A0&#39;prefix=3D${prefix}&#39; \<br>
=C2=A0 =C2=A0 =C2=A0&#39;bindir=3D${bindir}&#39; \<br>
=C2=A0 =C2=A0 =C2=A0&#39;sharedir=3D${datadir}&#39; \<br>
@@ -110,7 +111,7 @@ do_compile() {<br>
=C2=A0do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Linux kernel build system is expected to do t=
he right thing<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unset CFLAGS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake DESTDIR=3D${D} install<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake install<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # we are checking for this make target to be co=
mpatible with older perf versions<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${@perf_feature_enabled(&#39;perf-sc=
ripting&#39;, 1, 0, d)}&quot; =3D &quot;1&quot; ] &amp;&amp; grep -q instal=
l-python_ext ${S}/tools/perf/Makefile*; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake DESTDIR=
=3D${D} install-python_ext<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.8.0.rc3<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--047d7b41cbccd8f3220530d6ad01--
