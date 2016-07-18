Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2910360797
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 15:13:14 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id x130so8521104vkc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 08:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=EdwTth2xV2EVsmrsmMr/9cCF2EZbQhHhJTql+mpU71Q=;
	b=uyLVOxXYQ5jKfnFcNLIU3KBRaNmofRtMO9DWPBVAYC6aDhsXJw55Th9mV+qH+5AASw
	et+g7nVuj8XwfX2rNcYGwSBrdy7THbswYxbq8AjUif1ovHdV/X1ETsL/EOP1Wc8pPoqS
	2433rbpwnDCUwiqtCKz8o0SLxMldbgf6HluwWR23DZL92T93cSSk8CMartFTqDk/coy/
	Z3FOEJ5bClcNzoCI10NRCuEgAG+7NQBqIuqbCne01CMJn0JZgDD7zXxXBURpwHLSO0AH
	gioq+ySemAx7RpFqOmzzHhD6++kJzcbimwOvzlFMe0wPaiq4FOpbXpbojsG9oqqG0qfL
	wTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=EdwTth2xV2EVsmrsmMr/9cCF2EZbQhHhJTql+mpU71Q=;
	b=SP63/nS9Qf2OPPRx8RpwlPOY5EhC/+PJ1ZQ8Rpb5Jn1Yaqnyb9WzzXnnWBYi75Up7o
	K2o9892dBcBUf9eayXTOTcSyChqVbJzkVgdY8FG0tCWLpPFVrZk07wbT0jweIFDOXFEN
	rB5h0BeaTBXCISPVLELhFmEKtYXyHsqBbEwvG/Y6ZYYAW2BnyGCXqTMZU7ZQNb/d2mGt
	yRT3st1gN4iM4ubOl8NMU5P2wuX7Us4ilTxpZJQQDBlk8bKmyT/LnxaOA9pa+KJznic/
	0fvxdBZiHDzMtNQGmbYtJltEy6dx7q2DWNe/tEXu3vxWZvV2R3y/bS5PkDIlypZQQnYq
	zkoQ==
X-Gm-Message-State: ALyK8tIHjHnK7vbbFWNWOwn5YMMT3ZeBRshP245zoCorACaM7t3G8uSZPlGWboXKpJGFjQ==
X-Received: by 10.31.225.70 with SMTP id y67mr15306831vkg.80.1468854794615;
	Mon, 18 Jul 2016 08:13:14 -0700 (PDT)
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com.
	[209.85.213.50])
	by smtp.gmail.com with ESMTPSA id 53sm3073591uak.7.2016.07.18.08.13.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Jul 2016 08:13:13 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f50.google.com with SMTP id s189so34076585vkh.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 08:13:13 -0700 (PDT)
X-Received: by 10.176.0.180 with SMTP id 49mr15677919uaj.107.1468854792742;
	Mon, 18 Jul 2016 08:13:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.192.195 with HTTP; Mon, 18 Jul 2016 08:13:12 -0700 (PDT)
In-Reply-To: <1468852986-2487-1-git-send-email-tom.hochstein@nxp.com>
References: <1468852986-2487-1-git-send-email-tom.hochstein@nxp.com>
Date: Mon, 18 Jul 2016 12:13:12 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqvsErijR32f-X663hFM8jdmHyjN3be2pD5YSyL0iaZjg@mail.gmail.com>
Message-ID: <CAP9ODKqvsErijR32f-X663hFM8jdmHyjN3be2pD5YSyL0iaZjg@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/3] weston-init: De-couple framebuffer console from Weston for systemd startup
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
X-List-Received-Date: Mon, 18 Jul 2016 15:13:19 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 18, 2016 at 11:43 AM, Tom Hochstein <tom.hochstein@nxp.com> wrote:
> The framebuffer console was using the same I/O as Weston. We fix this
> by having openvt switch to the new VT when starting weston-launch, same
> as is already done for the sysvinit case.
>
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

