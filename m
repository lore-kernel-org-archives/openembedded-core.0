Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3BF0160107
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 08:01:43 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a20so976228wme.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 00:01:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7scEXGCKIqM3efSFzNxZVjClarq6YLhVUIdhFMEtttQ=;
	b=QOTrBGM4wCG39yZQdnGQAnFuFTs02mcxYNTXJgOONCwnhAHUXVsQZP2ghlrX5GTvC/
	0/oNqXYD1w1gXSAH9/0UDi6JGOeZwiMSTDw95bM7X32DfFBagptcLtkUTF9OHuJmX6M3
	6EQZlSd7h0mQGqT6vPwnFQHeVxNgKPxDFIms3qqWoo4ObVTZyFI/hoZRMr9hFHRKW5SZ
	uaYhIbiItI9YztwxnLsGliESkPdJ29Bj4xwqXBWxecL9JTQFfANcnxRoZbO4OMKzAvBP
	UyqeNQBv3oZlDNXuK2gEArk0W02iOhubWu4RNxFm4CQW5P2DBXFuuelbaYT9k7GPrOFR
	Xr6g==
X-Gm-Message-State: AKaTC03uyIbLoTL/Mr06OOo2QpTArx42EqAUFRHBAbRw+HqtQ+48QSY8zMknxFBA6vOlPQ==
X-Received: by 10.28.221.11 with SMTP id u11mr1901786wmg.91.1479888104344;
	Wed, 23 Nov 2016 00:01:44 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	g17sm34953616wjs.38.2016.11.23.00.01.43
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 23 Nov 2016 00:01:43 -0800 (PST)
Message-ID: <1479888102.31241.1.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Denys Dmytriyenko <denis@denix.org>
Date: Wed, 23 Nov 2016 08:01:42 +0000
In-Reply-To: <20161122223342.GC31090@denix.org>
References: <20161121093713.7220-1-git@andred.net>
	<20161122223342.GC31090@denix.org>
X-Mailer: Evolution 3.22.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] module.bbclass: allow to override location of Module.symvers
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
X-List-Received-Date: Wed, 23 Nov 2016 08:01:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-11-22 at 17:33 -0500, Denys Dmytriyenko wrote:
> On Mon, Nov 21, 2016 at 09:37:13AM +0000, André Draszik wrote:
> > +		install -Dm0644
> > "${B}/${MODULES_MODULE_SYMVERS_LOCATION}"/Module.symvers
> > ${D}${includedir}/${BPN}/Module.symvers
> 
> BTW, is "-Dm0644" portable?

Not sure, I would expect busybox' install to support it. OTOH, FreeBSD
install seems to have completely different parameters, in particular -D has
different semantics.

Cheers,
Andre'


