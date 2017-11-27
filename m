Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9B64171D9F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 04:52:07 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id j202so30917249qke.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 20:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tQYvs8HaQ5q1PtKPD+9WcKEPlHyPYcNdgtEuvOf1p/I=;
	b=BmUatfbCIEJ8QDE51r8eh5pX0yO0uV8F/pq1x8NiW6Lop1phLG7T+GLJvF0BzQJt5W
	JBkVQ9tky0a6F9wnaM17k7Qx+UfzBGiAiD3m82DoGMnFXfimedXl8Lo41FMyNPn/zXjc
	Eg8UZW6FQXTx8MXQpDl4ZwwPgA7RP1cnwgeZ4stH/dAfUT6dXyOKpaqJYe/ckmrBMMky
	+HAe8LLOrYXb7fTu+o8D3XBlJVZozei2Fn7NJbPVjBQH5ksBmu5AcIaRp8D2s3x6rfWo
	FJqsRhBDR83hkisbWCv9NN9Su3cjtj1hLIE5vIlUcwSUJymhieFVPaKFiEOlmao1xK8B
	sckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tQYvs8HaQ5q1PtKPD+9WcKEPlHyPYcNdgtEuvOf1p/I=;
	b=XFw0nwqgx6jks3rgeCAMotqAqwJAYp+0vW9BYTtlM3UUxc5Yqa5vzwbW+Ft8rW11Bb
	rXGv2wjXHP7nPJAJsPo2q9QPc5EEnp9XrJMXbTW4WizeqgV8Kd8VLnDPxk7JGqjTOsA0
	s6Ra/xw2lci5YUNc6Fdg4lCpwkld7kZpN4k3SSf2NTtzzIys03iSMokV0QgwuiQvSnpP
	0HZ3HuJQHa51B6z5S+2HlNuPOuYwR9VXNCsgS6O/94GYfYIyYyskZgkF6txqX9adXmlO
	F6ojwkCBMyrZx+7HfmJ5kQ6BEowyRoQWwzF4zQ5IdeWAF6qJapJ9HsfOdfB824xulXX8
	g9DQ==
X-Gm-Message-State: AJaThX7FBNXvYCQa3mW6juPrULqKt+EpuCoWGw8cjXMREECZ+hmx8tGW
	6IMH/XUIYDE/TrH7l/QrzUdgM6MPvDFyHd9EnT8=
X-Google-Smtp-Source: AGs4zMbW00xS1SoIpPgFdiLk2InkmsjwjFIJ9NtOZiEXXCaP/uwfR03ySDKU67efkv8iPIY1QJIPnDPYe8Ecdf5V0PI=
X-Received: by 10.55.181.1 with SMTP id e1mr39135911qkf.19.1511758328188; Sun,
	26 Nov 2017 20:52:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Sun, 26 Nov 2017 20:52:07 -0800 (PST)
In-Reply-To: <1511736279.11515.20.camel@linux.intel.com>
References: <20171122184724.21416-1-sgw@linux.intel.com>
	<3a0e2cdc-ca8c-07ba-e27d-701e3e4f6154@windriver.com>
	<1511736279.11515.20.camel@linux.intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 26 Nov 2017 23:52:07 -0500
Message-ID: <CADkTA4P98ysLwQ6nqpQGy940SLJ-aLRFs9QWMv4gKdkHN-+5ag@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: Add cleandirs for do_shared_workdir
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
X-List-Received-Date: Mon, 27 Nov 2017 04:52:07 -0000
Content-Type: multipart/alternative; boundary="94eb2c06c642235727055eefaa48"

--94eb2c06c642235727055eefaa48
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 26, 2017 at 5:44 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On Wed, 2017-11-22 at 15:51 -0500, Bruce Ashfield wrote:
> > On 2017-11-22 1:47 PM, Saul Wold wrote:
> > > Ensure we have a clean and empty STAGING_KERNEL_BUILDDIR (kernel-
> > > build-artifacts)
> > > before creating it, otherwise there might be older artifacts from a
> > > prior
> > > kernel build.
> > >
> >
> > What's the actual error that this triggers ? It would be nice to
> > log it here in the commit message .. or at least a description
> > of the symptoms.
> >
> As refered to in the bug, there is not an actual error occurs, but
> there are multiple older and non-appropriate (read older) artifacts
> remaining in the kernel-build-artifacts directory, just as the commit
> message describes.
>

Quoting a bug isn't useful .. everything that someone needs to know
*must* be in a commit message. I'm not clicking through later on
when doing a 'git whatchanged', and I may not even be online at
that time .. so that bug reference just isn't useful.

So the old artifacts remain .. is it a disk usage question ? Is it a
possible
confusion when inspecting a build ? .. All that the message does is
describe the change, not the why.

Bruce



>
> Sau!
>
> > > [YOCTO #11880]
> > >
> > > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> > > ---
> > >   meta/classes/kernel.bbclass | 3 +--
> > >   1 file changed, 1 insertion(+), 2 deletions(-)
> > >
> > > diff --git a/meta/classes/kernel.bbclass
> > > b/meta/classes/kernel.bbclass
> > > index 756707a3c25..2a0a7707a14 100644
> > > --- a/meta/classes/kernel.bbclass
> > > +++ b/meta/classes/kernel.bbclass
> > > @@ -400,6 +400,7 @@ emit_depmod_pkgdata() {
> > >
> > >   PACKAGEFUNCS += "emit_depmod_pkgdata"
> > >
> > > +do_shared_workdir[cleandirs] += " ${STAGING_KERNEL_BUILDDIR}"
> > >   do_shared_workdir () {
> > >     cd ${B}
> > >
> > > @@ -655,8 +656,6 @@ kernel_do_deploy() {
> > >             fi
> > >     done
> > >   }
> > > -do_deploy[cleandirs] = "${DEPLOYDIR}"
> > > -do_deploy[dirs] = "${DEPLOYDIR} ${B}"
> >
> > This isn't clear to me. Why does cleaning the STAGING_KERNEL_BUILDDIR
> > as part of the do_shared_workdir mean that we no longer need the
> > clean before the deploy (as well as the deploy dir).
> >
> > Bruce
> >
> > >   do_deploy[prefuncs] += "package_get_auto_pr"
> > >
> > >   addtask deploy after do_populate_sysroot do_packagedata
> > >
> >
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c06c642235727055eefaa48
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sun, Nov 26, 2017 at 5:44 PM, Saul Wold <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Wed=
, 2017-11-22 at 15:51 -0500, Bruce Ashfield wrote:<br>
&gt; On 2017-11-22 1:47 PM, Saul Wold wrote:<br>
&gt; &gt; Ensure we have a clean and empty STAGING_KERNEL_BUILDDIR (kernel-=
<br>
&gt; &gt; build-artifacts)<br>
&gt; &gt; before creating it, otherwise there might be older artifacts from=
 a<br>
&gt; &gt; prior<br>
&gt; &gt; kernel build.<br>
&gt; &gt;<br>
&gt;<br>
&gt; What&#39;s the actual error that this triggers ? It would be nice to<b=
r>
&gt; log it here in the commit message .. or at least a description<br>
&gt; of the symptoms.<br>
&gt;<br>
</span>As refered to in the bug, there is not an actual error occurs, but<b=
r>
there are multiple older and non-appropriate (read older) artifacts<br>
remaining in the kernel-build-artifacts directory, just as the commit<br>
message describes.<br></blockquote><div><br></div><div>Quoting a bug isn&#3=
9;t useful .. everything that someone needs to know=C2=A0</div><div>*must* =
be in a commit message. I&#39;m not clicking through later on</div><div>whe=
n doing a &#39;git whatchanged&#39;, and I may not even be online at</div><=
div>that time .. so that bug reference just isn&#39;t useful.</div><div><br=
></div><div>So the old artifacts remain .. is it a disk usage question ? Is=
 it a possible</div><div>confusion when inspecting a build ? .. All that th=
e message does is</div><div>describe the change, not the why.</div><div><br=
></div><div>Bruce</div><div><br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
<br>
Sau!<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; &gt; [YOCTO #11880]<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.co=
m">sgw@linux.intel.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 =C2=A0meta/classes/kernel.bbclass | 3 +--<br>
&gt; &gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/classes/kernel.bbclass<br>
&gt; &gt; b/meta/classes/kernel.bbclass<br>
&gt; &gt; index 756707a3c25..2a0a7707a14 100644<br>
&gt; &gt; --- a/meta/classes/kernel.bbclass<br>
&gt; &gt; +++ b/meta/classes/kernel.bbclass<br>
&gt; &gt; @@ -400,6 +400,7 @@ emit_depmod_pkgdata() {<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0PACKAGEFUNCS +=3D &quot;emit_depmod_pkgdata&quot;<br>
&gt; &gt;<br>
&gt; &gt; +do_shared_workdir[cleandirs] +=3D &quot; ${STAGING_KERNEL_BUILDD=
IR}&quot;<br>
&gt; &gt;=C2=A0 =C2=A0do_shared_workdir () {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0cd ${B}<br>
&gt; &gt;<br>
&gt; &gt; @@ -655,8 +656,6 @@ kernel_do_deploy() {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0done<br>
&gt; &gt;=C2=A0 =C2=A0}<br>
&gt; &gt; -do_deploy[cleandirs] =3D &quot;${DEPLOYDIR}&quot;<br>
&gt; &gt; -do_deploy[dirs] =3D &quot;${DEPLOYDIR} ${B}&quot;<br>
&gt;<br>
&gt; This isn&#39;t clear to me. Why does cleaning the STAGING_KERNEL_BUILD=
DIR<br>
&gt; as part of the do_shared_workdir mean that we no longer need the<br>
&gt; clean before the deploy (as well as the deploy dir).<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt; &gt;=C2=A0 =C2=A0do_deploy[prefuncs] +=3D &quot;package_get_auto_pr&qu=
ot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0addtask deploy after do_populate_sysroot do_packageda=
ta<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Tho=
u shalt not follow the NULL pointer, for chaos and madness await thee at it=
s end&quot;</div>
</div></div>

--94eb2c06c642235727055eefaa48--
