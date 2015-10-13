Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 99403605D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 21:44:24 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so102166178igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 14:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=xF7VQemRCKPEVLDqxXaaopgQF1bEYf1oUiDNOY7DAHQ=;
	b=cIgsbEECwv1OyQ9s0kH9boMMlLjh6tvsgA5/hnwPz6N9l8VTsK9piVwVksSP3nT4/g
	WLV+r+qmH/aA8SKmRAWCFo4KTgmz56I+WP5eMF8IsMuJEeU6gbYM2TMNwH0KkOf8hdSA
	IPnYT2o8TnghYf8wd04OQBYDZzow9tq96G33J6tXyGlGoQsPBtUireyzxIj2SdxVP2ZQ
	MCd7HqmZsLNI5neC7I8lljgpqijO+e7fd0zs2oRbBh1Ac61pLsp7oOMDOPIDU1s+94hw
	OsrvSBUXApmVRZn/Lyu++daBa6GglV4MQyf+x67vl8fi6UYeMT7Bl6yoyxjgaBgAm7M3
	TOWA==
X-Gm-Message-State: ALoCoQk6Fb3M5BqyzahUwJ7yv5jHRwqO8qxNTac2S+Og4KOfs9KWWNgTpmlxXdgCUw+nVx9D94n9
X-Received: by 10.50.164.225 with SMTP id yt1mr283668igb.76.1444772664448;
	Tue, 13 Oct 2015 14:44:24 -0700 (PDT)
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com.
	[209.85.213.180])
	by smtp.gmail.com with ESMTPSA id o74sm2400603ioo.8.2015.10.13.14.44.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Oct 2015 14:44:23 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbni9 with SMTP id ni9so67051317igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 14:44:23 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.30.233 with SMTP id v9mr23034545igh.5.1444772663259; Tue,
	13 Oct 2015 14:44:23 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 13 Oct 2015 14:44:23 -0700 (PDT)
In-Reply-To: <CAJTo0LbR=Fryhe-Jfgw9AW=ZjBTWE5gZQ2id3si55LpRZtmH-A@mail.gmail.com>
References: <CAP9ODKpN0kbRtm7pvrky5pwFZ_1YPoZ-fy=kt+4CPB+NUoyBKA@mail.gmail.com>
	<CAJTo0LbR=Fryhe-Jfgw9AW=ZjBTWE5gZQ2id3si55LpRZtmH-A@mail.gmail.com>
Date: Tue, 13 Oct 2015 18:44:23 -0300
Message-ID: <CAP9ODKrks-DGP6mTJxMaVyY7-+Sit0_sBgndny3LouWjuG541A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error due GTK+3 new rdepends on libgl
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
X-List-Received-Date: Tue, 13 Oct 2015 21:44:24 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 13, 2015 at 6:42 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 13 October 2015 at 22:32, Otavio Salvador <otavio.salvador@ossystems.com.br> wrote:
>>
>> This includes a forced rdepends on libgl and I see no reason for this.
>
> Mainly because gtk3-demo will link to libGL.so on startup.
>
> It would be interesting to see what happens on platforms where libgl.so isn't available if you remove the dependency.  If GTK+ handles that gracefully then we can make the rdepends conditional on DISTRO_FEATURES.

I am handling it in my side, meta-fsl-arm, however I think gtk3-demo
ought to link to the library when building, no?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

