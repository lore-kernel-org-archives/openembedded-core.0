Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 972CE71A8E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 22:25:27 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id t22so378057ioa.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Feb 2018 14:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sjeeMg7xVM1Dx/lNd9ScGBvmmDD4kn92lSBCoHA/f9U=;
	b=dikltVAjCNiG3auvswOH1QqIazOiIuf+D6u0+EO4Y9ebafH1h636XqYpFe9tHHg4Px
	cR4QlZbB1nJmY6l/Xzps9EMp86TpnMqfaE4I8k+Z4dAFJDon5hvVRwzoYA0fJ1uX/UDq
	NCV1gk2Pg5+eDU5n7C4/rYfw/LPxIitihdhTEapb3v5vNXEGOt2vmR0P9W3JAHUpq1Q9
	5pHLqfZOHxMz/wJH4ziMdVeu6HsTJZyBQWRvSaoi+DTtR/dC9T0h/LYaUtSSRdIeZGQZ
	+yd8krBOhDMm+LGyX1oFqEUvg+SpFMeVlY4Ltuix+So5MY9kBpYLqb9dLBB9RANUfRfX
	bNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sjeeMg7xVM1Dx/lNd9ScGBvmmDD4kn92lSBCoHA/f9U=;
	b=Pb38qFJ1spEh2/0UB7pcpdqu/EHRIjC9O21c6Lg3PZ3bkKTNgmBo0BOUVVN5VQEg4W
	b6iud5M+9tVmg3yR115YILN3BKgnFtQq5DdR611NjiNXte1sh6fJ7A9P4SPA+y8fmgiF
	zhWDMXRQf/MzwZCBBMGjG6QpzD8dw7+aGHolDCqcVxcqigRmPh9rh8l3i6rByyInsBa4
	Rk0hK8MtDTDy10YBuXLaEdNfLrKVbteah6n5JtQGpkav8T1LFNMXkrDDju4gX3wasDuo
	+NpEWmkj0cCc9lMvsBMqo70HIQEBj4aRPsfDE1NJgRxEk+OA81nNnBTBW9sdfEL5m57u
	+R1Q==
X-Gm-Message-State: APf1xPCRThSnzCYJWvSz+AwKcyvFKuCOVEvwX7E9YecLtyNYouX3I7Z6
	XrOqeQZQCN1HbltqdjFOwXPBDrF9Jfz+Ay+2GHV3CA==
X-Google-Smtp-Source: AH8x227V9lwDRQdgUprhqMxco45l/cieNpQ8qj3/NweyKcqsLCV8I7i2uZPxeLBGJgZVSYPhDtW9EnOulo40/cYG1BY=
X-Received: by 10.107.32.19 with SMTP id g19mr424773iog.217.1517869528736;
	Mon, 05 Feb 2018 14:25:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Mon, 5 Feb 2018 14:25:08 -0800 (PST)
In-Reply-To: <20180205221300.GG2786@denix.org>
References: <20180205182112.GF2786@denix.org>
	<CAJTo0LYBFGxrHiDUK1FaJW3YB6hNZf4jiVTBgd7C2ONC9sq9XQ@mail.gmail.com>
	<20180205221300.GG2786@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Feb 2018 22:25:08 +0000
Message-ID: <CAJTo0LZ9XAFNGmw9m3c-3a9MznVTzh1PWHUXyg-ANHSXhczDPA@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Paul Eggleton <paul.eggleton@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: WARNING: Variable key %s (%s) replaces original key %s (%s).
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
X-List-Received-Date: Mon, 05 Feb 2018 22:25:28 -0000
Content-Type: multipart/alternative; boundary="001a1141a2a4139d2005647e8ac2"

--001a1141a2a4139d2005647e8ac2
Content-Type: text/plain; charset="UTF-8"

On 5 February 2018 at 22:13, Denys Dmytriyenko <denis@denix.org> wrote:

> On Mon, Feb 05, 2018 at 09:53:44PM +0000, Burton, Ross wrote:
> > On 5 February 2018 at 18:21, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > > Am I supposed to see bunch of these warnings (3 during parsing and 20
> more
> > > during build):
> > >
> > > WARNING: Variable key RDEPENDS_${KERNEL_PACKAGE_NAME}-base
> > > (${KERNEL_PACKAGE_NAME}-image) replaces original key
> RDEPENDS_kernel-base
> > > (kernel-devicetree).
> > >
> > >
> > > From kernel.bbclass:
> > >
> > > # Allow machines to override this dependency if kernel image files are
> > > # not wanted in images as standard
> > > RDEPENDS_${KERNEL_PACKAGE_NAME}-base ?= "${KERNEL_PACKAGE_NAME}-image"
> > >
> >
> > That's your kernel recipe not liking the new multiple-name kernel
> classes,
> > and if your problem is the same as oe-core's qemu* machines then this is
> > the fix:
> >
> > -RDEPENDS_kernel-base = ""
> > +RDEPENDS_${KERNEL_PACKAGE_NAME}-base = ""
>
> Ah, I see, thanks! I assume all other operations with that variable (like
> appends) would have to be changed similarly?
>

Yes.

CCing Paul, master of release notes, to ensure this gets into the migration
guide. :)

Rosss

--001a1141a2a4139d2005647e8ac2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 5 February 2018 at 22:13, Denys Dmytriyenko <span dir=
=3D"ltr">&lt;<a href=3D"mailto:denis@denix.org" target=3D"_blank">denis@den=
ix.org</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Mon, Feb 05, =
2018 at 09:53:44PM +0000, Burton, Ross wrote:<br>
&gt; On 5 February 2018 at 18:21, Denys Dmytriyenko &lt;<a href=3D"mailto:d=
enis@denix.org">denis@denix.org</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; Am I supposed to see bunch of these warnings (3 during parsing an=
d 20 more<br>
&gt; &gt; during build):<br>
&gt; &gt;<br>
&gt; &gt; WARNING: Variable key RDEPENDS_${KERNEL_PACKAGE_<wbr>NAME}-base<b=
r>
&gt; &gt; (${KERNEL_PACKAGE_NAME}-image) replaces original key RDEPENDS_ker=
nel-base<br>
&gt; &gt; (kernel-devicetree).<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; From kernel.bbclass:<br>
&gt; &gt;<br>
&gt; &gt; # Allow machines to override this dependency if kernel image file=
s are<br>
&gt; &gt; # not wanted in images as standard<br>
&gt; &gt; RDEPENDS_${KERNEL_PACKAGE_<wbr>NAME}-base ?=3D &quot;${KERNEL_PAC=
KAGE_NAME}-image&quot;<br>
&gt; &gt;<br>
&gt;<br>
&gt; That&#39;s your kernel recipe not liking the new multiple-name kernel =
classes,<br>
&gt; and if your problem is the same as oe-core&#39;s qemu* machines then t=
his is<br>
&gt; the fix:<br>
&gt;<br>
&gt; -RDEPENDS_kernel-base =3D &quot;&quot;<br>
&gt; +RDEPENDS_${KERNEL_PACKAGE_<wbr>NAME}-base =3D &quot;&quot;<br>
<br>
</span>Ah, I see, thanks! I assume all other operations with that variable =
(like<br>
appends) would have to be changed similarly?<br></blockquote><div><br></div=
><div>Yes.</div><div><br></div><div>CCing Paul, master of release notes, to=
 ensure this gets into the migration guide. :)</div><div><br></div><div>Ros=
ss=C2=A0</div></div></div></div>

--001a1141a2a4139d2005647e8ac2--
