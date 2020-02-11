Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8690860FB6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 17:53:40 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id m10so2802224wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2020 09:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=/fCXm2VelBVN3lsptpi1qqSuJOuht+/8PXHNHnDZfP8=;
	b=efXXkILtLCzXCKDLmtVbyCxnwporf1mk+yxJaYbzjCc6x5yA8PzDwFUnv22OViXXBy
	cb0sH2tWYaZrwHB4qBCEGhIEh3+rdPFaukeVfCqe7s0pr2n9nj9iza5Fy2TPWzrVOPOk
	LJLLHxt4NLOU5mgNddA5f0FZpoZpEJSS4gpDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=/fCXm2VelBVN3lsptpi1qqSuJOuht+/8PXHNHnDZfP8=;
	b=g4n1hV5p8bGQF5c1P/2ZxQ9tY7vjtXYIts44G4ye3WXtBPWfBdw81eUhLR0MJD+Hfe
	8MTbqT68gtjgDVfNf1ZbWmeh+DDc8in6qJsvZWmTJeiE5cfliiA8ppO/K0wuJTOcqGDW
	VcudKtKuGVSnLw3OKxrVfHZP29LhhD5FBc/DklKquodnus/+HWASFB1fxQRTWI1bg+C0
	4wQisLIW2+5SN39ziDppgKQlv777RH+mdIuK/7gWRp9dwN7YqMigvUpQPdVEI99ljkxo
	p03FMWn7L9L6oxPwR428/mF4aq10OkoMhH/+3FZ3WZKZ/l6T2yicMqz8JTJFh2TrBiHr
	DCHg==
X-Gm-Message-State: APjAAAUGtUlNZV3MrWWvFmHZ5KSwrjBr6CPT3vd+srrkyzaxlGWDm8rt
	Nk+rQooeYRviAhwD8kJ75vcZ1g==
X-Google-Smtp-Source: APXvYqyqMZNHhtgg7ocw5OdGkigA6tx7hWgWvOWwx7xccEWaeyVNrRFyZW1zoAQ4fEWCA5MuG9O+0Q==
X-Received: by 2002:a1c:4383:: with SMTP id q125mr6833842wma.88.1581443621052; 
	Tue, 11 Feb 2020 09:53:41 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id y8sm4578563wma.10.2020.02.11.09.53.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 11 Feb 2020 09:53:40 -0800 (PST)
Message-ID: <2a9e05eadae5df35ae1c13be4484fd6d3e8fed19.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>, OE-core
	<openembedded-core@lists.openembedded.org>
Date: Tue, 11 Feb 2020 17:53:38 +0000
In-Reply-To: <CANNYZj-KS+mHQ20sQUv-SzpeaXjvAzQDPND00iuep6ek7utd5g@mail.gmail.com>
References: <CANNYZj-KS+mHQ20sQUv-SzpeaXjvAzQDPND00iuep6ek7utd5g@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 11 Feb 2020 17:53:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Alex,

Thanks for bringing this up.

On Tue, 2020-02-11 at 13:49 +0100, Alexander Kanavin wrote:
> I'd like to lay out a few ideas/thoughts on what should be done with
> sato (matchbox bits) and X going forward. The inputs are:
> 
> - Red Hat is the only company doing X maintenance anymore, and
> they're transitioning it to 'hard maintenance mode'
> https://blogs.gnome.org/uraeus/2019/06/24/on-the-road-to-fedora-workstation-31/
> "Once we are done with this [xwayland gaining missing features] we
> expect X.org to go into hard maintenance mode fairly quickly. The
> reality is that X.org is basically maintained by us and thus once we
> stop paying attention to it there is unlikely to be any major new
> releases coming out and there might even be some bitrot setting in
> over time. We will keep an eye on it as we will want to ensure X.org
> stays supportable until the end of the RHEL8 lifecycle at a minimum,
> but let this be a friendly notice for everyone who rely the work we
> do maintaining the Linux graphics stack, get onto Wayland, that is
> where the future is.
> "

X.Org is definitely going to be shrinking market share going forwards.
That said its going to take a few years for this to happen, its not
going to be gone in 6 or 12 months. I'd hope that it should be a
relatively low maintenance burden over the next couple of years as it
won't change much, it will mainly be things like gcc changes that will
affect it.

> - matchbox is reliant on gtk3 (to be obsoleted by gtk4 this year),
> and does not have a Wayland compositor. Yocto project does not have
> the resources to do the gtk4 port, or add a compositor.

Whilst gtk4 will come out, gtk3 will continue for a while yet, it feels
like we only just got rid of gtk2+! :)

> - no 'lightweight Wayland compositor with a desktop/launcher
> experience" has emerged in the open source space; I think the only
> realistic choice at the moment is the reference compositor Weston
> which provides a blank desktop with ability to open terminal windows.
> 
> So the way I think things should be going (seeking opinions/inputs of
> course):
> 
> - oe-core adopts Weston as the 'new sato'; all sato images that
> currently pull in matchbox and friends are changed to be Weston-
> based. Note that there is no requirement for 3D acceleration; Weston
> works with plain frame buffer device. However, both options should be
> supported and tested. Also, support for Xwayland should be tested.
> 
> - oe-core continues to support and runtime-test X for as long as
> possible; for this a new image (say, 'core-image-sato-xorg') is
> created which will provide matchbox under X. However, once upstream
> bitrot sets in, and pain threshold is exceeded, this will be removed
> and/or relegated to a legacy layer.
> 
> Thoughts?

I still strongly believe we need something in core which pulls together
all our pieces into a UI where you can test key elements of what we
build. If we don't have sato how do we actually test the core or demo
it?

I think we shouldn't rush into things here. We should ramp up our
wayland testing and make the wayland images more useful/comprehensive
and then look at moving more of our tests from sato to the wayland
images.

So in summary, yes, I think we do retarget our testing over time and
strengthen when were testing under wayland. I probably don't see that
needing to happen quite as quickly as you do though!

Cheers,

Richard










