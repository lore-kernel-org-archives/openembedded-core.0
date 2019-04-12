Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 370CE7C7A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 08:17:42 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id h18so9876313wml.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2019 01:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=rVBbDT51H7WpfBHHrLZoxGSpU5HafmrU9ieTgX9bIXU=;
	b=O1Vs/gcUG/4O8eQv5tUzZFuHk69Z6+k2MJJf5NoQ+BQX4LjoSbJVJFY6oOG2eKpNv6
	hoFqQn6TJY2WDH5H8P8FkeyjmjoryVJdK32kYNhhgp3wA2JbE7JBPDWU7XQaU7EoOSnc
	cSU6tDeGh+lw8dHRHjOSRcwd7SqnkGYVytbdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=rVBbDT51H7WpfBHHrLZoxGSpU5HafmrU9ieTgX9bIXU=;
	b=rDU9blPAJfWcdj6yn76SlpcC2MNK50U35SZYNiOy6QLVDhC21AMQepwkLO+XhcJj1a
	YD5wolzkeS28qL0rDVbw/j7jDBbx+tgZx47EDDhdqK0n/cG4dohkQptQNE6bn44gVmid
	4f5yaCAVuawFku7ovQgMoD40KkEk80QQR9nSpwVgbtgEJAqjywt8aGP21QDQiOS7GLvz
	9+YGT6Y+ND+ZdI3BH5mnpMuFP7HRBBw1nKeTO4lI7meThz7oTVAwgPiebXZi+eawexAQ
	ytdlSolkyxMdNyvxGiDjymz+blhX0TOfHkNQcFJxb6037dcadsiOosvSI+ev1s+Ff4gv
	k9ug==
X-Gm-Message-State: APjAAAU2QQTddFKO2RUzUz2iAZgmqiCUHWoPPphCjZqFrl5rTnyvwpvJ
	V3A3/BeyOkOwVnW/43zZaYxwrpxXu0c=
X-Google-Smtp-Source: APXvYqztRae0dzbkp6UdLK/wnTNOkR5sbCcBKDvd8tUXnd+ctQSqUpWyvkUcHqE6dZwYXBBH4rR6xQ==
X-Received: by 2002:a1c:2b41:: with SMTP id r62mr10405895wmr.94.1555057062878; 
	Fri, 12 Apr 2019 01:17:42 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h12sm39414569wrq.95.2019.04.12.01.17.41
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Apr 2019 01:17:42 -0700 (PDT)
Message-ID: <2cf8ada8df82cb38252db3ff4c45b9f85294c63e.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Seebs <seebs@seebs.net>
Date: Fri, 12 Apr 2019 09:17:40 +0100
In-Reply-To: <20190410185944.0a16ea5d@seebsdell>
References: <20190410231254.25763-1-richard.purdie@linuxfoundation.org>
	<20190410185944.0a16ea5d@seebsdell>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo: Update to gain key bugfixes
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
X-List-Received-Date: Fri, 12 Apr 2019 08:17:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-04-10 at 18:59 -0500, Seebs wrote:
> On Thu, 11 Apr 2019 00:12:54 +0100
> Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> 
> > -SRCREV = "6294b344e5140f5467e6860f45a174440015304e"
> > +SRCREV = "6ebc7d6bc8ab973d0ba949eeb363821811ce8dc5"
> 
> I would sort of recommend one of the two commits since then -- one
> may
> fix the .NET startup failures, and the other fixes warnings that this
> one introduced and I forgot to fix. But I'm also okay with this one.

That is good news. I've tested and updated to the later revision,
thanks!

Cheers,

Richard


