Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7633C73D26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 17:13:22 +0000 (UTC)
Received: by pdjr16 with SMTP id r16so56100103pdj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 10:13:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=h001V4qcpc931C4hWfoXgC+cqa6qwTCvxEQ1tj7rh4U=;
	b=Hf4spkcWo6LHq1p5ljsI8WnZmqPuYLPiimmrgJGUq7ZxqE2Bb+Z84+ink2hHNJruQ7
	xPTxRGrqahUEWmQ5MIdsDeWhe2rsMJcGoOU4X5fY/LsEQz6Phvy0VTQmZmo81ep3GBg+
	4oh8imLiR3S3L5hsze9mrAZZznmS7ZNVS8H/eGTHBYJalD4rsHSNCd9u4pu8RqOiwRpi
	4nntO0n4uluV7VaWnpPTsBi5U0l/wQR0of6EQVkkwKzNKKZJovNzC/GKlv7TiSdLzGhZ
	rVR+uZD16xLM/2ICRxNYu3Y90RxAN188BJlSPR2HlU6s3wYqbgMqjfPOe1T690Ia9ya0
	8anw==
X-Gm-Message-State: ALoCoQkHV2pWI1iLWP15dcme2MwIlU82mD+3P90Lu5jRUCQmX+BKsgOvK0e5Pj1heIxy6UcLCbEp
X-Received: by 10.70.3.4 with SMTP id 4mr70430949pdy.103.1438017202887;
	Mon, 27 Jul 2015 10:13:22 -0700 (PDT)
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com.
	[209.85.220.52]) by smtp.gmail.com with ESMTPSA id
	fl3sm30484597pdb.30.2015.07.27.10.13.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Jul 2015 10:13:21 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pacan13 with SMTP id an13so55588413pac.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 10:13:20 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.116.81 with SMTP id ju17mr70689803pab.35.1438017200219;
	Mon, 27 Jul 2015 10:13:20 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Mon, 27 Jul 2015 10:13:20 -0700 (PDT)
In-Reply-To: <CAJTo0LbOeMQXd+tRS4=ETVCcDwcaSkKAie_7aR+2zUXT2_pWrg@mail.gmail.com>
References: <1437996407-29463-1-git-send-email-b54851@freescale.com>
	<1437996407-29463-2-git-send-email-b54851@freescale.com>
	<CAP9ODKpMEdbLXiv=kHRpnX0CJ0v7ee_FRF0ZVMWYMW7a18mWdQ@mail.gmail.com>
	<CAJTo0LbOeMQXd+tRS4=ETVCcDwcaSkKAie_7aR+2zUXT2_pWrg@mail.gmail.com>
Date: Mon, 27 Jul 2015 14:13:20 -0300
Message-ID: <CAP9ODKo_nFMSQsCDDVeHjyHwvBOH4X4P36ED2uo9R8juMs5ZWw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][PATCH v2 1/6] gstreamer1.0-plugins-base: Bug fix for id3demux issue
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
X-List-Received-Date: Mon, 27 Jul 2015 17:13:24 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 27, 2015 at 2:05 PM, Burton, Ross <ross.burton@intel.com> wrote:
> How many of these patches are applied in the 1.5 releases of GStreamer?  We
> can upgrade instead and a colleague is going to be looking at the upgrades
> tomorrow, so if several can be dropped then that will save time and effort.

Many but 1.5 is a development release and we should stay in 1.4 until
1.6 is out.

1.5 is very nice and promising as we have been involved with some
development funding and effort due a specific customer. Once 1.6 is
out we ought to upgrade but for OE-Core 1.4 seems to be the one to
focus for now.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

