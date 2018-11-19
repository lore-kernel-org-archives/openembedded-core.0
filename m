Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 264926C42D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 22:43:21 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id j2so5387717wrw.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 14:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HGTXjIqsiQoPTY66JFFAUMF2QbLCfWP4TejevHbuig4=;
	b=cZcTRDvr2imnNRg6vDONW09hwg+zOXnuOxB+UJwX+OkLLu+KAdHqDhLKgGTE4AGudQ
	E942X2T78XyOez1cI2eMTO3LxkviVRpydbSsEYsUKRI8gJQW0pbDp15vTKDMSxLLhz2G
	WIDjuZjc1U9R+qRkzVSXjzdYh96SSLJQDwo6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HGTXjIqsiQoPTY66JFFAUMF2QbLCfWP4TejevHbuig4=;
	b=pxHzA2lJdnRclVx70JKlpWqxoZi5sfp7vKsAT5WIDMV05SZfd375wHT5RSvokYZvuM
	hMUy9NlKLr/pqnzmJfsTUQCdT86uBocYb7QGVClnz2FWopSK9TA2oyXGbJl+RXBtcCQQ
	d5htysIHhS8MpEW8Y/fJ/yWFlTCec/q5SnXYTdJGWIfFFSFQrjU9bqnsRz22jErpjk94
	x1aWZ923OVEBHdNJPXYYLjMBTtYnApJ8I3ku2WP+fDM/Tvm/Pwyi08kocre3hx2WuuMq
	v+uNIAeoExt9BMgSFFfQsHcgrMfb18DWQab6xa7rvzVu5K+0+8zDNHdlwhhW2p+oe+Ux
	ul+w==
X-Gm-Message-State: AA+aEWbLgM1TofvrANKBC6tYWmmXDCsBke/kM/xfbErPRWSJe+vns+cB
	nxHLSjSFqyYHqJITlne543uWDw==
X-Google-Smtp-Source: AFSGD/W2AKdOcZvJtUr2mTEkqSrjH5gS6yzoC3SgYJ6iaL0q1Qk3/cQsFArZPApnTil59kHpO8xo/w==
X-Received: by 2002:a05:6000:1c8:: with SMTP id
	t8mr6639480wrx.146.1542667402256; 
	Mon, 19 Nov 2018 14:43:22 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y83-v6sm29590443wmb.20.2018.11.19.14.43.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 19 Nov 2018 14:43:21 -0800 (PST)
Message-ID: <4063fc9ca83a5ab4815dc8c76761171c4b1c526d.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Valek, Andrej" <andrej.valek@siemens.com>
Date: Mon, 19 Nov 2018 22:43:20 +0000
In-Reply-To: <D55698ECEC159B488D62A508E18D7FEC01696588@ATNETS9912WMSX.ww300.siemens.net>
References: <D55698ECEC159B488D62A508E18D7FEC01696588@ATNETS9912WMSX.ww300.siemens.net>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Update sdk dummy providers
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
X-List-Received-Date: Mon, 19 Nov 2018 22:43:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-11-19 at 15:00 +0000, Valek, Andrej wrote:
> I would like to ask You a question about your commit (
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-core/meta/dummy-sdk-package.inc?id=0d0984e1e616c9f1c211b7b980ba2ca54c096e6e
> ) to update sdk providers. I have found an issue regarding to
> buildtools.
>  
> ERROR:  OE-core's config sanity checker detected a potential
> misconfiguration.
>     Either fix the cause of this error or at your own risk disable
> the checker (see sanity.conf).
>     Following is the list of potential problems / advisories:
> 
>     Required perl module(s) not found: Text::ParseWords Thread::Queue
> Data::Dumper
>  
> After analyzing, I have found, that buildtools-tarball contains a
> nativesdk-perl (in manifest), which I guess should be excluded.
> I have found, that after removing comments your comments of
> d.appendVar("RCONFLICTS_%s" % p, "${DUMMYPROVIDES}") and RREPLACES_%s
> in meta/recipes-core/meta/dummy-sdk-package.inc it works. Is there
> any reason, why You have commented out?

It appears if they are uncommented we see:

https://autobuilder.yoctoproject.org/typhoon/#/builders/3/builds/226/steps/7/logs/step2b

(and other similar failures).

I suspect this breaks this way for rpm and breaks a different way for
dpkg/opkg so I'm not sure what the right fix would be. Am I correct
that you're not using rpm?

Cheers,

Richard


