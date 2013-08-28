Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8DC586BC26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 13:31:03 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id ep20so4733538lab.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 06:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=PioZoUCH0R9jWEnuruAYkAbT7DxZsf2hoeL8qzXa9kE=;
	b=GTXm2IH7v3tjii6Y0uUcbgC7d8q+EV4XqqxEcHRLJfwrWf8b0CP3eifQ7SDhGb3aTQ
	ZtNOZoFlUjeCBIspZ6Jy1gxkJpQNmzwVG1yZk+ZfceHs+B9YX6EjCmh8qxPOkBc6Y7NP
	TmzqRgbY4Zf0wPQ2BdtB8+wLjs+r3UNWqAFw10OhC7f4rm+vXTF9DXzFTKQNUL3i9HeS
	thx0xdfYKO0Rpj1UNX+a4G7KLbuZVmnt+SeH8Ga7wQMhGtW9ZfEgT+T+rtRLyFA0ZVEf
	2FV2smi9H9czGq/gW/jYAvyuL+83btnaWlkSoeXLUBgq1ui2/U0drZnAP4ic5eJksYpJ
	bzRg==
X-Received: by 10.152.8.115 with SMTP id q19mr24035354laa.16.1377696663031;
	Wed, 28 Aug 2013 06:31:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.53.197 with HTTP; Wed, 28 Aug 2013 06:30:42 -0700 (PDT)
In-Reply-To: <1705534.gI98rekybp@helios>
References: <cover.1377285913.git.chris_larson@mentor.com>
	<20130828081908.GF3544@jama> <1705534.gI98rekybp@helios>
From: Chris Larson <kergoth@gmail.com>
Date: Wed, 28 Aug 2013 06:30:42 -0700
Message-ID: <CABcZANkgpJf9JzOcNqZ+TZuo7_Md_WeRdr6bGDBeq65mdsjV1A@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 0/2] Add ca-certificates recipe
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
X-List-Received-Date: Wed, 28 Aug 2013 13:31:04 -0000
Content-Type: multipart/alternative; boundary=001a11c34f5c35586004e50200fb

--001a11c34f5c35586004e50200fb
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 28, 2013 at 5:31 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Wednesday 28 August 2013 10:19:08 Martin Jansa wrote:
> > On Fri, Aug 23, 2013 at 12:26:13PM -0700, Christopher Larson wrote:
> > > From: Christopher Larson <chris_larson@mentor.com>
> > >
> > > This is based on the meta-oe recipe, with enhancements, and
> prepopulates
> > > the certificates for the nativesdk version, for later use in the
> > > buildtools-tarball.
> > >
> > > The following changes since commit
> 9b05c65450526522d7358d0c0901b594de546748:
> > >   sstate: Fix the relative symlink replacement code (2013-08-23
> 16:59:04
> > >   +0100)>
> > > are available in the git repository at:
> > >   https://github.com/kergoth/oe-core.git ca-certificates
> > >
> > > Christopher Larson (2):
> > >   ca-certificates: add recipe (version 20130610)
> > >   nativesdk-ca-certificates: prepopulate ca-certificates.crt
> >
> > Are you going to send patches to oe-devel to remove moved
> > recipes/bbclasses ?
>
> Martin is now aware, but FYI I've sent a patch for this.


Ah, thanks.
-- 
Christopher Larson

--001a11c34f5c35586004e50200fb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Aug 28, 2013 at 5:31 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@=
linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Wednesday 28 August 201=
3 10:19:08 Martin Jansa wrote:<br>
&gt; On Fri, Aug 23, 2013 at 12:26:13PM -0700, Christopher Larson wrote:<br=
>
&gt; &gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mento=
r.com">chris_larson@mentor.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; This is based on the meta-oe recipe, with enhancements, and prepo=
pulates<br>
&gt; &gt; the certificates for the nativesdk version, for later use in the<=
br>
&gt; &gt; buildtools-tarball.<br>
&gt; &gt;<br>
&gt; &gt; The following changes since commit<br>
9b05c65450526522d7358d0c0901b594de546748:<br>
&gt; &gt; =C2=A0 sstate: Fix the relative symlink replacement code (2013-08=
-23 16:59:04<br>
&gt; &gt; =C2=A0 +0100)&gt;<br>
&gt; &gt; are available in the git repository at:<br>
&gt; &gt; =C2=A0 <a href=3D"https://github.com/kergoth/oe-core.git" target=
=3D"_blank">https://github.com/kergoth/oe-core.git</a> ca-certificates<br>
&gt; &gt;<br>
&gt; &gt; Christopher Larson (2):<br>
&gt; &gt; =C2=A0 ca-certificates: add recipe (version 20130610)<br>
&gt; &gt; =C2=A0 nativesdk-ca-certificates: prepopulate ca-certificates.crt=
<br>
&gt;<br>
&gt; Are you going to send patches to oe-devel to remove moved<br>
&gt; recipes/bbclasses ?<br>
<br>
</div>Martin is now aware, but FYI I&#39;ve sent a patch for this.</blockqu=
ote></div><br>Ah, thanks.<br>-- <br>Christopher Larson</div></div>

--001a11c34f5c35586004e50200fb--
