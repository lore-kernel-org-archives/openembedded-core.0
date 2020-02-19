Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 31510615CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 23:16:42 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w15so2533569wru.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 15:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=XVm87QMmFaAaC5KjVlOkUTFHKTEqYAmqdVBf0VjoXls=;
	b=f6hOZMLvSnTM4/GLbSCgtdzH2h0DRrFSr/uiVXMEX2PvZlhOhqsY8QJMlCL0FzFeJH
	wihUQ+l+Y5HURkvq96r9FctzzAWRuGgASstwpsMlusSeSMPD3tBeLx5WLaQbIl8W9Z8t
	ATfJ4zHL7AWVZJ1e+mCg5DgofQHn9hwHiTco8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=XVm87QMmFaAaC5KjVlOkUTFHKTEqYAmqdVBf0VjoXls=;
	b=Ffe81rd76lfMw73PbgOhAX235hsudGzy3uBTB1Bq/FScD4m6C6/x+PQtFChkAZgP9B
	drj3h1fBA7XsGBUwkrtO5VYPiMFGRVW1rkdX7nwe1EV+iBApctAWFHGGMCJAgcQUG6VE
	rMSa9TXZly/X8EJ0hvfTLwuM8qluEXFbWAqb/z4G+uQUAmt52iVTHumQccsggz6prQcP
	FtKKGWg+5Zk8XdFrD7LhhqYXity0+JZHfH9Fy8P4QxDRtqHesvhchi2t/hy8LKywOnFJ
	2haRyMfx5RCWSZRFdRFB9APZL1zczx/wqDZhb89Wsd6+1h9Cyeq/Tq6TFJXGyH7G72sZ
	bzVw==
X-Gm-Message-State: APjAAAVk72oPYuRJ1ULZAOQyMtye5CYH31eJEdk7nyx7hLjqHtBvq7tB
	/bc7SFFO+jV6OnLV8vN980eH7Q==
X-Google-Smtp-Source: APXvYqwty0Oxa7Rsh4VQyeFUx780uRCg5/LNhlcfzcBeeYsfNP51DqQlx1JCUdf7LJB7J3z288xQIw==
X-Received: by 2002:a5d:4f0f:: with SMTP id c15mr40205686wru.251.1582154202805;
	Wed, 19 Feb 2020 15:16:42 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i16sm1647999wrr.71.2020.02.19.15.16.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 19 Feb 2020 15:16:42 -0800 (PST)
Message-ID: <9ef969cbe41ad90330b52b045eecaf8688fa18e4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 19 Feb 2020 23:16:40 +0000
In-Reply-To: <CAJ86T=VsVpM+KLzXdQ569T4LALG4fDT2sS4v+4YCp_6LTZvfsw@mail.gmail.com>
References: <20200219214303.138067-1-richard.purdie@linuxfoundation.org>
	<CAJ86T=VsVpM+KLzXdQ569T4LALG4fDT2sS4v+4YCp_6LTZvfsw@mail.gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] local.conf.sample.extended: Document how to limit parallel fetch tasks
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
X-List-Received-Date: Wed, 19 Feb 2020 23:16:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-02-19 at 14:05 -0800, Andre McCurdy wrote:
> On Wed, Feb 19, 2020 at 1:43 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > [YOCTO #13235]
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/conf/local.conf.sample.extended | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/meta/conf/local.conf.sample.extended
> > b/meta/conf/local.conf.sample.extended
> > index fcf4a9b7c1a..443b4e83f9a 100644
> > --- a/meta/conf/local.conf.sample.extended
> > +++ b/meta/conf/local.conf.sample.extended
> > @@ -23,6 +23,14 @@
> >  #
> >  # For a quad-core machine, BB_NUMBER_THREADS = "4", PARALLEL_MAKE
> > = "-j 4" would
> >  # be appropriate for example.
> > +#
> > +# Some users are behind firewalls or use servers where the number
> > of parallel connections
> > +# is limited. In such cases you can limit the number of fetch
> > tasks which run in parallel by
> > +# setting the option below, in this case limiting to a maximum of
> > 4 fetch tasks in parallel:
> > +#
> > +#do_fetch[number_threads] = "4"
> 
> How does this interact with BB_NUMBER_THREADS? If, for example, both
> are set to 4 does it mean there could be 4 fetch threads and 4
> compile threads running in parallel?

BB_NUMBER_THREADS is an upper limit which includes fetch tasks.

> A related issue when the number of parallel connections is limited is
> parsing a large number of AUTOREV recipes. From what I remember the
> workaround for that was to set BB_NUMBER_PARSE_THREADS. Maybe that
> should be documented in local.conf.sample.extended too? Perhaps even
> better would be to define a single new variable which limits the
> number of parallel connections in both cases?

I don't know how you'd implement a total number of connections limit
from a code perspective :/.

You'd probably need something like a make job server where you obtained
tokens before making connections and I can see this becoming "fun"
since you'd have to markup every code section where a network
connection was made.

We have a conflict between code complexity, maintainability,
performance and functionality and I'm not sure the use case here
warrants the complexity...

Cheers,

Richard






