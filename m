Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 37D4E7DB8B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 13:56:30 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id b1so4614746wru.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 06:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=VLmMbK9LXlKNgIYlbC8SRlBdKepdYjRDn8Yvo2Lxm4g=;
	b=dACh2CvbEVoCQalffkR3RWJ28s/FAXg8DG3F6PjPARdZRm6+SjuS6iHUiVIO2aKUjq
	KYUUtcmCUnbZf7Qo8R9cyydtNXdrWj6MneGAOc7DvFTwr1jzasSStIAHwhNqG4JlkNQT
	QFxQGsFJ94x2USK68+wbcs0r1Cll7+YIyq5RI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=VLmMbK9LXlKNgIYlbC8SRlBdKepdYjRDn8Yvo2Lxm4g=;
	b=ZwmwbsjWFTZ/NksGxDJjwBzBxtfMuSC1J6XBF9miPMJ0H9hv0lqM1vZyBsn131XCxO
	litUnY8N91py2QQLXWUUAqg/jds92jTEwBVrr6b0oOPvIBPeXnZ/AxWfUc9uyN3WroB5
	yJ4BtNdJdnpLB9Wf95D6YRb1qCXSF2c5qOo3Lc84iL0W38ZzCEeQpE+fDosa4t8JUcqh
	Z4YHgVrOJSRK2FyEGUlt2/elRHy+Mp9R40LKKIlmN1ixgwL9dZ/72Wgn9fkKJk4D9zqo
	mwLfkR1TOdxlgv9XypO8Yz300H7FDiBfFlyM5VN61ytg1dB4dvK6ODcEaJrkuBJ+2Vgp
	ktVw==
X-Gm-Message-State: APjAAAW49uBuko2miS8ZIN2ozeJHNb/iKJjcenI4Ymxe748xaciKSH3d
	UUYLhOL84vWUpxXbMj14vy2IvDU1sHw=
X-Google-Smtp-Source: APXvYqwqN9VbdsM8OoO5LtiDRE/Murc7cAFgNUKNzjoPtACgf+3XGXhM6CiFvfQX/sWRvKPgDBS8FQ==
X-Received: by 2002:adf:ea42:: with SMTP id j2mr4476260wrn.70.1556286991018;
	Fri, 26 Apr 2019 06:56:31 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a17sm16761997wrm.53.2019.04.26.06.56.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 26 Apr 2019 06:56:30 -0700 (PDT)
Message-ID: <7e08518b4381a936e225eccdadee24a5a5521000.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Fabio Berton <fabio.berton@ossystems.com.br>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 26 Apr 2019 14:56:29 +0100
In-Reply-To: <c05b9ebe4d9e79e34897851477e3c9b2a9e7602b.camel@linuxfoundation.org>
References: <20190425135557.8967-1-fabio.berton@ossystems.com.br>
	<c05b9ebe4d9e79e34897851477e3c9b2a9e7602b.camel@linuxfoundation.org>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [RFC, v5] mesa: Convert recipe to use meson build system
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
X-List-Received-Date: Fri, 26 Apr 2019 13:56:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-04-26 at 14:55 +0100, Richard Purdie wrote:
> On Thu, 2019-04-25 at 10:55 -0300, Fabio Berton wrote:
> >   - Remove all non related meson patches
> >   - Change radeon driver to r100
> >   - Add python3-mako-native gettext-native to DEPENDS
> > 
> > Based on https://patchwork.openembedded.org/patch/158748/
> > 
> > Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> 
> I think this breaks musl at runtime:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/538/steps/7/logs/step1c
> 
> Specifically:
> 
> [     5.224] (EE) Failed to load
> /usr/lib/xorg/modules/extensions/libglx.so: Error relocating
> /usr/lib/libGL.so.1: alphasort: initial-exec TLS resolves to dynamic
> definition in /usr/lib/libGL.so.1

and also:

https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/457856/raw

oe-selftest -r runtime_test.TestImage.test_testimage_virgl_gtk 

Cheers,

Richard


