Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 90DE577F34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 10:21:45 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id r36so14942286ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 03:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=c4oVIoYZsDRZ9dM0RZj/avdkSaa0IHlPljI0F0ll22A=;
	b=sewvu2ZFSmRb6VmCNix+yv+tBMdeOgZn4hyBp8W9ZUHUvhH4KyOhOwGuH+4nzvtYZ9
	LfB26lYTV/slitXD1Vx6gLKCJIaiGPlWTlcLVLT53JqvKzzYw4KVFsT7G2v1LM7ImPRF
	RJqT8+hj86vA4PKD8lEeZpJx4R0bduxpRmNoxPFYccTOvPSq7+zZuKrZ4mZEwWRJxQpS
	AVkMDoIOc8jC/OnrZHlwMxpkYTX7kjs2BkMRmoiET+SBKupDYTCkJB4t2BguLo+oNOoR
	nnVf7EzCMdlcstlTNUL6IFmk5azbWe59qTNVWljQxT96GWeqAYawAWntMKuhQak0Z95j
	DmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=c4oVIoYZsDRZ9dM0RZj/avdkSaa0IHlPljI0F0ll22A=;
	b=ceLF23IkSjzudJCRBVuWJBS77Tbzy4OmloMIsjoPG+jbAZA7zINY5ZHidR+yOH6COZ
	DNUs3KKCUBAmdCbgSdBRwbpYfEzvivUTXCXIop3oyvT6ZBHLT6yGepc6wxeu2/x4PUVJ
	SS95mejybnt207Ok6cJ9fRl8+6gkksUJnoO8nnH04yvSXvWwJDQuwByDNjSwR6ClgbSR
	H3JZR6NTEQes1qizrc8f/m0t4jPy7QDc4+7DIT7Ivhg0acMrkrBtjVJy9vrWHqlS3u0+
	gVJSGDtnF+B1ITgSjs8KB4C5Jrot77IhMK4HoEql82xJEeLVFeiCw8YGp+LpbYcuOU3N
	iDrA==
X-Gm-Message-State: AKS2vOxG3U8YqazdRIQ9BoX00tspF0Zbkg0k88ScXdX/3oMjXWCCOqEO
	+SkG/I3HYRVmY88x
X-Received: by 10.107.134.168 with SMTP id q40mr5616941ioi.149.1498558906583; 
	Tue, 27 Jun 2017 03:21:46 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FB9F.dip0.t-ipconnect.de. [93.232.251.159])
	by smtp.gmail.com with ESMTPSA id
	s94sm1369689ioi.20.2017.06.27.03.21.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Jun 2017 03:21:45 -0700 (PDT)
Message-ID: <1498558903.7464.37.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Jonathan Liu <net147@gmail.com>
Date: Tue, 27 Jun 2017 12:21:43 +0200
In-Reply-To: <1498554326.7464.33.camel@intel.com>
References: <20170601121552.27868-1-net147@gmail.com>
	<1498554326.7464.33.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] bitbake.conf: Add sdl-config to HOSTTOOLS if using host SDL
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
X-List-Received-Date: Tue, 27 Jun 2017 10:21:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-06-27 at 11:05 +0200, Patrick Ohly wrote:
> Even if you had checked the right variable, is that really necessary?
> I'm building qemu with ASSUME_PROVIDED += "libsdl-native" just fine on
> Debian Jessie, without sdl-config in HOSTTOOLS.

I'm still interested in learning what problem it fixes.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




