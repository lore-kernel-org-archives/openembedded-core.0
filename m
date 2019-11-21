Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1614F751D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 10:10:31 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id i12so3633605wro.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 02:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=1+ZDtxl1LL/ksGbFhFSn9Cq9TLZtN6xl8x48TlMVkTk=;
	b=C7GSlYvUcJFZPxqkx67YtbrYZgKEyY5QdmHpo5eDIrC1KGVFbJR9qrNSSJtr6apkNL
	T4U+tAaGDPpZine1fqsXMhxlPGtPfe/4nVbetAc8wxKlZuEJ8b3SGsw5VbxmGU9qnlU9
	qOrDiSGZUgWC/7TwzTL7DAixJIK6+hixdlsks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=1+ZDtxl1LL/ksGbFhFSn9Cq9TLZtN6xl8x48TlMVkTk=;
	b=Kt/1mMCAg/wovhmQScZleXNSoe0BI9llNAtQkOuNCd5+OzOqJgDNNKPFhLShluf8HK
	v3X4vuNynKZ/bgW0WgFCSq4vWxmV2uT9PRsH+6b2+VnStUbtn0/mDGBJOhS6eDwntBC/
	A8Bi9evZqRpDvLjctnTd11/KXJ/w0WNN7auVgxy8/6pCyCB8WV5W9tX8krfEQnZxYAJ6
	eXqJxUAonbAr/NCcc6GWWOh1y5oucUVc9MgSYLyYXEjqvmq/l/W/tHvwf+yGjON5sefp
	Da7NGqau2kS3mHc7b9uTRwDKEyUgTfVLkClvRW7kYmjIFyHgIicwQWU4f8eN5Gul/Oei
	blKA==
X-Gm-Message-State: APjAAAWr8NEnsP4vdpHSesTep2yGSEeBFneQHFJRLCdMjtE2emfAj2Dv
	7Ppy4UEWQM+84fZ48a1O8QElvQ==
X-Google-Smtp-Source: APXvYqy7SbvpuPjOtTMf2GLodnz5lXOZgs27HAnRLQ4gNReLl2CBWSx38TG0nPpc2KUO1YN+2kqynw==
X-Received: by 2002:adf:f005:: with SMTP id j5mr9308969wro.295.1574331032672; 
	Thu, 21 Nov 2019 02:10:32 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t185sm2536324wmf.45.2019.11.21.02.10.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 21 Nov 2019 02:10:31 -0800 (PST)
Message-ID: <fc3a26d7c77f2781cbad28cdb8fc71995ab5e327.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>, Adrian Bunk <bunk@stusta.de>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 Nov 2019 10:10:30 +0000
In-Reply-To: <238a39c7-b794-aaa0-1da6-4b585078f447@intel.com>
References: <20191120134455.125118-1-alex.kanavin@gmail.com>
	<20191120134455.125118-8-alex.kanavin@gmail.com>
	<20191120194927.GA28030@localhost>
	<CANNYZj_g1kDJ5CSbKg4DEaATCiyPPT=2GuYEsUyHr+7ZpH8EkQ@mail.gmail.com>
	<20191120213844.ome6ota74rmgosy3@pbcl.net>
	<CANNYZj9uAs5wQPya6R9q3gfSQm_Xyu9xViGBxOQ2COKKbcYeWg@mail.gmail.com>
	<20191120223207.6cuuklpgrzuhqug3@pbcl.net>
	<CANNYZj93tJxTsCwS3cg3J=0WB--A0Af26Y=nO9fOdfNb9okRYg@mail.gmail.com>
	<20191120231812.GB3962@localhost>
	<238a39c7-b794-aaa0-1da6-4b585078f447@intel.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 08/11] lrzsz: remove the recipe
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
X-List-Received-Date: Thu, 21 Nov 2019 10:10:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-11-21 at 09:24 +0000, Ross Burton wrote:
> On 20/11/2019 23:18, Adrian Bunk wrote:
> > On Wed, Nov 20, 2019 at 11:56:38PM +0100, Alexander Kanavin wrote:
> > > On Wed, 20 Nov 2019 at 23:32, Phil Blundell <pb@pbcl.net> wrote:
> > > 
> > > > However, I think the point still stands that the commit message needs to
> > > > provide a better description of why the package is being removed.  If you
> > > > think it represents an ongoing maintenance headache that's already bad and
> > > > only going to get worse, and this now outweighs its usefulness, let's just
> > > > say that.  Not all old software is problematic, and not all problematic
> > > > software is old; the fact that the last release was 20 years ago is an
> > > > interesting fact but in isolation that doesn't represent a problem.
> > > > Indeed, compared to some other packages in oe-core, eight patches in
> > > > total over a 20-year period doesn't seem like that bad of an average.
> > > > 
> > > 
> > > Fair enough, I wrote a hasty commit message. Mistakes happen.
> > > 
> > > Can I say what my problem is? Here goes: so far, no one in this discussion
> > > offered actual help with the actual issue. If you need this or that
> > > functionality from Yocto, please try to place help ahead of complaints and
> > > criticism.
> > 
> > No, your problem is your way of communication.
> > 
> > It is a very unfriendly way of communication to request help in the form
> > patch aiming at immediate removal.
> 
> Hopefully everyone has calmed down overnight and we can continue this 
> discussion politely?

Agreed, lets keep this level headed!

> Yes, Alex's commit message should have spelt out that both:
> 1) there are doubts anyone is actually using zmodem still (he did this)
> 2) the source is positively ancient and building it on modern linux is 
> getting harder over time (this was implied by being in a series that 
> upgraded gettext and fixed other recipes, instead of being spelt out).
> 
> So, if zmodem is still a useful feature to have in core, then is anyone 
> willing to step up and either:
> 1) maintain the recipe.  I'd love someone who uses lrzsz to put a fork 
> up on github, integrate all of our patches, and start maintaining it. 
> Maybe then other distributions who still ship it will join in too.
> 2) provide an alternative.

I just wanted to highlight that the way things are trending, its likely
we'll end up with Linux builds alongside RTOS builds with multiconfig.
These will likely need to communicate and the mechanism(s) for that
remain to be seen. I know I've personally implemented xmodem and then
ymodem as a way of dumping data out a microcontroller on a small
project before, it makes for a simple/effective way of getting data
over into Linux. I therefore have a slight inclination to try and keep
this around if we can.

I do take the point about needing work to keep it maintained/working
though :(.

Cheers,

Richard




