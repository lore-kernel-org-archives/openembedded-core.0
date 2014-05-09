Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (unknown [209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7BE9960897
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 19:22:57 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id q108so5008666qgd.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 May 2014 12:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ZwQ4m/9n4M9aQ+ARiE7ItycNiBCWhT3YKR1EV9ZOHXQ=;
	b=Snkmy8IM91Db1nm6ieyhuzI2hadJt//P6+GE7wgqbTrw8hqwnuWFKFnE0m91TahvGS
	hSH6wrxgVNab91qIvMFVo4ByMETpiWwlu62OXN+dnJJQN0+zDMHFOBX0Td/8Qn/5F2kR
	zfEW8yxND5fH5Y3SaYTgyr8RH6QLZsvFOZ1fmK0G6lwfE6fEGAMMhxFI7DDv3l3FOy3l
	bQarghtM9YcZ/fcGQfq/ta0yks1pMbNPsVrubnFcJ88XB1O6G32gzmZHKJkxJetjGxU1
	VPb4Ub8sp/GFRnCdk9SWHtivY3QFiCqjZCPS8jqqXUP+IUw6R0S2FJqWgfzCjqzUTOL4
	XGMA==
X-Gm-Message-State: ALoCoQk+eI+97ZbfDt92KY/xiBx2D7Np+qIAVgNgoPUEAQW7i5ytCh0Jygy29AFw+pMBumzRPz4L
X-Received: by 10.140.48.161 with SMTP id o30mr16953829qga.68.1399663368341;
	Fri, 09 May 2014 12:22:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Fri, 9 May 2014 12:22:27 -0700 (PDT)
In-Reply-To: <536CF208.3000400@gmx.de>
References: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
	<CAJTo0LZ_S=mNgM6gtPSfYf=AVRxdLcJ_CO31c+emmQrib80hjw@mail.gmail.com>
	<536CF208.3000400@gmx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 May 2014 20:22:27 +0100
Message-ID: <CAJTo0LZJ-cLjvGH5YZA1Tu-Wz6biKn=A2mVp5rrkwzkFB-ggTg@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] [oe] GStreamer 0.10's future
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
X-List-Received-Date: Fri, 09 May 2014 19:22:58 -0000
Content-Type: text/plain; charset=UTF-8

On 9 May 2014 16:19, Neuer User <auslands-kv@gmx.de> wrote:
> Yes, it does, as long as you need QtMultimedia. Same applies to Qt5.
> There was a discussion on the Qt mailing list about moving to
> gstreamer1.0, but this seems to be rather some time in the future was my
> impression.

So Qt 5.3 won't have GStreamer 1.0 support.  The port is being done in
a branch so it's possible that it will land in Qt 5.4, which is due to
be released in the September/October timeframe.

One option would be to move GStreamer 0.10 into another layer, give
Qt4/Qt5 disabled-by-default GStreamer 0.10 options and hope that by
the time Yocto 1.7 is released, Qt5.4 with GStreamer 1.0 is also
released.  Even as someone who's rather keen on removing cruft from
oe-core that's a bit too eager for my liking.

Revised plan unless anyone has a better idea: in 1.7 we'll move
everything possible away from GStreamer 0.10 but keep 0.10 around
until the 1.8 cycle, and then revisit the Qt situation.

Ross

