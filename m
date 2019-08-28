Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id CA52E7F289
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 20:12:16 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z1so1013298wru.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 13:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=68hqoAEwCLr6kxc1hMTDpf+CMOardhJsZrIw/kSngAo=;
	b=BLQTxUTicvvYONMFYpUHVmz6XKDMy8PqpXs3rvDw5Isq5jK0M7Cn8l7bB2DtN/XoHo
	jFM3zDBS7EWP8bX0fEU3Bxo2HkrnHSdqfstgjbUvKPuTwqdv9Fti61eYX6togRCZjcAf
	w8ZMU1CtPq3J52HP7SZCulI7QflO+8WPrUVds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=68hqoAEwCLr6kxc1hMTDpf+CMOardhJsZrIw/kSngAo=;
	b=K+0nSq2htWb8sseG7DuWkLFnqczShVub67QACYMjJ34t+ZZybvrFLv3FgbyebV8l6+
	NB0YNiWCMVKvhqete5b9DpyrP6dG0R93ZeRiMBHPVYuhKVop32K10JI6ekvSkPVdWxM0
	CWaPdSJKdbV5QPgeo+Y4ucZ0vYpQvPGOL0NPKnLJyVmaM/rNOPUnLrthR4s72Ah5A6J/
	nVMNSidLPyiWZFAY3AhLotE55NcIO+u3/R6UOGtZB3KDHCBKcdF5c2qZOMegQTNwerig
	+QkY6i5y9Puke2AAxY5+Ai445pgu5/NXQEQc4WruYPi9J8bt8O6KvUEqpgZz7/noL5XC
	XwJA==
X-Gm-Message-State: APjAAAVb/pWrSlevPomxobcLrpc4zwRFUZ5O3PdcMSdgZW7ZSfr9HJLc
	eJjvFjd3bmZtb7qKRZ1vCYRUyg==
X-Google-Smtp-Source: APXvYqywlvGT3qzi2Y320rEYcMikdwmM3CiD1UoNk6TDZmj6pUWmzLA3mPD+VuWBSzhvMTi7hq/b3g==
X-Received: by 2002:adf:e30e:: with SMTP id b14mr6937942wrj.168.1567023137525; 
	Wed, 28 Aug 2019 13:12:17 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id m7sm670149wmi.18.2019.08.28.13.12.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 13:12:16 -0700 (PDT)
Message-ID: <d37172d226a0570d66859adf37c18b3212d6e4bf.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Adrian Bunk <bunk@stusta.de>, bruce.ashfield@gmail.com
Date: Wed, 28 Aug 2019 21:12:15 +0100
In-Reply-To: <20190828200536.GD3044@localhost>
References: <cover.1567019771.git.bruce.ashfield@gmail.com>
	<4f7fa357480ec0139aa809bed4a12c9aa7622d60.1567019771.git.bruce.ashfield@gmail.com>
	<20190828200536.GD3044@localhost>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/8] kernel-devsrc: remove python2 dependency
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
X-List-Received-Date: Wed, 28 Aug 2019 20:12:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-08-28 at 23:05 +0300, Adrian Bunk wrote:
> On Wed, Aug 28, 2019 at 03:28:38PM -0400, bruce.ashfield@gmail.com
> wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > 
> > Witht the approaching EOL of python2, the kernel packages need to
> > be updated to depend on python3.
> > ...
> 
> Yocto 3.0 ships and supports Python 2.7, so there is no urgent need
> for 
> last-minute Python 2 -> 3 changes.

Removal of 2.X dependencies where we can was an objective of 3.0 and
2.X is EOL and will expire in the lifetime of 3.0. I'd say this is
therefore quite in keeping with that...

Cheers,

Richard


