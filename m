Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id D69E87BE38
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 21:46:38 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id f81so5964942wmd.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 13:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=rcuNTzVfytT93IsHCRYHOrMgo0wLPFdG6n7+WjKrNHo=;
	b=O1qISiVIrHN+BFWa6HUyHDepdn+qyYZQHQ8GfZPq3rR0eya0CwbuV0oDSCinucjqmc
	ZkqeDuBAIf/3RjEn38bZbuvQeJThZHU9kZO4/3fEjEEmHs6YHze0Xwk04MJ56gflT60I
	6l0w6rDKDNxkHiO872QkolGnDBx/Io42xJjAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=rcuNTzVfytT93IsHCRYHOrMgo0wLPFdG6n7+WjKrNHo=;
	b=izJVuKxzwKrbR059wUKYebIOwqafLiabguy7/sqzjAn196wrwXDT26bBq3BdMQxEoo
	3R6IFhrdeN1ELlwkX+onROh2UJ8YzBeAFLjlEWfiU3+248NGohK2Lfxip1L5hE4pzxYx
	sJOW+G2IYbR02BLCErTnolg1KaKANfa0JeGHIQHEWzEe0rGxlS15TSQzLAGN8qHd5CMF
	+vriQ4n7OGXYcGCNkuHvPKbblL2CXIpMWXmEtyO4jQ7kiUnzRCn4UCNmWMQdhNeRgWoP
	AznhNzfiFoNcW2BRTrADPW0DeZWwM3fHcjNrn3x5RXB8KCHzWEABNsVLfYoQvKlfXSQJ
	lx/w==
X-Gm-Message-State: AJcUukcU9nUDpxXdSLtd/QmtZloBQ0NWwZvZSfqt6oAffiLqXfq9Az2G
	oNx3P50GenQ7t7XHLJTCiUy+1Q==
X-Google-Smtp-Source: ALg8bN71oin7IzgedFkwzwvOsyCq/wIh+Wefz2/FqpQYkhX52c0l3zlfvkQggMZ5PhhiTCuAIUYbcw==
X-Received: by 2002:a1c:5656:: with SMTP id k83mr3106398wmb.125.1546983999377; 
	Tue, 08 Jan 2019 13:46:39 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	w16sm50815619wrp.1.2019.01.08.13.46.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 08 Jan 2019 13:46:38 -0800 (PST)
Message-ID: <fa30e51479e77bed2b7ca05049bed3c65f3efe2b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Tue, 08 Jan 2019 21:46:37 +0000
In-Reply-To: <7497c039-7951-ee51-7506-300a74d0b558@windriver.com>
References: <05af53a7-6ed6-9615-be2e-d8c31dbfb321@siemens.com>
	<CAJTo0LbHTnSYrjm6QWGbXFJFj8jUGuk07t6hAhgB8dUnSYkAxw@mail.gmail.com>
	<d2772c25-a1ee-d20a-d913-323784db6933@windriver.com>
	<CAJTo0LYJyuYgj2MUnKPN8X2JNOK9AGFmDbcJ=-9EjPBoMDDGXQ@mail.gmail.com>
	<7497c039-7951-ee51-7506-300a74d0b558@windriver.com>
User-Agent: Evolution 3.30.3-1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Prelink problem
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
X-List-Received-Date: Tue, 08 Jan 2019 21:46:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-01-08 at 14:50 -0600, Mark Hatle wrote:
> On 1/8/19 2:37 PM, Burton, Ross wrote:
> > On Tue, 8 Jan 2019 at 20:15, Mark Hatle <mark.hatle@windriver.com>
> > wrote:
> > > > No idea why the opkg rootfs code is doing prelink operations
> > > > when RPM
> > > > or dpkg don't.   CCing Mark who may have an idea here.  I
> > > > thought the
> > > > autobuilder exerised multilib-on-opkg, but maybe not.
> > > 
> > > They all should be doing prelink operations.  The operation
> > > SHOULD be
> > > generically implemented as part of the image-prelink class, which
> > > is where I
> > > would have expected that copy to exist.
> > > 
> > > If any of the package types of specifically doing something, that
> > > sounds
> > > broken...  but the generic ones (last I looked) said to copy in
> > > the config file
> > > [if it didn't exist], run prelink, remove the file [if it wasn't
> > > there to start
> > > with].
> > 
> > Note that it's part of the incremental code, so needs to be in the
> > rootfs code directly I suspect. Frankly I'd love to see incremental
> > images removed.  It makes promises it can't keep (the moment a
> > rootfs
> > postprocess command is used, all bets are off) and massively
> > complicates things.
> 
> We assume the post process command is what an 'admin' would do.  So
> the various
> package managers should be able to deal with it in most
> cases.  (Note, obviously
> it's more freeform, but I wouldn't expect everything to work in you
> removed a
> large part of the filesystem for instance.)
> 
> As for prelink, I'm surprised this is in the incremental code.  I'm
> not sure why
> it would be necessary unless the incremental work wants to UNPRELINK
> the rootfs
> before performing the upgrade?
> 
> Prelink itself should still be run as a postprocess command that
> takes the
> output of the filesystem and reprocesses it.
> 
> So something seems out of sync here.. (at a minimum probably should
> be better
> commented on why it's needed..)

The code is there for incremental opkg multilib image support. Its
trying to compare whether binaries are identical. To make it work, it
has to "unprelink" the files first before comparing.

I'm not convinced this is a good idea :/. I'm wondering if incremental
image generation makes sense at all in this context to be honest.

Cheers,

Richard


