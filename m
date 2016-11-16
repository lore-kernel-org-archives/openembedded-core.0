Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 333426FFED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 09:07:09 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id m203so8819632wma.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Nov 2016 01:07:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MJIToEi8db/PRic4sd3pU/MhEWQSRqGCYZx+Gcnf0Z8=;
	b=Gp5AthtlnMFaOSB8yAQBjM0PI5JYUxTloIGlFhDcrK9jTL/MbkH100r94zNN7w/7+C
	oEVBCQv7CVB4/9/G7V18/fUQqhEibBBHUKkLPhQj3ZV+w90qIerykE20XTReJZ1xV0/d
	h2ciAPnKcXX1gKRlpIkUox+t3ZgeaDYIWu1IsjPT4Boy05MCi5rEMtIrlMXroKLCbnVL
	Ys1Ziplimxe9Xe4D9J/QSK8mvqId/Dq6IIqixMLk+BNvlWKTq4rLY4t7yiuNBMObTfpu
	B0P04RR12XxI03UkSzbbMk1um10ZIBEPnqXNKSDnVHefN2eNZ2gvj7EIY7jOx8VQ3V7A
	30uA==
X-Gm-Message-State: ABUngvcKLhUgW1JVOskDypmtNWRe3zjA9S1wNC8OsiTmGbtMwg1gr/OXWreeDZ1y27trMg==
X-Received: by 10.28.183.215 with SMTP id h206mr8771994wmf.60.1479287230770;
	Wed, 16 Nov 2016 01:07:10 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	kq7sm25281508wjb.30.2016.11.16.01.07.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 Nov 2016 01:07:10 -0800 (PST)
Message-ID: <1479287229.3131.10.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2016 09:07:09 +0000
In-Reply-To: <1479230361.3131.6.camel@andred.net>
References: <20161115154311.30118-1-git@andred.net>
	<1479230361.3131.6.camel@andred.net>
X-Mailer: Evolution 3.22.1-2 
Mime-Version: 1.0
Subject: \n in DESCRIPTION creates invalid (ipk) packages? (was: Re: [oe][meta-networking][PATCH 0/2] ncp - a fast file copy tool for LANs)
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
X-List-Received-Date: Wed, 16 Nov 2016 09:07:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-11-15 at 17:19 +0000, André Draszik wrote:
> On Tue, 2016-11-15 at 15:43 +0000, André Draszik wrote:
> > "ncp" is a utility for copying files in a LAN. It has absolutely
> > no security or integrity checking, no throttling, no features,
> > except one:
> >   you don't have to type the coordinates of your peer.
> 
> Hm, hold on. Something went wrong along the way. I can't actually install
> it
> anymore:
> 
> root@poky:~# opkg update
> Package ncp-dbg version 1.2.4-r0 has no valid architecture, ignoring.
> Package ncp-dev version 1.2.4-r0 has no valid architecture, ignoring.
> Package ncp-doc version 1.2.4-r0 has no valid architecture, ignoring.
> Package ncp version 1.2.4-r0 has no valid architecture, ignoring.
> 
> root@poky:~# opkg install ncp
> Package ncp-dbg version 1.2.4-r0 has no valid architecture, ignoring.
> Package ncp-dev version 1.2.4-r0 has no valid architecture, ignoring.
> Package ncp-doc version 1.2.4-r0 has no valid architecture, ignoring.
> Package ncp version 1.2.4-r0 has no valid architecture, ignoring.
> Collected errors:
>  * opkg_prepare_url_for_install: Couldn't find anything to satisfy 'ncp'.

It looks like this was caused by additional \n in the DESCRIPTION string. Is
it expected that those cause the packaging process to create apparently
invalid ipk packages?




Cheers,
Andre'


