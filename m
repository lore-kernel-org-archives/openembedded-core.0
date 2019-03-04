Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41])
	by mail.openembedded.org (Postfix) with ESMTP id 55B886C10B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 16:33:47 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id v10so4439541iop.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 08:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CBk/SJwqGLEvFbQvhgSH6cGW6TI3cx4hgzOjrDp6118=;
	b=UTjBgXYbo5mpGvKgFNO9c00T27acIMJiC3RXhAm0xpFcN2I5LsnmlPmAJfuMA6o7bH
	YoRNtt98N7J7J4RucY4ezbhRIloJDpjsKRuXX44FNScBlpNwnA0vlkqrfie/56ncLOse
	XDqTnH3mgkzIcZKlOYDw6R0xifG5BNdEiM0oWl+wpt16TlO9X2vLLRhhCxFR+tc6eT1z
	aQOySIvHpWFqpG+KnfrRfvGHIPmy8ZUpKfa3zY5B4lZD+HdGtg0vZouM8zTBlPZkTcGF
	5ZR/ocvksKaBQG7Vxm+AbQB925xJJxquGscnK7Kd7//FiNrPnzAdkq9OOcDuc5p/q6ow
	52Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CBk/SJwqGLEvFbQvhgSH6cGW6TI3cx4hgzOjrDp6118=;
	b=S/bZIT0E10o9UIuz7KcXwb77AGJ9ZCl5bkr6u5Wilou7AHPNPUYDQby82lMdsQj/5b
	hiPqYwqcRopnK6R+q+ckCKXgK/BRqtSVL3oS9rY+4+W2aJ1r63M8Zfp+tci+TOGhCONu
	f3HFZ71yT7wjk7zJ2UkqDwesRbo1Ec6NTZ/ct9O7zkni7fK/VgZgYpL/gRPHDFEkStPK
	DacCnfDJFeLV9L0DUSC1Wy+x6VA1IBAf60UCaWa2KCEI7PzzKCw2azqgTAhdB4EF+U0n
	78PZOGs1RZiszWsyRgr8NAukaTD0jtA1lIXVOcaNseeo9dzIQ4vJfNmqjPeuaRN8ctk2
	1Dig==
X-Gm-Message-State: APjAAAU362PXYi/d9x8FlA87/9sP+Jh0r0KbVBeOKrKWLgG2mKqwMNSz
	mcVyAXU6FjlbNtVJQ1/Wqp5Am9vMF7bGHNpyp8u0/w==
X-Google-Smtp-Source: APXvYqwbZ3TXgr9CWG9rtbgSjynZAHfX/6PVgxhV+1CpuKil4ehXMtNXH8qurbhbDj3k+sHOvYQidiJ5LPLggE/MnyI=
X-Received: by 2002:a5d:818d:: with SMTP id u13mr9925498ion.20.1551717228248; 
	Mon, 04 Mar 2019 08:33:48 -0800 (PST)
MIME-Version: 1.0
References: <20190304115835.28288-1-ross.burton@intel.com>
	<7c24c5585f8aa25ad636da1723f20610df542ce3.camel@linuxfoundation.org>
In-Reply-To: <7c24c5585f8aa25ad636da1723f20610df542ce3.camel@linuxfoundation.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Mar 2019 16:33:37 +0000
Message-ID: <CAJTo0LZjk3GVgHem7d7e50Zc9RRXUYN4mWur4jnsiK5WozfA5Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libcomps: put PV in filename
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
X-List-Received-Date: Mon, 04 Mar 2019 16:33:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, 4 Mar 2019 at 15:12, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I suspect we have this issue in a few cases and having PV next to the
> SRCREV may prompt people to keep things more in sync?

I'm sure we do, but I spotted this one.  The AUH will do the prompting
so I'm not sure what else needs to be kept in sync.

Ross

