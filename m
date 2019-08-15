Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 424467F304
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 13:56:27 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id b16so2288628wrq.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 06:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=cw7Ql44rINsquVgTdRXvBp47fiaxH4i/yeaOfT3qd1c=;
	b=S5XKSIkQ7aV6jROeIhSYKX7pbfE8s4LQBc0uhK0Jzl9I1wyh/9vV4s5HVlNHcepDLq
	GkfTlr/QMLdDR10z80Y+osc9Glch6D5y02tCJEe8yGNBMpQpxU1clxMGHpbBd1UgdJoB
	9Bqpp4uUo5/avNKsJLQP7pPPnLxL93l9L8LiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=cw7Ql44rINsquVgTdRXvBp47fiaxH4i/yeaOfT3qd1c=;
	b=EuXXLlj9v+gryafnsmSznCQPrgQjnphdi8EqW/79CwaNMr98CbYIbPUOfaqe/4u54u
	TrdctFWOdAYVv8iHDv0qbxAHoLciQ0yRScE02uz+4n9aJ1oXqP7E5csknklwKVSHiWzZ
	fFLpAJgl/HY7Pe+d5wdgrQMnFxz5+jn3kcXQlO75eOMVgPggLPAkmRLUirjfp9HKA34r
	nIXYTNo0aEF52ntfGCp6O91+R5mf72o/fS5dgthjuKYjfPojss4UGgVZpjevleDYHTd1
	0Knp/dW+2AUftWqlr+wuKq4s1o3L/urbSYQ/qgvB4ezc5WZuFYnE9JDwlP2p2p1Kl653
	VsCw==
X-Gm-Message-State: APjAAAXHSF6Fp2x9kOlI5KJz0Wbo+4Qkc2Dy5T/RB9ccrsyi/iuatFO6
	+y6Fd2nuien3Y/PflbdjRCFlZA==
X-Google-Smtp-Source: APXvYqyc8zuk+78izXD3Fi5Iv6ApIF68bCHWrbsczmPtxZ4S9YWAgeTRtl/dfEe2GDpEySLkqFiRcw==
X-Received: by 2002:adf:e4c3:: with SMTP id v3mr5545653wrm.107.1565877387798; 
	Thu, 15 Aug 2019 06:56:27 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id t63sm1563145wmt.6.2019.08.15.06.56.26
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 15 Aug 2019 06:56:26 -0700 (PDT)
Message-ID: <21c7f2ef52a0776dbdc9ac948d3e964d0fd937af.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 15 Aug 2019 14:56:25 +0100
In-Reply-To: <CANNYZj_2GJt9=YaSJ8VG4gdEzxgtA+WRaNgknvQWmi6fHvQVBw@mail.gmail.com>
References: <fcc15178e58e4ef0a8e2cf3047109bd5@xbox06.axis.com>
	<33bca828a78daaefc32fe497e7f244e3208bc968.camel@linuxfoundation.org>
	<2a106fcffc331009abdb6498ffe8c4f3c99ee80b.camel@linuxfoundation.org>
	<CANNYZj9HHxJa5NKWU9r09NXgBy8aD0RTkugQ-k6esVNCTVOa6w@mail.gmail.com>
	<6551fb5303bcc8dbf3a9d55a1aa6a9ecd2baeb13.camel@linuxfoundation.org>
	<CANNYZj_7t+dB0FOUjGocHLzACtLquqqGV3R1awiQe=27JwQa3Q@mail.gmail.com>
	<123708bfcd4646571a59f2d2ddde7a90267833ef.camel@linuxfoundation.org>
	<CANNYZj_XzB3g55qEe4hYGGCBwPPkg9kwydWQ0jGwRbi8UkJNGw@mail.gmail.com>
	<f30af5bfdca30721a345f656c6f3762dbb947d25.camel@linuxfoundation.org>
	<CANNYZj_2GJt9=YaSJ8VG4gdEzxgtA+WRaNgknvQWmi6fHvQVBw@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Long delays with latest bitbake (was: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively)
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
X-List-Received-Date: Thu, 15 Aug 2019 13:56:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-08-15 at 14:56 +0200, Alexander Kanavin wrote:
> On Wed, 14 Aug 2019 at 23:25, <richard.purdie@linuxfoundation.org>
> wrote:
> > Right, it still definitely needs work. Its a balancing act between
> > sorting out the execution bugs in the code and figuring out the
> > performance problem.
> > 
> > If anyone wants to experiment, the way I'd debug this is to run the
> > before and after cases with the -P option to bitbake. If you want
> > to
> > exit early just make the code return where it prints "Executing
> > tasks"
> > or whatever makes sense as Ctrl+C won't write the profile data.
> > 
> > You want the profile.log.processed file.
> > 
> > So save that file with the "before" commit, then save it afterwards
> > and
> > look at those files and see where its spending more time.
> > 
> > If someone generates those two files I'll happily take a look, I'm
> > kind
> > of used to reading them. There are four sets of output in there,
> > same
> > data but different sorting/types, each has its uses.
> 
> And here they are (with task spinning included this time):
> http://sensi.org/~ak/tmp/profile.log.processed.before
> http://sensi.org/~ak/tmp/profile.log.processed.after
> 
> Hope you find it useful!

How many tasks are in that build?

What is really odd is this on both traces:

   524436  405.102    0.001  405.266    0.001 /home/alexander/development/poky/bitbake/lib/bb/cooker.py:264(notifications)

What that means is that cooker recieved notification of 524436 file
changes whilst it was parsing/preparing runqueue.

I would be very interested to understand which files its being notified
of changes to as I suspect there is something that shouldn't be there.

If we fixed that, it would take 406s off the 1800s for starters in both
cases. I don't see that locally in my trace, my build layout may be
different.

Other things of note:

Time in next_buildable_task went up 338 -> 440s
(probably through the set manipulation e.g. method 'difference' of
'set' objects)
New function update_holdofftasks() took 173s

build_taskdepdata is also eating lots of time suddenly.

So yes, useful, thanks. You may want to add some debug to that
nofitications() function in cooker and see which files are changing
though.

Cheers,

Richard


