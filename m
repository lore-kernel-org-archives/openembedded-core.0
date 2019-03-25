Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id AD3D56BC19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 22:38:23 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id o129so6423945qke.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 15:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1SDpx4bnytW/S3+oDxssOGlXbHyjykJVy6uEFvH6vdw=;
	b=ivmJUhVICPcbZrCErwW3X/Y8usgbXl/FRwrHzSAp1hguAmmO/eOQBMwOIXI2qX/h10
	plJEITduxomeHEpRJIaIc7eAOa4BYM0VqpTsW+00i+9czL9iqI2kEFal/ypqLodkYMzg
	JDMIFIsrPk+f401kZGUk2O8Gqp9SOYrQxI+91442G0cKVRtcKnETO5oVlQj3rjgv/fMV
	vN2T92b+y2uKbWlQc8Pgwca1zaygkTzjL5nvZWdQOq3MNk6nzqRLr1fADP+c9FuGsk0B
	1hI5PRE4A9i4Gp5t/py04bdOP+t4Gilr/85GYrZ9Mw1yoeGmJWZgp9DBu6ZZmjJQd0/Z
	6JRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1SDpx4bnytW/S3+oDxssOGlXbHyjykJVy6uEFvH6vdw=;
	b=BjTe0Dq2QdvfCpCVlRliL2GBrUJH4zNYNrprR0vdgK+gjV0XlRv7I8qEc85YQEVbV0
	iXdpUKwPppHpuGGIAmHJo9yNjWFSgpqd4b+EvKYjlcHe4F8WT9cC4+qDjNu4GW/Vzwb6
	dB5Az/OfW6XgskccEhJgPYRPaojM1j5Ex2beCCMMWGZh+xqZ1VJvahvRT4EYmUPnCW2r
	eZeD8gPqW0yT5KruatChJhLqWuKyiwO2neQY9yiLwwh88jgzlhH3jULp2xssh400w2EH
	lzVp4O5eUYYVBESrjiOy9vMdv/UTBjs6tQCPnWVlw0IKzz4ZUlndckTFoR5azJdKchAd
	NSUQ==
X-Gm-Message-State: APjAAAXphYPFemBNVm6Z7AjLLESpKlJjbh15sRECJwQUbjms14DRXIBe
	sCg/I9S0iaHBUL2S92T3MtdszvzApXOd1QWWVQQ=
X-Google-Smtp-Source: APXvYqz+X3M9M8/h48MwOQL10IbSweyqxV3xZD9kqagQWDS3viZ1FHJw3VM5D7kwmU5D1NsimhmF7dkrMnbz+39jGmI=
X-Received: by 2002:ae9:f44a:: with SMTP id z10mr15513601qkl.223.1553553504117;
	Mon, 25 Mar 2019 15:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <CALbNGRRm1QAgY2MHbTUA_Ly9L_Kt6ZzkR55jArkCE53G=ts8tA@mail.gmail.com>
	<CAMKF1sri_7L8sb95L5BjD3d2iMJq4PnqK+pD0XnTibUpwogpsQ@mail.gmail.com>
	<20190323211604.GA20793@localhost>
	<CALbNGRQPtnNLSVhDzXgnvn-2VNPPMfQTY5vDdwM3xr5iVcGofg@mail.gmail.com>
	<20190323215336.GA22469@localhost>
	<CALbNGRScKq9gCQWbU2wchSvQ3cf2aRNnn5601fOATuKMdVOFCA@mail.gmail.com>
	<CAAQYJAsLQFn3VrB7gSTkytA8Rm-1GkKLBLHHpVzonpqykrHnRg@mail.gmail.com>
	<20190325161004.GB484@localhost>
	<CALbNGRSgkQrjKrhEywJb3DhvKv3gkobZvv7YG_DxE039SAqJaw@mail.gmail.com>
	<CALbNGRThou+6CNKotr-hduJoKNPgg+F2i8PQdgjBGcGRZeOKdw@mail.gmail.com>
	<20190325174629.GA5805@localhost>
	<CALbNGRTqm3nOXqvZnX=LBQ_6=28jUs4kAhk=sjbNjdM=MFZjNw@mail.gmail.com>
In-Reply-To: <CALbNGRTqm3nOXqvZnX=LBQ_6=28jUs4kAhk=sjbNjdM=MFZjNw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Mar 2019 15:38:12 -0700
Message-ID: <CAMKF1srTvh6HfZDwbUV1QvtOppnEPhWHSm8kkhik+bzq_Mbbsg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Adrian Bunk <bunk@stusta.de>
Subject: Re: musl thoughts
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
X-List-Received-Date: Mon, 25 Mar 2019 22:38:23 -0000
Content-Type: multipart/alternative; boundary="000000000000c0a9ad0584f2dc74"

--000000000000c0a9ad0584f2dc74
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2019 at 2:12 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m>
wrote:

> On Mon, Mar 25, 2019 at 6:46 PM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Mon, Mar 25, 2019 at 06:15:40PM +0100, Andreas M=C3=BCller wrote:
> > >...
> > > Looked into this. Found an old musl build failure of networkmanager
> > > [1] but I think the issue has not changed:
> > >
> > > | In file included from
> > >
> TOPDIR/build/tmp/work/mips32r2-yoe-linux-musl/networkmanager/1.14.4-r0/re=
cipe-sysroot/usr/include/net/ethernet.h:10,
> > > |                  from
> ../NetworkManager-1.14.4/shared/n-acd/src/n-acd.c:28:
> > > |
> TOPDIR/build/tmp/work/mips32r2-yoe-linux-musl/networkmanager/1.14.4-r0/re=
cipe-sysroot/usr/include/netinet/if_ether.h:111:8:
> > > error: redefinition of 'struct ethhdr'
> > > |  struct ethhdr {
> > > |         ^~~~~~
> > > | In file included from
> ../NetworkManager-1.14.4/shared/n-acd/src/n-acd.c:26:
> > > |
> TOPDIR/build/tmp/work/mips32r2-yoe-linux-musl/networkmanager/1.14.4-r0/re=
cipe-sysroot/usr/include/linux/if_ether.h:167:8:
> > > note: originally defined here
> > > | struct ethhdr {
> > > |         ^~~~~~
> > >
> > > glibc does not fail because it does include linux header
> > > | /* Get definitions from kernel header file.  */
> > > | #include <linux/if_ether.h>
> > > and does not define struct ethhdr
> > >
> > > linux/if_ether.h says:
> > > /* allow libcs like musl to deactivate this, glibc does not implement
> this. */
> > > #ifndef __UAPI_DEF_ETHHDR
> > > #define __UAPI_DEF_ETHHDR        1
> > > #endif
> > >
> > > #if __UAPI_DEF_ETHHDR
> > > struct ethhdr {
> > >     unsigned char    h_dest[ETH_ALEN];    /* destination eth addr    =
*/
> > >     unsigned char    h_source[ETH_ALEN];    /* source ether addr    *=
/
> > >     __be16        h_proto;        /* packet type ID field    */
> > > } __attribute__((packed));
> > > #endif
> > >
> > > musl does not include linux header but defines which is differen from
> > > what linux does:
> > > struct ethhdr {
> > >     uint8_t h_dest[ETH_ALEN];
> > >     uint8_t h_source[ETH_ALEN];
> > >     uint16_t h_proto;
> > > };
> > > and later
> > > #define __UAPI_DEF_ETHHDR       0
> > >
> > > So for networkmanager there is either some wrong sequence or it
> > > includes linux headers.
> >
> > musl headers providing own different definitions of kernel interfaces
> > is a problem in musl.
> >
> > After reading [1] I think that this is musl upstream having made the
> > decision of not even trying to work properly with the kernel headers.
> >
> > OE adding a not upstreamable patch that removes one of the two
> > definitions in musl builds might be the best available solution.
> >
> > > And I am still not confident that it is our job to teach umpteen
> > > projects written for linux how to write portable code (oe-core has 14=
7
> > > musl related patches and meta-openembedded has 140)...
> > >...
> >
> > This is not about writing portable code, this is about problems with
> musl.
> >
> > Using the Linux userspace headers is obviously not portable to non-Linu=
x,
> > but many packages like NetworkManager are anyways Linux-only no matter
> > what you do.
> >
> > > Andreas
> >
> > cu
> > Adrian
> >
> > [1] https://wiki.musl-libc.org/faq.html#Q:-Why-am-I-getting-
> >
> Have looked into some papers at musl page and the link above: The more
> I read from them the less I am interested in wasting my time on it.
> There is too often this 'the world is full of idiots - and it is just
> us doing the right thing' between the lines. Starts that they call
> musl 'correct' - while their own performance charts are - for my use
> case - unacceptable (ok outdated - maybe things changed). One could
> say: Go and give it a try but there is just a little problem: I think
> it'll take weeks to get images with contents I interested in.
>
> Looked into networkmanager: There are dozen places where linux headers
> are used - I don't see a clean solution we could offer upstream.
>
> What bugs me most: Silently a rule was introduced that patches failing
> for musl are not accepted - or did I miss something. A project
> considering itself as center of the world blocks resources here in
> times these are limited.


No there is no rule like that it=E2=80=99s who shows up with interest and r=
eports
problems I understand your usecase might not involve musl and that=E2=80=99=
s how
everyone is they have interest in some parts of project but they cooperate
with the things which don=E2=80=99t interest them so when I ask it=E2=80=99=
s breaking musl
I am trying to nudge them to help fixing it since I do the same when
someone approaches my patches and reports issues that could be fixed in
that and sometimes I express my helplessness and sometimes I do help if I
have knleoledge and time so I expect others to do same

>
>
> Just to add that I spent past three weekends to wipe after patches
> being removed / 'bit-rottened' stuff was removed from a layer I
> maintain right before next release. Ahh maintainer means take care /
> answer user questions take / complaints when something does not work -
> but when it comes to decisions: Please keep you mouth shut.


You can be direct and cite the case and may be it can be discussed further
if you are talking about gstreamer 0.10 then I thought you agreed for
removal since that=E2=80=99s what your email said but if it=E2=80=99s a dif=
ferent case then
I encourage you to bring it forward and discuss

I usually report my problems and of possible I send a fix and if something
of my interest is affected I try to help this works well in most cases

>
>
> it is enough
>
> Andreas
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000c0a9ad0584f2dc74
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Mar 25, 2019 at 2:12 PM Andreas M=C3=BCller &lt;<a =
href=3D"mailto:schnitzeltony@gmail.com">schnitzeltony@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">On Mon, Mar 25, 2019 at 6:46 PM=
 Adrian Bunk &lt;<a href=3D"mailto:bunk@stusta.de" target=3D"_blank">bunk@s=
tusta.de</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, Mar 25, 2019 at 06:15:40PM +0100, Andreas M=C3=BCller wrote:<b=
r>
&gt; &gt;...<br>
&gt; &gt; Looked into this. Found an old musl build failure of networkmanag=
er<br>
&gt; &gt; [1] but I think the issue has not changed:<br>
&gt; &gt;<br>
&gt; &gt; | In file included from<br>
&gt; &gt; TOPDIR/build/tmp/work/mips32r2-yoe-linux-musl/networkmanager/1.14=
.4-r0/recipe-sysroot/usr/include/net/ethernet.h:10,<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f=
rom ../NetworkManager-1.14.4/shared/n-acd/src/n-acd.c:28:<br>
&gt; &gt; | TOPDIR/build/tmp/work/mips32r2-yoe-linux-musl/networkmanager/1.=
14.4-r0/recipe-sysroot/usr/include/netinet/if_ether.h:111:8:<br>
&gt; &gt; error: redefinition of &#39;struct ethhdr&#39;<br>
&gt; &gt; |=C2=A0 struct ethhdr {<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~<br>
&gt; &gt; | In file included from ../NetworkManager-1.14.4/shared/n-acd/src=
/n-acd.c:26:<br>
&gt; &gt; | TOPDIR/build/tmp/work/mips32r2-yoe-linux-musl/networkmanager/1.=
14.4-r0/recipe-sysroot/usr/include/linux/if_ether.h:167:8:<br>
&gt; &gt; note: originally defined here<br>
&gt; &gt; | struct ethhdr {<br>
&gt; &gt; |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~<br>
&gt; &gt;<br>
&gt; &gt; glibc does not fail because it does include linux header<br>
&gt; &gt; | /* Get definitions from kernel header file.=C2=A0 */<br>
&gt; &gt; | #include &lt;linux/if_ether.h&gt;<br>
&gt; &gt; and does not define struct ethhdr<br>
&gt; &gt;<br>
&gt; &gt; linux/if_ether.h says:<br>
&gt; &gt; /* allow libcs like musl to deactivate this, glibc does not imple=
ment this. */<br>
&gt; &gt; #ifndef __UAPI_DEF_ETHHDR<br>
&gt; &gt; #define __UAPI_DEF_ETHHDR=C2=A0 =C2=A0 =C2=A0 =C2=A0 1<br>
&gt; &gt; #endif<br>
&gt; &gt;<br>
&gt; &gt; #if __UAPI_DEF_ETHHDR<br>
&gt; &gt; struct ethhdr {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0unsigned char=C2=A0 =C2=A0 h_dest[ETH_ALEN];=
=C2=A0 =C2=A0 /* destination eth addr=C2=A0 =C2=A0 */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0unsigned char=C2=A0 =C2=A0 h_source[ETH_ALEN];=
=C2=A0 =C2=A0 /* source ether addr=C2=A0 =C2=A0 */<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0__be16=C2=A0 =C2=A0 =C2=A0 =C2=A0 h_proto;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* packet type ID field=C2=A0 =C2=A0 */<br>
&gt; &gt; } __attribute__((packed));<br>
&gt; &gt; #endif<br>
&gt; &gt;<br>
&gt; &gt; musl does not include linux header but defines which is differen =
from<br>
&gt; &gt; what linux does:<br>
&gt; &gt; struct ethhdr {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0uint8_t h_dest[ETH_ALEN];<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0uint8_t h_source[ETH_ALEN];<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0uint16_t h_proto;<br>
&gt; &gt; };<br>
&gt; &gt; and later<br>
&gt; &gt; #define __UAPI_DEF_ETHHDR=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
&gt; &gt;<br>
&gt; &gt; So for networkmanager there is either some wrong sequence or it<b=
r>
&gt; &gt; includes linux headers.<br>
&gt;<br>
&gt; musl headers providing own different definitions of kernel interfaces<=
br>
&gt; is a problem in musl.<br>
&gt;<br>
&gt; After reading [1] I think that this is musl upstream having made the<b=
r>
&gt; decision of not even trying to work properly with the kernel headers.<=
br>
&gt;<br>
&gt; OE adding a not upstreamable patch that removes one of the two<br>
&gt; definitions in musl builds might be the best available solution.<br>
&gt;<br>
&gt; &gt; And I am still not confident that it is our job to teach umpteen<=
br>
&gt; &gt; projects written for linux how to write portable code (oe-core ha=
s 147<br>
&gt; &gt; musl related patches and meta-openembedded has 140)...<br>
&gt; &gt;...<br>
&gt;<br>
&gt; This is not about writing portable code, this is about problems with m=
usl.<br>
&gt;<br>
&gt; Using the Linux userspace headers is obviously not portable to non-Lin=
ux,<br>
&gt; but many packages like NetworkManager are anyways Linux-only no matter=
<br>
&gt; what you do.<br>
&gt;<br>
&gt; &gt; Andreas<br>
&gt;<br>
&gt; cu<br>
&gt; Adrian<br>
&gt;<br>
&gt; [1] <a href=3D"https://wiki.musl-libc.org/faq.html#Q:-Why-am-I-getting=
-" rel=3D"noreferrer" target=3D"_blank">https://wiki.musl-libc.org/faq.html=
#Q:-Why-am-I-getting-</a><br>
&gt;<br>
Have looked into some papers at musl page and the link above: The more<br>
I read from them the less I am interested in wasting my time on it.<br>
There is too often this &#39;the world is full of idiots - and it is just<b=
r>
us doing the right thing&#39; between the lines. Starts that they call<br>
musl &#39;correct&#39; - while their own performance charts are - for my us=
e<br>
case - unacceptable (ok outdated - maybe things changed). One could<br>
say: Go and give it a try but there is just a little problem: I think<br>
it&#39;ll take weeks to get images with contents I interested in.<br>
<br>
Looked into networkmanager: There are dozen places where linux headers<br>
are used - I don&#39;t see a clean solution we could offer upstream.<br>
<br>
What bugs me most: Silently a rule was introduced that patches failing<br>
for musl are not accepted - or did I miss something. A project<br>
considering itself as center of the world blocks resources here in<br>
times these are limited.</blockquote><div dir=3D"auto"><br></div><div dir=
=3D"auto">No there is no rule like that it=E2=80=99s who shows up with inte=
rest and reports problems I understand your usecase might not involve musl =
and that=E2=80=99s how everyone is they have interest in some parts of proj=
ect but they cooperate with the things which don=E2=80=99t interest them so=
 when I ask it=E2=80=99s breaking musl</div><div dir=3D"auto">I am trying t=
o nudge them to help fixing it since I do the same when someone approaches =
my patches and reports issues that could be fixed in that and sometimes I e=
xpress my helplessness and sometimes I do help if I have knleoledge and tim=
e so I expect others to do same=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
br>
<br>
Just to add that I spent past three weekends to wipe after patches<br>
being removed / &#39;bit-rottened&#39; stuff was removed from a layer I<br>
maintain right before next release. Ahh maintainer means take care /<br>
answer user questions take / complaints when something does not work -<br>
but when it comes to decisions: Please keep you mouth shut.</blockquote><di=
v dir=3D"auto"><br></div><div dir=3D"auto">You can be direct and cite the c=
ase and may be it can be discussed further if you are talking about gstream=
er 0.10 then I thought you agreed for removal since that=E2=80=99s what you=
r email said but if it=E2=80=99s a different case then I encourage you to b=
ring it forward and discuss</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">I usually report my problems and of possible I send a fix and if someth=
ing of my interest is affected I try to help this works well in most cases=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><br>
<br>
it is enough<br>
<br>
Andreas<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--000000000000c0a9ad0584f2dc74--
