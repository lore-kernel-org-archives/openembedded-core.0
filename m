X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <d4cda8f3a34e4c0757ffdb2393575749a18b11ed.camel@igalia.com>
Subject: Re: [OE-core] [hardknott][PATCH v2 ] mesa: Add patches for red label issues on video for VC4 and Freedreno
From: "Pablo Saavedra Rodi?o" <psaavedra@igalia.com>
Date: Mon, 27 Sep 2021 11:26:31 +0200
In-Reply-To: <16A78CB146CA0532.15719@lists.openembedded.org>
References: 
	<CANPvuR=W+REiC0t0mN1H_B4dzpXDVpSv+WwrJhBVX1CPGKEJgQ@mail.gmail.com>
	 <20210923151723.3435155-1-psaavedra@igalia.com>
	 <CANNYZj_adECA+Vn1aM-9arV2JXckDT5Y6+T+Hr4gzpQs0kqv2g@mail.gmail.com>
	 <eecd36d1edb8fb6a25bba430505f223c021b8302.camel@igalia.com>
	 <CANNYZj8+PEXuuGCUdqs2+T+-F-q1_VWczhZqdtebZeHF-9ieLw@mail.gmail.com>
	 <16A78CB146CA0532.15719@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-xna7LRz2B0kaEL2HNKUY"
List-id: <openembedded-core.lists.openembedded.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>

--=-xna7LRz2B0kaEL2HNKUY
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

I got answer from Mesa with a new proposed fix in gallium for this
problem:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/13038

I just tested it over Mesa 21.0.3 (hardknott - without
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/10524/commits
) in RPI4 and apparently this fix the issue for VC4 . Probably for
Freedreno too.

If this last commit is finally landed in Mesa and fix the problem for
both drivers I will update this pull request with this single patch.

On Thu, 2021-09-23 at 22:14 +0200, Pablo Saavedra Rodi?o wrote:
> OK. Looks good to me. Let's wait for the acceptance of the patch
> first.
> 
> On Thu, 2021-09-23 at 21:00 +0200, Alexander Kanavin wrote:
> > On Thu, 23 Sept 2021 at 20:44, Pablo Saavedra
> > <psaavedra@igalia.com> wrote:
> > > I kindly accept your recommendation but could I make also a
> > > question?: Couldn't it be enough just setting the 0001-freedreno-
> > > YUV-formats-are-supported-as-external-only.patch with "Upstream-
> > > status: Submitted" [1].
> > > 
> > >
> > [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12991
> > > 
> > 
> > 
> > In this case I would like to be cautious and accept the patch into
> > oe-core only after it has been accepted by upstream. There have
> > been situations where submitted patches were never actually merged
> > upstream for various reasons, and so we ended up with
> > unmaintainable custom patches.
> >  
> > > 
> > > I assume this point affects only to the 0001-freedreno-YUV-
> > > formats-are-supported-as-external-only.patch patch since the
> > > other commits are already in Mesa 20.2 (version available in
> > > Honister) and they are not required for Honister and next Am I
> > > right?
> > > 
> > 
> > 
> > That's right.
> >  
> > Alex
> > 
> 
> 
> 
> 


--=-xna7LRz2B0kaEL2HNKUY
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>I got answer from Mesa with a new proposed fi=
x in gallium for this problem:</div><div><a href=3D"https://gitlab.freedesk=
top.org/mesa/mesa/-/merge_requests/13038">https://gitlab.freedesktop.org/me=
sa/mesa/-/merge_requests/13038</a></div><div><br></div><div>I just tested i=
t  over Mesa 21.0.3 (hardknott - without <a href=3D"https://gitlab.freedesk=
top.org/mesa/mesa/-/merge_requests/10524/commits">https://gitlab.freedeskto=
p.org/mesa/mesa/-/merge_requests/10524/commits</a>) in RPI4 and apparently =
this fix the issue for VC4 . Probably for Freedreno too.</div><div><br></di=
v><div>If this last commit is finally landed in Mesa and fix the problem fo=
r both drivers I will update this pull request with this single patch.</div=
><div><br></div><div>On Thu, 2021-09-23 at 22:14 +0200, Pablo Saavedra Rodi=
?o wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border=
-left:2px #729fcf solid;padding-left:1ex"><div>OK. Looks good to me. Let's =
wait for the acceptance of the patch first.</div><div><br></div><div>On Thu=
, 2021-09-23 at 21:00 +0200, Alexander Kanavin wrote:</div><blockquote type=
=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding=
-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Thu, 23 Sept 2021 at 20:44, Pablo Saavedra &lt;<a href=
=3D"mailto:psaavedra@igalia.com">psaavedra@igalia.com</a>&gt; wrote:<br></d=
iv><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #7=
29fcf solid;padding-left:1ex"><div>I kindly accept your recommendation but&=
nbsp;could I make also a question?: Couldn't it be enough just setting the =
0001-freedreno-YUV-formats-are-supported-as-external-only.patch with "Upstr=
eam-status:&nbsp;<span style=3D"font-family:sans-serif;font-size:12.7px;fon=
t-weight:700">Submitted"</span><span style=3D"font-family:sans-serif;font-s=
ize:12.7px"> [1].</span><div><br></div><div>[1]&nbsp;<a href=3D"https://git=
lab.freedesktop.org/mesa/mesa/-/merge_requests/12991" rel=3D"noreferrer" ta=
rget=3D"_blank">https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/1=
2991</a></div></div><div><br></div></blockquote><div><br></div><div>In this=
 case I would like to be cautious and accept the patch into oe-core only af=
ter it has been accepted by upstream. There have been situations where subm=
itted patches were never actually merged upstream for various reasons, and =
so we ended up with unmaintainable custom patches.<br></div><div>&nbsp;</di=
v><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #72=
9fcf solid;padding-left:1ex"><div><div><br></div><div>I assume this point a=
ffects only to the 0001-freedreno-YUV-formats-are-supported-as-external-onl=
y.patch patch since the other commits are already in Mesa 20.2 (version ava=
ilable in Honister) and they are not required for Honister and next Am I ri=
ght?</div></div><div><br></div></blockquote><div><br></div><div>That's righ=
t.<br></div><div>&nbsp;</div><div>Alex<br></div><div><div><span></span></di=
v></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2=
px #729fcf solid;padding-left:1ex"></blockquote></div></div></blockquote><d=
iv><br></div><div><span></span></div><div><br></div><div><br></div><div><br=
></div></blockquote><div><br></div><div><span></span></div></body></html>

--=-xna7LRz2B0kaEL2HNKUY--
