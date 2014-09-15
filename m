Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 3A78560144
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 14:39:30 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id m5so3871179qaj.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 07:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=iVSbibualqKEOiq3puQ9cKwfMSIlnPPs91OI2BWob28=;
	b=FYApAF2lOiVBSZTJtEooa/QTRJgZQD3ladbUXwcxIDixQyTBKRGln6mrFda6w2rA6h
	NQNyUgtcWRb6apYBpAi2PAZvaYFZa6FhniAoN46GtHDckHWNJmWWTkBDo5QSM2t0XPcX
	jRDcryoMY0Y028JAKWozzp+MlKhX8gvKRQZnLbC7Y4D8/PQ5ATUGYvARu6b+6mb29Ea7
	bFYrgkt29H8J+Ty9Ewb+6b9Ju0+KLqRr8JGZiLTJWi3MihVCwg3ZXsPYypLajAf8vApI
	jBVKazIzLrGtwcw00oqSiqE1oazCOcbUqxhOjCCZ7Ou8X5Vbs5oBcm5qFcY7mBIabAR2
	X0CQ==
X-Gm-Message-State: ALoCoQkO20wO8gHuQ+xOrabiAiQF9KbJ7ZDwULR+zBsIVdQb46sKZCeg+eKK1ZklrVatca6LVqkE
X-Received: by 10.224.38.10 with SMTP id z10mr36995005qad.52.1410791971449;
	Mon, 15 Sep 2014 07:39:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Mon, 15 Sep 2014 07:39:11 -0700 (PDT)
In-Reply-To: <541674AA.8070102@hdebug.com>
References: <541674AA.8070102@hdebug.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Sep 2014 15:39:11 +0100
Message-ID: <CAJTo0Lbs-A7vRiTQCUHbR2wdqkbAQvtmCUJG=GDjqXbUGDBVKQ@mail.gmail.com>
To: Ed Swarthout <ed.swarthout@hdebug.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: udev ptest leaves symlink loops in target sysroots
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
X-List-Received-Date: Mon, 15 Sep 2014 14:39:31 -0000
Content-Type: text/plain; charset=UTF-8

On 15 September 2014 06:10, Ed Swarthout <ed.swarthout@hdebug.com> wrote:
> It looks like udev ptest is the culprit:
>
> /f/deb/home/yocto/yocto/build2014/tmp/sysroots/qemuppc/usr/lib/udev/ptest/test/sys/block/loop0/subsystem/loop0/subsystem:
>   total used in directory 8 available 55515512
>   drwxr-xr-x  2 ed ed0 4096 Aug 24 10:51 .
>   lrwxrwxrwx  1 ed ed0   33 Aug 24 10:51 loop0 ->
> ../../devices/virtual/block/loop0
>   lrwxrwxrwx  1 ed ed0   33 Aug 24 10:51 loop1 ->
> ../../devices/virtual/block/loop1
>   lrwxrwxrwx  1 ed ed0   33 Aug 24 10:51 loop2 ->
> ../../devices/virtual/block/loop2
>   lrwxrwxrwx  1 ed ed0   33 Aug 24 10:51 loop3 ->
> ../../devices/virtual/block/loop3
>
> Does it have to leave these there after it completes the test?

No, it should clean up.  This would be run-ptest in the systemd
recipe, can you submit a tested patch?

Ross

