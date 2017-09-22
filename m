Return-Path: <jefro.net@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 16A6C783C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 20:49:39 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id m72so6902717wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 13:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=6/KaHD9YlsBcvt6rSZIfM6wne+7fHpV7q1FtvAPr1ec=;
	b=Yj0uovnp9ijzGUZgT4+kmBp39qjWdDTS8RpVNoUC+OvX1JKuAA0eV3dkGJfarbpBkq
	zVr88SNGkzP/eqjD2U1KIJziUgFrOt9nl1CoFuh90r0IJwRQqbpIpYKCZwlr9NTSKP9H
	Z3T+Oo338+8tA70j/lOYOQC7si4JEP3IlbGeH730qZoLhfn73M73lzsiqE4+TEAdNnxP
	EnWF2jmWwyYPPCrEjj0kK9oNPLexzxCkqHLS7uOFWXHybqedBA5F6W1lOAXdkiC5m8ZR
	L+dOLiPxKtFgzwvnM+Jl+rgR7MSHm5j9qZr4c4wJUI6tmFNYn35u4Wkt1GJ0VQM/VV+O
	uRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=6/KaHD9YlsBcvt6rSZIfM6wne+7fHpV7q1FtvAPr1ec=;
	b=m3LPl9uSHWMxO2Zse3uON7ea3IMKsmREARASVzPmrByqy5JVtI0Rq3fOBg2auEF8Ro
	N3rwvS8bQnIeP6NbP837WwQ9ydYRqR3rrVuJ1XlUoeLELArKpVc58PcPzrt7PaeexLsd
	si7KGkayGLBfz2VO31e4852A/wA0gHY6squHjr+k77/KSU7JDSDWuqDesErKYsfJ63lI
	pUrEE9WsTPECj7njqsTlLwhy6Vlc4UPDNbwgHn/i84tXh2plr9j+B/8eMjLQqOR31wHu
	rngANEZnyzxR2Uws7/dFHbzjU1LwZnAYQbvDWHjSjZHyGxVhWz+chS8ST9vrdwcOVXuC
	lCTg==
X-Gm-Message-State: AHPjjUjWBrjdrkClJacCc9h+Nkv8+JBi8++YHuMVZoDDmCVXYRcIPCMP
	Tb7U9yi/hQrKIDQibXjexvrFbCZ3sSBz1vhKNiU=
X-Google-Smtp-Source: AOwi7QD5i1iW9jywnpzQvf1r4+Y8LKsm98ZxWz38Ds/PnMeFWlneBRT/tOIS/i0EwwfXMNzxdmzRIpABLsvWVGbF+Y0=
X-Received: by 10.28.228.213 with SMTP id b204mr4754629wmh.157.1506113380027; 
	Fri, 22 Sep 2017 13:49:40 -0700 (PDT)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.223.134.180 with HTTP; Fri, 22 Sep 2017 13:49:19 -0700 (PDT)
In-Reply-To: <c2911001-d598-9e20-8463-085d5f4910db@balister.org>
References: <37a76fa5-4f25-56dd-9616-4b4b23fbb093@balister.org>
	<CAB=otbS8_F_Yhisc+ybm8X1m3GXBzCK1q16YjrWATDArwVf+Hw@mail.gmail.com>
	<bdabbc35-fa12-55ae-5387-54da9204fd55@topic.nl>
	<CAHUNapRuc6RHNZXHGdN0TO2A0EwRgkT53bqqqM-DcwqKzUz55w@mail.gmail.com>
	<9e86f719-bcf9-132e-3a82-8c924385710d@topic.nl>
	<646f4edc-ff9f-7f2e-37a7-260cbd2af60d@balister.org>
	<ab1501ba-e625-61ac-c6f5-ce676531a473@gmail.com>
	<c2911001-d598-9e20-8463-085d5f4910db@balister.org>
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Fri, 22 Sep 2017 13:49:19 -0700
X-Google-Sender-Auth: oA7TWAE9nguxKJ7vv81ztYbEoPg
Message-ID: <CA+YB3rYwurx0i8oUGUkwWA3JMzTBJtFsijP_V0t+ncYVbOkW6A@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OpenEmbedded Developer Meeting Oct 22, 2017 in Prague (before ELCE)
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
X-List-Received-Date: Fri, 22 Sep 2017 20:49:41 -0000
Content-Type: multipart/alternative; boundary="001a114b0be20215200559cd59c3"

--001a114b0be20215200559cd59c3
Content-Type: text/plain; charset="UTF-8"

If its relevance to YP and OE is able to be explained, it would be
welcomed. The only issue I see is the size of the booth, which is tiny.
However, we frequently spill out of our confined space, and I will locate a
second table if we end up needing one. Great to see community effort on the
demos!

On Thu, Sep 21, 2017 at 1:56 PM, Philip Balister <philip@balister.org>
wrote:

> On 09/21/2017 02:32 PM, akuster808 wrote:
> >
> >
> > On 09/21/2017 01:27 PM, Philip Balister wrote:
> >> On 09/20/2017 01:50 AM, Mike Looijmans wrote:
> >>> On 18-09-17 18:25, Trevor Woerner wrote:
> >>>> Hi Mike,
> >>>>
> >>>> On Mon, Sep 18, 2017 at 8:45 AM, Mike Looijmans
> >>>> <mike.looijmans@topic.nl> wrote:
> >>>>> I can probably bring some work (e.g. Zynq MPSoC board) and fun
> >>>>> (settop box)
> >>>>> hardware along to demonstrate what I'm using OE for.
> >>>> Any chance you could set something up that could be on display at the
> >>>> Yocto booth during the conference?
> >>> Depends on what I'll be able tug along in my luggage on the airplane,
> >>> but whatever I can bring is probably suited for public display. A few
> >>> circuit boards will certainly fit, so if the stand could provide a HDMI
> >>> monitor (or TV) to connect them to that'd be awesome.
> >> I'd love to see some different things on the stand. Make sure you help
> >> explain to people why the Yocto Porject and OpenEmbedded are important
> >> to you and your product.
> > Philip,
> >
> > Since you are the OE rep to the Yocto Project, can you make sure this is
> > OK with them. There could be space  or limitations at their booth.
>
> I mentioned it to Jefro, I'm also making a guess he has something based
> on a Xilinx product, who are members.
>
> Philip
>
> >
> > Thanks,
> > - Armin
> >>
> >> Philip
> >>
> >>
> >>
> >>> M.
> >>>
> >>>
> >>> Kind regards,
> >>>
> >>> Mike Looijmans
> >>> System Expert
> >>>
> >>> TOPIC Products
> >>> Materiaalweg 4, NL-5681 RJ Best
> >>> Postbus 440, NL-5680 AK Best
> >>> Telefoon: +31 (0) 499 33 69 79
> >>> E-mail: mike.looijmans@topicproducts.com
> >>> Website: www.topicproducts.com
> >>>
> >>> Please consider the environment before printing this e-mail
> >>>
> >>>
> >>> Visit us at the Space Tech Expo Europe (Stand E-71)
> >>>
> >
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
Jeff Osier-Mixon - Open Source Community Manager, Intel Corporation

--001a114b0be20215200559cd59c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If its relevance to YP and OE is able to be explained, it =
would be welcomed. The only issue I see is the size of the booth, which is =
tiny. However, we frequently spill out of our confined space, and I will lo=
cate a second table if we end up needing one. Great to see community effort=
 on the demos!</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On Thu, Sep 21, 2017 at 1:56 PM, Philip Balister <span dir=3D"ltr">&lt;<=
a href=3D"mailto:philip@balister.org" target=3D"_blank">philip@balister.org=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">O=
n 09/21/2017 02:32 PM, akuster808 wrote:<br>
&gt;<br>
&gt;<br>
&gt; On 09/21/2017 01:27 PM, Philip Balister wrote:<br>
&gt;&gt; On 09/20/2017 01:50 AM, Mike Looijmans wrote:<br>
&gt;&gt;&gt; On 18-09-17 18:25, Trevor Woerner wrote:<br>
&gt;&gt;&gt;&gt; Hi Mike,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On Mon, Sep 18, 2017 at 8:45 AM, Mike Looijmans<br>
&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:mike.looijmans@topic.nl">mike.looijm=
ans@topic.nl</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt; I can probably bring some work (e.g. Zynq MPSoC board)=
 and fun<br>
&gt;&gt;&gt;&gt;&gt; (settop box)<br>
&gt;&gt;&gt;&gt;&gt; hardware along to demonstrate what I&#39;m using OE fo=
r.<br>
&gt;&gt;&gt;&gt; Any chance you could set something up that could be on dis=
play at the<br>
&gt;&gt;&gt;&gt; Yocto booth during the conference?<br>
&gt;&gt;&gt; Depends on what I&#39;ll be able tug along in my luggage on th=
e airplane,<br>
&gt;&gt;&gt; but whatever I can bring is probably suited for public display=
. A few<br>
&gt;&gt;&gt; circuit boards will certainly fit, so if the stand could provi=
de a HDMI<br>
&gt;&gt;&gt; monitor (or TV) to connect them to that&#39;d be awesome.<br>
&gt;&gt; I&#39;d love to see some different things on the stand. Make sure =
you help<br>
&gt;&gt; explain to people why the Yocto Porject and OpenEmbedded are impor=
tant<br>
&gt;&gt; to you and your product.<br>
&gt; Philip,<br>
&gt;<br>
&gt; Since you are the OE rep to the Yocto Project, can you make sure this =
is<br>
&gt; OK with them. There could be space=C2=A0 or limitations at their booth=
.<br>
<br>
</span>I mentioned it to Jefro, I&#39;m also making a guess he has somethin=
g based<br>
on a Xilinx product, who are members.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Philip<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Thanks,<br>
&gt; - Armin<br>
&gt;&gt;<br>
&gt;&gt; Philip<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; M.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Kind regards,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Mike Looijmans<br>
&gt;&gt;&gt; System Expert<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; TOPIC Products<br>
&gt;&gt;&gt; Materiaalweg 4, NL-5681 RJ Best<br>
&gt;&gt;&gt; Postbus 440, NL-5680 AK Best<br>
&gt;&gt;&gt; Telefoon: <a href=3D"tel:%2B31%20%280%29%20499%2033%2069%2079"=
 value=3D"+31499336979">+31 (0) 499 33 69 79</a><br>
&gt;&gt;&gt; E-mail: <a href=3D"mailto:mike.looijmans@topicproducts.com">mi=
ke.looijmans@topicproducts.<wbr>com</a><br>
&gt;&gt;&gt; Website: <a href=3D"http://www.topicproducts.com" rel=3D"noref=
errer" target=3D"_blank">www.topicproducts.com</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Please consider the environment before printing this e-mail<br=
>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Visit us at the Space Tech Expo Europe (Stand E-71)<br>
&gt;&gt;&gt;<br>
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
<div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div>Jeff Osier-Mixon - Open Source Community Manager, Intel Corpo=
ration</div></div></div>
</div>

--001a114b0be20215200559cd59c3--
