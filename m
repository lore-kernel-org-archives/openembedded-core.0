Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2396174BFD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 13:46:47 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id z96-v6so7735833wrb.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 06:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3/rBBJFnlVS2/eVCoLWjp3HoeVolKgqddjdOrqMSBJg=;
	b=Yn1bTR4gEVFBztQHbvL2cXcxqJ4lwD2re+zx9z8XVl6KKmUbI3zu0BbWQPVI5Gm2Xv
	vP01j6SNO+mqthNWeLK0nqdMtYYVHQGGSUBS5VtcNXckszM/WKxI/HQDB14tlzl7ytlK
	BzKxD5WEc7ZBt11FgjC1996ISDysLEECjqr/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3/rBBJFnlVS2/eVCoLWjp3HoeVolKgqddjdOrqMSBJg=;
	b=Hr/n6zeMHB0doKsyd8NeWN9SpYohshLc2Rpq5kFO42if1NiovY7OiWY5kU1Wuel9Yi
	t2Eoag9Slrw02rIu5VmR23ws5Q0BDTdzW7BkwIWxMP6cfhtRqzOS6t/AiTjo4uy+U+eL
	LWdeYiRNJ737v1F5EAvn8f2WMEDUwTBTkkK7Ryv0ZMxCRhxnnjn6XvMnoFZs85DR6fqd
	0acgKMKAZV1NOAa9oHTAU5XDP3GdpNN28uieVI668SVp/vHovEi3ziYFoH8xcFV/niME
	0kIzw6FWahnwatxurECxwce4vBagKUOf0PLyqOkw2SjHRvBN0Ik3Bow9LBl8X569l09O
	fziQ==
X-Gm-Message-State: APzg51DDag4NT0/fKM/6Sj0jug/vdBB6rRWrTOOGpzLBK9hs0/2Y0WDv
	P+XM/BEZWeSDI1tK/i6vtarCSg==
X-Google-Smtp-Source: ANB0VdZAb9EYHwIhWfE8l2NLZzqz3DXm7JAXZff+IEtzWEQZFnGGCvygbSkaP1JYXpHFP3KabqoMpQ==
X-Received: by 2002:adf:c38e:: with SMTP id
	p14-v6mr27704942wrf.68.1536155208783; 
	Wed, 05 Sep 2018 06:46:48 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c3-v6sm2827307wrm.56.2018.09.05.06.46.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 05 Sep 2018 06:46:47 -0700 (PDT)
Message-ID: <dc04038009f70f6b8757c12099c4c7bc20547760.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Steffen Sledz <sledz@dresearch-fe.de>, Koen Kooi
	<koen@dominion.thruhere.net>, Khem Raj <raj.khem@gmail.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	angstrom-distro-devel <angstrom-distro-devel@linuxtogo.org>
Date: Wed, 05 Sep 2018 14:46:46 +0100
In-Reply-To: <12694af3-0513-71a2-42cb-025d47aac87a@dresearch-fe.de>
References: <94e49755-3c5a-a4fe-47da-b5881a2d7c43@dresearch-fe.de>
	<3d2233af61b189875478bfe65fefb96b0c2c97c5.camel@linuxfoundation.org>
	<12694af3-0513-71a2-42cb-025d47aac87a@dresearch-fe.de>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Subject: =?UTF-8?B?UmU6IERlcGVuZGVuY3kgbG9vcHMgd2hlbiBlbmFibGluZyBwdGVzdCB3aXRoIMOFbmdzdHLDtm0=?=
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
X-List-Received-Date: Wed, 05 Sep 2018 13:46:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-09-05 at 15:32 +0200, Steffen Sledz wrote:
> On 05.09.2018 14:43, richard.purdie@linuxfoundation.org wrote:
> > Those are all OE-Core components and build fine with ptest enabled
> > in
> > poky. That suggests one of the layers does something to the recipes
> > in
> > a bbappend which breaks things. I'd try bisecting your layers,
> > remove
> > some and see what makes the problem go away.
> 
> As I wrote before there's none of our layers involved, just the pure
> Ångström setup. So this is a job for the Ångström maintainers?

If "we" collectively as a project want to fix it then someone will have
to do that.

I suspect the Ångström maintainers may appreciate some help in
narrowing it down and fixing it since I doubt they have any more
copious free time to solve all the bugs coming than I do.

I suspect they can nod, say yes, it is broken, they'd love to see it
fixed and would love patches.

Cheers,

Richard



