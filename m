Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4F03A6F4B3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 11:50:29 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id w8so1843629qac.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Mar 2014 03:50:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jIyFZAtVcYzxHbpvJXdqC5FIMkcaHE20x69FTOzhkyI=;
	b=fGDwKvvlWIrLmUqrL4I0S6RsdYJOMk9Frk9PyRyDf0dMEelQ18oH581J/PThX026R6
	odWLgQDfYKzAAJ52h2dO/ydtbmuWvuw3nFokLjA+GdJjbEF8VmZw7Rj8rMF8mIz7l4An
	55wpOrTcZSI5DV8Wm3X5v3KhZRxO7HiW9R2+ijBvKY7p1ue+kldSLrMj08/n2eWZakA1
	0NrWEnNskTinElDHIBaGv1s+FbibzrZT+hmMHeyx4nQhVspB3q1ZxxA/HWTrCzPWrH+x
	MYgsXJJQzBwJT0bH5OSjQJIwBL/tsrKVNB7t8Rjq8oxGSmToNQxPenT9Ap2If95tWURg
	7wMA==
X-Gm-Message-State: ALoCoQkm2uCSLMm3rKTiSGP/zt9KnOQhtjOCXs6mpuyqgUwN0kAMz3wrGMgojRo03b+t6y5+ANRl
X-Received: by 10.140.42.54 with SMTP id b51mr21375289qga.87.1393847430431;
	Mon, 03 Mar 2014 03:50:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Mon, 3 Mar 2014 03:50:09 -0800 (PST)
In-Reply-To: <26065539-945D-4AB2-8AB3-797BB63B01D3@gmail.com>
References: <1393612134-15665-1-git-send-email-ross.burton@intel.com>
	<5313F632.60207@windriver.com>
	<26065539-945D-4AB2-8AB3-797BB63B01D3@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Mar 2014 11:50:09 +0000
Message-ID: <CAJTo0Lbw5-7JmuHak4-hU35c73LG7CZWmxZ-0kDQ4rDrFDSZmA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ncurses: use ln -r to generate relative symlink
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
X-List-Received-Date: Mon, 03 Mar 2014 11:50:30 -0000
Content-Type: text/plain; charset=UTF-8

On 3 March 2014 03:29, Khem Raj <raj.khem@gmail.com> wrote:
> count debian in too.

I wrote this patch on Debian stable...

But oh well.

Ross

