Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3608073DF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 15:39:53 +0000 (UTC)
Received: by iods203 with SMTP id s203so191235929iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Aug 2015 08:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=r7tpnEICeLzAH2lY0QCp2qXJD4ha07yieXTORvN6zHI=;
	b=wAIq/9r6hk/aWouGahFHRYphf3KQpo29HcRkzHmqs1Jdw8/OKAiLlV2Sa3dgyHh+Ch
	RntbIt9jUjv5jATFQmlKGvvy6zEAzbMB2kD1HVdL0g9k6vKPIxnAt5KQJgfp1hOtqRdq
	QcVerFM5DCO6LN3KzCeiLGv/RDvzvZJpN89hUyXkMZtEys8y8gKIBHRikgpFInk9d6X0
	gZIukzhWrcQy/PMQUeJvPUQlJfuGbKEA25Ht/WDNmoSd6fFg+2wRzLWKEnl0Ub4U3aB1
	fvmc5NXK4ayCXjQoWws9mydXSkJdk7yX4czpKiFMepPORbi4nEFgC6ADPPhKhlnzmdHc
	VFPA==
X-Received: by 10.107.128.152 with SMTP id k24mr23928671ioi.74.1440517193856; 
	Tue, 25 Aug 2015 08:39:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.100.71 with HTTP; Tue, 25 Aug 2015 08:39:34 -0700 (PDT)
In-Reply-To: <1BF41B12-84C2-4B3E-B6D8-28513FB87A12@gmail.com>
References: <efbd9a5c0ebb330d105c707bbb1ebf9875003caa.1440454579.git.chris_larson@mentor.com>
	<cover.1440454579.git.chris_larson@mentor.com>
	<a4f5aee1dac48d9455c616c8fe75f780f2d4246e.1440454579.git.chris_larson@mentor.com>
	<1BF41B12-84C2-4B3E-B6D8-28513FB87A12@gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 25 Aug 2015 08:39:34 -0700
Message-ID: <CABcZAN=0oXeSdytcCfZPEsytJ0pf3qw-Xi15nNvi5voc_bKODw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] libatomic-ops: move to recipes-support, fix recipe name
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
X-List-Received-Date: Tue, 25 Aug 2015 15:39:58 -0000
Content-Type: multipart/alternative; boundary=001a113f8efaa2042e051e248bf6

--001a113f8efaa2042e051e248bf6
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 24, 2015 at 5:32 PM, Khem Raj <raj.khem@gmail.com> wrote:

> > On Aug 24, 2015, at 3:19 PM, Christopher Larson <kergoth@gmail.com>
> wrote:
> >
> > - This recipe is useful for more than just pulseaudio, so move it to
> >  recipes-support.
> > - Rename to the correct upstream name, which corresponds to the library
> name.
> >  Keep a PROVIDES of libatomics-ops for compatibility.
> >
>
> There have been few fixes especially for gcc5 see
>
> https://github.com/ivmai/libatomic_ops/commit/437c10b73ae4b83306f77c851cf8385172ae3759
> can you also bring those in while you are at it ?


I'll add a todo to do that as an additional patch so it doesn't block this
going in.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113f8efaa2042e051e248bf6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, Aug 24, 2015 at 5:32 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; On Aug 24, 2=
015, at 3:19 PM, Christopher Larson &lt;<a href=3D"mailto:kergoth@gmail.com=
">kergoth@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; - This recipe is useful for more than just pulseaudio, so move it to<b=
r>
&gt;=C2=A0 recipes-support.<br>
&gt; - Rename to the correct upstream name, which corresponds to the librar=
y name.<br>
&gt;=C2=A0 Keep a PROVIDES of libatomics-ops for compatibility.<br>
&gt;<br>
<br>
</span>There have been few fixes especially for gcc5 see<br>
<a href=3D"https://github.com/ivmai/libatomic_ops/commit/437c10b73ae4b83306=
f77c851cf8385172ae3759" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/ivmai/libatomic_ops/commit/437c10b73ae4b83306f77c851cf8385172ae3759</a=
><br>
can you also bring those in while you are at it ?</blockquote></div><br>I&#=
39;ll add a todo to do that as an additional patch so it doesn&#39;t block =
this going in.<br>-- <br><div class=3D"gmail_signature"><div dir=3D"ltr">Ch=
ristopher Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbe=
dded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor =
Graphics</div></div>
</div></div>

--001a113f8efaa2042e051e248bf6--
