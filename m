Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id AC2FB60657
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 21:11:42 +0000 (UTC)
Received: by iodt126 with SMTP id t126so95499069iod.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 14:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=frbjvMPKuq5zK3SyX58vbsuyZbCGP8l6lO5gkPkRLoM=;
	b=Yc72+SfmM87Q+d4g/4FsfTzueBZNTDjnYYhM4e+blbwbb8otB65Cy/Ge7BLV9mAteH
	mG1DH64IPBO/4slPoD4knyiKyaD0L64yFOaG/b+dBtSXtSNwrb+n7G/gTC0PzHB5tkC1
	120CSud0MgaaRdo5dpKcclmLE3OV16bjqAkrrMQ4EoyzNvhaug3IPvSD+U4NJdIea+zu
	Qyx/0p4RAF+zdt+BpFtU8Mbf0RgzwNAS0Bm6St5EhYLKBnCFBRtVP52C9wNnmZsPSZfP
	Itl9I1gXbNMkksBnCwcr79xfOqcq3KkbbBEfbPQIWUBgSki2zjfzx3nUkE1ArkRJhe1k
	ztUA==
X-Gm-Message-State: ALoCoQmyGxTgOkXZ/jjbCEtkmLbqZSF2P5jMteb700RGKBcOEmoX562EzKRmnxFvL74kuq3t63aA
X-Received: by 10.107.168.25 with SMTP id r25mr9291444ioe.32.1440191502201;
	Fri, 21 Aug 2015 14:11:42 -0700 (PDT)
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com.
	[209.85.223.177])
	by smtp.gmail.com with ESMTPSA id b78sm6882216ioe.2.2015.08.21.14.11.41
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Aug 2015 14:11:41 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iodv127 with SMTP id v127so95078552iod.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 14:11:40 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.7.168 with SMTP id g40mr10103019ioi.28.1440191500819;
	Fri, 21 Aug 2015 14:11:40 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Fri, 21 Aug 2015 14:11:40 -0700 (PDT)
In-Reply-To: <1440167394-20065-3-git-send-email-b54851@freescale.com>
References: <1440167394-20065-1-git-send-email-b54851@freescale.com>
	<1440167394-20065-3-git-send-email-b54851@freescale.com>
Date: Fri, 21 Aug 2015 18:11:40 -0300
Message-ID: <CAP9ODKqQosQxyMrSxDQrJz7jYBRKCD7kA-YEY9HBPP-WC_PERg@mail.gmail.com>
To: Yuqing Zhu <b54851@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v4 2/2] gstreamer1.0: Fix QoS/lateness checking if subclass implements prepare/prepare_list vfuncs
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
X-List-Received-Date: Fri, 21 Aug 2015 21:11:48 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 21, 2015 at 11:29 AM, Yuqing Zhu <b54851@freescale.com> wrote:
> In function gst_base_sink_chain_unlocked(), it should calculate jitter based
> on current media clock, rather than just passing 0.
> Or it will drop all the frames when rewind in slow speed, such as -2X.
>
> Signed-off-by: Yuqing Zhu <b54851@freescale.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

+Carlos for his feedback on this one as well.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

