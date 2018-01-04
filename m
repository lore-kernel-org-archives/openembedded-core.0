Return-Path: <patrick.ohly@intel.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 39029784F0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 10:41:34 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id y82so1588166wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jan 2018 02:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=RLVgFPMBZrJhTwV2ObqV6U307eVz/tacYoQnsedrD5o=;
	b=1HEUMD8eiYrvH/qhrHL/BckclFB6bGNEcDIk7qeqLV/jG2aI4nG9y7ubKoIN6sqO1c
	JtCPoqZ+w00p6ofd0iBwDAa4wjPWAnbNBXhLI144LlaweFCE2wQfwLZMjKJtbQUeisTz
	tnLGprgrS96pyB/+y9XMTjHYyK2msM+30vaI2du3WbLgn21QTwNw4F0TCu5WQYtSdWKd
	yvmNqtfiC46sSgVJ4PEyjteEsiysI6/wsjhwwykEEwPXGltyoxTwQ8tgnZFF4o657beV
	19IIKjbp76xDIMO2OtcCsJ1PmMDXCPbK88ZStr5iUyPAnWT3kY3P7AK1jERfCf7u2Prh
	GRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=RLVgFPMBZrJhTwV2ObqV6U307eVz/tacYoQnsedrD5o=;
	b=lDCfsHiLz+SZwkB0n6D4knYYUzkpEhdjtOPf8Nr8iVbyA+D3ajFeBL8IslyVOl9IWz
	G3U0AC/LXZnQciHmuwfm0yvFcE9tMymKcEcoCGJputdiV04Pi1lC7ha+VElyq2Cv1VAg
	eU5EJEY5oVq44qjlKt4cNxrLE6nlscEGIyydAAdIUjsR/ENtgk7bxZDjJ7KdQ4B5blei
	ATWiTPDnu5uhxlQuM3gfcab7mU0Lb1dkvKAD7yPzt6WazHS2cSOqgK9xV++zMJvJLqxP
	sQMD4F6+9QQvOtx+WrZp6jnT8OJSGwk41mGMDCEn6wBK8WKP2277h0rmOLQDjL0vacrB
	3ALQ==
X-Gm-Message-State: AKGB3mLe33kja6YGOsZtw9d4jCgywzvKDT6tr7OmB7L20dUkYg3NuyEP
	uCp/f+rNNjQB4jPjwjWoGsTp
X-Google-Smtp-Source: ACJfBotIlhRw0B87krjIqMs2wRuMKT7lD+PgEPNimgfZ0Pcy8RP8IHE2xsVsOEN66UCZ15A5CxVaWA==
X-Received: by 10.28.62.20 with SMTP id l20mr4002820wma.6.1515062496024;
	Thu, 04 Jan 2018 02:41:36 -0800 (PST)
Received: from pohly-mobl1 (p54BD57AD.dip0.t-ipconnect.de. [84.189.87.173])
	by smtp.gmail.com with ESMTPSA id
	w75sm8909401wrb.86.2018.01.04.02.41.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 04 Jan 2018 02:41:34 -0800 (PST)
Message-ID: <1515062493.10775.21.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: =?ISO-8859-1?Q?Jos=E9?= Bollo <jobol@nonadev.net>, wenzong fan
	<wenzong.fan@windriver.com>
Date: Thu, 04 Jan 2018 11:41:33 +0100
In-Reply-To: <20180104111826.5c8f9036@d-jobol.iot.bzh>
References: <20170309140706.19814-1-jobol@nonadev.net>
	<1489075674.7785.368.camel@intel.com>
	<20170309174815.056bc5a2@d-jobol.iot.bzh>
	<1489079885.7785.371.camel@intel.com>
	<20170315090430.69b17cc1@d-jobol.iot.bzh>
	<f2f3913c-05db-c304-4cd8-45067bf98fa2@windriver.com>
	<20180104111826.5c8f9036@d-jobol.iot.bzh>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] shadow: 'useradd' copies root's extended attributes
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
X-List-Received-Date: Thu, 04 Jan 2018 10:41:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2018-01-04 at 11:18 +0100, José Bollo wrote:
> > Do you agree to move the patch to Smack specific layer? Such as 
> > meta-security?
> 
> I agree.

Layers like meta-security should not modify recipes from other layers,
at least not by default. That would violate the "Yocto Compatible 2.0"
rules.

Besides, it would be harder to maintain in a separate layer - for the
maintainer of that layer.

I still think this patch belong into OE-core, even though it is then
more work for the OE-core maintainer.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



