Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6C37C7D53D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 12:55:34 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c3so2734626wrd.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 05:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=ycXThJv7v5dG+WNftiFZni/wp9lYqrxsnApiF0obL2E=;
	b=N3xJTaBEApmsjXxiAK9w6CcSQDCnw9G8bGvZeT47PtqV2/jD7BoD40ecSbJLblIkrl
	LZAn+qCTd/Q1s9LODflLxTk4GvDQMXOw6+DF6ab3ideuP9wRb1visiIoqNdfF14qd4bs
	YxHD0LAOfPLb6lPvmHYZ161qSfcdVHc32y8h4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ycXThJv7v5dG+WNftiFZni/wp9lYqrxsnApiF0obL2E=;
	b=HKyH0TqBpwu8nkoucKXd2Yp1b+qTeOHkUC542DOqYCgbrDGgXDbqx4XUODW1M3X3vd
	92S+FIm8AHhsgQI0bwgdHjM+YbnHUMPwOu9aMaQQhDR1a8Fk76vF/b6C4Y79xh4aqVRQ
	YaJ9NYaxkglet9xd/4EjT0ZqsDaygwsZD/TBHcYt/gLqSgFnpV0u6PX4GDCHwGKztpPd
	7XmgziOIg9I4vgRwift2NmXdLqXU5nw66YNInI+c43iYTfNOT+EYw/yk3iRjgfOXIioF
	JIdJoVx2dFjl0331cw7A6mRZboNvhfzPxjeKVitgrEMce/KAWgcNXSeIsr32I4lzTeOl
	EDiA==
X-Gm-Message-State: APjAAAVCyeNWdLdveQDwkmbahCqrZykKDJP+ysWJ/y7nZBjNmwFWXIA/
	gJ/hoZStm9MNes7yJ/18cdG+kQ==
X-Google-Smtp-Source: APXvYqxflQ0R4UPdqB8Te0qqeRBOXHAStJtPvzbatEHYGmc/wc3baXkDJPJqR3JfE/4qGefO8ZDGng==
X-Received: by 2002:adf:f646:: with SMTP id x6mr55826277wrp.18.1565787335079; 
	Wed, 14 Aug 2019 05:55:35 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b26sm4840319wmj.14.2019.08.14.05.55.33
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 14 Aug 2019 05:55:34 -0700 (PDT)
Message-ID: <123708bfcd4646571a59f2d2ddde7a90267833ef.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Aug 2019 13:55:32 +0100
In-Reply-To: <CANNYZj_7t+dB0FOUjGocHLzACtLquqqGV3R1awiQe=27JwQa3Q@mail.gmail.com>
References: <fcc15178e58e4ef0a8e2cf3047109bd5@xbox06.axis.com>
	<33bca828a78daaefc32fe497e7f244e3208bc968.camel@linuxfoundation.org>
	<2a106fcffc331009abdb6498ffe8c4f3c99ee80b.camel@linuxfoundation.org>
	<CANNYZj9HHxJa5NKWU9r09NXgBy8aD0RTkugQ-k6esVNCTVOa6w@mail.gmail.com>
	<6551fb5303bcc8dbf3a9d55a1aa6a9ecd2baeb13.camel@linuxfoundation.org>
	<CANNYZj_7t+dB0FOUjGocHLzACtLquqqGV3R1awiQe=27JwQa3Q@mail.gmail.com>
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
X-List-Received-Date: Wed, 14 Aug 2019 12:55:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-08-14 at 14:08 +0200, Alexander Kanavin wrote:
> On Wed, 14 Aug 2019 at 13:36, <richard.purdie@linuxfoundation.org>
> wrote:
> > On Wed, 2019-08-14 at 13:25 +0200, Alexander Kanavin wrote:
> > > On Tue, 13 Aug 2019 at 21:18, Richard Purdie <
> > > richard.purdie@linuxfoundation.org> wrote:
> > > > I had a glance at the profile output from master-next and the
> > > > problem
> > > > wasn't where I thought it would be, it was in the scheduler
> > code.
> > > > That
> > > > is good as those classes are effectively independent of the
> > other
> > > > changes and hence are a separate fix.
> > > > 
> > > > I've put a patch in -next which takes the above test to 36s
> > which
> > > > is
> > > > close to the older bitbake.
> > > > 
> > > > Could be interesting to see how it looks for others and
> > different
> > > > workloads.
> > > 
> > > I just tried the same test I did yesterday with
> > > ab56d466452148e5fce330d279d13e2495eceb1f. Unfortunately it
> > doesn't
> > > seem to improve things much: bitbake is stuck at "NOTE: Executing
> > > Tasks" for 15 minutes now.
> > 
> > This might sound slightly crazy but can you try commenting out this
> > line in runqueue.py:
> > 
> > logger.debug(2, "Holding off tasks %s" %
> > pprint.pformat(self.holdoff_tasks))
> > 
> > ?
> 
> Even crazier is the outcome: it helped! 

Cool, I think I can explain it.

The holdoff_tasks list can contain a list of nearly all the tasks at
some points in execution. Even though the debug messages aren't being
printed on the console, they are being sent over the internal IPC bus
between the cooker, UI and other event handlers. Obviously for small
task lists its not a problem, for large ones its multiple 4k chunks
over pipes which isn't going to be fast.

We have done a lot of optimisation in the past but its all too easy to
trend on something like this and upset things :/.

> The whole thing completed after 15m49secons (with much of the time
> going to the empty task spin), that's some 3 minutes slower, but
> certainly it's usable again.

You followed up mentioning this wasn't with master-next. I think there
is a patch in -next which will help with the empty task spin so both
together might get us back to more normal numbers.

Cheers,

Richard


