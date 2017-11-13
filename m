Return-Path: <patrick.ohly@intel.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 494627868C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 20:26:29 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id l22so15545051wrc.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 12:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=/Zg/2nHuLrIxmNE1aHSGjG1IQQTMx9pUgtq0c/mSa/A=;
	b=xj7vA4jVeZoorZrEjGk5lWB1qUnLaReJ4TZtWEeS4fty+KYoT5ViTxtuojnx15FvMP
	uw9UwWVvIhT2haJpbkxUCqTUulK5rhz6AQUJA6LTE/S83lgt/33CY+FAvC0Mqt4xLGIi
	vP/MjA2DMNm9VulL6qNpl551fK6LxAdDWfvdVuB3SmSfGZ0gckPeoHJ8/NDvamfAhXg3
	g785pNQZYHDdS2ZxcIq/mbayT2ISIsFvUvNCtim+K11zgVCItjRNjtcW4QqMnaz0G8wU
	qa09ANpdRpF4th1yFfa0RVmZq1xtc28yG67dw42cSAR5UUeae3En4yIB/bNX0TTnYw7U
	OBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=/Zg/2nHuLrIxmNE1aHSGjG1IQQTMx9pUgtq0c/mSa/A=;
	b=Gm3ah+rEBfMXG4W/RnBOJp1pzX3ntEMQiIrRXOi/Fyfl06iub2xHMv7x50GsbKDjao
	YRbfJThhSRqoBjB3PE7rEfJ9LvQmcAHpS2SABVyREDnEvULTtULuMtn1Dzyo71rcHVFc
	5Oe5m4UmGh4UIjYyRHa1sUkA/cWbCSbOR/Zs/ekAEQy0tzkQ1n9masec3oARKTZGThoO
	vsRCtSxE1tXjdQIc8/OmXR9x/yuEMQPMC/tVm34lD5zwi4fZFmsJbl68fiVJOo0pAbNZ
	ZKwTHQazllyjtpIr3UvW72Wx6AWHQqPIMSAzqWee6WC7de6jr3OR0kotXo2oX35q4m98
	1KvQ==
X-Gm-Message-State: AJaThX52363IgPWo+6aEJ4lQbUeyiLvKJuyh77LjK4nECBz0F1XMwh6H
	7nquY2R00Of/jrV4QklbDfk4LBs=
X-Google-Smtp-Source: AGs4zMZRRtdCYif8G2qv04QUfYAziQOr/2VrZsMCduaeI56Q0Bs9gP3NVl4pJXr6XLOCIN2f24d0zw==
X-Received: by 10.223.156.201 with SMTP id h9mr8158781wre.143.1510604790949;
	Mon, 13 Nov 2017 12:26:30 -0800 (PST)
Received: from pohly-mobl1 (p54BD5837.dip0.t-ipconnect.de. [84.189.88.55])
	by smtp.gmail.com with ESMTPSA id
	j125sm11276182wmf.24.2017.11.13.12.26.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 13 Nov 2017 12:26:30 -0800 (PST)
Message-ID: <1510604789.5979.1.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 13 Nov 2017 21:26:29 +0100
In-Reply-To: <CAJ86T=UQ_b0RLUTCTGPONvkxXCO_s3Hvim0Zh4_MpcBBPoDpeA@mail.gmail.com>
References: <1510293271-32407-1-git-send-email-armccurdy@gmail.com>
	<1510584490.22094.65.camel@intel.com>
	<CAJ86T=UQ_b0RLUTCTGPONvkxXCO_s3Hvim0Zh4_MpcBBPoDpeA@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: create wheel sysuser group offline
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
X-List-Received-Date: Mon, 13 Nov 2017 20:26:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-11-13 at 12:18 -0800, Andre McCurdy wrote:
> On Mon, Nov 13, 2017 at 6:48 AM, Patrick Ohly <patrick.ohly@intel.com
> > wrote:
> > On Thu, 2017-11-09 at 21:54 -0800, Andre McCurdy wrote:
> > > The default systemd-tmpfiles config file expects to be able to
> > > create
> > > files etc belonging to the wheel system group. Currently the
> > > wheel
> > > group is created at run time by systemd-sysusers, but that
> > > doesn't
> > > happen if systemd-sysusers is disabled (as it currently is by
> > > default
> > > when building with musl libc).
> > 
> > Isn't this something that the systemd_create_users rootfs
> > postprocess
> > command in rootfs-postcommands.bbclass already takes care of?
> 
> systemd_create_users() does a build time pass over the
> systemd-sysusers config files, but those files are not installed if
> systemd is configured without sysusers support.

I didn't know that this is optional. To me it sounds like an invalid
(or let's say, unexpected) configuration to install tmpfiles config
files but not the sysusers files, because as you said, the tmpfiles may
depend on the sysusers.

Anyway, I just wanted to know because I was wondering whether it is
really necessary to duplicate the user creation information in the
systemd recipe.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



