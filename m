Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f193.google.com (mail-it1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 703BD7BDAE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 13:19:58 +0000 (UTC)
Received: by mail-it1-f193.google.com with SMTP id h193so5879785ita.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 05:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7eRuXEi25qRt6va6bKrwMN+W8GAZkpwFJFv3VaoS/Vk=;
	b=pQBbtwTc5VpRShK9Vq0ldaKPHgcRVLK8ip1w+6pexHzrpx1fi1Vg90GITWtE/fcFzd
	5rLOZJF6smcXhmPTDue5xpx4ZSnvQ5NVxzpXdJAhuxKM+GJ0M5snglefJDW1TVEz/xE0
	3SSp9xrDLbOu36C3NX0g6bIB6s6i6bq0Nx5Udr3ZMvhnaZY2pNZ6Yu52MntzKlb6frh0
	+GWtTFFTo6vDru6thN+7gco2Lx3A/8JeXPv1aHIVeHCCUk4P0Ov/pJI9oWm0gmD2GJUj
	o1vnyBofkarOp3bWSwcSJgK9DKfNS8lDiuSnC8JjK01pd2QcvmyqM9guvJBxRWHPGCXF
	iFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7eRuXEi25qRt6va6bKrwMN+W8GAZkpwFJFv3VaoS/Vk=;
	b=KIESZdx0oKKHk1baXmz0MZ4JnLpLKndd538tc/MVayhpQgHEHxT8bsh177HiANeH9b
	SjfTQ4tnXeNlfOdvKVhchFXp91E8U5xJ+J++6W/F0kajX2JYYxacYnVxSLvEeycMR10f
	Blt+/Z7mE1DKik0IZ5BmtzXxrXjKnbcWmrj1Aj4kdgTevj/v1vxtJ4PrtNhQT0PazFZ7
	IwZrTXp83q3wUuPWayp1ZprOBndGox4o/ecuOuXKGxPdd7fwDPvLjJH6iWwSX/c4f9M6
	oJzuGOCZlkKbLdVvcD0vtvcOw+e0NPmLjO5GQFifFfTVnSKmzBKvxDPJ0qGUz/Are2Hc
	mDmA==
X-Gm-Message-State: AJcUukfzMDthHu7Hvrx/I0Y3bOwI9eDEGu+6wayrQ9DYIdHY/ay+e5iX
	BekjfTjgBCY4s1BWGFW6AGZvTBGBVEwvpBgClhn+Uw==
X-Google-Smtp-Source: ALg8bN5fdY393oMJbqQJ7BzBgehjF5P0jZsHvNybRBgHA+0c1iE9Ozan7aLw5Kc/8mN2LDzgyE25XSdBWLBp9MmyjL0=
X-Received: by 2002:a24:1d4a:: with SMTP id 71mr1140542itj.62.1546953599400;
	Tue, 08 Jan 2019 05:19:59 -0800 (PST)
MIME-Version: 1.0
References: <20190107163823.31816-1-ross.burton@intel.com>
	<CAJTo0LZ__dsz_LuVUS6FPD+dkW7mkY+a5kMJJgTieUxwY0ZEHQ@mail.gmail.com>
	<CAJdd5GYp38NPZkF3Ouyj8oHiKEFfvPAeQ5x=ocXLf4iroOH39w@mail.gmail.com>
In-Reply-To: <CAJdd5GYp38NPZkF3Ouyj8oHiKEFfvPAeQ5x=ocXLf4iroOH39w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Jan 2019 13:19:48 +0000
Message-ID: <CAJTo0LY0s3ac9a8ZtfphrmUMQ_O-zY6BUSo9cXomDuDOMUwAHw@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] toolchain-scripts: run post-relocate scripts for every environment
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
X-List-Received-Date: Tue, 08 Jan 2019 13:19:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Jan 2019 at 13:10, Joshua Watt <jpewhacker@gmail.com> wrote:
>> I think this change - whilst the right thing - exposes a problem that
>> icecc doesn't work properly in multilib SDKs.  Can I ask you to
>> investigate and sort this, as you submitted the icecc rewrite
>> recently?
>
> Yep, I'll take a look.

Thanks, hopefully you spotted some bug mail earlier.

Ross

