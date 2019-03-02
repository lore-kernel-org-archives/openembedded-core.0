Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id A5DD87CD0B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Mar 2019 19:25:30 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r5so1279372wrg.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Mar 2019 11:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=bftOO8umqwqZ/fP9Y4fZX6vQAH/+1Sr19E+PYunIov0=;
	b=BT4zeUS1qyxkM4Sf7Y/OHyiRcQ1q10hAMPJC+gKVm8QXJWgOHlMKcaFfy/FT5dHFAX
	DXP8rd/DuvAa7YiXR+cNOga1ly4AVhGiZy3UqItXvLqk0akyfNujntUg+4EIOvXeKwQ2
	HDa/F/MFo0qWJVc/SRrq98EiWTXW2lpCHj75Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=bftOO8umqwqZ/fP9Y4fZX6vQAH/+1Sr19E+PYunIov0=;
	b=L1OUHoMtKowUH44nhUICB8b60uB8aAPnlyo6VV1GNzScEz6HfKx2tZXSxj5d5HqEkr
	I4IqPJBP8mZYmc6PjdyXNuwROfzy13WhMDDzt1mXzvCb/ZB9X5+Funs9OBy6Cu3f5YJV
	E3re7zhoP5Jp9hYd5Rn7AV984E1TlR0cHNgA7CBOxsaSKIXsYvivmEePLHFV1Y2pxBLc
	LXdhI+/Hqo3waxXxXGdS9x1+4wlpS36jKlMeSTn1IA24fEHN4q55tOp+rs7ckQ+wGn1v
	UyO0wakNhVKjTTyWfMc4Wg+l2Osy4Rzs13BURtC9r5N2XLyFrYM89VZQmUXguyK8l9DY
	tCQg==
X-Gm-Message-State: APjAAAV1JDPbF18Vjc8dA3VZjiclLHGPHBCSyPL19Ip1qgpGhjjxKZsz
	3EykDYgv2LD7Cx91mYOnrdo2FQ==
X-Google-Smtp-Source: APXvYqy1rniUnnJ3M445MZY+gaeEq9B2l9j3EGfN9JQuBHLVo3+wqz9pEg+rzkPd7ofM/RC7l/55bw==
X-Received: by 2002:adf:cd87:: with SMTP id q7mr8092695wrj.92.1551554731123;
	Sat, 02 Mar 2019 11:25:31 -0800 (PST)
Received: from hex.config (5751ab90.skybroadband.com. [87.81.171.144])
	by smtp.gmail.com with ESMTPSA id
	c186sm3015336wmf.34.2019.03.02.11.25.29
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 02 Mar 2019 11:25:30 -0800 (PST)
Message-ID: <ad024f8fb7f7fb2f8bb82a6e878d75a4325565ab.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tom Rini <trini@konsulko.com>
Date: Sat, 02 Mar 2019 19:25:29 +0000
In-Reply-To: <20190302174624.GH5026@bill-the-cat>
References: <1551479212-28944-1-git-send-email-trini@konsulko.com>
	<1551479212-28944-3-git-send-email-trini@konsulko.com>
	<e44ab9ad197708fae61fefb6b235e62ae59f0dcb.camel@linuxfoundation.org>
	<20190302174624.GH5026@bill-the-cat>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/4] inetutils: Import version 1.9.4
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
X-List-Received-Date: Sat, 02 Mar 2019 19:25:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-03-02 at 12:46 -0500, Tom Rini wrote:
> On Sat, Mar 02, 2019 at 05:00:18PM +0000, Richard Purdie wrote:
> > On Fri, 2019-03-01 at 17:26 -0500, Tom Rini wrote:
> > > In order to have more robust stand-alone network tools in oe-
> > > core,
> > > bring
> > > in vim from meta-openembedded/meta-networking.  This imports the
> > > recipes
> > > as of git commit:
> > > commit 408204073e6bdcd8ac586e05d5b75213417673f2
> > > Author: Martin Jansa <martin.jansa@gmail.com>
> > > Date:   Thu Aug 16 20:39:15 2018 +0000
> > > 
> > >     inetutils: fix build with glibc-2.28
> > > 
> > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > 
> > vim and inetutils will need entries in maintainers.inc else we'll
> > see
> > selftest failures.
> 
> Ah, OK.  Does that generally involve more than ack'ing the automatic
> upgrades (that one gets CC'd on I assume) and answering questions?

That and helping out with upgrades when new versions appear even if the
AUH can't handle it.

Cheers,

Richard


