Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1646676B7C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 15:05:27 +0000 (UTC)
Received: by ioii196 with SMTP id i196so4154522ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 08:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=AbgZiJm1A//qwerjdlrer0SyPvM8DrsKIuoAQ47F+WI=;
	b=vwjlHw+IZcaB9DDY6XkYGyJCV4QA2gf4TbPzrugnlc1gGs9MqUDVWmsN0ROXtHtIHP
	YhAQZ8VDgamUczpaVbWP1hdRAs4j49iTnEmK+WKJqwlgRbsHrjFswc9oI7/BRSuSOvei
	FBMLjvZJZcwyrllqdyuwOSnptomuDYYNM93kptMbT4wMny8Jhsd2eeq52VBM0fYxShbx
	9xX5Ukl9hsT4BJjJPU4nMui7Yah3Rd09k+DAmaQWYyJ9jJzrgcaGU4d8oYXjX4sB5Waa
	0uopjFJjKA3yhflf+knlWm/54Iy0HARJ0MgZc0RywIKQ5RdK1A02XwdfG7EG4H1+Gj1u
	Oo9A==
X-Received: by 10.107.40.200 with SMTP id o191mr28747079ioo.83.1441119926629; 
	Tue, 01 Sep 2015 08:05:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.100.71 with HTTP; Tue, 1 Sep 2015 08:05:07 -0700 (PDT)
In-Reply-To: <1441093940.26554.57.camel@linuxfoundation.org>
References: <cover.1440454290.git.chris_larson@mentor.com>
	<1441093853.26554.56.camel@linuxfoundation.org>
	<1441093940.26554.57.camel@linuxfoundation.org>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 1 Sep 2015 08:05:07 -0700
Message-ID: <CABcZAN=_9ESDDO3SSFFL81VURL2PRJjFf0w8eoA8_0xE27=WiQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Add checks for "host user contamination"
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
X-List-Received-Date: Tue, 01 Sep 2015 15:05:31 -0000
Content-Type: multipart/alternative; boundary=001a1141cf8c4e6d08051eb0e1d4

--001a1141cf8c4e6d08051eb0e1d4
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 1, 2015 at 12:52 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2015-09-01 at 08:50 +0100, Richard Purdie wrote:
> > On Mon, 2015-08-24 at 15:19 -0700, Christopher Larson wrote:
> > > From: Christopher Larson <chris_larson@mentor.com>
> > >
> > > This adds a QA test, as well as a rootfs_ function for use in
> > > ROOTFS_POSTPROCESS_COMMAND, to warn/error when paths are owned by the
> same
> > > user/group as the user running bitbake. This is useful to catch stuff
> which is
> > > written outside of pseudo's control, for example.
> > >
> > > The following changes since commit
> c38acd720b3f6ffbeb544063692eb471dada8593:
> > >
> > >   binconfig-disabled: write an message to stderr to help confused
> developers (2015-08-19 17:57:58 +0100)
> > >
> > > are available in the git repository at:
> > >
> > >   git://github.com/kergoth/openembedded-core host-user-contaminated
> > >
> https://github.com/kergoth/openembedded-core/tree/host-user-contaminated
> > >
> > > Christopher Larson (3):
> > >   insane.bbclass: handle tests which need fakeroot
> > >   insane.bbclass: add host-user-contaminated test
> > >   image.bbclass: add rootfs_check_host_user_contaminated
> >
> > On the autobuilder we found:
> >
> > http://errors.yoctoproject.org/Errors/Details/16318/
> >
> > which looks like a race against the packaging code and the creation of
> > package manager files. Not sure why we don't see this in other cases...
>
> Also http://errors.yoctoproject.org/Errors/Details/16310/ which looks
> like the same issue (racing dpkg rather than opkg).


Ah, indeed, sorry about that, I must have gotten lucky with our builds thus
far. I'll re-submit, ignoring ENOENT.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1141cf8c4e6d08051eb0e1d4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Sep 1, 2015 at 12:52 AM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><span class=3D"">On Tue, 2015-09-01 at 08:50 +0100, Richard Purdie =
wrote:<br>
&gt; On Mon, 2015-08-24 at 15:19 -0700, Christopher Larson wrote:<br>
&gt; &gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mento=
r.com">chris_larson@mentor.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; This adds a QA test, as well as a rootfs_ function for use in<br>
&gt; &gt; ROOTFS_POSTPROCESS_COMMAND, to warn/error when paths are owned by=
 the same<br>
&gt; &gt; user/group as the user running bitbake. This is useful to catch s=
tuff which is<br>
&gt; &gt; written outside of pseudo&#39;s control, for example.<br>
&gt; &gt;<br>
&gt; &gt; The following changes since commit c38acd720b3f6ffbeb544063692eb4=
71dada8593:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0binconfig-disabled: write an message to stderr to hel=
p confused developers (2015-08-19 17:57:58 +0100)<br>
&gt; &gt;<br>
&gt; &gt; are available in the git repository at:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0git://<a href=3D"http://github.com/kergoth/openembedd=
ed-core" rel=3D"noreferrer" target=3D"_blank">github.com/kergoth/openembedd=
ed-core</a> host-user-contaminated<br>
&gt; &gt;=C2=A0 =C2=A0<a href=3D"https://github.com/kergoth/openembedded-co=
re/tree/host-user-contaminated" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/kergoth/openembedded-core/tree/host-user-contaminated</a><br>
&gt; &gt;<br>
&gt; &gt; Christopher Larson (3):<br>
&gt; &gt;=C2=A0 =C2=A0insane.bbclass: handle tests which need fakeroot<br>
&gt; &gt;=C2=A0 =C2=A0insane.bbclass: add host-user-contaminated test<br>
&gt; &gt;=C2=A0 =C2=A0image.bbclass: add rootfs_check_host_user_contaminate=
d<br>
&gt;<br>
&gt; On the autobuilder we found:<br>
&gt;<br>
&gt; <a href=3D"http://errors.yoctoproject.org/Errors/Details/16318/" rel=
=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Errors/Det=
ails/16318/</a><br>
&gt;<br>
&gt; which looks like a race against the packaging code and the creation of=
<br>
&gt; package manager files. Not sure why we don&#39;t see this in other cas=
es...<br>
<br>
</span>Also <a href=3D"http://errors.yoctoproject.org/Errors/Details/16310/=
" rel=3D"noreferrer" target=3D"_blank">http://errors.yoctoproject.org/Error=
s/Details/16310/</a> which looks<br>
like the same issue (racing dpkg rather than opkg).</blockquote></div><br>A=
h, indeed, sorry about that, I must have gotten lucky with our builds thus =
far. I&#39;ll re-submit, ignoring ENOENT.<br>-- <br><div class=3D"gmail_sig=
nature"><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>=
Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior=
 Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a1141cf8c4e6d08051eb0e1d4--
