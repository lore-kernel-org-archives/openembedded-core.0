Return-Path: <kad@kad.name>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8A70E6E26B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 14:05:51 +0000 (UTC)
Received: by ioii196 with SMTP id i196so61679482ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 07:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=hv6QqtRSRzMToNNN83NBvq/gLuo8Mnwj9JInhXtYV+c=;
	b=FHOa2w6PYAFWb4COp+sQxeoR2uNc8Q2R5DFWx3RUYZ4kF2achvy8DedfTTWajsLfvA
	2vj/YaT2oTsVwNJqEeyPLi03rRoDGmtGzpIo3yZIHMh3cNqdGc0/fSu/2RcJLAw36kD3
	+Npwzi2RoFMN8aZQ7AhMU3y3tnp80edhqU5IiMUkfkq4ZMVml4PL6qaJ4ymcsaZEedzv
	ohFxAi328zITraP1DQ+U/PLbairGAQ00hWAIqDOPAHu5L8kSOtElIx/n7y4qzHqnzDWB
	zkSHsgXtZuRfGxAG05VFgywWJlvMTiqOUs9VDiBobwoZyZ/qYozCZyReOg/7cWtguadc
	qCqg==
X-Gm-Message-State: ALoCoQm3OQyMONsc9CoWvVMpyUMQmJDbPmboKe9IwVwnR8PjUGG/AVqTuuatHTbH0oI8jraXKvMx
MIME-Version: 1.0
X-Received: by 10.107.25.71 with SMTP id 68mr32972254ioz.46.1441893950712;
	Thu, 10 Sep 2015 07:05:50 -0700 (PDT)
Received: by 10.107.36.196 with HTTP; Thu, 10 Sep 2015 07:05:50 -0700 (PDT)
In-Reply-To: <20150908210642.GG2381@jama>
References: <8B394616-9009-4FF4-828C-561A859D34B3@gmail.com>
	<20150901215512.GE2458@jama>
	<CAP9ODKq=HsV79hXhHeCwdhpF6uhHdCxYrhC53Kt5+Pe6Qdpf1w@mail.gmail.com>
	<255516EC-098E-457B-A2E6-2F7C953CAA8D@gmail.com>
	<CAP9ODKp9Vkw-vHNp1PMqE1eTfmW8-s5o6+0JYTv=sFEHm9nc1g@mail.gmail.com>
	<1441177787.24871.33.camel@linuxfoundation.org>
	<55EF2670.6040101@gmail.com>
	<CAMKF1sogs9sRR_07nOxZrvvOxXj_=ioqNr=_vN+hr+VFf2BO6A@mail.gmail.com>
	<20150908210642.GG2381@jama>
Date: Thu, 10 Sep 2015 17:05:50 +0300
Message-ID: <CANFkWp=+xi6AVh-b1+-iGPsbqeXCr8ByORJUWiVMaQh+kUkQwg@mail.gmail.com>
From: Alexander Kanevskiy <kad@kad.name>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Patch merge process
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
X-List-Received-Date: Thu, 10 Sep 2015 14:05:52 -0000
Content-Type: multipart/alternative; boundary=001a113ff20ebc8541051f6518fc

--001a113ff20ebc8541051f6518fc
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 9, 2015 at 12:06 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Tue, Sep 08, 2015 at 11:39:17AM -0700, Khem Raj wrote:
> > On Tue, Sep 8, 2015 at 11:18 AM, Trevor Woerner <twoerner@gmail.com>
> wrote:
> > > If Richard doesn't want to use gerrit for OE-core, that doesn't exclude
> > > others from using it for the layers they manage, does it?
> >
> > yes, however, we should prefer this to run on oe domain, its better
> > for project and then if most of layers use it its fine too, it could
> > end up
> > with same situation as patchwork where oe-core and bitbake do not use
> > it actively. other layers do. its not ideal situation but its ok as
> > long as
> > its makes people productive, we could be open for options its matter
> > of volunteers then maintaining the infra for these services.
>
> I agree, there are not technical reasons for not using it for other
> layers, but once we ask contributors to create account on gerrit and
> submit all patches through gerrit for *some* layers, then these people
> will ask why oe-core and bitbake submissions are different.
>
> I should also say that I really like gerrit work-flow and review, but if
> people continue to send patches to e-mail and someone else will need to
> add Change-Ids to them and consolidate them into review-chains, than
> it's not as great as it could be if all related people "buy-it" and use
> it exclusively.
>
>
Gerrit, despite its good ability to integrate into existing infrastructures
might be not the best solution for OE, and I must admit, gerrit is not the
best tool in the world for reviews, as there are limits in it like missing
ability to review properly series of patches.

However, for people who don't like Gerrit, there is also always a
possibility to use GitHub or something similar, like locally hosted GitLab
if OE don't want to be dependant on external service.


> Regards,
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


-- 
br, Alexander Kanevskiy

--001a113ff20ebc8541051f6518fc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Sep 9, 2015 at 12:06 AM, Martin Jansa <span dir=3D"ltr">&lt;<a =
href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,=
204);border-left-style:solid;padding-left:1ex"><span class=3D"">On Tue, Sep=
 08, 2015 at 11:39:17AM -0700, Khem Raj wrote:<br>
&gt; On Tue, Sep 8, 2015 at 11:18 AM, Trevor Woerner &lt;<a href=3D"mailto:=
twoerner@gmail.com">twoerner@gmail.com</a>&gt; wrote:<br>
&gt; &gt; If Richard doesn&#39;t want to use gerrit for OE-core, that doesn=
&#39;t exclude<br>
&gt; &gt; others from using it for the layers they manage, does it?<br>
&gt;<br>
&gt; yes, however, we should prefer this to run on oe domain, its better<br=
>
&gt; for project and then if most of layers use it its fine too, it could<b=
r>
&gt; end up<br>
&gt; with same situation as patchwork where oe-core and bitbake do not use<=
br>
&gt; it actively. other layers do. its not ideal situation but its ok as<br=
>
&gt; long as<br>
&gt; its makes people productive, we could be open for options its matter<b=
r>
&gt; of volunteers then maintaining the infra for these services.<br>
<br>
</span>I agree, there are not technical reasons for not using it for other<=
br>
layers, but once we ask contributors to create account on gerrit and<br>
submit all patches through gerrit for *some* layers, then these people<br>
will ask why oe-core and bitbake submissions are different.<br>
<br>
I should also say that I really like gerrit work-flow and review, but if<br=
>
people continue to send patches to e-mail and someone else will need to<br>
add Change-Ids to them and consolidate them into review-chains, than<br>
it&#39;s not as great as it could be if all related people &quot;buy-it&quo=
t; and use<br>
it exclusively.<br>
<br></blockquote><div><br></div><div style=3D"font-size:12.8px"><span class=
=3D"">Gerrit</span>, despite its good ability to integrate into existing in=
frastructures might be not the best solution for OE, and I must admit,=C2=
=A0<span class=3D"">gerrit</span>=C2=A0is not the best tool in the world fo=
r reviews, as there are limits in it like missing ability to review properl=
y series of patches.</div><div style=3D"font-size:12.8px"><br></div><div><s=
pan style=3D"font-size:12.8px">However, for people who don&#39;t like</span=
><span style=3D"font-size:12.8px">=C2=A0</span><span class=3D"" style=3D"fo=
nt-size:12.8px">Gerrit</span><span style=3D"font-size:12.8px">, there is al=
so always a possibility to use GitHub or something similar, like locally ho=
sted GitLab if OE don&#39;t want to be dependant on external service.</span=
></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex">
Regards,<br>
<div class=3D""><div class=3D"h5"><br>
--<br>
Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mailto:Ma=
rtin.Jansa@gmail.com">Martin.Jansa@gmail.com</a><br>
</div></div><br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
<br></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div cla=
ss=3D"gmail_signature">br, Alexander Kanevskiy</div>
</div></div>

--001a113ff20ebc8541051f6518fc--
