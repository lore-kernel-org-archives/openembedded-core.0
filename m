Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA5DC6FD1F
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 22:08:55 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.10178.1711058931669602211
 for <Openembedded-core@lists.openembedded.org>;
 Thu, 21 Mar 2024 15:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=R+DDXraf;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 81D1940002;
	Thu, 21 Mar 2024 22:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711058929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0nIGaxar0aJrPvFFL02maIWXHq+AI2/JQry8ku65O1I=;
	b=R+DDXrafmGySF//DzBnW2/pL/Eoy6daRvVVDarswM8stA9fJy2xIJRAT4Rtq3MrPIlU2kG
	Fy8dp3cnd68N2ZXAh1j62GUsJQFBYG3ojPwbX5mfgNkGLaMHymSRlGfe8wBoMrG5LetFuM
	WYWGpWkD7smyKTAycJFsW6NfMe0zrklGfG5w+C9loRF0IA5f80cGW+Z0yQoEkRCpw/juhC
	qOhta8xtRmLNUFpLcGLgHUNbXJn9GZuRbRQE8r2wdRM7WvSXmvOAf2Fowpz83xiHHc2OSd
	tu4JnjtknkOQeI1yn0tF7U3UoNWwOrfU432YkW5iHhHooCcOZW8dkFxBKKM40A==
Date: Thu, 21 Mar 2024 23:08:49 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Joel Winarske <joel.winarske@gmail.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] [master] riscv: libcamera stack smashing detected
Message-ID: <20240321220849ed4253c3@mail.local>
References: <CABKMkPKN__Jh6jvc_CfHtwp3HGbRsBJ3YxHxGb1RPPN2WWqRMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABKMkPKN__Jh6jvc_CfHtwp3HGbRsBJ3YxHxGb1RPPN2WWqRMw@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Mar 2024 22:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197431

Hello,

This report should have gone to the openembedded-devel mailing list as
libcamera is in meta-oe. But I guess Khem will have a look anyway.


On 20/03/2024 09:10:05-0700, Joel Winarske wrote:
> In master there is a problem running the libcamera "cam" app on a RISC-V
> device:
> 
> *** stack smashing detected ***: terminated
> 
> If I remove the patches in the libcamera recipe, it builds and runs on
> target without issue.
> 
> libcamera bug has the details:
> https://bugs.libcamera.org/show_bug.cgi?id=214
> 
> Joel

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197371): https://lists.openembedded.org/g/openembedded-core/message/197371
> Mute This Topic: https://lists.openembedded.org/mt/105047726/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

