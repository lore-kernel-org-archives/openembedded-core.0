Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id EB4826E688
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 21:54:01 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id mh10so1373356igb.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 14:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=zx4Cp+d5cEqS9i8zVH4FSdVkxxqt7mg+wMe+sJEePJk=;
	b=kNO6HstpAKF3Lsvv++WN2LihnsAmDR/M+b+FUJgO7jamWRX6RoyzTYsp+O2jqlcS0k
	axYdhUbBH0I6e0fIH8Rq373bCMPI+JQUUvjQ2ijjDrvs3QTkTqVt7QSnjFhpryiFD3cW
	qTeU9Ih9PodxBut8juQdCq02JJiMbAntpNI0ub4Rp4pBD152Zg4hj5AaxDmlXDUCYXQj
	HOqkxy70xLxaSqWT0dVKfWns1CutoHdMDIl0a9x3fuV2g3QZX1sTRrNklIgKOL2xist3
	ujhsMz3CQp+faaOHtxVGMN7Wsp+7S14B3B+byqgMo8nhg7uxYFImru9zuhiJNcWJnL0O
	FQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=zx4Cp+d5cEqS9i8zVH4FSdVkxxqt7mg+wMe+sJEePJk=;
	b=N2MXPaTym/7oA6yxL7GDJqPcGZL8TP2nreljXKtleqAy0yLGVtnDznvGfGYWxhUWUP
	vRRgIl77tdhpb4pNE9qzGE9T//wMmamPg7tKvcJJSRx8rvIB9MiY5c1FQDvO58oxHhXc
	JOUKshmlfPhT5gicwm8YmiRc6cpymK8ZcjSxptjV4bf9NFwRKXfqkSsrNWcdgwhdl4I8
	lTfrH6g5e4rDdHDtZ5AuwS7t7HfyIyMWz0lH4IvJetEODqmzlbSJLBW80kJaPxH2eqjM
	TvsHIuPjsWY0aR2uL13dhM4Ykp3FYIzrHFm6dhfFJ3+0sCwaRxnC5wTrswqujpafYyb1
	v1AQ==
X-Gm-Message-State: AD7BkJKd3dmDHIWkFIRuOPne0c2cP3S58WjiBMNMfBs7lqBrQHGznY3sG1EWInyHbLxaEw==
X-Received: by 10.50.136.136 with SMTP id qa8mr14179594igb.39.1457906042025;
	Sun, 13 Mar 2016 14:54:02 -0700 (PDT)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	40sm8203392iom.28.2016.03.13.14.54.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 13 Mar 2016 14:54:01 -0700 (PDT)
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1457836529-32388-1-git-send-email-twoerner@gmail.com>
	<10341857.OKlmJH1THC@peggleto-mobl.ger.corp.intel.com>
	<56E5D0C1.7010302@gmail.com>
	<1773609.Q7X4j5YgZm@peggleto-mobl.ger.corp.intel.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56E5E180.30408@gmail.com>
Date: Sun, 13 Mar 2016 17:54:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1773609.Q7X4j5YgZm@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] metadata-revs: provide more information
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
X-List-Received-Date: Sun, 13 Mar 2016 21:54:02 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/13/16 16:53, Paul Eggleton wrote:
> On Sun, 13 Mar 2016 16:42:41 Trevor Woerner wrote:
>> That's the problem I'm trying to solve: how can I easily keep all the
>> information required to reproduce this build, exactly. The whole "two
>> meta's" thing was just a speed bump.
>
> Right, understood, and it does make sense. I'm convinced there is an
> underlying problem to fix that this just papers over though.

Okay, I think I see your point, and I agree. There is a layer clone 
problem that should be addressed.

But again, I think this is a speed bump.

My underlying point is that we're purposefully leaving out information 
that is vital to reproducible builds.


> This probably fits with what you said at OEDEM, which was that too often the
> system doesn't build properly out of the box for various boards. Have you had
> a chance to think about that problem further?

Oh yes, but I'm rather sure nobody's going to like my suggestion, which 
makes me hesitant to suggest it ;-)

It should be possible for me to hand you _one_ configuration file and 
from that you could reproduce my entire build in _one_ step by issuing 
_one_ command. If I can get something to build successfully for a given 
board, you should too. But currently that's not always the case.

bblayers.conf and local.conf should somehow be rolled into one and the 
build should have some sort of "repo tool"-like functionality built in.

I hand you this one configuration file, you run "bitbake some-or-other" 
and the build starts by going through the provided list of layers 
checking out the exact ones I have used and potentially checking them 
out at the exact revisions I've used. This means the layer list will 
have to specify from where the layer was found, which branch, what the 
HEAD was, etc. In other words, exactly the information I'm trying to 
capture at the end of any build today.

I really think this might help everyone.

Newbies would have a better out-of-box experience. Chances are they just 
bought some board and want to make a build for it. I think it is rare 
that someone stumbles onto The Yocto Project and is happy just doing 
builds for qemu. My belief is that people find The Yocto Project as a 
secondary event, the main event is they want to perform a build for the 
hardware that just arrived and is sitting on their desk. The generic 
documentation doesn't target their board specifically, so in addition to 
trying to understand this new build system, they also have to figure out 
how to get a layer, where to get it from, and how to add it to their 
build. I know that The Yocto Project does have BSPs for beaglebone, 
raspberry pi 2, generic x86(-64), edgerouter, and some ppc board... and 
if this newbie happens to have one of those, things might go better. But 
if they have some other board...

I think experienced developers would be helped too by the combined 
config+layer-full-details thing too. For example, developers would swap 
configs between each other more easily, and build artifacts could be 
kept for future reference which is very important in a production 
environment.

The current way of doing things purposely hides information, and this is 
bad.

bblayers only tells you that on a given day on a specific machine there 
was a layer at a specific location that was used for this build. If that 
layer is something that was pulled from somewhere else (and not, as Khem 
was mentioning, something that was done locally) then there is no 
mechanism anywhere that preserves this information. There's a gap; a gap 
in the information. On my machine there's a meta-browser layer, on 
github there are hundreds of meta-browser layers, bblayers just says I 
used something called meta-browser... but the link is missing which 
points to from where I got this layer.

If I wanted to be really devious I could clone my repositories with any 
weird old name I wanted. I could clone meta-browser and name it 
openembedded-core and clone openembedded-core and name it meta-trevor. 
My build would still work 100%, but good luck with that! :-D

The genie's out of the bottle. There already are hundreds of clones. 
There is no way to police it, there is no way to force people to use 
globally unique names. I don't know how you're going to fix something 
like that. I think the best thing is to recognize this is going to 
happen and take steps to mitigate the issue... such as specifying where 
layers are coming from both in the config (for external layers) and 
after the build to record what happened.

I don't want to embarrass anyone by giving names, and I certainly don't 
want to be seen as a troll :-( I've been playing around with a large 
number of boards for the last while and there are lots of issues that 
I've come across. I already mentioned my thoughts on the out-of-box 
experience for newbies who have just bought a board and now have to 
figure out how to successfully add a layer.

Another thing I come across is the following: given a company (ACME) who 
produces a bunch of boards (ACME-1, ACME-2, and ACME-3). The ACME-1 has 
CPU-1, ACME-2 has CPU-2, and ACME-3 has CPU-3. On github you'll find 
several meta-acme's and a couple meta-cpu's. Some of the meta-acme's 
will have support for one or more of the ACME-n boards, but not 
necessarily all of them, or you might find your board is supported by 
one of the meta-cpu repositories you've found. You'll even find one of 
those meta-acme's in the layerindex, but the developer of that 
particular layer only has 2 out of the 3 boards so that's all their 
layer supports. If you happen to have the one that's not in layerindex's 
meta-acme then you'll need to google and use some other meta-acme you've 
found yourself. When you ask the maintainers of the various meta-acme's 
to please get together and make sure the layerindex layer fully supports 
all the ACME board, sadly that doesn't happen. When you provide patches 
and pull requests to add the missing support, you're at the mercy of the 
maintainer, who is happy to refuse your contribution for all manner of 
reasons ;-)

Simply having a bblayers file that says meta-acme or meta-cpu isn't good 
enough. And hoping that we can all standardize on one layer... well, you 
know what they say about standards! :-D

