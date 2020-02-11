Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com
	[209.85.217.51])
	by mail.openembedded.org (Postfix) with ESMTP id 4DCC360F8E;
	Tue, 11 Feb 2020 17:46:29 +0000 (UTC)
Received: by mail-vs1-f51.google.com with SMTP id b79so6840913vsd.9;
	Tue, 11 Feb 2020 09:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=X+GfSTl642Q9Nm8d4C+gdULt7L+mpeMlMMVNhesCF1E=;
	b=tBvGIzn5vb20caO1mCbcdLqu+BfQ5dGF8e2OYvh22Uax8Ob45A6PbrmftwPJQ+zVyN
	3efnJHtTrTSVMSAo8OSe+fVQuduov+fl7GMZQjkwdPzkkCkUeIEniTQwYU10TNA+Hv4G
	wzixvQZuUY9YOZG2WvmRkYwIK506STHKkdsBUy7gJmqmOhrhlECvxOhAPj5daHi2riBx
	1U1YZUTwQYDjK/A3enEdrIoWzXcuq7Qr5XnkobNdM2APUBMDqu/ZPFCGzeqYx9xvqYGC
	whbhMgQObe7J12Yt0HvsQrgzThv0Lfa/U34PPz2NDrhCzIAHOfqHDTn1ClWi0fBLNPEv
	gjTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=X+GfSTl642Q9Nm8d4C+gdULt7L+mpeMlMMVNhesCF1E=;
	b=HWZCd6dvH0AWN9+Wpgs4QbpmIKmSGqdN1PKQVt13HC+KcOE3fNKzvHsm4hGdGR2SUj
	9wlU8AnDXQpOJnr2gYx85p7Sx3KY+v45ONRs4skijWdUTioLJlz38UgIqVfEB/JwkiFj
	XcI2o74jh+5NVgnzl+StWluHG2oBei1626ksEPXoi8je/AUbkCpM1vxi1y+WUfjkMWfI
	iN0ZZrFWd/k5JSCxsaRAO/OHCEcJdOnrRbz4wP1S/VLejiBhZqx3Kgc3GUnT6p8Nm0Tw
	kunmXDyqETYzXHOksFt/+XB5lMLm7eidDXK1Glc6oEpbun0G9UI8h1uGEu+ErSDpr/fG
	g/1w==
X-Gm-Message-State: APjAAAVABiuGmBBogO3vGxyVtZ4bRfv6GE2/OQvUEwNRCCbZFqOhHchD
	5h9sy6zF+KSQfL3XXu4sL79+VbSpNSuYCIodCCw=
X-Google-Smtp-Source: APXvYqyOW84hbCgfzP0szaZg2x/Jykfv4zIOgwsi0YXmXJzAfRy41+2X/J5CLlFeAeJhs+n8gCj7+npLX38NZgI3Gyk=
X-Received: by 2002:a05:6102:757:: with SMTP id
	v23mr10021828vsg.35.1581443190128; 
	Tue, 11 Feb 2020 09:46:30 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj-KS+mHQ20sQUv-SzpeaXjvAzQDPND00iuep6ek7utd5g@mail.gmail.com>
	<20200211135323.GA3234@localhost>
	<CANNYZj_ExXVJJMS3g6Ga2xNc9AgspEhcMBQgmQGaQXmkcUYvPQ@mail.gmail.com>
	<CANNYZj_v9=Ys-NXqHWXY42dZqT95+LxcRUqSRKcyy6pMz-Y01g@mail.gmail.com>
	<20200211141347.GB3234@localhost>
	<CANNYZj_2WVWrWDbL1tsUeqVQ_OPHnzebA=6fobRD9e==UybAhA@mail.gmail.com>
	<8b9de58b-7d65-dc89-69ec-4b5d40667184@kernel.crashing.org>
In-Reply-To: <8b9de58b-7d65-dc89-69ec-4b5d40667184@kernel.crashing.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Feb 2020 18:46:19 +0100
Message-ID: <CANNYZj8L1q+Dy2Xuh-q+E_npiyhXS4CUqPtinwH1Nk1E+c4Bmw@mail.gmail.com>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Future of sato and X in oe-core
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
X-List-Received-Date: Tue, 11 Feb 2020 17:46:30 -0000
Content-Type: multipart/alternative; boundary="00000000000094821c059e506fbb"

--00000000000094821c059e506fbb
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Feb 2020 at 16:58, Mark Hatle <mark.hatle@kernel.crashing.org>
wrote:

>
> I also don't think oe-core itself needs a 'real' UI, and as my previous
> response
> said -- we do need something though to test that the graphical framework is
> working properly.
>
> In the past this often comes back to needing a LOT of a UI in order to
> adequately test all of the components of the system.   If wayland/weston
> has a
> proper test suite that exercises all of the various parts of and pieces of
> the
> systems -- then the need for a UI drops considerably.
>
> (but we still have the need for some sort of example/demostration...)
>

Wayland/weston do have test suites, neither of which we currently use. I
don't know how much they exercise all the moving parts, but the tests do
exist.

As for the demo/examples, I think we have reached the point where we can
outsource the eye candy to the Internet and not bother with 'apps'.
Specifically, just bundle epiphany/webkit into core-image-weston-demo, and
make a nice looking landing page somewhere on yoctoproject.org that links
to various HD video sites and WebGL demonstrators. As long as both GL and
h.264/whatnot are HW accelerated, this should look and feel fine, even in
qemu with virgl and kvm acceleration to a recent x86 CPU family.

For what it's worth, with my mbition.io hat on, I do not care in the
slightest for X anymore, and wouldn't blink an eye if all of it would
disappear from oe-core tomorrow. What I wanted to gauge is whether people
still use X for *new* product development, and for what reasons, and how
much resistance there is to the idea of switching the default graphical
stack in oe-core to weston.

Alex

--00000000000094821c059e506fbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 11 Feb 2020 at 16:58, Mark Hatle &lt;<a href=3D"mailto:mark.=
hatle@kernel.crashing.org">mark.hatle@kernel.crashing.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
I also don&#39;t think oe-core itself needs a &#39;real&#39; UI, and as my =
previous response<br>
said -- we do need something though to test that the graphical framework is=
<br>
working properly.<br>
<br>
In the past this often comes back to needing a LOT of a UI in order to<br>
adequately test all of the components of the system.=C2=A0 =C2=A0If wayland=
/weston has a<br>
proper test suite that exercises all of the various parts of and pieces of =
the<br>
systems -- then the need for a UI drops considerably.<br>
<br>
(but we still have the need for some sort of example/demostration...)<br></=
blockquote><div><br></div><div>Wayland/weston do have test suites, neither =
of which we currently use. I don&#39;t know how much they exercise all the =
moving parts, but the tests do exist.</div><div><br></div><div>As for the d=
emo/examples, I think we have reached the point where we can outsource the =
eye candy to the Internet and not bother with &#39;apps&#39;. Specifically,=
 just bundle epiphany/webkit into core-image-weston-demo, and make a nice l=
ooking landing page somewhere on <a href=3D"http://yoctoproject.org">yoctop=
roject.org</a> that links to various HD video sites and WebGL demonstrators=
. As long as both GL and h.264/whatnot are HW accelerated, this should look=
 and feel fine, even in qemu with virgl and kvm acceleration to a recent x8=
6 CPU family.</div><div><br></div><div>For what it&#39;s worth, with my <a =
href=3D"http://mbition.io">mbition.io</a> hat on, I do not care in the slig=
htest for X anymore, and wouldn&#39;t blink an eye if all of it would disap=
pear from oe-core tomorrow. What I wanted to gauge is whether people still =
use X for *new* product development, and for what reasons, and how much res=
istance there is to the idea of switching the default graphical stack in oe=
-core to weston.<br></div><div><br></div><div>Alex<br></div></div></div>

--00000000000094821c059e506fbb--
