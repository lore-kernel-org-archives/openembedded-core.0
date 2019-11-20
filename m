Return-Path: <ryan.harkin@linaro.org>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4DE0A7F6AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 19:44:55 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id g50so861742qtb.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 11:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Nx7bSHaaOZ6x3Aib08xlLycayKFSHgizctmXOvZ57ds=;
	b=uRYKKtXJIkwo1tOP1bFL7I3FiSGrvk208I0wG+czIKB/9R0qita9BD8dybDmM0OBhz
	XlCojCGuXjVKT+lgNvZoUPCunB9KoE9Tctfo1N9UfgBUeDYnLwHUP+DCw36bKD+iTiLx
	jfEuW78jpn26Pj9LOBhaMcWRlBfQ93Rj6crgGro0xXDuoer0uHbtMPgxx0suyRxiJLVW
	+PNW7um9hvKTrOv20os967foWlNMobsrUCDHKA1L8qagak4lFIbYSuRUleeXsM6Yz4tt
	GdiP0NpQIL+FxemhhaK+meZNxzfDimuI4w5mctLoXZHHgDMwzINTjZPoC2uM/dJgPKb8
	bsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Nx7bSHaaOZ6x3Aib08xlLycayKFSHgizctmXOvZ57ds=;
	b=jFRKMl026Lv6DBXV1lXyQGq/jCk36QF3ksD7yivjrynj9A45uy+2GIBwr+RTA4b2/h
	yUgVyoaM3f+f6RDjz/c/L/gJ1eOowDzs228zGKYaUFeVOk5HhRfssMmJ+LJv8J939epz
	VILsI3WvBH5wiLBaRpnSxY+9hIxHdOJMK7+7QGY1AmDCDuZd0K7LZy04JEK3FkoqXc+T
	CWTiyJtpmX8HkvY//fbFKKpsH+SHJ7xreDLfR78BbBM4RChCp2omEJXvGE9wVHsBA4Bd
	2HG9AhULS0gt3/Ah/78o3HbbzVK5Vnr6heQigcd5q+RIU1A59Oxov4OM8agEKL3yYruq
	YLzg==
X-Gm-Message-State: APjAAAX2FYbm/19l8uxTBk+kBoKd5wn56Whu57h0YHtt4nPHPgAcGudk
	5p7RK9xIA44TowfihFMQWLqAClW5EjXAxk0MXGwztA==
X-Google-Smtp-Source: APXvYqzy4+mbNEBnPznCW2E8TgPL/KN960NuVG85NrHtIngBjPtxtu8RglUNq8ej+EfVMs8k8AlFL8xXikAdKbMs40Q=
X-Received: by 2002:aed:27da:: with SMTP id m26mr4423842qtg.138.1574279096022; 
	Wed, 20 Nov 2019 11:44:56 -0800 (PST)
MIME-Version: 1.0
References: <CAD0U-hKudOEYkkPQQ1He3=Cg1hLqT7u5Uhsn_e2ZK0vGmo+z3w@mail.gmail.com>
	<5c9cb09a-e0b3-f43b-36cd-bc9a7df2dd6c@kernel.crashing.org>
	<CAD0U-hLzTxYw3F-tPbj5m1+iqW+2PZcU5n4bE1sxL9KxGmuVUw@mail.gmail.com>
	<31b224ae-8e1a-943c-0554-684557ef33bc@kernel.crashing.org>
	<CAJ86T=XhxLih7d6cdXc8-1ZOKhHXTU6quzHnt+G4Oa3qhSFypw@mail.gmail.com>
In-Reply-To: <CAJ86T=XhxLih7d6cdXc8-1ZOKhHXTU6quzHnt+G4Oa3qhSFypw@mail.gmail.com>
From: Ryan Harkin <ryan.harkin@linaro.org>
Date: Wed, 20 Nov 2019 19:44:44 +0000
Message-ID: <CAD0U-hL1m-2G67wfyKcr8BmG=ugf-s=534DnzhdQatJuG4DHaQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to backport openssl to Sumo
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
X-List-Received-Date: Wed, 20 Nov 2019 19:44:55 -0000
Content-Type: multipart/alternative; boundary="0000000000004bdc590597cc6a9a"

--0000000000004bdc590597cc6a9a
Content-Type: text/plain; charset="UTF-8"

Hi Andre,

On Wed, 20 Nov 2019 at 19:27, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Wed, Nov 20, 2019 at 11:09 AM Mark Hatle
> <mark.hatle@kernel.crashing.org> wrote:
> > On 11/20/19 1:06 PM, Ryan Harkin wrote:
> > > On Wed, 20 Nov 2019 at 18:36, Mark Hatle <
> mark.hatle@kernel.crashing.org
> > > <mailto:mark.hatle@kernel.crashing.org>> wrote:
> > >
> > >     You know that 1.0.2 and 1.1 APIs are not compatible?  So you will
> need to update
> > >     everything that needs OpenSSL to understand the new API.
> > >
> > >
> > > So far, we're only using it in a shell script to sign an image and
> later verify
> > > the image, so I've assumed, perhaps naively, that the API changes
> won't matter...
> >
> > Correct, but there may be other components of the system that could be
> using the
> > API that you are unaware of.  On a system as old as Sumo, you will need
> to take
> > precautions to ensure that ONLY the 1.1x version is being used.  (There
> may be
> > an openssl10 for compatibility that will need to be blacklisted.)
> >
> > >     For CVE fixes, typically you would patch 1.0.2p, or update to the
> latest
> > >     (1.0.2t) as you go.  (If you have an OSV, this should be part of
> the services
> > >     that they offer you.)
> > >
> > >
> > >     In my opinion, 1.0.2 will be around for at least another 4-5 years
> due to the
> > >     number of people actively using it in the world.  Until 1.1/3.0
> (won't be a 2.0
> > >     from what I read) exists and has a FIPS-140-2 support available --
> people will
> > >     continue to use 1.0.2 and maintain it as necessary for security.
> > >
> > >     As an FYI:
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-openssl102/
> > >
> > >     This version is for thud, warrior, zeus and master.  It is
> intended to be
> > >     maintained until either 1.0.2 is no longer maintainable -- or the
> FIPS-140-2
> > >     needs have been met by OpenSSL.
> > >
> > >
> > > Great, that looks like a better option anyway, assuming it has the
> latest fixes
> > > I need, and doesn't give me the same build problem.  Thanks for
> pointing it out.
> > > I'll give it a go.
> >
> > It's better to work with the Sumo version for your needs.  I just posted
> that as
> > an example of openssl 1.0.2 being needed still by others, even as
> oe-core/Yocto
> > Project have changed their defaults.
>
> If you want an up to date openssl 1.0.2 recipe which is compatible
> with Sumo, you can find one here:
>
>   https://github.com/armcc/meta-plumewifi
>
> I'm only actively testing it with OE 1.6 (Daisy) and OE 2.7 (Warrior)
> but it should work for all versions in between (and if it doesn't I'll
> accept patches or try to fix it).
>

Thanks! It looks similar to the tree Mark Hatle pointed out to me. Two
diffs jump out:

- Your repo adds the RPROVIDES for openssl-bin to "Be compatible with the
openssl 1.1.x recipe".
- Mark's repo has two extra patches:
           file://0001-Fix-BN_LLONG-breakage.patch \
           file://0001-Fix-DES_LONG-breakage.patch \

Regards,
Ryan.

--0000000000004bdc590597cc6a9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Andre,</div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Wed, 20 Nov 2019 at 19:27, Andre McCurdy =
&lt;<a href=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Nov 2=
0, 2019 at 11:09 AM Mark Hatle<br>
&lt;<a href=3D"mailto:mark.hatle@kernel.crashing.org" target=3D"_blank">mar=
k.hatle@kernel.crashing.org</a>&gt; wrote:<br>
&gt; On 11/20/19 1:06 PM, Ryan Harkin wrote:<br>
&gt; &gt; On Wed, 20 Nov 2019 at 18:36, Mark Hatle &lt;<a href=3D"mailto:ma=
rk.hatle@kernel.crashing.org" target=3D"_blank">mark.hatle@kernel.crashing.=
org</a><br>
&gt; &gt; &lt;mailto:<a href=3D"mailto:mark.hatle@kernel.crashing.org" targ=
et=3D"_blank">mark.hatle@kernel.crashing.org</a>&gt;&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0You know that 1.0.2 and 1.1 APIs are not compa=
tible?=C2=A0 So you will need to update<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0everything that needs OpenSSL to understand th=
e new API.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; So far, we&#39;re only using it in a shell script to sign an imag=
e and later verify<br>
&gt; &gt; the image, so I&#39;ve assumed, perhaps naively, that the API cha=
nges won&#39;t matter...<br>
&gt;<br>
&gt; Correct, but there may be other components of the system that could be=
 using the<br>
&gt; API that you are unaware of.=C2=A0 On a system as old as Sumo, you wil=
l need to take<br>
&gt; precautions to ensure that ONLY the 1.1x version is being used.=C2=A0 =
(There may be<br>
&gt; an openssl10 for compatibility that will need to be blacklisted.)<br>
&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0For CVE fixes, typically you would patch 1.0.2=
p, or update to the latest<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0(1.0.2t) as you go.=C2=A0 (If you have an OSV,=
 this should be part of the services<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0that they offer you.)<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0In my opinion, 1.0.2 will be around for at lea=
st another 4-5 years due to the<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0number of people actively using it in the worl=
d.=C2=A0 Until 1.1/3.0 (won&#39;t be a 2.0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0from what I read) exists and has a FIPS-140-2 =
support available -- people will<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0continue to use 1.0.2 and maintain it as neces=
sary for security.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0As an FYI:=C2=A0 <a href=3D"http://git.yoctopr=
oject.org/cgit/cgit.cgi/meta-openssl102/" rel=3D"noreferrer" target=3D"_bla=
nk">http://git.yoctoproject.org/cgit/cgit.cgi/meta-openssl102/</a><br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0This version is for thud, warrior, zeus and ma=
ster.=C2=A0 It is intended to be<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0maintained until either 1.0.2 is no longer mai=
ntainable -- or the FIPS-140-2<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0needs have been met by OpenSSL.<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Great, that looks like a better option anyway, assuming it has th=
e latest fixes<br>
&gt; &gt; I need, and doesn&#39;t give me the same build problem.=C2=A0 Tha=
nks for pointing it out.<br>
&gt; &gt; I&#39;ll give it a go.<br>
&gt;<br>
&gt; It&#39;s better to work with the Sumo version for your needs.=C2=A0 I =
just posted that as<br>
&gt; an example of openssl 1.0.2 being needed still by others, even as oe-c=
ore/Yocto<br>
&gt; Project have changed their defaults.<br>
<br>
If you want an up to date openssl 1.0.2 recipe which is compatible<br>
with Sumo, you can find one here:<br>
<br>
=C2=A0 <a href=3D"https://github.com/armcc/meta-plumewifi" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/armcc/meta-plumewifi</a><br>
<br>
I&#39;m only actively testing it with OE 1.6 (Daisy) and OE 2.7 (Warrior)<b=
r>
but it should work for all versions in between (and if it doesn&#39;t I&#39=
;ll<br>
accept patches or try to fix it).<br></blockquote><div><br></div><div>Thank=
s! It looks similar to the tree Mark Hatle pointed out to me. Two diffs jum=
p out:</div><div><br></div><div>- Your repo adds the RPROVIDES for openssl-=
bin to &quot;Be compatible with the openssl 1.1.x recipe&quot;.</div><div>-=
 Mark&#39;s repo has two extra patches:</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0file://0001-Fix-BN_LLONG-breakage.patch \<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-DES_LONG-breakage.patch \</div>=
<div><br></div><div>Regards,</div><div>Ryan.</div></div></div>

--0000000000004bdc590597cc6a9a--
