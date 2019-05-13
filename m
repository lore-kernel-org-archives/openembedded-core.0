Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 60ED27D723
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 13:46:20 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id r4so15334426wro.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 06:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=lMwcE6+DnXxXGi40kiLGRycJaPrr1e8yVzM6PCQdwHM=;
	b=ReC99quOgEGJGScKVjPfiusAwyW7oLxjqMX0vh5v971URrpaQ3q9r++WmRH8EAiPWt
	Z11GkDbWAPkfcuXKFWfdPdChxMyoUBVpxWCA7LoK2YvSW5nDXUGHB40mfrkoRTpbRrKD
	24u1ezdqxMimzwexEXyl4i0WlV0sNZGSYTg5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=lMwcE6+DnXxXGi40kiLGRycJaPrr1e8yVzM6PCQdwHM=;
	b=HQrXKmhE3koO2Vzt2atxQxspTAbD4WxRap9zVNW1CrpQalQGcpBVo1uKRI7T9nqPCu
	voiJmLYr3wbR4/WY/fewWW6Y0T0SvkaoDIoczxNqIKNRBnF1As9y+V7qOZvhVVAndEG7
	bnG0CmTCA0v2oSYdBTll1LNg23NTXHRVwMUzkABgJRy1ZgkmKAAWz1XsE5J1Ov1Sz0K7
	jo6vOfzqet+9Wr5U6kCQrdzq+cPvVCJ0PnejN7g+jxHf3+bkEB49UUYAzi3v4UZ6ej1o
	3J69ECFz14Ws7gDNQ12zkIDwVr8cmWYYCC0nB9qBXGNe9bg3LdoHa2cVBp2sNP4YHECo
	0nRw==
X-Gm-Message-State: APjAAAUuspSgCws+rLA8EmNSn+tuOixIie9R8k0lHHPG4m0AbIOLwT8R
	QTL4myVmivp/9hb2z/2W7ZkzDw==
X-Google-Smtp-Source: APXvYqxHL/WdH1daiUmHMOYk0AaATj7JPT2nbnvOtmNYydYB5i9iCYjpqONjVQrdrTjyYQfDNz/p/w==
X-Received: by 2002:adf:dbc1:: with SMTP id e1mr18645733wrj.203.1557755181027; 
	Mon, 13 May 2019 06:46:21 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u17sm12474313wmj.1.2019.05.13.06.46.19
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 13 May 2019 06:46:20 -0700 (PDT)
Message-ID: <c1411d0a06b8e9778f581247d4fa9fb20859021c.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 May 2019 14:46:18 +0100
In-Reply-To: <CANNYZj8WQasbaiPZnifQ474QMPyNS-YZC3fgqbK7eMZSWCenig@mail.gmail.com>
References: <20190508135459.84886-1-alex.kanavin@gmail.com>
	<20190508135459.84886-3-alex.kanavin@gmail.com>
	<000386a97aab0dc593e908b4d7f50f1c8a079be9.camel@linuxfoundation.org>
	<CANNYZj8WQasbaiPZnifQ474QMPyNS-YZC3fgqbK7eMZSWCenig@mail.gmail.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] webkitgtk: update to 2.24.1
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
X-List-Received-Date: Mon, 13 May 2019 13:46:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-05-13 at 15:39 +0200, Alexander Kanavin wrote:
> On Mon, 13 May 2019 at 13:36, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2019-05-08 at 15:54 +0200, Alexander Kanavin wrote:
> > > Add a patch to address a missing format string error.
> > > 
> > > Disable the recipe on 32 bit x86, as SSE2 is now required
> > > unconditionally.
> > 
> > Unfortunately this isn't quite that simple since just disabling it
> > triggers:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/445
> > 
> > (errors in world builds)
> > 
> > It might be time to optimise qemux86 slightly more which would help
> > avoid this?
> 
> Yes, we should certainly move qemux86 to something less vintage than
> the original Pentium CPU. I'll make a patch.

Sounds good thanks.

> Another issue is 'packagegroup-self-hosted' including epiphany, and
> build-appliance-image pulling that packagegroup in. Tracing back the
> history, it seems that epiphany is there because long time ago Hob UI
> made use of a 'web browser' for some tasks. With Hob long gone, and
> its replacement Toaster accessible across the network (or from outside
> the VM), I think there is not any more a use case for including a web
> browser into the image?

I agree it shouldn't be in self hosted which should be more minimal. I
think we do need a webbrowser image which we test *somewhere* and this
ties into the discussion we had in the bug triage meeting regarding bug
12991.

Basically "build-appliance" was designed to test whether toaster/hob
could rebuild the build-appliance image (and hence be self hosting).
I'd like to see this split up so that the self hosting is commandline
and we have a web browser test somewhere else.

An added complication is that the test also tests VMWare :/. Tesing
multiple things with one operation has its drawbacks...

Cheers,

Richard



