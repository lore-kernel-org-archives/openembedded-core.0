Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id B2F1776F8C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Apr 2016 21:53:57 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id f52so39324294qga.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Apr 2016 14:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=HYgUdFounvPU+tGYVypfNUb3vc7j6v5YIcyfov7B0T4=;
	b=SWVYcOHOCfXZuLN6s5C9/T3MTQlV1M7uv3UdMPS7BTbWjO779p78EAJ+iBp0J2F383
	MF6Dy0rvcW7ZwOzEFjUaH5dymRUZvwQMoaeJ1vquYuzj3vZ691o2TUxrKE8G5RYpjMFs
	7vpC8sKeRtSRegAkF+/ltEUAVVJ8XtnS+WEyBoNbKtFIqHs5XvON46PuSI8HTg03/Qov
	2s3rrJLHa+xmAiWsWyXaPx8ebbkq7TbTYbairJ6Q1Iyhf+yLRqu2AqOPLHhlu95DUEOq
	gEnWgU8nm+gvhU5Lg85Ps7XKET1cbvui607p7VS2YBJtT8HWqtu5N5sQIeSDCgfcz6Ho
	MTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=HYgUdFounvPU+tGYVypfNUb3vc7j6v5YIcyfov7B0T4=;
	b=k+wejxZqlqMRlLi0e2rrngCxNa9fSeWjU7UpUZCRs2IR9cZKFqeYMrmL24JPoZYkih
	gTUPhj3Iuuk7DvPv9uIR3MAGbT5SoaKe+GGVnEuwBu5ItiMIYZvwx61mAs3WQM1yS/az
	tSifGnXZPiCGa5OClNCXaeWyeJytRiQwsiHkCF8wpMRjvSh87EmOV9rOaSNPXSnpXcqn
	Ura5gYy6WjisB+G39Wfnu1c+e9gDcZJrRMmeU4LZjOVHu0lyWqiChSjmi7FtlHNeAYcm
	PzxH86b79NlQiWBpWsltYVK33Vo/9EPnmyL9v6PE7PHr7sSi4nt5XKiZFSQyS40jjM6b
	SZjQ==
X-Gm-Message-State: AD7BkJJIbDyS3WGlr0Qr5nsgFNcU8wgrd3/owAE9hmSLIzhEivsdlLLRxDizcOB+tfkDEOLYcpc5PSaAToaz+g==
MIME-Version: 1.0
X-Received: by 10.140.148.134 with SMTP id 128mr10419981qhu.98.1459720438513; 
	Sun, 03 Apr 2016 14:53:58 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Sun, 3 Apr 2016 14:53:57 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Sun, 3 Apr 2016 14:53:57 -0700 (PDT)
In-Reply-To: <1459719934.7348.141.camel@linuxfoundation.org>
References: <1459717038-10549-1-git-send-email-max.krummenacher@toradex.com>
	<1459719934.7348.141.camel@linuxfoundation.org>
Date: Sun, 3 Apr 2016 14:53:57 -0700
Message-ID: <CAMKF1sp_yzu2KnHvN_4R0+-_cfhp9i_J4t=-mNcj5nyif4dWJg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe][Patch] package.bbclass: fix host contamination warnings for source files
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
X-List-Received-Date: Sun, 03 Apr 2016 21:54:00 -0000
Content-Type: multipart/alternative; boundary=001a1136ff183585a4052f9ba660

--001a1136ff183585a4052f9ba660
Content-Type: text/plain; charset=UTF-8

On Apr 3, 2016 2:45 PM, "Richard Purdie" <richard.purdie@linuxfoundation.org>
wrote:
>
> On Sun, 2016-04-03 at 22:57 +0200, Max Krummenacher wrote:
> > Addresses https://bugzilla.yoctoproject.org/show_bug.cgi?id=8939
> >
> > Source files deployed with the *-dbg packages are owned by the user
> > running bitbake leading to warnings as the one below.
> >
> > WARNING: glibc-2.23-r0 do_package_qa: QA Issue: glibc: /glibc
> > -dbg/usr/src/debug/glibc/2.23-r0/git/include/resolv.h is owned by uid
> > 1000, which is the same as the user running bitbake. This may be due
> > to host contamination
> > glibc: /glibc-dbg/usr/src/debug/glibc/2.23-r0/git/include/monetary.h
> > is owned by uid 1000, which is the same as the user running bitbake.
> > This may be due to host contamination
> > glibc: /glibc-dbg/usr/src/debug/glibc/2.23-r0/git/include/locale.h is
> > owned by uid 1000, which is the same as the user running bitbake.
> > This may be due to host contamination
> > ...
> >
> > The files are copied as part of the do_package task.
> > The patch chowns all file in packages/usr/src after cpio copied them
> > into the
> > package directory.
> >
> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > ---
> >
> >
> >  meta/classes/package.bbclass | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/meta/classes/package.bbclass
> > b/meta/classes/package.bbclass
> > index bdbe96d..d9ef62c 100644
> > --- a/meta/classes/package.bbclass
> > +++ b/meta/classes/package.bbclass
> > @@ -362,6 +362,7 @@ def copydebugsources(debugsrcdir, d):
> >      # and copied to the destination here.
> >
> >      import stat
> > +    import subprocess
> >
> >      sourcefile = d.expand("${WORKDIR}/debugsources.list")
> >      if debugsrcdir and os.path.isfile(sourcefile):
> > @@ -410,6 +411,28 @@ def copydebugsources(debugsrcdir, d):
> >          if retval:
> >              bb.fatal("debugsrc symlink fixup failed with exit code
> > %s (cmd was %s)" % (retval, cmd))
> >
> > +        # cpio --no-preserve-owner does not create the destination
> > files with
> > +        # owner root even when run under pseudo, chown them
> > explicitely.
>
> How about passing --owner=0:0 to cpio?
>
> I'm a little worried about why I don't see this failure on my own local
> builds.

Can you dump the dbg rpm from poky and see if the flagged file is there ?
>
> We have a few cases where things sometimes seem to work out and
> sometimes don't and I'd love to get to the bottom of how to reproduce
> it and to understand why its different for different people.
>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a1136ff183585a4052f9ba660
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Apr 3, 2016 2:45 PM, &quot;Richard Purdie&quot; &lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt=
; wrote:<br>
&gt;<br>
&gt; On Sun, 2016-04-03 at 22:57 +0200, Max Krummenacher wrote:<br>
&gt; &gt; Addresses <a href=3D"https://bugzilla.yoctoproject.org/show_bug.c=
gi?id=3D8939">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8939</a><=
br>
&gt; &gt;<br>
&gt; &gt; Source files deployed with the *-dbg packages are owned by the us=
er<br>
&gt; &gt; running bitbake leading to warnings as the one below.<br>
&gt; &gt;<br>
&gt; &gt; WARNING: glibc-2.23-r0 do_package_qa: QA Issue: glibc: /glibc<br>
&gt; &gt; -dbg/usr/src/debug/glibc/2.23-r0/git/include/resolv.h is owned by=
 uid<br>
&gt; &gt; 1000, which is the same as the user running bitbake. This may be =
due<br>
&gt; &gt; to host contamination<br>
&gt; &gt; glibc: /glibc-dbg/usr/src/debug/glibc/2.23-r0/git/include/monetar=
y.h<br>
&gt; &gt; is owned by uid 1000, which is the same as the user running bitba=
ke.<br>
&gt; &gt; This may be due to host contamination<br>
&gt; &gt; glibc: /glibc-dbg/usr/src/debug/glibc/2.23-r0/git/include/locale.=
h is<br>
&gt; &gt; owned by uid 1000, which is the same as the user running bitbake.=
<br>
&gt; &gt; This may be due to host contamination<br>
&gt; &gt; ...<br>
&gt; &gt;<br>
&gt; &gt; The files are copied as part of the do_package task.<br>
&gt; &gt; The patch chowns all file in packages/usr/src after cpio copied t=
hem<br>
&gt; &gt; into the<br>
&gt; &gt; package directory.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Max Krummenacher &lt;<a href=3D"mailto:max.krummen=
acher@toradex.com">max.krummenacher@toradex.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 meta/classes/package.bbclass | 23 +++++++++++++++++++++++<b=
r>
&gt; &gt;=C2=A0 1 file changed, 23 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/classes/package.bbclass<br>
&gt; &gt; b/meta/classes/package.bbclass<br>
&gt; &gt; index bdbe96d..d9ef62c 100644<br>
&gt; &gt; --- a/meta/classes/package.bbclass<br>
&gt; &gt; +++ b/meta/classes/package.bbclass<br>
&gt; &gt; @@ -362,6 +362,7 @@ def copydebugsources(debugsrcdir, d):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # and copied to the destination here.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 import stat<br>
&gt; &gt; +=C2=A0 =C2=A0 import subprocess<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 sourcefile =3D d.expand(&quot;${WORKDIR}/debu=
gsources.list&quot;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 if debugsrcdir and os.path.isfile(sourcefile)=
:<br>
&gt; &gt; @@ -410,6 +411,28 @@ def copydebugsources(debugsrcdir, d):<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if retval:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;de=
bugsrc symlink fixup failed with exit code<br>
&gt; &gt; %s (cmd was %s)&quot; % (retval, cmd))<br>
&gt; &gt;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # cpio --no-preserve-owner does not =
create the destination<br>
&gt; &gt; files with<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # owner root even when run under pse=
udo, chown them<br>
&gt; &gt; explicitely.<br>
&gt;<br>
&gt; How about passing --owner=3D0:0 to cpio?<br>
&gt;<br>
&gt; I&#39;m a little worried about why I don&#39;t see this failure on my =
own local<br>
&gt; builds.</p>
<p dir=3D"ltr">Can you dump the dbg rpm from poky and see if the flagged fi=
le is there ?<br>
&gt;<br>
&gt; We have a few cases where things sometimes seem to work out and<br>
&gt; sometimes don&#39;t and I&#39;d love to get to the bottom of how to re=
produce<br>
&gt; it and to understand why its different for different people.<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--001a1136ff183585a4052f9ba660--
