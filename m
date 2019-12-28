Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id B2C407CDC0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2019 11:55:13 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id b6so28461573wrq.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2019 03:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=0LqOOX4nCZu8PRtNAnMwldIFJlwHAyQ9Agn97HT+ZDw=;
	b=abqJp0iBNl548xuSYekqDipH1HLpHlfcpSpBNh15JI9tIB6+xJVED0aFb9LHPUOIa7
	wJLye0whc/E5TBqmI3XqPoSkSTzwsZkBhNe/zXBaqGTtpTB3EQWLqqquPNKH46EYicRp
	QVlk18VaEforQL+TO0QO8on3OUy3eBafnqYc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=0LqOOX4nCZu8PRtNAnMwldIFJlwHAyQ9Agn97HT+ZDw=;
	b=BHYlXhMLXj7hypNDhZKevr+66jS45ogs3BduZ3XWmxRIBv29GLq4q5CxNWjulxPzCD
	QZJ4Hx1oBtqXs6K0mfKOVYKd95VRlGryQit1iWjX3I12H6vFoblNPc2RX/XEtl/Zy9gh
	NcDG5rnPzEkWdo88tHAOWM3WNTuuXURotmE73AjTniq2+uIFn98oHRNxYsrVGDtK0kM7
	O7J6QowF283Qb0/nUyYUoJ3lIRmwYPWsxr45ej+KIkVzq2ri6HBk5hr5bv681aODiT6r
	7o53M3w/WU+KmlEfJ1CmnY5NJAiI2c6T9Xx03ie8mYwBAc82VnCv8+jj6c9dv/bRpE2I
	Gmyg==
X-Gm-Message-State: APjAAAUb4277R0YUt/yWPxB7rFJT4kmxMYtS+BZX0VLAAPyUc1mss7zp
	HIpkIaReHgv54hmfYFO5zZfn7JNUIjY=
X-Google-Smtp-Source: APXvYqwmT79ufljJL/cqKlvUPZHRuIcGsFw+v5TXI2r424Q8XcXk0gV4WxIrVpx/go8YEBZclpw/lg==
X-Received: by 2002:adf:fc08:: with SMTP id i8mr11007754wrr.82.1577534114085; 
	Sat, 28 Dec 2019 03:55:14 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	l7sm37734528wrq.61.2019.12.28.03.55.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 28 Dec 2019 03:55:13 -0800 (PST)
Message-ID: <2be17566f3104a4a843bf27dbf4e2294a2fca1b7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>
Date: Sat, 28 Dec 2019 11:55:11 +0000
In-Reply-To: <CAJdd5GYUDegdRO7kR_PcM8oO4BoEbhxunYfm7qanGBnW-eBTjw@mail.gmail.com>
References: <ce6615e19c75117b5d4458334af60107fba830a6.camel@linuxfoundation.org>
	<f92e77c992efa93542732e335a99177b5903a11f.camel@linuxfoundation.org>
	<a73ba44d3f16704691971ebfede683de21b2e65d.camel@linuxfoundation.org>
	<CAJdd5GYZydn+kxHw3jP9AuJWWv60nxYwFPYWtrSGi1-q4NJNiQ@mail.gmail.com>
	<cd4a5e26597d3b09392d76edfeb018ea38a368ff.camel@linuxfoundation.org>
	<CAJdd5Ga=vrNMe6hW+SGrJaP=FAQhZBjqa14gXJ3qoQxzOBaaew@mail.gmail.com>
	<CAJdd5Gbbmv45-q0G1FSDgfNLNQG+xHArorf=F=-wZtdOPU85xA@mail.gmail.com>
	<a9bc7048e2f7dd45a6fd6e7730c8143573646ac7.camel@linuxfoundation.org>
	<CAJdd5GYUDegdRO7kR_PcM8oO4BoEbhxunYfm7qanGBnW-eBTjw@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Debug from failing hashequiv builds - server side problem?
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
X-List-Received-Date: Sat, 28 Dec 2019 11:55:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-12-27 at 13:55 -0600, Joshua Watt wrote:
> From a more theoretical standpoint, I think that hash equivalence
> only works if all of the possible variables that can impact the
> output hash are present in the taskhash. Otherwise, you can end up in
> cases described above where the same taskhash results in diverging
> output hashes that will never converge back together (in this case
> because the build host arch differs). For most target recipes this
> should already be true because we certainly want to rebuild the
> recipe if any of the inputs that could possibly affect the output
> change. One of the great parts about hash equivalence is that it sort
> dynamically and automatically figures out if these changes don't
> actually change anything and accounts for it so we don't have to
> manually figure out which variables for which recipes could be
> whitelisted (not that we would embark on that madness!).
> 
> However, for some recipes (e.g. native and cross), the taskhash is
> incomplete in this case because we don't actually care about the
> specific binary output from these recipes; we actually care about the
> behaviour of these recipes when they are run (e.g. we don't care if
> gcc-cross running on x86_64 or aarch is the exact same binary as long
> as it produces the exact same cross compiled target binary in both
> cases). Hash equivalence sort of falls down a little bit here because
> there is no sane way to hash the "behaviour" of a native or cross
> recipe. If there were we could set the output hash algorithm for
> native and cross recipes to "OEOminiscentBehaviourHash" and all would
> be well :) In lieu of that, the next best thing is to make sure that
> the inputs we give to the hash equivalence server are the full set
> that affect the output hash, just like we do for target builds. This
> works because we do expect that on a given build host arch, the
> output should be the same from build to build.
> 
> So, the real question is how do we make sure that the inputs to the
> hash equivalence server are all the ones that affect the output hash?
> I think there are a few options:
>  1) Make up yet another hash (yahash) that is equivalent to the
> taskhash + the hash of variables "unwhitelisted" for the purpose of
> hash equivalence. Instead of dealing with taskhashes, the hash
> equivalence deals with yahashes
>  2) Just like #1, except that the yahash is only the unwhitelisted
> variables and hash equivalence uses both the taskhash and the yahash
> for lookups.
>  3) Implement some sort of "namespace" field in the hash equivalence
> tables that is used to filter out entries appropriately (basically,
> the solution proposed by Richard).
> 
> I don't really have a strong opinion either way.... #3 seems much
> easier, but the thing that worries me is if we are going to find
> other variables that should be unwhitelisted and do #1 or #2 anyway.

We do have quite a number of variables we exclude from the taskhashes.
The most obvious is TMPDIR since we make relocatable binaries and don't
care where something was built. On the most part hashequiv is fairly
tolerant of this as worst case the outhashes don't match if a path
leaks.

I was further thinking about this and another issue is the version of
gcc on the host machine for building native binaries. We're naturally
going to end up with different outhashes for a native binaries built
with different versions of gcc (or other host tools). This is more
problematic as we're back to two outhashes which are treated
equivalently for the same input hash.

I'm not sure its realistic to try and even encode all the permutations
of host tools that may influence the binary output from this
perspective.

> As stated, I think that one of the advantages of hash equivalence is
> that we can be a little more aggressive with what we "unwhitelist"
> and let the hash equivalence process itself figure out if variable
> actually makes a difference in the output.

Having also spent a bit of time thinking about this, I think the
important piece is that we need to match the behaviour of sstate in
hashequiv. The theory is great but in practise they have to work
consistently and together. Where sstate allows two coexisting hashes,
we need to allow for that on the hashequiv side.

For that reason I don't think 1/2 are feasible at implementation and
we'll need to add some namespace field (as in 3) which allows us to
have the two systems work together.

The native arch issue is the big current one and when uninative is
active, I *think* its the only one we have. We may need to account for
the gcc 4.8/4.9/later sstate splitting now I think about it. When
uninative is not active, I think it would have to use the NATIVELSB
string that sstate uses to split the sstate feeds per distro.

I've hacked the method overloading into master-next as an experiment to
see how it works out, just with BUILD_ARCH for now.

I also tracked down the mystery runqueue "not executing tasks" problem
and put hard aborts into runqueue so it does not do that. The challenge
now is the conditionals around that abort aren't right so its aborting
some builds it shouldn't. I'll continue to work on figuring out the
right set.

Cheers,

Richard







