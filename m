Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id AFE8D60C79
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2020 13:57:27 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id v28so2243714edw.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2020 05:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DyYbIFW4hSh0ix752IzxodhO//jB8kQi2EV5gHzhgX4=;
	b=kxMLsT4uxSV9QSHeKLTq6WMKr1Px8gHrEObZLU863RxCdyZQXk4jQW+a3sA1FcmmNl
	0WWiBH8hpxmMi6nn/IyR7C8LJQyalXI/AMtt3i/pGaxex4Gx4+A6oAY8WB+ad2svlzt6
	U/ZuqAQBbAEgIKFaAORIG9CEU+ETqspft8BW7CwpjgzflIJaLkT0b4hYyRKgwoufebgG
	Dmfw5yB92pv3+/B7uJpFjuC5sYZS5eBJJ/SWHNIwGT6AR8KdNc9r4lpnA80xJFsChWVE
	gawsWB1PwVAV9DjLSuWm6TusYzLoAs/qLIC908b81jz2kEggp7HZLdPVCYaSApyKKTcQ
	sOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DyYbIFW4hSh0ix752IzxodhO//jB8kQi2EV5gHzhgX4=;
	b=ax2uQladfq3JcYX9ZE3ByXjPVxsfZROBR65qjKTZA1TtEQcpzsw1ZdRXzMInyBwD6+
	E/MaHKkjlmXDISns/nF4X7nvhJ7wSsU4Z9qh8o+gZGp3XUgbO8oDjfYtiP7sHDmcGNhJ
	qj8XguQ3J2ggPeiRY/grdEEDBhXM+jrBS+i3lCimYSVl9HesTIb9M/LyIMFsSrHJXS1c
	aURoojbjlAhvS2MYsfyJ9Py2oNK6wUz+fvOXOdSUaRtCgoRY0AKacSFA+3Y9QoKWiN1V
	yHMVgkMPeCyX8HSh/eed2kxGXWmLpfhI7hsszn3sywm7APP6CSFJSDizWRidxr4WSC3a
	hySw==
X-Gm-Message-State: APjAAAVzjvJRGlJLTgfVbXC5//+cdVL+GuchGGo7Y0iPklMwUP6EC/XC
	TR+JOXAMPDcvptyfkqNq7zzg2GnXwTSFtStMdm4=
X-Google-Smtp-Source: APXvYqyqPGQuScFIMWbpLHu3N61l5O24gWexdgVTBnX8BHwxW/LaVtXZ5QFhPsehpeog2ZvyAMMeW54LBVItU7bfvzg=
X-Received: by 2002:a17:906:9413:: with SMTP id
	q19mr29766079ejx.172.1580911048314; 
	Wed, 05 Feb 2020 05:57:28 -0800 (PST)
MIME-Version: 1.0
References: <20200205024241.27828-1-Martin.Jansa@gmail.com>
	<20200205024241.27828-4-Martin.Jansa@gmail.com>
	<CADkTA4P-C8xPVcscM3DfUJ28KR19gcHW7s1X-dbU-5FN68+DaA@mail.gmail.com>
In-Reply-To: <CADkTA4P-C8xPVcscM3DfUJ28KR19gcHW7s1X-dbU-5FN68+DaA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 5 Feb 2020 14:57:17 +0100
Message-ID: <CA+chaQfTcJNTnEo-kexWvM0tyq_UN2nh0rvsFO9OiB4JvN=HAQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] kern-tools-native: use more common S value and oe_runmake
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
X-List-Received-Date: Wed, 05 Feb 2020 13:57:28 -0000
Content-Type: multipart/alternative; boundary="00000000000074d479059dd489c2"

--00000000000074d479059dd489c2
Content-Type: text/plain; charset="UTF-8"

OK, the patchdir cleanup won't be needed as you've already applied that
.patch file in the repo.

But I have forgot to update LIC_FILES_CHKSUM, which shouldn't have the
"git/" anymore as it's relative to ${S}.

LIC_FILES_CHKSUM =
"file://tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249624278c3e343e501"

Please adjust in your consolidated pull requests.

On Wed, Feb 5, 2020 at 3:54 AM Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> On Tue, Feb 4, 2020 at 9:42 PM Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  .../kern-tools/kern-tools-native_git.bb               | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> > index 8053483355..28080e510f 100644
> > --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> > +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> > @@ -11,16 +11,19 @@ PV = "0.2+git${SRCPV}"
> >  inherit native
> >
> >  SRC_URI = "git://git.yoctoproject.org/yocto-kernel-tools.git"
> > -S = "${WORKDIR}"
> > +S = "${WORKDIR}/git"
>
> While not common, this was on purpose.  This isn't something that is
> typically patched, it is something I queue and bump for release.
>
> So I'm ok with the cleanup, but I'll drop the patch tweaking part when
> I queue for test, since I'll have the patch already in the repo.
>
> Bruce
>
> >  UPSTREAM_CHECK_COMMITS = "1"
> >
> > +do_configure() {
> > +       :
> > +}
> > +
> >  do_compile() {
> >         :
> >  }
> >
> >  do_install() {
> > -       cd ${S}/git
> > -       make DESTDIR=${D}${bindir} install
> > +       oe_runmake DESTDIR=${D}${bindir} install
> >  }
> >
> > -SRC_URI +=
> "file://0001-merge_config.sh-pass-LD-variable-from-shell-environm.patch;patchdir=git"
> > +SRC_URI +=
> "file://0001-merge_config.sh-pass-LD-variable-from-shell-environm.patch"
> > --
> > 2.20.1
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--00000000000074d479059dd489c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OK, the patchdir cleanup won&#39;t be needed as you&#39;ve=
 already applied that .patch file in the repo.<div><br></div><div>But I hav=
e forgot to update LIC_FILES_CHKSUM, which shouldn&#39;t have the &quot;git=
/&quot; anymore as it&#39;s relative to ${S}.</div><div><br></div><div>LIC_=
FILES_CHKSUM =3D &quot;file://tools/kgit;beginline=3D5;endline=3D9;md5=3D9c=
30e971d435e249624278c3e343e501&quot;<br></div><div><br></div><div>Please ad=
just in your consolidated pull requests.</div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 5, 2020 at 3:54 A=
M Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashf=
ield@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Tue, Feb 4, 2020 at 9:42 PM Martin Jansa &lt;<a href=3D"ma=
ilto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&g=
t; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../kern-tools/<a href=3D"http://kern-tools-native_git.bb" rel=
=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 11 +++++++----<br>
&gt;=C2=A0 1 file changed, 7 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-too=
ls-native_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_gi=
t.bb</a> b/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-nati=
ve_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a=
><br>
&gt; index 8053483355..28080e510f 100644<br>
&gt; --- a/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-nati=
ve_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a=
><br>
&gt; +++ b/meta/recipes-kernel/kern-tools/<a href=3D"http://kern-tools-nati=
ve_git.bb" rel=3D"noreferrer" target=3D"_blank">kern-tools-native_git.bb</a=
><br>
&gt; @@ -11,16 +11,19 @@ PV =3D &quot;0.2+git${SRCPV}&quot;<br>
&gt;=C2=A0 inherit native<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/y=
octo-kernel-tools.git" rel=3D"noreferrer" target=3D"_blank">git.yoctoprojec=
t.org/yocto-kernel-tools.git</a>&quot;<br>
&gt; -S =3D &quot;${WORKDIR}&quot;<br>
&gt; +S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
While not common, this was on purpose.=C2=A0 This isn&#39;t something that =
is<br>
typically patched, it is something I queue and bump for release.<br>
<br>
So I&#39;m ok with the cleanup, but I&#39;ll drop the patch tweaking part w=
hen<br>
I queue for test, since I&#39;ll have the patch already in the repo.<br>
<br>
Bruce<br>
<br>
&gt;=C2=A0 UPSTREAM_CHECK_COMMITS =3D &quot;1&quot;<br>
&gt;<br>
&gt; +do_configure() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0:<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 do_compile() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 do_install() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}/git<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0make DESTDIR=3D${D}${bindir} install<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake DESTDIR=3D${D}${bindir} install=
<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -SRC_URI +=3D &quot;file://0001-merge_config.sh-pass-LD-variable-from-=
shell-environm.patch;patchdir=3Dgit&quot;<br>
&gt; +SRC_URI +=3D &quot;file://0001-merge_config.sh-pass-LD-variable-from-=
shell-environm.patch&quot;<br>
&gt; --<br>
&gt; 2.20.1<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--00000000000074d479059dd489c2--
