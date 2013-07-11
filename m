Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f170.google.com (mail-ve0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id CCC1560289
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 13:41:47 +0000 (UTC)
Received: by mail-ve0-f170.google.com with SMTP id 14so7207504vea.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 06:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=U1wU2A9PAkSuKCOUZLV4iz7rhAYsflkbOSwZ76JSad4=;
	b=EmjXrg3QYi+E3boX0UUPaZd4dZIREdv0YdsgzVenJfXNboudxLkB3AEhi72T4RJF1r
	v0cPAPqSWfUp4HVU1UZs2qV6bVxrl7KUJN+rOImtQFo5ic20W0FxtLpVm6R47ni2c6MV
	589Qk35DluSEsFMsOmZI3bDsAx3hMtE50P0wA2K0D+wHlj1AVckcAWPB8bg7m1bBZnq/
	L0rrtnWG4z/Kqcwe4H/XWUFstHt1VqTAmoSn8RuWu3nKduF5dWK0U8FjmaNphZXdLxnt
	LySz7ekQcVkEusJ/fcca7QiXJjDLfQ5c0Nx5AZ1+S2i2ZYKcHjvZnYu249nERGCxE6oz
	aw0A==
X-Received: by 10.220.192.4 with SMTP id do4mr21752796vcb.91.1373550108513;
	Thu, 11 Jul 2013 06:41:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Thu, 11 Jul 2013 06:41:28 -0700 (PDT)
In-Reply-To: <1373542459.2389.323.camel@phil-desktop.brightsign>
References: <cover.1373443071.git.hongxu.jia@windriver.com>
	<a546f2c5f8ecec522cb8087015359f433fb5c998.1373443071.git.hongxu.jia@windriver.com>
	<CAJTo0LZTHz5hE8jx+6qNtePXj-LcMpsXEJ3zbwN4jS9npDHpLg@mail.gmail.com>
	<CAJTo0LbGRLcbb_9J1AdDM1ZFX18SYQi_h6VPwxN3SESDdnN0gA@mail.gmail.com>
	<1373539530.2389.320.camel@phil-desktop.brightsign>
	<CAJTo0La1Npg5YwJ8ihzfbZvepOvg2HdjkbK_ir6WOvBVHBBkcQ@mail.gmail.com>
	<1373542459.2389.323.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Jul 2013 14:41:28 +0100
Message-ID: <CAJTo0LY6O3U-ySqzVZunTavzrpYsdCfAwqYs9UMDqVAV87Q_bA@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQkRGuL0bdMG0UmL0AqVM/CsuLqReA02TSn8gFT3Is27IeUab3INT2Q7DkOUyDdVxHR31edT
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/5] nss: add version 3.15.1
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
X-List-Received-Date: Thu, 11 Jul 2013 13:41:48 -0000
Content-Type: text/plain; charset=UTF-8

On 11 July 2013 12:34, Phil Blundell <pb@pbcl.net> wrote:
>> I was just pondering the idea of a "meta-lsb"...
>
> Yeah, I was thinking about that too.  The obvious downside of this plan
> is that this layer would end up containing a random-looking grab-bag of
> recipes with nothing in common other than that they're needed for LSB
> conformance and not in oe-core.
>
> In practice that's probably going to mean that the majority of them
> would duplicate recipes from other layers (e.g. meta-browser in the nss
> case) which doesn't seem like a very satisfactory state of affairs.

That's pretty much exactly my thoughts.   Two less than ideal
situations, one less worse than the other (LSB in oe-core being less
worse, in my opinion).

Ross

