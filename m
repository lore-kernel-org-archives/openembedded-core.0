Return-Path: <jefro.net@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 80A4C7820F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 16:24:15 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id r74so21497210wme.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Sep 2017 09:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=SYhH4a+ck4mtm3J0jb+QMCA1hvcfVMOXxbSL5GsIljI=;
	b=G8eBlmJD0kUqllFPMbhTEIyLJQGizm0ufCUV0ua7Fu0DbEYGp3ShEkk3fAbeCcYeek
	vaft7ABpcXyQraw+mm5A1TRvzhkNyMz93jLAszXv/0wqJJgWlU5rr5QFTWVHb+BESgQ2
	e41BZ9yDUtt8b7HRm0dWS/Yqw6Zc8sRtBM/G6+xfgyPGbY46fDo9TkGOuflcMW2/+S6I
	OVyH6UNMMGwwPYGhim8iDGxsqngXLfZJz2SJ4UZVbNeozbv5I22hREqr02plwl4kIMA2
	GuvB/kYJE7O66GzDecBKTqzA/+ki2lbFaX16WTAX+KNWVSXsXCi4gMX3e4+R5aKiujN1
	zPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=SYhH4a+ck4mtm3J0jb+QMCA1hvcfVMOXxbSL5GsIljI=;
	b=EeZEYEUFQnfisUaxQ3waZrNHsJhU9dAgXgQ3t86uDSdgoSuqqIJwQ5PayHmNpHhnex
	hiXzwB9oYuFHopQhebs0403w6dOjYAkAM2ODWOvRzdHjd1PcdnK7eULWL+hca/GBh558
	NUnH44caTUWgGXJj6XtgMzwYGm//BM565wmQXFHyP7rx6qfySbTNlqlLLfFsfrsT9IPg
	JZB/hDcoR2BEVwrp3x/Hn5RmJ4XCj2HaiEaOKPlCYWNAnwitlDcv4DqqG/QJ4bQUhvkP
	G3ZnTMVwEN3yNIQiVW0j+wifXBCHAwMNi8GcyHgfVnaXyyzQk5th1dOptj8xe/NF0f7V
	y51w==
X-Gm-Message-State: AHPjjUjamwex30yc2ahrLEg07vWEopcvrWi9qXX6S1TXcXbxBInQ8cok
	gCZCwvEeztHDZlkKUogon7lHCI1Ak/du/RdICDo=
X-Google-Smtp-Source: AOwi7QBdwiKK1GYb2UDjS9xoLinPaO0kpPM6CNPDLqUBFsXDS7fneJuHXd0N9g/XR6qkB7FTYWsClmQvqeLDzaWv9ds=
X-Received: by 10.28.224.4 with SMTP id x4mr752198wmg.85.1506356656149; Mon,
	25 Sep 2017 09:24:16 -0700 (PDT)
MIME-Version: 1.0
Sender: jefro.net@gmail.com
Received: by 10.223.134.180 with HTTP; Mon, 25 Sep 2017 09:23:55 -0700 (PDT)
In-Reply-To: <CAPybu_3tiZLD4vU6ZrH9iD4OB1wHibGWxFJ20wL_ynDeaLo-Yw@mail.gmail.com>
References: <37a76fa5-4f25-56dd-9616-4b4b23fbb093@balister.org>
	<CAB=otbS8_F_Yhisc+ybm8X1m3GXBzCK1q16YjrWATDArwVf+Hw@mail.gmail.com>
	<bdabbc35-fa12-55ae-5387-54da9204fd55@topic.nl>
	<CAHUNapRuc6RHNZXHGdN0TO2A0EwRgkT53bqqqM-DcwqKzUz55w@mail.gmail.com>
	<9e86f719-bcf9-132e-3a82-8c924385710d@topic.nl>
	<646f4edc-ff9f-7f2e-37a7-260cbd2af60d@balister.org>
	<ab1501ba-e625-61ac-c6f5-ce676531a473@gmail.com>
	<c2911001-d598-9e20-8463-085d5f4910db@balister.org>
	<CA+YB3rYwurx0i8oUGUkwWA3JMzTBJtFsijP_V0t+ncYVbOkW6A@mail.gmail.com>
	<CAPybu_1T63Vcw9N3VgVgj45gcUM8UgPqRkSAwaHhvyxWFU0Ztg@mail.gmail.com>
	<1a067fa9-8e5e-1f18-709d-15df07518928@balister.org>
	<CAPybu_3tiZLD4vU6ZrH9iD4OB1wHibGWxFJ20wL_ynDeaLo-Yw@mail.gmail.com>
From: Jeff Osier-Mixon <jefro@jefro.net>
Date: Mon, 25 Sep 2017 09:23:55 -0700
X-Google-Sender-Auth: QWHafaILQPy7hIRR62JiLrYh2ws
Message-ID: <CA+YB3rYipupFC2s_3gsfVSM6sZ5oAis1hAB491+tAXVEfEAPrg@mail.gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
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
X-List-Received-Date: Mon, 25 Sep 2017 16:24:16 -0000
Content-Type: multipart/alternative; boundary="001a114b14a2652159055a05fd94"

--001a114b14a2652159055a05fd94
Content-Type: text/plain; charset="UTF-8"

It certainly looks interesting! The  main issue is that our table is about
0.5 x 1.4 meters, so setting up demos as well as screens and keyboards may
be a difficult task. I'll do what I can to set up a second table at the
booth.

thanks!

On Mon, Sep 25, 2017 at 7:08 AM, Ricardo Ribalda Delgado <
ricardo.ribalda@gmail.com> wrote:

> Hi
>
> On Mon, Sep 25, 2017 at 4:05 PM, Philip Balister <philip@balister.org>
> wrote:
> > On 09/25/2017 10:00 AM, Ricardo Ribalda Delgado wrote:
> >> If you are looking for a "fun" demo. I plan to show our bottle scanner
> >> to the ELCE showcase. I could ask my manager if we can leave it on the
> >> yocto booth during the conference.
> >>
> >> We use yocto + our layer https://github.com/qtec/meta-qtec-core
> >
> > How large is it? Can you send us a photo?
>
> This is the last photo I have from the instrument. You can use the
> 50cl beer bottle as a reference ;).
>
> You also need a screen + keyboard to see the results.
>
> >
> > Philip
> >
> >>
> >> Regards!
> >>
> >> On Fri, Sep 22, 2017 at 10:49 PM, Jeff Osier-Mixon <jefro@jefro.net>
> wrote:
> >>> If its relevance to YP and OE is able to be explained, it would be
> welcomed.
> >>> The only issue I see is the size of the booth, which is tiny. However,
> we
> >>> frequently spill out of our confined space, and I will locate a second
> table
> >>> if we end up needing one. Great to see community effort on the demos!
> >>>
> >>> On Thu, Sep 21, 2017 at 1:56 PM, Philip Balister <philip@balister.org>
> >>> wrote:
> >>>>
> >>>> On 09/21/2017 02:32 PM, akuster808 wrote:
> >>>>>
> >>>>>
> >>>>> On 09/21/2017 01:27 PM, Philip Balister wrote:
> >>>>>> On 09/20/2017 01:50 AM, Mike Looijmans wrote:
> >>>>>>> On 18-09-17 18:25, Trevor Woerner wrote:
> >>>>>>>> Hi Mike,
> >>>>>>>>
> >>>>>>>> On Mon, Sep 18, 2017 at 8:45 AM, Mike Looijmans
> >>>>>>>> <mike.looijmans@topic.nl> wrote:
> >>>>>>>>> I can probably bring some work (e.g. Zynq MPSoC board) and fun
> >>>>>>>>> (settop box)
> >>>>>>>>> hardware along to demonstrate what I'm using OE for.
> >>>>>>>> Any chance you could set something up that could be on display at
> the
> >>>>>>>> Yocto booth during the conference?
> >>>>>>> Depends on what I'll be able tug along in my luggage on the
> airplane,
> >>>>>>> but whatever I can bring is probably suited for public display. A
> few
> >>>>>>> circuit boards will certainly fit, so if the stand could provide a
> >>>>>>> HDMI
> >>>>>>> monitor (or TV) to connect them to that'd be awesome.
> >>>>>> I'd love to see some different things on the stand. Make sure you
> help
> >>>>>> explain to people why the Yocto Porject and OpenEmbedded are
> important
> >>>>>> to you and your product.
> >>>>> Philip,
> >>>>>
> >>>>> Since you are the OE rep to the Yocto Project, can you make sure
> this is
> >>>>> OK with them. There could be space  or limitations at their booth.
> >>>>
> >>>> I mentioned it to Jefro, I'm also making a guess he has something
> based
> >>>> on a Xilinx product, who are members.
> >>>>
> >>>> Philip
> >>>>
> >>>>>
> >>>>> Thanks,
> >>>>> - Armin
> >>>>>>
> >>>>>> Philip
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>>> M.
> >>>>>>>
> >>>>>>>
> >>>>>>> Kind regards,
> >>>>>>>
> >>>>>>> Mike Looijmans
> >>>>>>> System Expert
> >>>>>>>
> >>>>>>> TOPIC Products
> >>>>>>> Materiaalweg 4, NL-5681 RJ Best
> >>>>>>> Postbus 440, NL-5680 AK Best
> >>>>>>> Telefoon: +31 (0) 499 33 69 79
> >>>>>>> E-mail: mike.looijmans@topicproducts.com
> >>>>>>> Website: www.topicproducts.com
> >>>>>>>
> >>>>>>> Please consider the environment before printing this e-mail
> >>>>>>>
> >>>>>>>
> >>>>>>> Visit us at the Space Tech Expo Europe (Stand E-71)
> >>>>>>>
> >>>>>
> >>>>>
> >>>> --
> >>>> _______________________________________________
> >>>> Openembedded-core mailing list
> >>>> Openembedded-core@lists.openembedded.org
> >>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>>
> >>>
> >>>
> >>>
> >>> --
> >>> Jeff Osier-Mixon - Open Source Community Manager, Intel Corporation
> >>>
> >>> --
> >>> _______________________________________________
> >>> Openembedded-core mailing list
> >>> Openembedded-core@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >>>
> >>
> >>
> >>
>
>
>
> --
> Ricardo Ribalda
>



-- 
Jeff Osier-Mixon - Open Source Community Manager, Intel Corporation

--001a114b14a2652159055a05fd94
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It certainly looks interesting! The =C2=A0main issue is th=
at our table is about 0.5 x 1.4 meters, so setting up demos as well as scre=
ens and keyboards may be a difficult task. I&#39;ll do what I can to set up=
 a second table at the booth.<div><br></div><div>thanks!</div></div><div cl=
ass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Mon, Sep 25, 2017 at =
7:08 AM, Ricardo Ribalda Delgado <span dir=3D"ltr">&lt;<a href=3D"mailto:ri=
cardo.ribalda@gmail.com" target=3D"_blank">ricardo.ribalda@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">Hi<br>
<span class=3D""><br>
On Mon, Sep 25, 2017 at 4:05 PM, Philip Balister &lt;<a href=3D"mailto:phil=
ip@balister.org">philip@balister.org</a>&gt; wrote:<br>
&gt; On 09/25/2017 10:00 AM, Ricardo Ribalda Delgado wrote:<br>
&gt;&gt; If you are looking for a &quot;fun&quot; demo. I plan to show our =
bottle scanner<br>
&gt;&gt; to the ELCE showcase. I could ask my manager if we can leave it on=
 the<br>
&gt;&gt; yocto booth during the conference.<br>
&gt;&gt;<br>
&gt;&gt; We use yocto + our layer <a href=3D"https://github.com/qtec/meta-q=
tec-core" rel=3D"noreferrer" target=3D"_blank">https://github.com/qtec/meta=
-<wbr>qtec-core</a><br>
&gt;<br>
&gt; How large is it? Can you send us a photo?<br>
<br>
</span>This is the last photo I have from the instrument. You can use the<b=
r>
50cl beer bottle as a reference ;).<br>
<br>
You also need a screen + keyboard to see the results.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Philip<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Regards!<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Sep 22, 2017 at 10:49 PM, Jeff Osier-Mixon &lt;<a href=3D"=
mailto:jefro@jefro.net">jefro@jefro.net</a>&gt; wrote:<br>
&gt;&gt;&gt; If its relevance to YP and OE is able to be explained, it woul=
d be welcomed.<br>
&gt;&gt;&gt; The only issue I see is the size of the booth, which is tiny. =
However, we<br>
&gt;&gt;&gt; frequently spill out of our confined space, and I will locate =
a second table<br>
&gt;&gt;&gt; if we end up needing one. Great to see community effort on the=
 demos!<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On Thu, Sep 21, 2017 at 1:56 PM, Philip Balister &lt;<a href=
=3D"mailto:philip@balister.org">philip@balister.org</a>&gt;<br>
&gt;&gt;&gt; wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On 09/21/2017 02:32 PM, akuster808 wrote:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; On 09/21/2017 01:27 PM, Philip Balister wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; On 09/20/2017 01:50 AM, Mike Looijmans wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; On 18-09-17 18:25, Trevor Woerner wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Hi Mike,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; On Mon, Sep 18, 2017 at 8:45 AM, Mike Looi=
jmans<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:mike.looijmans@topic=
.nl">mike.looijmans@topic.nl</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; I can probably bring some work (e.g. Z=
ynq MPSoC board) and fun<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; (settop box)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; hardware along to demonstrate what I&#=
39;m using OE for.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Any chance you could set something up that=
 could be on display at the<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; Yocto booth during the conference?<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Depends on what I&#39;ll be able tug along in =
my luggage on the airplane,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; but whatever I can bring is probably suited fo=
r public display. A few<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; circuit boards will certainly fit, so if the s=
tand could provide a<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; HDMI<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; monitor (or TV) to connect them to that&#39;d =
be awesome.<br>
&gt;&gt;&gt;&gt;&gt;&gt; I&#39;d love to see some different things on the s=
tand. Make sure you help<br>
&gt;&gt;&gt;&gt;&gt;&gt; explain to people why the Yocto Porject and OpenEm=
bedded are important<br>
&gt;&gt;&gt;&gt;&gt;&gt; to you and your product.<br>
&gt;&gt;&gt;&gt;&gt; Philip,<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Since you are the OE rep to the Yocto Project, can you=
 make sure this is<br>
&gt;&gt;&gt;&gt;&gt; OK with them. There could be space=C2=A0 or limitation=
s at their booth.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I mentioned it to Jefro, I&#39;m also making a guess he ha=
s something based<br>
&gt;&gt;&gt;&gt; on a Xilinx product, who are members.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Philip<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Thanks,<br>
&gt;&gt;&gt;&gt;&gt; - Armin<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Philip<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; M.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Kind regards,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Mike Looijmans<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; System Expert<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; TOPIC Products<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Materiaalweg 4, NL-5681 RJ Best<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Postbus 440, NL-5680 AK Best<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Telefoon: <a href=3D"tel:%2B31%20%280%29%20499=
%2033%2069%2079" value=3D"+31499336979">+31 (0) 499 33 69 79</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; E-mail: <a href=3D"mailto:mike.looijmans@topic=
products.com">mike.looijmans@topicproducts.<wbr>com</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Website: <a href=3D"http://www.topicproducts.c=
om" rel=3D"noreferrer" target=3D"_blank">www.topicproducts.com</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Please consider the environment before printin=
g this e-mail<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Visit us at the Space Tech Expo Europe (Stand =
E-71)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt;&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt;&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org=
">Openembedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/=
openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openem=
bedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; Jeff Osier-Mixon - Open Source Community Manager, Intel Corpor=
ation<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt;&gt; Openembedded-core mailing list<br>
&gt;&gt;&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Op=
enembedded-core@lists.<wbr>openembedded.org</a><br>
&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/open=
embedded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedd=
ed.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
<br>
<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
Ricardo Ribalda<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div di=
r=3D"ltr"><div>Jeff Osier-Mixon - Open Source Community Manager, Intel Corp=
oration</div></div></div>
</div>

--001a114b14a2652159055a05fd94--
