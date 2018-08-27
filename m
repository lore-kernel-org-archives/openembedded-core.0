Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id B2AE8601D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 22:47:29 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id u12-v6so485300wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 15:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gPr2DrkP8InBPTsuNAX0Zh5soROonRIQuylWNvV1b+A=;
	b=YU0MZ4sJ01RTbFkhTaX1fZUxZC8V6E75VzIrDErF5Ve6fYOqou7POeXaAtl/SiMPo0
	mKoSQ6ao92WykU56vG/Ix1i8EIQKHczL3g8IsbBVdlPrK4VFonyQUOWo9FtBxSnb4QrR
	HWyT0TkfMd+vF/9yCeSweW5LrGkkhMBrI2sKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gPr2DrkP8InBPTsuNAX0Zh5soROonRIQuylWNvV1b+A=;
	b=trFw9dK0dyC/5W0hjZklk616sT91Pm2Ic36Ymt9HUkGA4as/ylzsu60clGvS/0enaO
	pM1uhHLmYwKjSBZiJGL26KQozj5huOHTQ5q0xjgBYFlyxR6OHmI3hS4GK2Kd62bStXVI
	si/vFimh1TgzQPSzeZ7HZdx+UJ695wgu0ixOrdjPynxedzWsUcz/o3BgRG2iymkOMcsn
	yQehOXHszI8CFpUM75gzHwwEicUGvxBn9bBhjpSj0HFW23X+h+34J2FNVXubrHIRHavq
	hVbxej0EdsthZTLfGQzjpWUdPR3B1DW8GbA1246KGFCm5KWzKkYor8mgEz+G2kIsTseB
	Uibg==
X-Gm-Message-State: APzg51DZc6j5NJ0SNQZSY9ZskP0KhzkWhkwPd0y2BPSaFyozJm+Pl2ok
	Mhsj8mqN8tTN0ddRn01hu6WE8Q==
X-Google-Smtp-Source: ANB0VdYHhIwwgTFzDebAZFo67T8sLfhmihyDYIev6ay4CjpVvRmx+d41W2JJTHWBVx2P7bzbkKne4Q==
X-Received: by 2002:adf:a708:: with SMTP id c8-v6mr2483952wrd.56.1535410050411;
	Mon, 27 Aug 2018 15:47:30 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	v21-v6sm507199wrd.4.2018.08.27.15.47.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 27 Aug 2018 15:47:29 -0700 (PDT)
Message-ID: <ae4e34f935b088807fac73bed99cb586a8d0223f.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 27 Aug 2018 23:47:27 +0100
In-Reply-To: <CA+chaQc7p5Q2iknW+3mVKm6jSxo0E4GJuNYLPBrRYkC29mzD5w@mail.gmail.com>
References: <20180807144843.26064-1-richard.purdie@linuxfoundation.org>
	<CA+chaQc7p5Q2iknW+3mVKm6jSxo0E4GJuNYLPBrRYkC29mzD5w@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate: Add sstate usage summary to the build
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
X-List-Received-Date: Mon, 27 Aug 2018 22:47:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-08-24 at 23:24 +0200, Martin Jansa wrote:
> This is nice addition, but maybe it would be worth explaining
> somewhere what these numbers actually mean.
> 
> e.g. my current build shows:
> Sstate summary: Wanted 181 Found 39 Missed 142 Current 279 (21%
> match, 69% complete)
> 
> From quick look at the code my understanding is that:
> 1) Wanted = Found + Missed
> 2) Wanted is number of sstate covered tasks needed for current build,
> Found is how many of them will be covered by existing sstate (fetched
> from SSTATE_MIRROR or local) and match is just Found/Wanted
> 3) Current is most confusing for me as it is a sum of tasks covered
> either by normal stamps or setscene and complete is then percentage
> of the tasks which either doesn't need to be executed at all or will
> be covered by sstate

Wanted is the number of artefacts the build ideally wants from sstate

Found is the number of artefacts present in sstate locally or it thinks
are fetchable from any mirrors

Missed = Wanted - Found

Current is the number of stamps which bitbake viewed as "current", i.e.
it needed to do nothing. Since they're current, it wouldn't bother
querying sstate or considering them any further.

"% match" tells you how much of the sstate queried, matched

"% complete" tells you how much of the build is already current or
completed

The reason the current/complete numbers are there are because a build
directory where a build has already partly completed could show a "0%
match" against sstate but its not immediately clear that things which
have already run are never checked for in sstate. A build which was 90%
complete would likely have a high "% match" for a fresh tmpdir so this
was added to try and give people a real idea of how much work remains
in a given build "up front" when you start the build.

Does that help explain it? I'm open to better terminology but its hard
to find something short and simple which conveys this...

> 4) Neither of these is about not-sstate-covered tasks which for this
> build was 1983 and 1574 were already covered by stamp files (as shown
> at the end of the build shown bellow)

The % current is close. 1574/1983 = 79% which is approx equal (but
greater than) 69%. The difference is that 69% is before any sstate was
fetched, there was a 21% sstate match which meant X tasks were then
covered. Therefore after setscene ran, the number of completed tasks
would be higher and at 1574. We couldn't easily compute 1574 in
advance.

>Am I close?
> 
> I'm used to meta/classes/buildstats-summary.bbclass output
> (unfortunately after the build) which just shows 3 numbers per sstate
> covered task and this new summary is a bit confusing for me.

People wanted to know about coverage in advance of the build running
and we have a different set of numbers to work with unfortunately.
Statistics afterwards are much easier! :)

I'm open to better ways of presenting it to make it clearer what it
means but we don't really want to print too much either. It really is
meant so you can tell at a glance roughly how much work a build will
need to do.

Cheers,

Richard



