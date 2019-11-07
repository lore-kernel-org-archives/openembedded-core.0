Return-Path: <ryan.harkin@linaro.org>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 96A007F2B5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 10:41:52 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id z16so1513590qkg.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2019 02:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XvHJkKuFHC6O8T3G1aHNPhMnywZvCGD7ikljzvuSGF0=;
	b=aaGtka+Y1qaN/s9YlBryXRckeFDS2w8YeKB6nT5XjuMW351611j/pr8ZWnTyFrfyGh
	Jo9GAbYvodaOFLew6+SZPvGubiBPj6wNDlNJuVeZHQ+YVS5mbb+bPpa2IOWmLdNmEKIo
	655+BFGIhasC40ny82AmCZEYeGMGa/f+X/ayoNWAPIAz/h6a+x7eVVT5Z8JzGq7rHwzF
	udeWUVZxVHJTnZgQ8A6U1aD8e9FXY4UUXPCUTXL3ciU6lmYILtgZg8JlhlAAvELYwFis
	BnA+1xuOF1mhpP6fa2rRRi96klMjlscU3PmcBgMh4K3krfzXy7Sc/CDn47aiDGjw6blu
	VkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XvHJkKuFHC6O8T3G1aHNPhMnywZvCGD7ikljzvuSGF0=;
	b=CgGdUxu5Om2yYLkwluEmmKDP4KdXwOMro+7koz4Jbp+XHp4v4tquW2l0fn2Rt044hJ
	6+G52bKLTTAmZ/WHxBG4zFIG+VyLjIbrWB6SQSEbuEOlqHdE43vAWtylvEgV9S1CgR7F
	pVdTk7ql5RoFgTgcGa1aqt04unMw7oXVQ5CxV3zTBt3zDoGW5HRYHdB5rfy3XpHHbUE3
	zHdYEPT2OfvIAP2CI458wHhyuK05LsVZIvc3oyfHAYAM17UGSVFbpDGgybajj1A4QZoN
	Vav2hAZiCWWdpbw8dwVqueDbwjQGBIjc40YuS1+vSQOO1j8ayBH9nJAjW0R5xcTsvht1
	UnHg==
X-Gm-Message-State: APjAAAUo6GZLLai/8QKdR4YajhaH9xnpBZGR1fMMSbNIPbDBWhkj9DLB
	sZGXNAhiN72Itog+gR9bApBuHpFbGN2jo7YX/QSe9w==
X-Google-Smtp-Source: APXvYqxjaB/OsFQxfaCubYMVWCaOshi7DXqs34Veyh5sRUQD/AuRvwquHCJSQMVBC4xUOfiEVQKUqiJ0+uw4BWhWsy4=
X-Received: by 2002:a05:620a:1247:: with SMTP id
	a7mr2097255qkl.16.1573123313299; 
	Thu, 07 Nov 2019 02:41:53 -0800 (PST)
MIME-Version: 1.0
References: <20190925122349.14872-1-ross.burton@intel.com>
	<CAD0U-hJLV7F3K4VdX0GUKO9LRazWLz1rvp1xmWh6fzgzP3gcFQ@mail.gmail.com>
	<20191106160618.GC2398@hiutale>
	<e3de40a47b9b208f08c3123ad59c8caf25d581d6.camel@linuxfoundation.org>
	<20191107075931.GD2398@hiutale>
In-Reply-To: <20191107075931.GD2398@hiutale>
From: Ryan Harkin <ryan.harkin@linaro.org>
Date: Thu, 7 Nov 2019 10:41:42 +0000
Message-ID: <CAD0U-hK2UWoMU9kih_EtRTVRFKFscXFYpQhbHV_aRgZ9m2+c4A@mail.gmail.com>
To: Mikko.Rapeli@bmw.de
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: maintaining sumo (was Re: [PATCH][thud] cve-check: backport rewrite from master)
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
X-List-Received-Date: Thu, 07 Nov 2019 10:41:52 -0000
Content-Type: multipart/alternative; boundary="000000000000470cef0596bf5059"

--000000000000470cef0596bf5059
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Nov 2019 at 07:59, <Mikko.Rapeli@bmw.de> wrote:

> Hi,
>
> On Wed, Nov 06, 2019 at 05:53:27PM +0000, Richard Purdie wrote:
> > On Wed, 2019-11-06 at 16:06 +0000, Mikko.Rapeli@bmw.de wrote:
> > > Hi,
> > >
> > > On Wed, Nov 06, 2019 at 02:59:16PM +0000, Ryan Harkin wrote:
> > > > Hi Ross/Richard,
> > > >
> > > > I'd like this applied to Sumo also. Should I create a new patch and
> > > > send it
> > > > to the list, or is there a process for requesting this is cherry-
> > > > picked
> > > > across?
> > >
> > > I just posted the port of this and all other CVE scan related changes
> > > to sumo
> > >
> http://lists.openembedded.org/pipermail/openembedded-core/2019-November/288817.html
> > >
>

Thanks Mikko! That's a great help, I guess my question was good timing for
our mutual interest in Sumo.

> > But the question is valid :)
> >
> > Support for sumo officially ended. I can see a case that the broken CVE
> > tools there are a good reason we could consider merging the patch
> > series but we do need to be able to test it to merge it to the main
> > branch. If we can't test, we're merging blind and the quality the
> > project tries to deliver could be compromised.
> >
> > I have made some tweaks to the autobuilder which bring us closer to
> > being able to test sumo using the workers still around from that
> > release.
> >
> > The things that make me nervous are questions like:
> >
> > Which releases do we "open" for such patches? How far back do we go?
> > Which kinds of patches are acceptable?
> >
> > Note that sumo (and earlier) doesn't have much of the QA automation
> > which we've now built our processes around so we don't get test
> > reports.
> >
> > You mention wanting to change gcc. That means we really do need a full
> > retest of it to merge that (which is why it never happened originally
> > from what I remember).
> >
> > Also, the LTS proposal stated we needed someone to handle this work. We
> > have no such person, even if we do somehow find them, they can't be
> > expected to cover all the old releases and effectively turn all of them
> > into LTS releases. How can we get the funding to try and get some help
> > with handling this workload?
> >
> > I am probably going to try and make a case for sorting the CVE tooling
> > on sumo as I agree its bad and we should do something. Where do we draw
> > the line though.
> >
> > Basically, this looks like it could create a lot of extra work without
> > helping the core project under-resourcing we currently struggle with.
> > You can therefore see why I might be nervous :/.
>
> All this is understood.
>

Agreed. It's an expensive and tricky task.


> I need to maintain sumo in a project for a while longer so I can publish
> that work.
> The CVE checker patches are just a start.
>

Yes, the same is true for me. I need to maintain a Sumo distro until
mid-2020, at least. It uses the poky merge branch [1]. My support may
extend further when the time comes.


>
> Providing funding for Yocto Project LTS work is possible but a lot harder
> for me to do.
> Testing and publishing patches is much easier.
>

Not sure if it helps, but I have a Jenkins job that tests sumo on a trigger
(there is one for Warrior also):

https://ci.linaro.org/job/warp7-openembedded-sumo/

eg. it was triggered when Armin's patch was merged yesterday.

This builds Sumo, based on Linaro's OE-RPB distro for NXP WaRP7
(imx7s-warp). It then runs the build in our LAVA lab (although the boards
have gone down recently, they're normally up). Once the boards are up
again, I'll add ptest to the job, to give it a more thorough workout. I'll
also add the sumo-next branch to the list of build configurations.


> Could you clarify Yocto Project side answers to these questions:
>
> If I continue to publish patches for sumo, can I continue doing so on
> oe-core mailing list?
>
> If I continue to collect patches for sumo, can I do so using Yocto Project
> infrastructure, e.g.
> a sumo-contrib-lts or similar branch in poky git tree?
>
> If I continue to test patches, what would be the patch acceptance criteria
> and required testing?
> I would assume same as stable release rules, but maybe these need to be
> even stricter, e.g.
> only support building on Debian stable, following the LTS proposal. I'm
> testing in my own project
> trees and CI with target HW, and doing world builds on pure poky with qemu
> target. I could some
> kind of ptest execution to plain poky as well.
>
> Would any testing of patches be possible in Yocto Project infrastructure?
>
> All of these things I can do also completely outside of Yocto Project,
> e.g. publish a sumo
> git tree on github, and rely only on my own testing. But I'd like to see
> some co-operation here from other users who are stuck with sumo.
>
> -Mikko


[1] http://git.yoctoproject.org/git/poky

--000000000000470cef0596bf5059
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 7 Nov 2019 at 07:59, &lt;<a h=
ref=3D"mailto:Mikko.Rapeli@bmw.de">Mikko.Rapeli@bmw.de</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On Wed, Nov 06, 2019 at 05:53:27PM +0000, Richard Purdie wrote:<br>
&gt; On Wed, 2019-11-06 at 16:06 +0000, <a href=3D"mailto:Mikko.Rapeli@bmw.=
de" target=3D"_blank">Mikko.Rapeli@bmw.de</a> wrote:<br>
&gt; &gt; Hi,<br>
&gt; &gt; <br>
&gt; &gt; On Wed, Nov 06, 2019 at 02:59:16PM +0000, Ryan Harkin wrote:<br>
&gt; &gt; &gt; Hi Ross/Richard,<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; I&#39;d like this applied to Sumo also. Should I create a ne=
w patch and<br>
&gt; &gt; &gt; send it<br>
&gt; &gt; &gt; to the list, or is there a process for requesting this is ch=
erry-<br>
&gt; &gt; &gt; picked<br>
&gt; &gt; &gt; across?<br>
&gt; &gt; <br>
&gt; &gt; I just posted the port of this and all other CVE scan related cha=
nges<br>
&gt; &gt; to sumo<br>
&gt; &gt; <a href=3D"http://lists.openembedded.org/pipermail/openembedded-c=
ore/2019-November/288817.html" rel=3D"noreferrer" target=3D"_blank">http://=
lists.openembedded.org/pipermail/openembedded-core/2019-November/288817.htm=
l</a><br>
&gt; &gt; <br></blockquote><div><br></div><div>Thanks Mikko! That&#39;s a g=
reat help, I guess my question was good timing for our mutual interest in S=
umo.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; &gt; But the question is valid :)<br>
&gt; <br>
&gt; Support for sumo officially ended. I can see a case that the broken CV=
E<br>
&gt; tools there are a good reason we could consider merging the patch<br>
&gt; series but we do need to be able to test it to merge it to the main<br=
>
&gt; branch. If we can&#39;t test, we&#39;re merging blind and the quality =
the<br>
&gt; project tries to deliver could be compromised.<br>
&gt; <br>
&gt; I have made some tweaks to the autobuilder which bring us closer to<br=
>
&gt; being able to test sumo using the workers still around from that<br>
&gt; release.<br>
&gt; <br>
&gt; The things that make me nervous are questions like:<br>
&gt; <br>
&gt; Which releases do we &quot;open&quot; for such patches? How far back d=
o we go?<br>
&gt; Which kinds of patches are acceptable?<br>
&gt; <br>
&gt; Note that sumo (and earlier) doesn&#39;t have much of the QA automatio=
n<br>
&gt; which we&#39;ve now built our processes around so we don&#39;t get tes=
t<br>
&gt; reports.<br>
&gt; <br>
&gt; You mention wanting to change gcc. That means we really do need a full=
<br>
&gt; retest of it to merge that (which is why it never happened originally<=
br>
&gt; from what I remember).<br>
&gt; <br>
&gt; Also, the LTS proposal stated we needed someone to handle this work. W=
e<br>
&gt; have no such person, even if we do somehow find them, they can&#39;t b=
e<br>
&gt; expected to cover all the old releases and effectively turn all of the=
m<br>
&gt; into LTS releases. How can we get the funding to try and get some help=
<br>
&gt; with handling this workload?<br>
&gt; <br>
&gt; I am probably going to try and make a case for sorting the CVE tooling=
<br>
&gt; on sumo as I agree its bad and we should do something. Where do we dra=
w<br>
&gt; the line though.<br>
&gt; <br>
&gt; Basically, this looks like it could create a lot of extra work without=
<br>
&gt; helping the core project under-resourcing we currently struggle with.<=
br>
&gt; You can therefore see why I might be nervous :/.<br>
<br>
All this is understood.<br></blockquote><div><br></div><div>Agreed. It&#39;=
s an expensive and tricky task.</div><div><br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
I need to maintain sumo in a project for a while longer so I can publish th=
at work.<br>
The CVE checker patches are just a start.<br></blockquote><div><br></div><d=
iv>Yes, the same is true for me. I need to maintain a Sumo distro until mid=
-2020, at least. It uses the poky merge branch [1]. My support may extend f=
urther when the time comes.</div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
Providing funding for Yocto Project LTS work is possible but a lot harder f=
or me to do.<br>
Testing and publishing patches is much easier.<br></blockquote><div><br></d=
iv><div>Not sure if it helps, but I have a Jenkins job that tests sumo on a=
 trigger (there is one for Warrior also):</div><div><br></div><div><a href=
=3D"https://ci.linaro.org/job/warp7-openembedded-sumo/">https://ci.linaro.o=
rg/job/warp7-openembedded-sumo/</a></div><div><br></div><div>eg. it was tri=
ggered when=C2=A0Armin&#39;s patch was merged yesterday.</div><div><br></di=
v><div><div>This builds Sumo, based on Linaro&#39;s OE-RPB distro for NXP W=
aRP7 (imx7s-warp). It then runs the build in our LAVA lab (although the boa=
rds have gone down recently, they&#39;re normally up). Once the boards are =
up again, I&#39;ll add ptest to the job, to give it a more thorough workout=
. I&#39;ll also add the sumo-next branch to the list of build configuration=
s.</div></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
Could you clarify Yocto Project side answers to these questions:<br>
<br>
If I continue to publish patches for sumo, can I continue doing so on oe-co=
re mailing list?<br>
<br>
If I continue to collect patches for sumo, can I do so using Yocto Project =
infrastructure, e.g.<br>
a sumo-contrib-lts or similar branch in poky git tree?<br>
<br>
If I continue to test patches, what would be the patch acceptance criteria =
and required testing?<br>
I would assume same as stable release rules, but maybe these need to be eve=
n stricter, e.g.<br>
only support building on Debian stable, following the LTS proposal. I&#39;m=
 testing in my own project<br>
trees and CI with target HW, and doing world builds on pure poky with qemu =
target. I could some<br>
kind of ptest execution to plain poky as well.<br>
<br>
Would any testing of patches be possible in Yocto Project infrastructure?<b=
r>
<br>
All of these things I can do also completely outside of Yocto Project, e.g.=
 publish a sumo<br>
git tree on github, and rely only on my own testing. But I&#39;d like to se=
e<br>
some co-operation here from other users who are stuck with sumo.<br>
<br>
-Mikko</blockquote><div><br></div><div>[1]=C2=A0<a href=3D"http://git.yocto=
project.org/git/poky">http://git.yoctoproject.org/git/poky</a>=C2=A0</div><=
/div></div>

--000000000000470cef0596bf5059--
