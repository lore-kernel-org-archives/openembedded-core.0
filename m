Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id B3DCE60196
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 May 2014 13:47:41 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id q107so292428qgd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 May 2014 06:47:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=C6ZAjZZ4ieTSfj1J2VHmEPd/ZjuDL6f37bqa/aAjJ2s=;
	b=RjcTO2Z8kf6x2M+cbZXopIVJ6yExwmqKl3kKHxfL7vn2NGceJFHky+MIQaEIgeAU2w
	BJBqOOayfYLuUkuQ5g6PSLs2oVt/xilx//IonXnM/rtLIeoiZzp1DxTs2NAi07W4uL4G
	0VxmglzhalgtalgSoIHli+vpIf73BbT68bfmlzAStYr91yMubzAz8PO9iv/wVh69fCCH
	HesWwenWChohnwwTqVMDv8PEcBwA3ycok9wZjW8dl5wluhx3BVLXYvpHySvjFErfHzWI
	+rV5b/UtriygjXS5EdrdXwtPrUCw9kyUByyCVmm2BeeP69/wWEVvJnUrebzyw9lWNy8j
	7Yuw==
X-Gm-Message-State: ALoCoQk8/K4dcawJMnJsaOE9dvQ4i2jkaf701V88wekd9yhx/EvCjE6nZkm3zIO+pcIAfSNqe+xM
X-Received: by 10.224.160.142 with SMTP id n14mr22604992qax.17.1399038462244; 
	Fri, 02 May 2014 06:47:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.19.136 with HTTP; Fri, 2 May 2014 06:47:22 -0700 (PDT)
In-Reply-To: <5363970A.8000601@topic.nl>
References: <1398963761.12731.1.camel@ted> <5363970A.8000601@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 2 May 2014 14:47:22 +0100
Message-ID: <CAJTo0LaYfVWuBkn4wsHcjWQvoGBv6r+U+Vd+ozb=_=ynPYvkHQ@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: My thoughts on the future of OE?
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
X-List-Received-Date: Fri, 02 May 2014 13:47:41 -0000
Content-Type: text/plain; charset=UTF-8

On 2 May 2014 14:00, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> Just about fifteen minutes ago I was asked the question of "Yay, I could
> build a complete image for the board from scratch. Now how do I create and
> run a HelloWorld application on it?"

Depending on context simply adding the "tools-sdk dev-pkgs"
IMAGE_FEATURES is sufficient to build applications on the target, as
long as it's for the hello world or iterative development approaches.
Obviously a recipe would need to be written at some point but getting
a toolchain in the image for development on the target is trivial.

Ross

