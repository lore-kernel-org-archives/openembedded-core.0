Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id D9F4A60438
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 09:29:38 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id z60so10793827qgd.27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 02:29:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=v/4/ZTzJoUMPmNyx1P+UUfzyO2r2A5plxyD/K/EU6FY=;
	b=AEPYZZYNzRnVOi0JKSFqsLJ/gmycxi13raZ8OmnvbOYTps8x7fxRG98CCoAcaMrFXT
	gByGHTzggBIbj8K8CRzTjWcmNjEphHbKwKKLU05S48iwYygkW0Y79CeXFULsGXTW7j9Z
	X1EQ3HuWRZSQY3rtdTJiXh+4QDHHFmlB+qa6OXLsAB1ygI75KYpbBLZWcoT+8Pswr9SB
	aaGtThOpVEggz3+Ceif3uor6m9VxS6gCurmdrZ/MHjUXMUGG9Id8VgoCF/ihAAHSb2w+
	E6ScOU8jJcXEE2rJAuR64LWVnMDGd0OGygk8xC5/HH25CLnUfF7MNwW5saE9YQm4LwLg
	GRkQ==
X-Gm-Message-State: ALoCoQkEIHQ0gFZECwCWHxfdRXP//1oC4WgcU8Dz06Kt9zjGY1R2TVVebpCTcZP2+FI++C6avzTV
X-Received: by 10.140.47.129 with SMTP id m1mr4424479qga.95.1407922179527;
	Wed, 13 Aug 2014 02:29:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.95.235 with HTTP; Wed, 13 Aug 2014 02:29:19 -0700 (PDT)
In-Reply-To: <53EAF40B.8050301@topic.nl>
References: <53EA5178.7020209@topic.nl>
	<CAJTo0LY+Kp14Sn4bdFtX4eYCK4Oea52MEG-=s6TbG_CKoMx9Pg@mail.gmail.com>
	<53EAF40B.8050301@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 13 Aug 2014 10:29:19 +0100
Message-ID: <CAJTo0LamoP5pE03pPi3=V-VAZxu9RYhJUwmHMWqyVLjNDeN9ww@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Autotools and "foreign"
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
X-List-Received-Date: Wed, 13 Aug 2014 09:29:47 -0000
Content-Type: text/plain; charset=UTF-8

On 13 August 2014 06:13, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> That might be the case if said upstream people actually still existed. Most
> of these packages have since long been abandoned.

That's generally where the problems are - packages that expect
autotools from ten years ago.

> So I guess I'll have to cook up a class that works around it, just adding
> the "missing" files into the S directory might do the trick.

In my experience of fixing oe-core, most packages that fail here
already have patches to fix their autotools infrastructure, so adding
[foreign] is just another fix in the same patch.

Ross

