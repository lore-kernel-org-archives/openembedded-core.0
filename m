Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id D6C0B74AEB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 14:07:32 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id d9-v6so8505389itf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2018 07:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/qfcC1fw/zTqgi/uSgbgPwmDHuDuF6tXAGA2B6YmoAw=;
	b=DXBEVoCP00/2Nbl71ThGpmlhaL/6/K3W/SLkSDLREvn5UtDGJ18FH6xyfgG3EONcYj
	ges+dTV/jFUw0VwvtvWU+a0sI9BFTquwP0Lq/qCZJbCwIc6dzrx9/TQlox8MEnd5pvTZ
	72O06Xdp0a8J4XArZOczaWd7Lzo3/9WIAYFXBznd+UAG6RbV3D+lpoj23SBwuW6Lm49h
	TDHrP01mNZqcqQbR6m7E9R6Gr6Is+WW7x2NWsO3nqkoRb4lAOM7Ir7H6JDNvILd7v4Gf
	S3YOzE+MDYOdr84doBXwswnExC3tFtKchFQNKPZ5usy1O3X261dpruse5eCz8lqs6Dhx
	Co4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/qfcC1fw/zTqgi/uSgbgPwmDHuDuF6tXAGA2B6YmoAw=;
	b=rI+AoCFky2mdQhauw53PoIwUjDc/KIW/t5GYJpcwnvExLCILhPmiSnCJU+ChM3gXPW
	GBP3XfFmjnObDrkglNvFZeKVDoZFNExD8ktTKrJJeZ4j0kWUkyJRuNN2CpImdlUEwdSu
	5xZJXPhOhH/Bm/3mDmJMKKIJfjCjajKHIlPF+MoLNRVOVEH7Roe0aGeiPd3cW4jc9u1P
	/hcmAhsXXN3skC++RLh4NPRiRJx5NddI4V93B4cEk0lZ3GxN+V//evqPHMJb/ExHcfc3
	yq0lU3cNSTurMUVemxBl6Htb10Ijd53KvkdskBGpfie3/wmniNhB+Znme8jzDW1Sf6rC
	jr4A==
X-Gm-Message-State: AOUpUlGGvt+SKNFqD0WYed9Qjz8JIFgQmI4NTb+EPrijgveOsnofMakl
	hNWziwSVcf0DEv3u71XUdss=
X-Google-Smtp-Source: AAOMgpcD76SCrcoPsisIaJX++3HhgJfoNiXp5r5XFggDwt7DJ1zOgkDxu3QtXZqPyjHCPV3FlKPdQQ==
X-Received: by 2002:a24:aa08:: with SMTP id b8-v6mr6274930itf.49.1533305253822;
	Fri, 03 Aug 2018 07:07:33 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	x15-v6sm2862239itb.9.2018.08.03.07.07.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 03 Aug 2018 07:07:33 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <3be35f83e111fa477e0a63700ec868e50d999869.camel@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 03 Aug 2018 09:07:32 -0500
In-Reply-To: <CAJTo0La5gdatTgqX+RSu6QaE5bW9tkoeWzjNy2BTX--Vv_x8gA@mail.gmail.com>
References: <20180803134831.16694-1-JPEWhacker@gmail.com>
	<CAJTo0La5gdatTgqX+RSu6QaE5bW9tkoeWzjNy2BTX--Vv_x8gA@mail.gmail.com>
X-Mailer: Evolution 3.28.3 (3.28.3-1.fc28) 
Mime-Version: 1.0
Cc: Tanu Kaskinen <tanuk@iki.fi>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] alsa-lib: Cleanup packaging
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
X-List-Received-Date: Fri, 03 Aug 2018 14:07:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-08-03 at 15:02 +0100, Burton, Ross wrote:
> On 3 August 2018 at 14:48, Joshua Watt <jpewhacker@gmail.com> wrote:
> >  # upgrade path
> > +RPROVIDES_${PN}-dev = "libasound"
> > +RREPLACES_${PN}-dev = "libasound"
> > +RCONFLICTS_${PN}-dev = "libasound"
> 
> Shouldn't this just be PN?

Indeed! Good catch. I'll try to remember the in-reply-to this time ;)

> 
> Ross
-- 
Joshua Watt <JPEWhacker@gmail.com>

