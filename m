Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id A2357600BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 01:47:51 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id r62so16679797pfd.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 17:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+0X9e7tdNqRMVLekbTpvvthNaFZGq0LwztZmDyDHYC8=;
	b=nUaiAgb8jrmZMFRdANpnfBNFdgEUVkVERZalGAVcctnXqYWO4aWyicps7mq0BS1Fbg
	+jhDfN3i7jaMNT3brFHFYekO1Eipfjb760nGEcC1pv4OdTUX6oelJ3sz3sybV79jcwDS
	c2Mlb1qzibJTd5s4gdNPyOw3yEKXHV6Zv7pQ8edrIwLB0KbrfcuYNZxp+rK0Io0ZR0//
	bfWKFU//8wph2zEYDgvUJgtBTWaPHG5kHRFCImUaF8bOSiEp/76MyrbTVwvfrJzpXC+N
	vvxm0XvxQhloghF3nd6Q+1VaNRotrG/KDRI2D0j2MAqaYCcJqYhe4gedOiRuKi7TSnOx
	z7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+0X9e7tdNqRMVLekbTpvvthNaFZGq0LwztZmDyDHYC8=;
	b=WO14Hwo6N1jVhcit1X/4wKV7Ex1RQjO4Fd0PGue2FJUypJqeSWNCs0VDtfEWQTMP+U
	xrDUyZESBv0gyhKJjh+oncOyJMGFmkZ8moRMdyaZFqYYZv9inMPDy6CP4uRfAM3lk/S6
	FbKYFPvzqTQU1ctd+znnSYaWUdzBcpVRRiOGWwiIOKrNkAM5hB+caLhDtegjjq3R3eAS
	LDbbqVbvwJ6zXtpCMV3BQnQXLWoGAJNRXhedRnr0NK8YuaPI7mvibndBpM6XCT48cW3J
	JT8jkfLjAjSvhv/M/k01QiaLdbgvEnaqhKJvUoCEhv4SR0ULbzemEOj7mjQiT089Dag8
	xQ1A==
X-Gm-Message-State: AJaThX4wY5BqaQGiMqMETYQA1/By7Z7ktGc2oUsPEtO2Rg99EsSMhBy6
	4JFY0oZsHLGCEjGYlzFsII5qSF4b/FOkbnM5ihw=
X-Google-Smtp-Source: AGs4zMZQr4MghsS/nvh1S4MrKsjeq84soA0TL/tn8cfRSbY2/JuM20pfgAVn2/UciyCr/WV/hCUnk1Z3Wk+r3mOs2Hg=
X-Received: by 10.101.73.203 with SMTP id t11mr35091361pgs.446.1511747272622; 
	Sun, 26 Nov 2017 17:47:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Sun, 26 Nov 2017 17:47:22 -0800 (PST)
In-Reply-To: <40240a76-a59f-b721-2445-e70be9f047ea@gmail.com>
References: <1511409137-30823-1-git-send-email-akuster808@gmail.com>
	<CAJTo0Larccb=6j_AgMpMpxtSDkUCSCLzC3HDJ12rqk=9_ybMdQ@mail.gmail.com>
	<40240a76-a59f-b721-2445-e70be9f047ea@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Nov 2017 17:47:22 -0800
Message-ID: <CAMKF1sqB7vj=b=j5owGCsTLSJri5kXDcpop+t8-XtPy1TytVAg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Several Glibc security fixes
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
X-List-Received-Date: Mon, 27 Nov 2017 01:47:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 23, 2017 at 8:16 AM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 11/23/2017 04:00 AM, Burton, Ross wrote:
>
> On 23 November 2017 at 03:52, Armin Kuster <akuster808@gmail.com> wrote:
>>
>> The pending 2.27 update does not need these. Only apply if that update is
>> delayed too long.
>
>
> I don't see a pending 2.27 update, just a 2.26 update (to
> 77f921dac17c5fa99bd9e926d926c327982895f7).  Is there a patch I'm missing?
>
>
> I was hoping, would have made things easier.. so how do we plan on
> disgusting between the two 2.26 versions ?? The CVE checker wont be able
> too.
>
> its possible this set of patchs may be different for the pending merge.
>

validate it in master and if its a specific backport thats already
covered with master
sha then create independent backport for release branches.

> - armin
>
>
> Ross
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

