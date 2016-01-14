Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f179.google.com (mail-pf0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 88401605BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 21:37:17 +0000 (UTC)
Received: by mail-pf0-f179.google.com with SMTP id q63so109130726pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 13:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=grh+sz5w7BlsxuxJoNWukF1T2rgnrgtD+wJ66aHunhc=;
	b=Ypc14hO4HNRbbxVg4YTVOBoA5lpKFdz8FbKMHRtPvbXQaatIusOLoiM6TVH74B+QOf
	nTzaTpFFlVr1x1DePaHq6ocOwIQck3A4PRSxFib1aBfRdQe6l5e6d9qh7GQxbblUXCt6
	YsPhbV1LetmpVj09/aBlpMgdfJgZEhdEUveBz+mopsNMPNdrICJRV+BXTKwH0wyCCg8b
	BBceM8Orf/OwZIPbw6p6jvBJMz3bxGkSOU6fZva0E3rq9r9RPNeGe1SmVIdRjiIvrknW
	Gig6CeBctH2tgDBLliSYI9YgNzfLUQhhZMIzE+jzdGYU85k9p3C68LVW8iMIVfbNgQJ2
	Xvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=grh+sz5w7BlsxuxJoNWukF1T2rgnrgtD+wJ66aHunhc=;
	b=a0TfPCJ0+ZhHjWJwnJkSKkHXpteBRoRZXvq3ac7QVy9VxJxKqyDkB+x2p7CA+e9DC3
	i9jdxTuWqOJTR/j+yCwXH4eJSGy+KpkP0E5z0kjPMW1oR8DjrBU+J8DpsrS4MIT0Xfeu
	8Zh9Tc0SmiKWKh6FNlm0R7QFtROwKmg+sJoo8PjsWTu9gwlma4vNssTLAgUAE52ZJxG7
	mVFzXXB2ORZdyQDzojYDZeony113KZfemIi5oaZwdMXYBIcnjMuBYqWsTydjt6hFHNf1
	EYjQ6NRL3RkN9EYjfqp/WVCPuTfFdlNKcyT5EL/oB6s62Kel+Gaday+/o4EaLGPyFU7B
	k/WQ==
X-Gm-Message-State: ALoCoQkjWpYagAvsQCJQ46/1wA37lEVl2QlMXkqZZwAiyNxBIEbdIZlmgJncqAecb3WeTHdj6OKXL5XfylgmejYz8xUwIXCHrQ==
X-Received: by 10.98.75.143 with SMTP id d15mr9696678pfj.96.1452807437910;
	Thu, 14 Jan 2016 13:37:17 -0800 (PST)
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com.
	[209.85.192.180]) by smtp.gmail.com with ESMTPSA id
	fc6sm11291994pac.44.2016.01.14.13.37.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Jan 2016 13:37:16 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f180.google.com with SMTP id q63so109130359pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 13:37:16 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.74.135 with SMTP id c7mr9440617pfj.129.1452807436142;
	Thu, 14 Jan 2016 13:37:16 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Thu, 14 Jan 2016 13:37:16 -0800 (PST)
In-Reply-To: <201601142215.19475.marex@denx.de>
References: <1452656212-9836-1-git-send-email-marex@denx.de>
	<20160113220943.GS3359@bill-the-cat>
	<CAP9ODKrwXxORtat0pP_J3MgQ2CkfYrBMuGPCnAynEM__xZmjnw@mail.gmail.com>
	<201601142215.19475.marex@denx.de>
Date: Thu, 14 Jan 2016 19:37:16 -0200
X-Gmail-Original-Message-ID: <CAP9ODKptS3b30mw8ZDZ1Pd2gLsN+wj8aJxxz+X4xWAr7qiAZCw@mail.gmail.com>
Message-ID: <CAP9ODKptS3b30mw8ZDZ1Pd2gLsN+wj8aJxxz+X4xWAr7qiAZCw@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Tom Rini <trini@konsulko.com>, Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2016.01 release
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
X-List-Received-Date: Thu, 14 Jan 2016 21:37:18 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 14, 2016 at 7:15 PM, Marek Vasut <marex@denx.de> wrote:
...
> Taking a look at u-boot.inc and uboot-config.bbclass makes me wonder how all
> that could work at all. It's either a stackpile of legacy cruft or just poor
> design.

I think it is a mix of both.

How would you address this in a clean way?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

