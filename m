Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1C0347C6B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 12:37:56 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d17so16842012wre.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 05:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=u0GSKbFmUXYPiVkQ4r7H9PNXJ0aIbAvLTB7SPxE3LcQ=;
	b=JWO7DHxw56fa9B4j7gMJe3HW5OYBEokIRWW7ImZs2Wse1W04kTUn7Jy+QzuZmgVsbF
	Ho7WylzCgS4EIfQiT0xvrqkCGjtccorzZXtj7AEu8iYTS/YPpT07Ch/ZiA6Km52Z62he
	4XoQWJ5VaaoxD8GItOZOqORTKBVpmdBQWTWcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=u0GSKbFmUXYPiVkQ4r7H9PNXJ0aIbAvLTB7SPxE3LcQ=;
	b=a6kDPqFR+MDAY+i6SgKtqrgpqNpOuMLG/TxsWdgv8GN5ZHRhhP7Pu6YqndThh+Gk8q
	QFi//C8lBhzXpmJigme74cqq/ztSRz9JxFmrU0rD4cpUh1DVP5HVz05nre3yowz70zbr
	iJLPcSNbqSqE+Q0TrUh/8YttsEl0q0JSVRiB+apWo6qSsfpGYSw8hoG5GB6rUFfhWKDl
	hnklIxMcAHmVH/9BV8ox1TuknhFZV7NYAF5hYhk9Dv6SuPnSetIRy3XnE63YHGIpA98s
	aamTU6F9NQYIXW61O+9Rb8MT3ZW8XnIjrccOwtyp2hR21TAlE6fmt56VPxQt9bH1Y70u
	grSQ==
X-Gm-Message-State: APjAAAViYaMrlyrn6I9NOwK4UEJokmucObUXpmWoN7AzH6vnaWCIj+PU
	UFhpLJ+1RbrD8u4YIQt0wjXm9cXgruE4Tw==
X-Google-Smtp-Source: APXvYqydYckLGtIaIUT0rP+K3iSJK8aCCT4EKVDyi5zmPbK8TGVe82RjpbjHoa3o7uj91wxKZgxHGg==
X-Received: by 2002:a5d:464e:: with SMTP id j14mr12670830wrs.109.1552912676775;
	Mon, 18 Mar 2019 05:37:56 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u134sm10571296wmf.22.2019.03.18.05.37.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Mar 2019 05:37:55 -0700 (PDT)
Message-ID: <e23a55b1a840f9a55ae1bf7aa5037fca2d54fe27.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
Date: Mon, 18 Mar 2019 12:37:54 +0000
In-Reply-To: <20190315144058.GA6994@joraj-alpa>
References: <20190312211330.30850-1-jonathan.rajotte-julien@efficios.com>
	<8b7a2720fbfc7333bc4f5186e00dd5d8b1bc0a37.camel@linuxfoundation.org>
	<20190315144058.GA6994@joraj-alpa>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] lttng-tools ptest: add missing dependencies
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
X-List-Received-Date: Mon, 18 Mar 2019 12:37:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-03-15 at 10:40 -0400, Jonathan Rajotte-Julien wrote:
> > Firstly, I wanted to say thanks for looking at this, there are some
> > really great fixes in here.
> > 
> > It failed in automated testing as glibc-utils is glibc specific and
> > musl builds couldn't cope with that.
> > 
> > We can certainly do:
> > 
> > RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
> 
> Sure, since we mostly need getconf from glibc-utils, we can use musl-
> utils to provide it when building with musl.
> 
> RDEPENDS_${PN}-ptest_append_libc-musl = " musl-utils"

Thanks for confirmation of that.

Since the patches with a couple of fixes were passing the tests, I've
merged the patches with the glibc/muslc tweak and also a tweak to make
disabled ust work. I'd normally wait for v2 resubmission but I wanted
to get this fix into M3 and the M3 build is already behind schedule.

I was at a conference last week so a bit distracted, just catching up
now.

> Also, I saw that lttng-ust is removed from PACKAGECONFIG when using
> musl, not sure why the commit history is not particularly verbose
> regarding why it was a problem. Still, it seems to build fine but we
> are seeing issue regarding musl.

I think when we originally merged musl, lttng didn't build with it or
there were some kind of issues. I suspect lttng-ust still doesn't work
on all the architectures we build for so we likely need to be able to
optionally disable it. I'd be happy to see patches enabling it where it
does work though.


> We checked with Alpine since they also use musl and see similar
> problem. I'm investigating on that front. I'll let you know what I
> find.
> 
> Side note, gdb simply segfault (at start) for me on a core-image-
> minirmnal build using musl.
> How would someone open the corefile generated on the build system
> with the proper libs and all?

I saw other discussion about this so it looks like you're making
progress on this front. If not, Khem would be the person to ask about
this as our musl expert...

Cheers,

Richard


