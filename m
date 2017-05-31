Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 97B6577C29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 07:15:49 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id r63so6616186itc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 00:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nU4qcVf2Z7TtbfzoU2N/8um+Tn1KT00tDwi4rGVxwHI=;
	b=m3h056wi/wC2vtgDAAjTjHJygCaH5vBzQ1YPsuKwSlV2PjwDyXPJkoKf9eX7vKph4W
	GPXXJE/kjZie0QstggU030+JuujEVwHp3JFpBpP23GUFT/sUTXPd21C7HaDA9lfpblJ+
	aq+oGRBILfzBNBK0uTzpXGT1xlX/cwt3cC684fYWMrU+0FDrsMCKz+wl7dn6LVtwnfn3
	KgKOcYBHVlVnUKc798riCrxQ9dOUNCjPa/qE+xPO/0yALWIeLankWjlDgUCWiQuxcqBr
	MIN+bi7WafKVb/nmypYPa/UgXxRZq7Xf3sZtynYTjdsC4dcpEvXHM0pNPoUjXNiidlS4
	6uRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nU4qcVf2Z7TtbfzoU2N/8um+Tn1KT00tDwi4rGVxwHI=;
	b=VYxOY7taNGFWCHApDHivRIer+toSOCHCyaP+9N1gU4mcjnADxBe2UoWWsjc3hcRxmf
	RafcsMaagiYAkZ7NaSermTWevNHEznr0JNQmZXTutk8UgLcJqgZOkoq2rRfuAVqPqEjG
	JsUHk0jJU1ub2n7y7zCEKn3xcxNQSZwRJbpzIi72bA2Jwz9G4uVQs64a4FhSLtxxi5XI
	9HB7pxervZj1g+ds74A8nQysT93GUjoiR4WmuS2kXVrtRFhe2/+Th/XgklXxqRqaEsZW
	WFhilgJIsyTrZ0q6L2sIYRnYAyuQwUSR2dapbTjip/2UmGLAuAvbwLdifK20cydQ0P0b
	8+gw==
X-Gm-Message-State: AODbwcBUlIsnmBtnhMblYmvP1X9VQC5nLbayyYVsrLPS24cYLis0/2ty
	/zgRkA8BDJId8A/VMhVvKafbdD6YpCHt
X-Received: by 10.36.172.105 with SMTP id m41mr5693643iti.110.1496214950541;
	Wed, 31 May 2017 00:15:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.164.170 with HTTP; Wed, 31 May 2017 00:15:19 -0700 (PDT)
In-Reply-To: <1496161149.6630.14.camel@linuxfoundation.org>
References: <20170526212248.16374-1-twoerner@gmail.com>
	<1496100337.25229.147.camel@linuxfoundation.org>
	<CAHUNapREVWXEaWYDYon8cYByzXcAdEu=_uWMAHCbOjU6VXrghg@mail.gmail.com>
	<1496130475.25229.160.camel@linuxfoundation.org>
	<20170530152738.GA24515@linux-uys3>
	<1496159050.6630.12.camel@linuxfoundation.org>
	<CAHUNapR0bPQq4qJnzK-ddPzn-m-0FCtVYLDBMsBuLY=eJUgmZg@mail.gmail.com>
	<1496161149.6630.14.camel@linuxfoundation.org>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 31 May 2017 10:15:19 +0300
Message-ID: <CAHiDW_EOrrVn+5FzMgGWSZP4=kOFfrWs_fc1bTBBx29a4HiqhQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: potentially enable texture float for gallium
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
X-List-Received-Date: Wed, 31 May 2017 07:15:49 -0000
Content-Type: multipart/alternative; boundary="94eb2c1faf44a295060550ccb0e0"

--94eb2c1faf44a295060550ccb0e0
Content-Type: text/plain; charset="UTF-8"

On 30 May 2017 at 19:19, Richard Purdie <richard.purdie@linuxfoundation.org>
wrote:
>
> On Tue, 2017-05-30 at 12:00 -0400, Trevor Woerner wrote:
> > On Tue, May 30, 2017 at 11:44 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > >
> > > > Maybe this would be a better way forward? Enable it, always, in
> > > > ./configure,
> > > > add the patch to check for it in the code itself, then you can
> > > > build
> > > > for all
> > > > the gallium targets (including swrast) and know that the patented
> > > > code will
> > > > only kick in where it's supported in hardware (and thus patent-
> > > > safe)?
> > > That sounds like exactly what we need to do!
> > Okay. The only caveat being, if someone actually *wanted* to enable
> > float for swrast, this would prevent them from going down that path.
> >
> > ajax on #dri-devel pointed out that some piglit tests go from pass to
> > fail instead of being skipped as a result of the above patch since
> > the
> > piglit tests are done with swrast and run very poorly without float
> > enabled.
>
> If someone really wants to enable it, they can drop the patch. I'm open
> to feedback from others like Ross/Jussi but IMO I think we can accept
> the degraded piglit results for swrast...

Sounds like a completely reasonable compromise to me.

Jussi

--94eb2c1faf44a295060550ccb0e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 30 May 2017 at 19:19, Richard Purdie &lt;<a href=3D"mai=
lto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org<=
/a>&gt; wrote:<br>&gt;<br>&gt; On Tue, 2017-05-30 at 12:00 -0400, Trevor Wo=
erner wrote:<br>&gt; &gt; On Tue, May 30, 2017 at 11:44 AM, Richard Purdie<=
br>&gt; &gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">rich=
ard.purdie@linuxfoundation.org</a>&gt; wrote:<br>&gt; &gt; &gt;<br>&gt; &gt=
; &gt; &gt;<br>&gt; &gt; &gt; &gt; Maybe this would be a better way forward=
? Enable it, always, in<br>&gt; &gt; &gt; &gt; ./configure,<br>&gt; &gt; &g=
t; &gt; add the patch to check for it in the code itself, then you can<br>&=
gt; &gt; &gt; &gt; build<br>&gt; &gt; &gt; &gt; for all<br>&gt; &gt; &gt; &=
gt; the gallium targets (including swrast) and know that the patented<br>&g=
t; &gt; &gt; &gt; code will<br>&gt; &gt; &gt; &gt; only kick in where it&#3=
9;s supported in hardware (and thus patent-<br>&gt; &gt; &gt; &gt; safe)?<b=
r>&gt; &gt; &gt; That sounds like exactly what we need to do!<br>&gt; &gt; =
Okay. The only caveat being, if someone actually *wanted* to enable<br>&gt;=
 &gt; float for swrast, this would prevent them from going down that path.<=
br>&gt; &gt;<br>&gt; &gt; ajax on #dri-devel pointed out that some piglit t=
ests go from pass to<br>&gt; &gt; fail instead of being skipped as a result=
 of the above patch since<br>&gt; &gt; the<br>&gt; &gt; piglit tests are do=
ne with swrast and run very poorly without float<br>&gt; &gt; enabled.<br>&=
gt;<br>&gt; If someone really wants to enable it, they can drop the patch. =
I&#39;m open<br>&gt; to feedback from others like Ross/Jussi but IMO I thin=
k we can accept<br>&gt; the degraded piglit results for swrast...<br><div><=
br></div><div>Sounds like a completely reasonable compromise to me.</div><d=
iv><br></div><div>Jussi</div></div>

--94eb2c1faf44a295060550ccb0e0--
