Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6CB8C78A2D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 09:24:59 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id b77-v6so11857787vkb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 02:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KSD/+4tgDab12zb74mpnwF1JxcrivmpPwil2I8brRGM=;
	b=i0/Ih6RKBR5HHX2kaKSuN/FYXYlvJOW+GESxenZuXjMX2MsjtFSixOYlCQNbk4D1iM
	7GCMoINUw/C24PJN5BCnfxcV1FUndj1iD55KcLGTsu8dw6l829aARdJHv6YhoXMBVQN1
	tVUy1InA4/zC4bAwu6t4y14Gq/Vn6EObegkfTll9Q9OTQD2nrURj1ceoSt81eL4pq2p1
	a3SJ6TXd3L6N6e4eSV8jpsMBrZfi8DrNpfZm9i5sjeFj0/woD/Zn+rvyrtQHU7d//hmr
	ivC3LxFJTZZ9RfLVza4ILu2zLnWTpvd/kVfaKvEQy5Mp/9JWu7a4JU3KSjRf/IYWKbsA
	i4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KSD/+4tgDab12zb74mpnwF1JxcrivmpPwil2I8brRGM=;
	b=JAtFW07mPu7+F6s05RvE3zPNVj6Yq98FR4xGyvWA1niutdWtHISUq3sdBYxbKm+l7B
	kCdp5JdoNdrXpjywZoql1P352ErA3D22XWCSJA+Fw50r53fJTHdDHhlVXlssTF1Kow4B
	sDhEbtiBEgkoAT5GdJnJP8HMee1rsKhpBxmo+4H9MoeMhCrjq4vg3KUbpwdf/8b4TbXc
	ZAl4AoYNFFlU7QgU7rsnYtv6EQaD42Z7Hv9vp31+3pTGeZzbyp0yu5GJhVYFwpafvIkf
	Qmpkc9K+d1OfooyU8xcIdCj6nhT/xDqVPMTBDe1Af+6sX/NiyoyoEvCuhJoXhHIuC767
	wRWA==
X-Gm-Message-State: APt69E2ZrBdLT0Q3HEpMZvtuFEOUBOptP9QNA/VJ70I+GXzZ3aZcWZfN
	8zSUWBU8u+QXvbIyIZM0DUPPf+aOkeAYNTn5Gk4=
X-Google-Smtp-Source: ADUXVKIiDNnC3sdCkGZabwIueVquBPkvmJu40uMXcyROP2takQHV8+71sZfV2POPDvhYn9mSNO3Sfohl9ZLWKoWaLnA=
X-Received: by 2002:a1f:4a04:: with SMTP id x4-v6mr9613317vka.88.1528709100321;
	Mon, 11 Jun 2018 02:25:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a67:4b48:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 02:24:59
	-0700 (PDT)
In-Reply-To: <1119b17c899a4b87aeb52467c703ff07@XBOX02.axis.com>
References: <1528557877-22037-1-git-send-email-liu.ming50@gmail.com>
	<CALatG=4e_7nvpG6spimG5a=5e8iX8J4JTB73uJ9zFQOPosL0Eg@mail.gmail.com>
	<4e955e55fee0f60333e6ed7bf8f87433c2d99c17.camel@linuxfoundation.org>
	<1119b17c899a4b87aeb52467c703ff07@XBOX02.axis.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Mon, 11 Jun 2018 11:24:59 +0200
Message-ID: <CALatG=7ZtFBvSwveoSB3NVO34XyBBfAVSwhBiPQ7s_U8_wixxQ@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: add BB_CURRENT_MC to OVERRIDES
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
X-List-Received-Date: Mon, 11 Jun 2018 09:24:59 -0000
Content-Type: multipart/alternative; boundary="000000000000e3c255056e5a5217"

--000000000000e3c255056e5a5217
Content-Type: text/plain; charset="UTF-8"

Arha, good suggestion, will do that in V2.

//Ming Liu

2018-06-11 10:51 GMT+02:00 Peter Kjellerstedt <peter.kjellerstedt@axis.com>:

> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Richard Purdie
> > Sent: den 10 juni 2018 21:29
> > To: Ming Liu <liu.ming50@gmail.com>; OE-core <openembedded-
> > core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH] bitbake.conf: add BB_CURRENT_MC to
> > OVERRIDES
> >
> > On Sun, 2018-06-10 at 20:45 +0200, Ming Liu wrote:
> > > I saw your comment as follows:
> > >
> > > > This adds "" in OVERRIDES in the default case. Whilst I think (but
> > > am not 100% sure) we fixed bitbake not to break on such a value, I'm
> > > not convinced adding empty elements to it is a good idea and this did
> > > used to break things.
> > >
> > > No, it will add "default" to OVERRIDES in the default case.
> >
> > That is even worse, we do not want to add "default" to overrides since
> > any variable containing that word would then be at risk of weird
> > breakage.
> >
> > Cheers,
> >
> > Richard
>
> You could add it as ":mc-${BB_CURRENT_MC}:" to OVERRIDES to avoid the
> ambiguity, similar to the pn- and df- prefixes used for recipe names
> and distro features.
>
> //Peter
>
>

--000000000000e3c255056e5a5217
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Arha, good suggestion, will do that in V2.<div><br></div><=
div>//Ming Liu</div></div><div class=3D"gmail_extra"><br><div class=3D"gmai=
l_quote">2018-06-11 10:51 GMT+02:00 Peter Kjellerstedt <span dir=3D"ltr">&l=
t;<a href=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kj=
ellerstedt@axis.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; =
-----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core-bounces@lists.openembedded.o=
rg">openembedded-core-bounces@<wbr>lists.openembedded.org</a><br>
&gt; [mailto:<a href=3D"mailto:openembedded-core-bounces@lists.openembedded=
.org">openembedded-core-<wbr>bounces@lists.openembedded.org</a><wbr>] On Be=
half Of<br>
&gt; Richard Purdie<br>
&gt; Sent: den 10 juni 2018 21:29<br>
&gt; To: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com">liu.ming50@gm=
ail.com</a>&gt;; OE-core &lt;openembedded-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org">core@lists.openembedded=
.org</a>&gt;<br>
&gt; Subject: Re: [OE-core] [PATCH] bitbake.conf: add BB_CURRENT_MC to<br>
&gt; OVERRIDES<br>
<span class=3D"">&gt; <br>
&gt; On Sun, 2018-06-10 at 20:45 +0200, Ming Liu wrote:<br>
&gt; &gt; I saw your comment as follows:<br>
&gt; &gt;<br>
&gt; &gt; &gt; This adds &quot;&quot; in OVERRIDES in the default case. Whi=
lst I think (but<br>
&gt; &gt; am not 100% sure) we fixed bitbake not to break on such a value, =
I&#39;m<br>
&gt; &gt; not convinced adding empty elements to it is a good idea and this=
 did<br>
&gt; &gt; used to break things.<br>
&gt; &gt;<br>
&gt; &gt; No, it will add &quot;default&quot; to OVERRIDES in the default c=
ase.<br>
&gt; <br>
</span>&gt; That is even worse, we do not want to add &quot;default&quot; t=
o overrides since<br>
&gt; any variable containing that word would then be at risk of weird<br>
&gt; breakage.<br>
&gt; <br>
&gt; Cheers,<br>
&gt; <br>
&gt; Richard<br>
<br>
You could add it as &quot;:mc-${BB_CURRENT_MC}:&quot; to OVERRIDES to avoid=
 the <br>
ambiguity, similar to the pn- and df- prefixes used for recipe names <br>
and distro features.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
//Peter<br>
<br>
</font></span></blockquote></div><br></div>

--000000000000e3c255056e5a5217--
