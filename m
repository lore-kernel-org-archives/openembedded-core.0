Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id F39A87FF5F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 15:00:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47vR4V3wTDz4K;
	Fri, 10 Jan 2020 16:00:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1578668443;
	bh=bCIqSxNxoHwGiXQLDw+T9+MFPeEeoIUC7qin1WRz0CY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YFtG6eAxHmnf+pcjRBOz+5F3wUr/vzdIqsfINZHv92+eLygTa4aCEFwlvrNkea0jU
	sZgwDsnJ5ZY+k+RGMQrfv659Kor7np/r1/7Ez0gg09aUYGRQDRz5WcMaobJ164JTth
	oSxJ9j/jGkvqQDO9aCsrLlznEvlEyBJCOwj7yUEojSYXAMgbDTPoRE/zGoxCZzYD0A
	7zTzPUs67v4wlB0m8kXmGnyyQhlUu2q1yTB1WB/cUyl/m0ielGuH4QejX1X5hKRZoA
	4DeSqnDPcepi+l4diV+7eEDz24d7h8/2df3HKWk8Kmxpps7tvh11aFmn0qgZGXEKSp
	GIllbf9XYwr06/8/Qe1MPw4RBz1NhbYhjIMYFhWPXp/UdfzYsbxjKRqqcrhBS279Kc
	LRjU+tSD7/d5pUGhOD8sEWir8N9fbC0y6XJ2wUQuakcPAmF/WMhb/e2dkps+oQet12
	IeEM54aj523ADim4kPqSHc8l+OGmE++IpzTVBkTr+lZlFpJ99E4v3EqpIQxFplGza4
	EaOiOisQXs8d6uiII72gOlVm2MewEf89/UvipMsDL+AeXJNOKzcpSfttKM2IqL4r91
	vWGRTg5oxb3zUSZlyJofentHOb6znxoYF0r5w4mo5A6jcEv4MQX06rGg6FL/E9Z+gL
	tfpJvfvAbISFH6OioNFW1j6Y=
Date: Fri, 10 Jan 2020 17:00:40 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20200110150040.GA29928@localhost>
References: <CANNYZj_52vBnUoR=XL0-vVPs7-h3=vH0QoO9f_wBVo+8FiijhA@mail.gmail.com>
	<CANNYZj8Tr3N-kp1b47w8LimQOWOyWVzqLyq1ip6eS4juf5VXFQ@mail.gmail.com>
	<e1cd09d3f326c30da7ecf41e951105f3a92af64f.camel@linuxfoundation.org>
	<CANNYZj-26WfDZ3fdp1WgptphLYxrhA6H780rDQReGk3fP+x5og@mail.gmail.com>
	<20200109144454.GB31026@bill-the-cat>
	<CANNYZj_rB4cPnGTqoO4MX1iwj2N0a6bhP3jvxCwOuO9mfMRSLA@mail.gmail.com>
	<20200109150148.GC31026@bill-the-cat>
	<CANNYZj-UjHc=f-yvfGXhqRH_4AKKzrAdgaX1i_jpzDSAEFfnRQ@mail.gmail.com>
	<20200109155506.GD31026@bill-the-cat>
	<CANNYZj_wZx-FCrLmsoBvRF8eP8JPxMHFd2TjMgbD_BjkHsNjJQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj_wZx-FCrLmsoBvRF8eP8JPxMHFd2TjMgbD_BjkHsNjJQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Tom Rini <trini@konsulko.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/28] ifupdown: update 0.8.22 -> 0.8.35
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
X-List-Received-Date: Fri, 10 Jan 2020 15:00:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Jan 09, 2020 at 05:12:58PM +0100, Alexander Kanavin wrote:
> On Thu, 9 Jan 2020 at 16:55, Tom Rini <trini@konsulko.com> wrote:
> 
> > I have to admit I'm guessing at what level of automated run-time testing
> > we normally have today.  We sanity test a sysvinit+busybox image with
> > networking, yes?  If so, we also do that on systemd and I assume with
> > what I put for the systemd+busybox-free we also do there, yes?
> >
> 
> I believe we test sysvinit+busybox, and systemd+busybox at runtime via poky
> and poky-alt distro configs.
> 
> We also test systemd+busybox-free core-base-utils (without ifupdown), but
> only as a build (no runtime tests). See
> lib/oeqa/selftest/cases/imagefeatures.py.

Is musl runtime tested at all?

ifupdown is one of these recipes where a musl build error was "fixed" 
with a patch that makes something do the wrong thing at runtime when
using musl.

> Alex

cu
Adrian

