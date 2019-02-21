Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id D41BD7C661
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 13:01:28 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id o17so30011323wrw.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 05:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ry7quzS8yDIRMMcWRGZEWlX0yHIrqQo/suQN3AJAbj0=;
	b=GlM1V1Fq1ynlhCS+fqUQou8Bnb0xed6ehfd161qmfwRCAy0QszmVJZ0GNtNAsXoc/c
	qgMrLte3vYr9H8pfO/5Of+sM53r6q1koUvKa6gCd9i/44Wts1/d4VmQnb8kBQMXViae4
	JHgPU3Nlj/68j2ktfCLTqrSssAAWEM/irKD2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ry7quzS8yDIRMMcWRGZEWlX0yHIrqQo/suQN3AJAbj0=;
	b=ENUMI4Kn43qfKGYZYzEAmC13z8jdfhFLAtsWOD8gGAl42y6WfS4EMBgUtOvbhgkMw/
	guCkHodxixAzuyugBmGR+mboCwvsk5TcKzQJCHRu+fqiIjBVmNL6SoPB01zfzHdKZsQ8
	edb49v+xYmFFJOh1g5pV7TTc6MgVRms+R+Kut4lZOmu+XN37IvBYdi3uKH1d9pE4w6+K
	Vu1hjA3s9H/FUcAsYQrcwOzvWHF7kkumnNus2A1oifCoBTxFtvCm/uiK3g4Z7k79CUQ/
	cUSpuT4kP3HISVNOjDNj9MTuzKchLIrM1r/j3TEJfP+50pGXA6LqIyjpoT3cbyaKI9kX
	f4mA==
X-Gm-Message-State: AHQUAuZHnzq19axQWBv8GIg2bszvoj40pn/ir+YGSq5jSHcXjE0+cHEj
	jwRSR5M+epyTC6uPZaWoN0fXKnZy+44=
X-Google-Smtp-Source: AHgI3IYEUHEwc3pq+8mjlUV+FfzGgMMcZSy/ftcQEF1y1DzfeNSH2zuila6jXkvAQG0Tp3WLc1SPig==
X-Received: by 2002:a5d:4e52:: with SMTP id r18mr17057216wrt.7.1550754089515; 
	Thu, 21 Feb 2019 05:01:29 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n26sm6696176wmk.29.2019.02.21.05.01.28
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 21 Feb 2019 05:01:28 -0800 (PST)
Message-ID: <5471c44e078f61500d0d0801e3c9c43a093d6006.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>, openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2019 13:01:27 +0000
In-Reply-To: <20190220164729.4rkhazvhtyzwkeh3@mcrowe.com>
References: <20190111164951.8329-1-mac@mcrowe.com>
	<47731964b9ae52ac23e67b92bbfd1a1ad3e2acc0.camel@linuxfoundation.org>
	<20190111165944.gussrefs6j5o6ffq@mcrowe.com>
	<20190123162759.yjdev2mpx24zwbaf@mcrowe.com>
	<20190220164729.4rkhazvhtyzwkeh3@mcrowe.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCHv2] glibc: Separate out AArch64 multilib loader symlink creation
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
X-List-Received-Date: Thu, 21 Feb 2019 13:01:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-02-20 at 16:47 +0000, Mike Crowe wrote:
> On Wednesday 23 January 2019 at 16:27:59 +0000, Mike Crowe wrote:
> > 
> > Does the lack of response mean that both approaches are horrendous?
> > If so, do you have any better ideas?
> 
> There doesn't seem to be much interest in this one.
> 
> The only other idea I've had is to create the symlink at rootfs-creation
> time. However, that seems to be detaching it too much from glibc, which
> would cause confusion.
> 
> I can apply one of my fixes locally (we currently have some far uglier
> hacks than these that I'd like to remove), but I'd really rather not have
> to diverge from upstream this much.

Sorry for the lack of feedback.

I'm fairly strongly against a separate aarch64 only recipe for this.
Realistically we therefore have to fix this in the existing
class/code/recipe.

The changes you sent previously didn't look that horrific, did you find
a working version of that?

I'm wondering if we can come up with something which works and
hopefully we can spot some way to then clean it up to be a bit nicer...

The delay was that I was going to try and come up with something but
that hasn't happened yet. If you have a horrific non-separate recipe
version that is complete, we can see if we can do anything to improve
it.

Cheers,

Richard


