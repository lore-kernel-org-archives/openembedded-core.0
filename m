Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id A01797C4F9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2019 20:16:05 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id i3so12468872wml.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 May 2019 13:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=uaRivgVwwVl6dl+dHhteJjr/2s56OWGsw8ENBMolZBY=;
	b=QookPc3+BqvZxbyxDoQBXThDGpqPmXqDULIh7Hjl8PkK9vFeJpbW2l61wRtBethx7H
	awcCwo0W/XAQ21vyx/g6Z8CZ4G1u/v/um6OMsPtqKxZYrAPHaaU7mrtmFbmcgjG7HUGt
	jseastZ5LGHC/0bosgxb23qaT8PJNlQzJbahw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=uaRivgVwwVl6dl+dHhteJjr/2s56OWGsw8ENBMolZBY=;
	b=k2elPTQ6mPh0i8r1KQtEzEKPUY9zeAHHmh3tWo4v7ddtQKP2+l9vvdDDLAMx/gqwWN
	l5qfkyV8bsLAuOLuivYfaGY+cmK65cp0pG2Sf1fifssDjX5uDlk0G5dtmMIwwmbnj+Bw
	oiFWrLrU9BNSd91bq5ppbf+mlJF7fkFvpTz4Ml0EldUW15QIDJNEcintOxymVQmKzUf8
	RrSUvUQ85V4SvqTElp4O7LsLfMuqTgVOe9ZD/F0x2trr6gJ0USOFhJMGhpTlZ12ZKP5L
	dLN9SjGGndvd/KRCFM0BF01h7rmuy4FKP6AscqC52qwc4QsCvYE8fRCkCOcFmGiEeAx0
	k4rg==
X-Gm-Message-State: APjAAAXuUwXKkzzD7M+S4TVulVJTsD5QrvBCt+ZWqzQvPohqP1M2Tmhv
	jpo26XY7+2v0HHFyx9knznlLiNhtGzo=
X-Google-Smtp-Source: APXvYqzFc4Nix0hQyA6mgmbVKEeV/QNF1KrDGin1MYrGT7CtfINuDopXWjZXUx913RFfrl3QJfuFpg==
X-Received: by 2002:a1c:e009:: with SMTP id x9mr4323928wmg.117.1558815366101; 
	Sat, 25 May 2019 13:16:06 -0700 (PDT)
Received: from hex ([85.255.236.98]) by smtp.gmail.com with ESMTPSA id
	p16sm11704562wrg.49.2019.05.25.13.16.05
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 25 May 2019 13:16:05 -0700 (PDT)
Message-ID: <12580c58f5d64b60ca87f5077b43924af5d746d2.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: mingli.yu@windriver.com, openembedded-core@lists.openembedded.org
Date: Sat, 25 May 2019 21:16:02 +0100
In-Reply-To: <1558516295-289667-1-git-send-email-mingli.yu@windriver.com>
References: <1558516295-289667-1-git-send-email-mingli.yu@windriver.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH] elfutils: fix ptest failures
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
X-List-Received-Date: Sat, 25 May 2019 20:16:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-05-22 at 17:11 +0800, mingli.yu@windriver.com wrote:
> From: Mingli Yu <Mingli.Yu@windriver.com>
> 
> * Add missing -ptest package dependencies (needs
>   ${PN}-dbg)
> 
> * Add missing files which needed by ptest test
>   to fix below failures:
>   | ./run-ar.sh: line 23: cd:
> /usr/lib64/elfutils/ptest/tests/..//src: No such file or directory
>   | FAIL: run-ar.sh
> 
>   | sh: ../src/elflint: No such file or directory
>   | FAIL: asm-tst4
> 
> * Rework 0001-skip-the-test-when-gcc-not-deployed.patch
>   to skip the tests which depend on gcc
> 
> Before:
> --------------------------------------------
> Recipe   | Passed    | Failed   | Skipped
> --------------------------------------------
> elfutils | 176       | 23       | 4
> --------------------------------------------
> 
> After:
> --------------------------------------------
> Recipe   | Passed    | Failed   | Skipped
> --------------------------------------------
> elfutils | 184       | 15       | 4
> --------------------------------------------
> 

Unfortunately if I add this to the build we see failures due to core-
image-sato-sdk-ptest becomming too large for generix86-64 as the image
exceeds the 4GB limit its FSTYPE allows.

I tried reducing the amount of free space in the image but then the
strace and until-linux ptests fail:

https://autobuilder.yocto.io/pub/non-release/20190524-8/testresults/testresult-report.txt

We do plan to change the hddimg format and use wic to avoid the 4GB
limit sometime in 2.8 but those patches aren't ready yet. I'm therefore
not quite sure what to do here. Is there any way we can save space in
the images so we could merge this?

Wth regard to the src/ directory, I did wonder if there needed to be a
patch to one of the other scripts to use installed files (similar to
how I fixed some of these last time)?

Cheers,

Richard


