Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id CEAE77017D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 23:48:13 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id d79so6568132wmi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 May 2017 16:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2JFbrEPSMsATW6pKLFfyMHCrHZXp3Y+JOJw3OEvuYlA=;
	b=N9as255iYV1D0cPyr5mzJHTHwvf/mC/wBa9tBfrjjweiwg2pxveg/pCc/RJfJSJ1y+
	M4uL/4LdXNs66X8woWc8yA5GBWpbfWeJeD/AVE52FYWJ3avIvuicrOeOqrzTXlAyAoga
	e0kfg+TblUUBbsrNBqwCNDxdAIp0m9M4cV01sXv3uJJ6XAKHWVG/aElU082QGv88MeiL
	DWJiRdmQMD5IUxYWIa3ZQVHzSQq9WqhSUT70Epd9hs8BAGPwvZROK4LQxnLsYRNL+zZC
	W3viLBoYI/NpLQvm48UloI+8TKYVVzR5D1NEGh3ZvUg9jcNrh/A8Ruzkd9Xp9+TB8U/8
	941w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2JFbrEPSMsATW6pKLFfyMHCrHZXp3Y+JOJw3OEvuYlA=;
	b=Gsh1S2vqMYlsRcQp9CKpnCh9fMr/P1ybv455PnWYXBcwHPAqWM4j/ut+03PnQ7P2P2
	LpWTj03L+Z1HiyuOLwVIwqlxM2jAxMiCThFTEBTPwL/Q8CBixUI5jewNg/qWO9HV1wkd
	Tqo1vVzDhQpXIfq1eCyfqaow2IOReO6nwHmG97I/8Wjj7p8hU50GPww6I2F56LnRkUVt
	1gzvvBbcN81QctY/q+DN/coCJI1rtMn+8IAS5adqJOFxkJfV5v9oS5Wwl+id0a4BFJqd
	wL2pMiwsfgJNWL9mxGoTIzGE6xkt229LZ8Dl/O1I78+dyHpEonmX97edKCYd0NitOnNV
	ZXNQ==
X-Gm-Message-State: AN3rC/4PaCgNAxfyuWUHfjnvSyhRmoWV9TLHbOvGkuoMxOsLEWwGs+Sc
	ciCDr/2blAF4ag==
X-Received: by 10.80.153.194 with SMTP id n2mr31521425edb.42.1493941694407;
	Thu, 04 May 2017 16:48:14 -0700 (PDT)
Received: from Saturn.local.all (138-14-48-195.pool.dsl-net.ch.
	[195.48.14.138])
	by smtp.gmail.com with ESMTPSA id 41sm993224eds.66.2017.05.04.16.48.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 May 2017 16:48:13 -0700 (PDT)
Message-ID: <1493941692.3022.18.camel@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>
Date: Fri, 05 May 2017 01:48:12 +0200
In-Reply-To: <CAJTo0LYDLu5zPf1EKrJKS-Hw-C=MumF8QXej_+i958AyWqy4CA@mail.gmail.com>
References: <20170503131153.1780-1-alexander.kanavin@linux.intel.com>
	<20170503131153.1780-3-alexander.kanavin@linux.intel.com>
	<1493836892.2405.4.camel@gmail.com>
	<CAJTo0LZ3O5au502TRqVUZY_gCT4r_9X-2Jtk+_-3o=u5j2UASg@mail.gmail.com>
	<cf767fe3-3c98-f32b-d27c-3f63b924ab7f@linux.intel.com>
	<CAJTo0LYDLu5zPf1EKrJKS-Hw-C=MumF8QXej_+i958AyWqy4CA@mail.gmail.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] libpng12: remove the recipe
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
X-List-Received-Date: Thu, 04 May 2017 23:48:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Donnerstag, den 04.05.2017, 10:54 +0100 schrieb Burton, Ross:
> On 4 May 2017 at 10:18, Alexander Kanavin <alexander.kanavin@linux.intel.com
> > wrote:
> 
> > Then meta-oe can continue to host libpng12.
> > > 
> > 
> > I actually think allowing those recipes to fail and blacklisting them is
> > better. Moving libpng12 to meta-oe is the lazy way out; the proper way to
> > deal with such regressions is to look at the actual recipes, what they do,
> > why they need such an old version of libpng, and whether they should be
> > updated or removed from meta-oe altogether. The only way to get people to
> > do this real maintenance work is to break the build for them, sadly. I
> > cannot take on maintaining things in meta-oe in this way, I have to draw
> > the line somewhere, and this is it.
> > 

My concern at the moment is that anything removed now from oe-core will also be removed
in oe-core pyro in the foreseeable future but the fix or relocation in meta-xyz will
take time.

Around the release of morty the same happened with libwnck3 which then made morty fail for
anyone using libwnck3.

> 
> For what it's worth, glmark2 was fixed in 2014:
> https://github.com/glmark2/glmark2/commit/499aa81a68fb4c8aac1c80f0d6a4cce05941c4cc
> 
> glcompbench appears to be a fork of glmark, so the same fix should be
> trivial to apply.

I agree that the it is an easy fix for glmark2 and probably not that hard with glcompbench,
nonetheless its sometimes nice to get a head start before things break.

Max

> Ross

