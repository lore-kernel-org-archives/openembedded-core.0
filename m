Return-Path: <ka6sox@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id EEE4C7404E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 17:56:43 +0000 (UTC)
Received: by igcpb10 with SMTP id pb10so41233500igc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 10:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=AYHYWfascb/ilOnTc2uyC3v4x8ocaKIX6S07QaEeZlE=;
	b=jq0Gn8uTli/vayGnL2x0i4wL7MkgzbYQ2Y46cj+hETPlEvnJuFcqSKCKLW5rWwcsnk
	Jh3yKkv+khIG3Rivs5ch2yHL3o6dt0YQ1oJwLMIvFe/r1+smQ7KgmQM/f367lNCu9qGs
	j9rJIB+TNHdF0rYdkoxTEe968dAF5txzHj4whAlIv0lbgQ2VpeegmN6KKtXgKsCjSbUQ
	LXARi11BbCWlGiPaXzYZSrB9b/rGWzEpC9RfD12jTvKK0k2lZA8n/bXNoyOGh7ryiFQt
	l1GKFJm658ez5Zc3XY1S/8z3W4rWprClzLVKwNqRKhEf11u7CAA2f41V/CTbuXu6OQPG
	DHyg==
MIME-Version: 1.0
X-Received: by 10.50.50.240 with SMTP id f16mr35198238igo.95.1442599002597;
	Fri, 18 Sep 2015 10:56:42 -0700 (PDT)
Received: by 10.36.112.75 with HTTP; Fri, 18 Sep 2015 10:56:42 -0700 (PDT)
In-Reply-To: <20150918173055.GB2385@jama>
References: <20150907151449.GB2457@jama>
	<20150918173055.GB2385@jama>
Date: Fri, 18 Sep 2015 10:56:42 -0700
Message-ID: <CAHQecY67ET70Gz30Hunm6CFiuV4uw5By-M+2WUK1dstyz9_UFw@mail.gmail.com>
From: Tom King <ka6sox@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: World builds HW Was: [PATCH 04/12] gnome-icon-theme: remove the recipe
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
X-List-Received-Date: Fri, 18 Sep 2015 17:56:46 -0000
Content-Type: multipart/alternative; boundary=047d7bd76c001a703505200941e1

--047d7bd76c001a703505200941e1
Content-Type: text/plain; charset=UTF-8

Martin, Randy et.al.:

I'm moving around things such that I can give Martin a full builder:

24Cores, 256GB RAM,  up to 3TB storage from the donation that HP made to
WebOS-Ports (as I consider it essential to webOS-Ports that OE has a strong
foundation)

Tom

On Fri, Sep 18, 2015 at 10:30 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Fri, Sep 18, 2015 at 12:24:00PM -0400, Randy MacLeod wrote:
> > On 2015-09-07 11:14 AM, Martin Jansa wrote:
> > > Full jenkins build test takes over 3 days (depending on sstate reuse,
> > > one MACHINE can take more than 24 hours), so if I add them to
> > > master-next after it's merged to oe-core it will take 3-6 days to
> > > build-test them (6 days if they are sent just after current queue is
> > > sent for build).
> >
> > Hi Martin,
>
> Hi Randy,
>
> > Replying privately but you can add the list back in your
> > reply if you like.
>
> OK, adding both MLs
>
> > I never build all of meta-oe but a day seems like a long time.
> > On a 3-4 year old 24 core system, with 64 GB RAM and
> > 2 large disks, I build oe-core + a whitelist of meta-oe + misc layers in
> > 5 hours using 18.3 of the 24 cores on average.
> > What are the specs of your build machine?
>
> It's one of VMs running on box donated by HP to webos-ports project. It
> has access to 8 E5-2630L 0 @ 2.00GHz cores (from IIRC 24) and slow IO
> which we try to compensate a bit by using tmpfs for TMPDIR, VM has 80G
> RAM, so I'm using 72G for tmpfs.
>
> Tom: please fill-in the gaps, I don't know any details about the real HW
> it's running on.
>
> The same machine is also running some webos-ports builds sometimes.
>
> BUT be aware that my world build is much bigger than what you're
> probably building and changes in oe-core almost always ensure very low
> sstate reuse.
>
> e.g. last build with only small oe-core upgrade since previous build:
> NOTE: Tasks Summary: Attempted 33283 tasks of which 5252 didn't need to be
> rerun and 33 failed.
> NOTE: Build completion summary:
> NOTE:   do_populate_sysroot: 21% sstate reuse (485 setscene, 1750 scratch)
> NOTE:   do_package_qa: 12% sstate reuse (262 setscene, 1760 scratch)
> NOTE:   do_package: 4% sstate reuse (76 setscene, 1750 scratch)
> NOTE:   do_packagedata: 13% sstate reuse (281 setscene, 1750 scratch)
> NOTE:   do_package_write_ipk: 12% sstate reuse (262 setscene, 1756 scratch)
> NOTE:   do_populate_lic: 22% sstate reuse (521 setscene, 1806 scratch)
>
> real    1485m40.070s
> user    4166m49.125s
> sys     2825m50.068s
>
> BTW: you can see all this information in the world logs I'm sending to MLs
> (but not all the builds make it to ML report).
>
> > A decent build box these days has 32+ cores, 64+ GB RAM  and
> > and SSD or RAID disk filesystem. The costs of such a system
> > are significant but worth it given the number of people's time
> > involved in meta-oe.
>
> That's true, but I have to do with what I have available :).
>
> > Also, it would be nice if OE had a few such machines each
> > working on builds for a MACHINE to reduce your turn-around
> > to more like a day or so. :)
>
> Yes, it would be nice, I'm trying to get Tom King to set another VM like
> this in another location (another HP donated server), hopefully he will
> finish it soon.
>
> It's all hosted together with OE infrastructure, bandwidth is limited, but
> all I need for these builds is to fetch sources and upload the logs, there
> are no package feeds or sstate from these builds usable outside, but now it
> rsync the downloaded sources to sources.openembedded.org
>
> If you know about some idling build servers, I would like to give them
> something to do :).
>
> Regards,
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

--047d7bd76c001a703505200941e1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Martin, Randy <a href=3D"http://et.al">et.al</a>.:<div><br=
></div><div>I&#39;m moving around things such that I can give Martin a full=
 builder:</div><div><br></div><div>24Cores, 256GB RAM, =C2=A0up to 3TB stor=
age from the donation that HP made to WebOS-Ports (as I consider it essenti=
al to webOS-Ports that OE has a strong foundation)</div><div><br></div><div=
>Tom</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">O=
n Fri, Sep 18, 2015 at 10:30 AM, Martin Jansa <span dir=3D"ltr">&lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, Sep 18, 20=
15 at 12:24:00PM -0400, Randy MacLeod wrote:<br>
&gt; On 2015-09-07 11:14 AM, Martin Jansa wrote:<br>
&gt; &gt; Full jenkins build test takes over 3 days (depending on sstate re=
use,<br>
&gt; &gt; one MACHINE can take more than 24 hours), so if I add them to<br>
&gt; &gt; master-next after it&#39;s merged to oe-core it will take 3-6 day=
s to<br>
&gt; &gt; build-test them (6 days if they are sent just after current queue=
 is<br>
&gt; &gt; sent for build).<br>
&gt;<br>
&gt; Hi Martin,<br>
<br>
Hi Randy,<br>
<br>
&gt; Replying privately but you can add the list back in your<br>
&gt; reply if you like.<br>
<br>
OK, adding both MLs<br>
<br>
&gt; I never build all of meta-oe but a day seems like a long time.<br>
&gt; On a 3-4 year old 24 core system, with 64 GB RAM and<br>
&gt; 2 large disks, I build oe-core + a whitelist of meta-oe + misc layers =
in<br>
&gt; 5 hours using 18.3 of the 24 cores on average.<br>
&gt; What are the specs of your build machine?<br>
<br>
It&#39;s one of VMs running on box donated by HP to webos-ports project. It=
<br>
has access to 8 E5-2630L 0 @ 2.00GHz cores (from IIRC 24) and slow IO<br>
which we try to compensate a bit by using tmpfs for TMPDIR, VM has 80G<br>
RAM, so I&#39;m using 72G for tmpfs.<br>
<br>
Tom: please fill-in the gaps, I don&#39;t know any details about the real H=
W<br>
it&#39;s running on.<br>
<br>
The same machine is also running some webos-ports builds sometimes.<br>
<br>
BUT be aware that my world build is much bigger than what you&#39;re<br>
probably building and changes in oe-core almost always ensure very low<br>
sstate reuse.<br>
<br>
e.g. last build with only small oe-core upgrade since previous build:<br>
NOTE: Tasks Summary: Attempted 33283 tasks of which 5252 didn&#39;t need to=
 be rerun and 33 failed.<br>
NOTE: Build completion summary:<br>
NOTE:=C2=A0 =C2=A0do_populate_sysroot: 21% sstate reuse (485 setscene, 1750=
 scratch)<br>
NOTE:=C2=A0 =C2=A0do_package_qa: 12% sstate reuse (262 setscene, 1760 scrat=
ch)<br>
NOTE:=C2=A0 =C2=A0do_package: 4% sstate reuse (76 setscene, 1750 scratch)<b=
r>
NOTE:=C2=A0 =C2=A0do_packagedata: 13% sstate reuse (281 setscene, 1750 scra=
tch)<br>
NOTE:=C2=A0 =C2=A0do_package_write_ipk: 12% sstate reuse (262 setscene, 175=
6 scratch)<br>
NOTE:=C2=A0 =C2=A0do_populate_lic: 22% sstate reuse (521 setscene, 1806 scr=
atch)<br>
<br>
real=C2=A0 =C2=A0 1485m40.070s<br>
user=C2=A0 =C2=A0 4166m49.125s<br>
sys=C2=A0 =C2=A0 =C2=A02825m50.068s<br>
<br>
BTW: you can see all this information in the world logs I&#39;m sending to =
MLs<br>
(but not all the builds make it to ML report).<br>
<br>
&gt; A decent build box these days has 32+ cores, 64+ GB RAM=C2=A0 and<br>
&gt; and SSD or RAID disk filesystem. The costs of such a system<br>
&gt; are significant but worth it given the number of people&#39;s time<br>
&gt; involved in meta-oe.<br>
<br>
That&#39;s true, but I have to do with what I have available :).<br>
<br>
&gt; Also, it would be nice if OE had a few such machines each<br>
&gt; working on builds for a MACHINE to reduce your turn-around<br>
&gt; to more like a day or so. :)<br>
<br>
Yes, it would be nice, I&#39;m trying to get Tom King to set another VM lik=
e<br>
this in another location (another HP donated server), hopefully he will<br>
finish it soon.<br>
<br>
It&#39;s all hosted together with OE infrastructure, bandwidth is limited, =
but<br>
all I need for these builds is to fetch sources and upload the logs, there<=
br>
are no package feeds or sstate from these builds usable outside, but now it=
<br>
rsync the downloaded sources to <a href=3D"http://sources.openembedded.org"=
 rel=3D"noreferrer" target=3D"_blank">sources.openembedded.org</a><br>
<br>
If you know about some idling build servers, I would like to give them<br>
something to do :).<br>
<br>
Regards,<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mailto:Ma=
rtin.Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
</font></span></blockquote></div><br></div>

--047d7bd76c001a703505200941e1--
