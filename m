Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id C7FDF7E3E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 12:47:35 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y11so3039180wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 04:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=Y9fpsn+931eoO+7uhWY/zIin2cWD04AphGf9Pjpj8/c=;
	b=VSeo1GU5EyyGG+wkaWJaLS5a7Ky3pC2kpV7NppQWpw8PQWuNCZBsuWZjhmRvVqMKJ9
	AcnNfgz0L01557EUSBx6saoreSOnFwKBc1y8foRA3i9RkPxWzvfJEkQ0LCqcfEGV32G+
	vu2AUSI7lv3Bk1RIX4LKJ5AS4nJ6ozh4dQGkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Y9fpsn+931eoO+7uhWY/zIin2cWD04AphGf9Pjpj8/c=;
	b=MbpCoueXnuwtBvtDj/pf7O+g4JKP7prSSzloUS336XcQ06H65OKw+j0UgMXEKydVxc
	BSntHbn1mSE3Xr3NJX+mMUC7PqFoomqpmwHLsjxxuvaZneNc+Cpj293in9CdCxQbo6l+
	/vVlKTJZUjUihk+aqUKlLW21vNkhPYhFeEzMFJE3fduH7uWBaR6rlG5/X8WA0hiV9rF4
	WWPmBPxA2/GPpl9Z9b2vzLdBowiwx/3/DFiHtkJCVRhVpawHbNWAsuKx3caHp/n/ZMXG
	gbVREz4TtSP9lQnGDExQC7IM2fsueEZ98AKaNMS54OJghLfi0ci2YsTlhGJlocFWD8RU
	kXVA==
X-Gm-Message-State: APjAAAUs/jGkZwRXq7NGjXulNqPCtPG5zmNFVCyXR+wxoh7JAa7OM/W1
	YEFnX7WRxh9+slpv0r5WjrT7yg==
X-Google-Smtp-Source: APXvYqyCBHpL4roGMAnt24Sw0ghihgpG5rwc1LHnGgbdYjdNjF86ovdWOS6cDMQZ0KQNt8pO/BkzWw==
X-Received: by 2002:a5d:484f:: with SMTP id n15mr4967668wrs.365.1579610856350; 
	Tue, 21 Jan 2020 04:47:36 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k13sm51854902wrx.59.2020.01.21.04.47.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 04:47:35 -0800 (PST)
Message-ID: <1ccb46bd9806f74f4c61b774754e314ca72c368c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@gmail.com>, Alexander
	Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 Jan 2020 12:47:34 +0000
In-Reply-To: <CALbNGRTcVRb7obS2g8d6fipNUervDr0ZYvJ+izLmCJH4h5QRyQ@mail.gmail.com>
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
	<20200120172510.22648-5-alex.kanavin@gmail.com>
	<CALbNGRTcVRb7obS2g8d6fipNUervDr0ZYvJ+izLmCJH4h5QRyQ@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/24] nss: update to 3.49.1
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
X-List-Received-Date: Tue, 21 Jan 2020 12:47:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2020-01-21 at 13:04 +0100, Andreas Müller wrote:
> On Mon, Jan 20, 2020 at 6:26 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> > Drop a backport, and a patch that causes build errors with
> > the new version.
> > 
> > Add a patch to make ARM HW crypto optional; upstream for some
> > reason does not allow disabling it.
> Thanks and FWIW - I tried to subscribe to their mailing list to ask
> if
> that was intended. To my surprise I received:
> 
> > Your request to the nss-dev mailing list
> > 
> >    Subscription request
> > 
> > has been rejected by the list moderator.  The moderator gave the
> > following reason for rejecting your request:
> > 
> > "Not an active NSS developer. Contact jc@mozilla.com to argue :)"
> 
> Wow...

That is surprising and rather sad :(

It may be worth mailing that person and pointing out you had a question
and where it should be taken? It would be good to discuss with upstream
rather than carrying the patch. We are making slow but steady progress
in reducing out patch load.

Cheers,

Richard



