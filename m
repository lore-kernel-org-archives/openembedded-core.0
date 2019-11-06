Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id B03F37F87E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2019 17:53:30 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id t1so21087675wrv.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Nov 2019 09:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=rO/XWzBH9RrNPWSub3p+DrUaB214bAzpMNlxwKd+jfM=;
	b=AtfLqlb+cT+gkXZqhAuiWmT/PpLMDsMHU7QItLTgga4nBiI3hxtGAda/yjFhRxTocI
	DAunEI+aqDCWNDL7imbg57ULbRBB+ohUlPNTFzi/cTxSzdK8kHIgQ/oFbdMabIoSxYnb
	8U3fi715wo6QSJiuIXS3rIjiTeF9W1nb2N7zQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=rO/XWzBH9RrNPWSub3p+DrUaB214bAzpMNlxwKd+jfM=;
	b=WXOqTBIzLY128lqJh9xdVt5iFljgidFJVeGghRfLAykBpNvPUPoCuN7VDEvUoFZJUs
	n0BwL0j8Po4AR3nqMBRXNxqyOIV5Wvgocq3ofhYi9J/hkJWW9nxxSXPEoJS5kI04Ahpj
	mHsKkWhuHKoCUdyecBXslHMYHIAg8uTXucxbh4N0bL09MnbPqIUeS51wn2aVS9w7w8LW
	tFoaECo0VJPjZNTWPd6F7KlOH8fWxhnT6MZXzgmG3OD1ED6XNUpx2QDaP++aa1LouQMo
	AlW59M7dWv9LiI51VYMAOvVWrRWUZfhZ9JQ7099DNTuqVZjhnTFDvcLM/WMCHFpznqph
	BIMg==
X-Gm-Message-State: APjAAAXxl0kYqwCGo96twUnVhbVtpmbxMM2q2BoFlmn1CUDy0vUx8iPg
	E7ChBeHenabxK6gMNXQPFo5JmQ==
X-Google-Smtp-Source: APXvYqxCK57G1ueGSSNzKu1FkzUaxHg4hUOhWnZoiTFCbjc4uEsSV5a2IrdyUQf4LsQMAJGvvyNJNg==
X-Received: by 2002:adf:ed11:: with SMTP id a17mr4049330wro.392.1573062811206; 
	Wed, 06 Nov 2019 09:53:31 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	u203sm3545725wme.34.2019.11.06.09.53.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Nov 2019 09:53:30 -0800 (PST)
Message-ID: <e3de40a47b9b208f08c3123ad59c8caf25d581d6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko.Rapeli@bmw.de, ryan.harkin@linaro.org
Date: Wed, 06 Nov 2019 17:53:27 +0000
In-Reply-To: <20191106160618.GC2398@hiutale>
References: <20190925122349.14872-1-ross.burton@intel.com>
	<CAD0U-hJLV7F3K4VdX0GUKO9LRazWLz1rvp1xmWh6fzgzP3gcFQ@mail.gmail.com>
	<20191106160618.GC2398@hiutale>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][thud] cve-check: backport rewrite from master
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
X-List-Received-Date: Wed, 06 Nov 2019 17:53:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-11-06 at 16:06 +0000, Mikko.Rapeli@bmw.de wrote:
> Hi,
> 
> On Wed, Nov 06, 2019 at 02:59:16PM +0000, Ryan Harkin wrote:
> > Hi Ross/Richard,
> > 
> > I'd like this applied to Sumo also. Should I create a new patch and
> > send it
> > to the list, or is there a process for requesting this is cherry-
> > picked
> > across?
> 
> I just posted the port of this and all other CVE scan related changes
> to sumo
> http://lists.openembedded.org/pipermail/openembedded-core/2019-November/288817.html
> 
> But the question is valid :)

Support for sumo officially ended. I can see a case that the broken CVE
tools there are a good reason we could consider merging the patch
series but we do need to be able to test it to merge it to the main
branch. If we can't test, we're merging blind and the quality the
project tries to deliver could be compromised.

I have made some tweaks to the autobuilder which bring us closer to
being able to test sumo using the workers still around from that
release.

The things that make me nervous are questions like:

Which releases do we "open" for such patches? How far back do we go?
Which kinds of patches are acceptable?

Note that sumo (and earlier) doesn't have much of the QA automation
which we've now built our processes around so we don't get test
reports.

You mention wanting to change gcc. That means we really do need a full
retest of it to merge that (which is why it never happened originally
from what I remember).

Also, the LTS proposal stated we needed someone to handle this work. We
have no such person, even if we do somehow find them, they can't be
expected to cover all the old releases and effectively turn all of them
into LTS releases. How can we get the funding to try and get some help
with handling this workload?

I am probably going to try and make a case for sorting the CVE tooling
on sumo as I agree its bad and we should do something. Where do we draw
the line though.

Basically, this looks like it could create a lot of extra work without
helping the core project under-resourcing we currently struggle with.
You can therefore see why I might be nervous :/.

Cheers,

Richard




