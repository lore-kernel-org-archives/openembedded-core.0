Return-Path: <rudolf.streif@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 17ACD6013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 19:52:05 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id yy13so55836453pab.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 11:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4YM8osP17iT8FkNM12c5m1iUhK1JTv7dO7qBcMPt2fI=;
	b=gDTyWnE5/nSLd1D5s3Yn4zI9fXaS3QxbYnIRC3bavbsTz+ag7jr2LytlEnX8i/HsXN
	vW1x+7edfwcV7i8aATEnHb6xv9g3HSPtgWYO1EJ/G/yfOIdI+MTZpL4VSL23i9V48Zy6
	+ZMbni3FmR3Scddieet2bKSjn/aEpF2PplPSsiaSV6Q3Cb4Vvt4jFu/Y8XPN41u5Gva1
	7pUEdK1nN9uH7iZgkLZNL+n8mI0ykezKawz5KxVFG1qq06P5I4XAQzbv2ycWP+Enc1sX
	v3mOdzsIre/6IjbzidSFX+inNYKlfFCCNcLYrZx9ezccbMzPcPpcNwi0Tu3Zqm4Jbx3A
	fHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:user-agent
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=4YM8osP17iT8FkNM12c5m1iUhK1JTv7dO7qBcMPt2fI=;
	b=QuMpZ4p1EKnRze9plBmATsnrgpTKjKVz5kkiMv6LU0Ynb8yOmCHUchRibvRHAzoIiX
	IFvg2vFpo9v7KiP6MuozYz/3U4pRg860xUbk95FYeWWYSPANULEu75RMR+kqwVLeIhjl
	4x035N9jRImhHKSQ8hX8+suJy5syjw9srW6ABVLyn+CIIBOsw3FhBtc6UfIrEY/vDZHj
	gCJ54OfqIV+ctqnpELv1CIWfAXcGjwA73yEm0AGbyYn0ZYeTUZUMzSLfbEIdQ9LGGjvp
	x6mf3jO1WMP5BuZlBgHJ4IjTZzfCZo68+fZFhrvxByEJeOHyU6xU9vLwYfEJJBll/4RX
	UZUQ==
X-Gm-Message-State: AD7BkJJ4ZwSV5gd0Gx6FzN3d7jdHpu9aMor9Nxdp61Xum2YWVF9gOf1dfk/jSrdCK9vZDg==
X-Received: by 10.66.190.131 with SMTP id gq3mr4548189pac.42.1456516325974;
	Fri, 26 Feb 2016 11:52:05 -0800 (PST)
Received: from rjs-zotac.streifs.net (ip68-7-48-20.sd.sd.cox.net. [68.7.48.20])
	by smtp.gmail.com with ESMTPSA id
	v29sm21174614pfa.31.2016.02.26.11.52.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Feb 2016 11:52:04 -0800 (PST)
From: Rudolf J Streif <rudolf.streif@gmail.com>
To: yocto@yoctoproject.org
Date: Fri, 26 Feb 2016 11:52:03 -0800
Message-ID: <2042150.gN3rpHrprf@rjs-zotac.streifs.net>
User-Agent: KMail/4.14.10 (Linux/4.3.5-200.fc22.x86_64+debug; KDE/4.14.14;
	x86_64; ; )
In-Reply-To: <1456512644.11498.108.camel@linuxfoundation.org>
References: <1456508168.11498.95.camel@linuxfoundation.org>
	<56D09D35.8040002@balister.org>
	<1456512644.11498.108.camel@linuxfoundation.org>
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Yocto Project Status WW09
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
X-List-Received-Date: Fri, 26 Feb 2016 19:52:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

> > > 
> > > * We're about to try and transition meta-yocto within meta-yocto to
> > > 
> > >   meta-poky. The amount of pain this is causing is horrible :(.
> > 
> > Thanks for doing this. Can you summarize the pain? Are there any
> > important lessons here?
> 
> The key lesson is our current "migration" code in OE-Core sucks and I
> have some patches in progress which rewrite pieces of it in a way that
> makes it more useful. I'm therefore trying to make some positives from
> it.
> 
> That said, I haven't found a way to make this work without leaving a
> dummy layer.conf in the old location since a missing layer.conf file is
> fatal to bitbake very early on before any migration code triggers.
> 
> More should become clear when I post the patches, I've been holding off
> that until I actually manage a patch set that works on the
> autobuilder...
> 
> Patches should be out over the weekend (in time for the freeze).

Sounds like a lot of work and potential for breaking things with little added 
value other than a more consistent naming. What was the rationale for making 
the change, if I may ask?

Thanks,
:rjs


