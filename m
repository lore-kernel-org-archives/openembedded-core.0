Return-Path: <clord@mozilla.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id B3D0875CF1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 13:58:24 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id m101so136083509ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 06:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mozilla.com; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=o9PzwQkzbpv8yKxj6J+XIjxPkb4V35APv/Wm1dwghJs=;
	b=VO82hYHF5JBLAqSPtjZ7/HAcO+XxLDCsID7RELd4f2KBkFJeGZoNxtuTpmPWGfRud6
	6yCtBR7z5Ul6hT+ZVOhfGYytzkCTR9JgLauiTTR4qmklPINsQgupIzbnPIvgRpGuqIMs
	FBO1tYc/flM7w+qpfRCrUvAmcx8fyaMq4sh1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=o9PzwQkzbpv8yKxj6J+XIjxPkb4V35APv/Wm1dwghJs=;
	b=BpCits6CHomPJ+joiddkTn4GmFRgYAifFJJsHnInc3yOqD2Nm8awUvJq7tdHu+AoXH
	ENT8JMa/z5C6fYms3EKpPFllIbjNam3ZvgAUSgybjJfNWCoF7Z99ebAHkZk3w69yfj3J
	9AMfIdFIPwCwtAfSdhx4iV6jnTWaoNOrI/8tVN1YFoFR/aBGb2VUuoZWXcgvG+c4DQvV
	5EMylGQHu4Y2kNvB4nz+MB3ubrUdv5DMNqKDWWHxcH2N+6buO09h1k7dS8RT4NYFzhrY
	JKo7iMoqR0oIs1n5Wgx/wLrREHKaLuZA5iYNLbRZHgAUsnm4F/nl66UdciMDr0ysKORl
	z7sw==
X-Gm-Message-State: AEkoousydcM63g1lTaN31+zfX48G0Ww/6qAizuN4kibymorp5ByzeSDb4qt2LE7nS6YT5gsuaEuVndSJTqv+caNH
X-Received: by 10.107.56.70 with SMTP id f67mr48922094ioa.162.1471442304980;
	Wed, 17 Aug 2016 06:58:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.36.23.212 with HTTP; Wed, 17 Aug 2016 06:58:24 -0700 (PDT)
In-Reply-To: <3036338.LeAAZU0Ur8@peggleto-mobl.ger.corp.intel.com>
References: <CABDc_zW0Mi9a5G+neZMSAC5mRVo8LC-62ew_X9PiKM8uVxhAUA@mail.gmail.com>
	<20160817101112.GA20728@hippo.iwi.intel.com>
	<3036338.LeAAZU0Ur8@peggleto-mobl.ger.corp.intel.com>
From: Christopher Lord <clord@mozilla.com>
Date: Wed, 17 Aug 2016 14:58:24 +0100
Message-ID: <CABDc_zVWhcAdhobvkLBZcRdPBM2npp5PaUDpG50VrL_Rc3e0ng@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: npm.bbclass
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
X-List-Received-Date: Wed, 17 Aug 2016 13:58:25 -0000
Content-Type: multipart/alternative; boundary=001a114ac57ee58046053a44db21

--001a114ac57ee58046053a44db21
Content-Type: text/plain; charset=UTF-8

On 17 August 2016 at 13:40, Paul Eggleton <paul.eggleton@intel.com> wrote:

> Hey Chris, long time!
>

Hey :)


> On Wed, 17 Aug 2016 11:11:13 Brendan Le Foll wrote:
> > >    - Is there a reason to split the package like it does? Node projects
> > >    tend to have huge dependency trees, it makes updating and
> distributing
> > >    node-based applications a bit of a chore if they end up split into
> 20
> > >    packages, most of which have no use separately. It would be great if
> > >    there was at least a way to disable this.
> >
> > Paul added this, the worry was that we wanted to make sure all the
> > licenses where tracked properly of the package etc...
>
> Right, that is why we do the splitting - if you want the licenses and
> actual
> packages used to be fully represented in the image license manifest then
> they
> really do have to be split this way. Honestly I view this ugliness more as
> an
> artifact of how npm works (i.e. every dependency is handled separately
> instead
> of trying to ensure only one instance of a particular package).
>
> > I'm not a huge fan either to be honest. Maybe we can have a npm-no-
> > split.bbclass would that be ok - Paul? It's in python
> > populate_packages_prepend in npm.bbclass.
>
> Sure, but rather than a separate class I would just add a variable such as
> NPM_SPLIT_PACKAGES that defaults to "1" and then you can set it to "0"
> either
> globally or in each recipe.
>

This sounds good. A further bug I just encountered (after finally getting a
particularly gnarly project packaged), the RDEPENDS that gets generated
doesn't seem to be complete. Dependencies of dependencies don't get added
it appears. So for example, you package appA that has a dependency on
moduleX, which itself has a dependency on moduleY. It all gets packaged,
but moduleY is missed from the RDEPENDS of appA (or of moduleX, which I
guess is where it would be ideally). At least, I've included appA in an
image, and appA is installed, moduleX is installed, but moduleY is missing.
I've assumed this is the error, but I could be assuming incorrectly.


> > >    - Any patches end up getting packaged because they get put in the
> > >    srcdir. I'm guessing this isn't intentional (or maybe it is?)
> > >    Just wanted to provide some feedback. It's fantastic that OE has the
> > >    ability to package node software, and despite the teething
> > >    difficulties, I've appreciated its availability!
> >
> > That is a good point, didn't think about it tbh. in npm.bbclass we
> > could maybe delete everything that looks like a patch before
> > compilation, little bit worried there might be nasty side effects but
> > I can try :)
>
> This is definitely not intentional, but the way we have been dealing with
> npm
> it makes it easy for stuff like this to leak into the output packages. I
> guess
> we just need to delete them under ${D} after the files are installed there.
>

On further thought about this, I actually don't think it's a terrible idea
to do this anyway. Unless your patches are huge, it's not much overhead,
and it's nice to include to hint at anyone inspecting the filesystem that
the distributed files have been modified. It'd definitely be better to
package them than to delete them and possibly end up deleting things that
shouldn't be deleted. Maybe another thing that could be made optional?

Cheers,

--Chris

--001a114ac57ee58046053a44db21
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 17 August 2016 at 13:40, Paul Eggleton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:paul.eggleton@intel.com" target=3D"_blank">paul.eggleton@intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hey Chris, long =
time!<br></blockquote><div><br></div><div>Hey :)<br>=C2=A0<span class=3D"">=
</span><br><span class=3D""></span></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><sp=
an class=3D"">
On Wed, 17 Aug 2016 11:11:13 Brendan Le Foll wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 - Is there a reason to split the package like it doe=
s? Node projects<br>
&gt; &gt;=C2=A0 =C2=A0 tend to have huge dependency trees, it makes updatin=
g and distributing<br>
&gt; &gt;=C2=A0 =C2=A0 node-based applications a bit of a chore if they end=
 up split into 20<br>
&gt; &gt;=C2=A0 =C2=A0 packages, most of which have no use separately. It w=
ould be great if<br>
&gt; &gt;=C2=A0 =C2=A0 there was at least a way to disable this.<br>
&gt;<br>
&gt; Paul added this, the worry was that we wanted to make sure all the<br>
&gt; licenses where tracked properly of the package etc...<br>
<br>
</span>Right, that is why we do the splitting - if you want the licenses an=
d actual<br>
packages used to be fully represented in the image license manifest then th=
ey<br>
really do have to be split this way. Honestly I view this ugliness more as =
an<br>
artifact of how npm works (i.e. every dependency is handled separately inst=
ead<br>
of trying to ensure only one instance of a particular package).<br>
<span class=3D""><br>
&gt; I&#39;m not a huge fan either to be honest. Maybe we can have a npm-no=
-<br>
</span>&gt; split.bbclass would that be ok - Paul? It&#39;s in python<br>
&gt; populate_packages_prepend in npm.bbclass.<br>
<br>
Sure, but rather than a separate class I would just add a variable such as<=
br>
NPM_SPLIT_PACKAGES that defaults to &quot;1&quot; and then you can set it t=
o &quot;0&quot; either<br>
globally or in each recipe.<span class=3D""><br></span></blockquote><div><b=
r></div><div>This sounds good. A further bug I just encountered (after fina=
lly getting a particularly gnarly project packaged), the RDEPENDS that gets=
 generated doesn&#39;t seem to be complete. Dependencies of dependencies do=
n&#39;t get added it appears. So for example, you package appA that has a d=
ependency on moduleX, which itself has a dependency on moduleY. It all gets=
 packaged, but moduleY is missed from the RDEPENDS of appA (or of moduleX, =
which I guess is where it would be ideally). At least, I&#39;ve included ap=
pA in an image, and appA is installed, moduleX is installed, but moduleY is=
 missing. I&#39;ve assumed this is the error, but I could be assuming incor=
rectly.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">
&gt; &gt;=C2=A0 =C2=A0 - Any patches end up getting packaged because they g=
et put in the<br>
&gt; &gt;=C2=A0 =C2=A0 srcdir. I&#39;m guessing this isn&#39;t intentional =
(or maybe it is?)<br>
&gt; &gt;=C2=A0 =C2=A0 Just wanted to provide some feedback. It&#39;s fanta=
stic that OE has the<br>
&gt; &gt;=C2=A0 =C2=A0 ability to package node software, and despite the te=
ething<br>
&gt; &gt;=C2=A0 =C2=A0 difficulties, I&#39;ve appreciated its availability!=
<br>
&gt;<br>
&gt; That is a good point, didn&#39;t think about it tbh. in npm.bbclass we=
<br>
&gt; could maybe delete everything that looks like a patch before<br>
&gt; compilation, little bit worried there might be nasty side effects but<=
br>
&gt; I can try :)<br>
<br>
</span>This is definitely not intentional, but the way we have been dealing=
 with npm<br>
it makes it easy for stuff like this to leak into the output packages. I gu=
ess<br>
we just need to delete them under ${D} after the files are installed there.=
<br></blockquote><div>=C2=A0</div><div>On further thought about this, I act=
ually don&#39;t think it&#39;s a terrible idea to do this anyway. Unless yo=
ur patches are huge, it&#39;s not much overhead, and it&#39;s nice to inclu=
de to hint at anyone inspecting the filesystem that the distributed files h=
ave been modified. It&#39;d definitely be better to package them than to de=
lete them and possibly end up deleting things that shouldn&#39;t be deleted=
. Maybe another thing that could be made optional?<br></div><div>=C2=A0</di=
v>Cheers,<br><br></div><div class=3D"gmail_quote">--Chris<br></div></div></=
div>

--001a114ac57ee58046053a44db21--
