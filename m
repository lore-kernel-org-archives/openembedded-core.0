Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id A4EBA7F380
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 21:25:01 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f72so5077393wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 14:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=oKngt/A4yP7mnMYWFf8LHFhkSmjcLIdhkNv1c7BARfQ=;
	b=D2a7NM96DwYYKUs0UOxyKZ1QZWpUClNEzXi+jhilFdhMQGQM7G2al7NRWwcZa+HQZ8
	9tXzk6KsFTSGQhAAzRIMSF/lPIZoyhR455PIHPO2mFVyfsSeVOckXE2JLs4niYdqAUCJ
	LfiUhg2VLCAlTQnB+3NWYvePZ5mSqBKB4FFlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=oKngt/A4yP7mnMYWFf8LHFhkSmjcLIdhkNv1c7BARfQ=;
	b=AbCksRtHEkV8H8ke2NbqnUrL3QZWuT14r/Qf1sfgo8ADZ2iBKrvMJ88K6KLuHj/sw7
	o6OCqxhVCxDqknCYQn+WUCireRsgQAOYYZUvNqo5ZBb+F1k7VWG0OwBLDKa3/9XOEjxP
	XwgVJ6TsdX06Ad1WXwpll4aSUwyXkwwgWdmtzQE7wOx0Ag5ZvaQDvTJdKeGGLcWvA45F
	quedVd9Nqkf5R4vhUpYAyZXG9s1mycXSqd9cakxZRCWfq2jiIPo2IOEmFVb22FORyyJ2
	frUYRCrW8B3Sm58+MKoZ5PIxaGCjkIOZeU1T0HsWhlqVk6j7b8EAQm4orID96UVGQg5Z
	F6ng==
X-Gm-Message-State: APjAAAXRnBlVpq7UP1whGyPN2cRuK09LEsuK/WbliEQoMTfCFarNjIx4
	HGgqAQ3CosmVeddENoOporzoDw==
X-Google-Smtp-Source: APXvYqymEBw06HIk5Wcfl1K6vNG8em5E+DNLlcOQC8T7n5oCTzLFwnM0Y7wQg6ZgdwYxTnV0oyH+Ng==
X-Received: by 2002:a1c:cfc6:: with SMTP id f189mr8732130wmg.18.1565990702343; 
	Fri, 16 Aug 2019 14:25:02 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u130sm11529608wmg.28.2019.08.16.14.25.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 16 Aug 2019 14:25:01 -0700 (PDT)
Message-ID: <283ea4a282885878d26308925690e3428a08c841.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Jason Wessel <jason.wessel@windriver.com>
Date: Fri, 16 Aug 2019 22:25:00 +0100
In-Reply-To: <CAMKF1sqc4M-0ykKNhAao+sQk9WXwetqX4P6VLh44ypCv1LZKtA@mail.gmail.com>
References: <20190816210605.62377-1-jason.wessel@windriver.com>
	<CAMKF1sqc4M-0ykKNhAao+sQk9WXwetqX4P6VLh44ypCv1LZKtA@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/2] cross-localedef-native: Add hardlink resolver from util-linux
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
X-List-Received-Date: Fri, 16 Aug 2019 21:25:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-08-16 at 14:22 -0700, Khem Raj wrote:
> On Fri, Aug 16, 2019 at 2:06 PM Jason Wessel <
> jason.wessel@windriver.com> wrote:
> > The hard link resolver that is built into localedef cannot be run
> > in
> > parallel.  It will search sibling directories (which are be
> > processed
> > in parallel) and perform a creation of a .tmp file and remove the
> > original and move the .tmp file in.  The problem is that if a probe
> > occurs a hard link can be requested to the file that is being
> > removed.
> > This will lead to a stray copy or potentially, on a loaded system
> > cause race condition which pseudo cannot deal with, where it is
> > left
> > with a hard link request to a file that no longer exists.  In this
> > situation psuedo will inherit the permissions of what ever the
> > target
> > inode had to offer.
> > 
> > In short, there are two problems:
> > 
> >   1) You will be left with stray copies when using the hard link
> >      resolution that is built in while running in parallel with
> >      localedef.
> > 
> >   2) When running under pseudo the possibility exists for uid/gid
> >      leakage when the source file is removed before the hard link
> > can
> >      be completed.
> > 
> > The solution is to call localedef with --no-hard-links and
> > separately
> > process the hardlinks at a later point.  To do this requires the
> > inclusion of the hardlink utility found in modern versions of
> > util-linux.  Most host systems do not have this, so it will be
> > included with the cross-localedef binary.
> > 
> 
> can we depend on util-linux-native for this ?

This was discussed on IRC. We really really want to avoid that as a
dependency if we care about build performance. Its really easy to just
add that in but the implications are significant :(

Cheers,

Richard




