Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id B74A37CB0B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 08:37:23 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id x10so8956844wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 00:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=gLsz8uaDJ4kLGBsdJcLp2LWPuwrMujZIdtsbl5upxeY=;
	b=XubrFB+vSx+UBV9Nc0kyDP1XStka8DyKiCOvEdmdShDSTolmvOn9Ic7qbL7otcOqpo
	UaCCrdSEtR4SExnKcbT3N/r23k/d61EW1bexAJvzswiBGY+CISaNOLzze6kyq6TgDPfm
	J1UcStXRYd2teM3/1Dgmoqix8Srn5Phr4IEO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=gLsz8uaDJ4kLGBsdJcLp2LWPuwrMujZIdtsbl5upxeY=;
	b=EVUVTyUMXTTg9L0LATBenSsWTjPhy4EbaPCKv+ZYxtWbedVC8C5IOGVCD6fMV/g77W
	O9d/m8SZLV5opnSYX8MAjzU4aRVtSKaJVK69yKv84DVX5euf22faprA7OmLQZzQoZnYo
	lgMzy9O0qsS/i3kBFLV+VpmqtZpHE5TSEkWE9K9BLqnwVAUa1+npBJxkNnythTTOVYAo
	cbEffhjGoGrt6cSWjU2TXBZiqMIq+ylxS/e09kzCZoHDlPemZpXoEpZLcP0IUAo6JL19
	auCFcMb4z+BqP1yu0a7edfoWAUZHWsbJLg59j8AvbwKvuT7AWCshwDipyVsGsnURMPek
	Br6w==
X-Gm-Message-State: AHQUAuZ8DmOr0eEglVOjyh/K6TZziDBK8jWzLEWY1dPDQ/wzzIxemDQN
	ltx20fJE1fxugSSninJ+eMnWmw==
X-Google-Smtp-Source: AHgI3IaV3ny//rNlAci0XjuPv0HFg4opnPlbFh129EO53mjNkB1KRPffuPO3ZhosxEaECnGlgFPoMA==
X-Received: by 2002:a7b:cf1a:: with SMTP id l26mr9357612wmg.76.1550738244320; 
	Thu, 21 Feb 2019 00:37:24 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h137sm13094635wmg.41.2019.02.21.00.37.23
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 21 Feb 2019 00:37:23 -0800 (PST)
Message-ID: <853fdac8bdfc6fc7222fce906172b08852a4eed3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>, Philip Balister
	<philip@balister.org>
Date: Thu, 21 Feb 2019 08:37:22 +0000
In-Reply-To: <BYAPR02MB6005A0C02E838863D370C7B4B97E0@BYAPR02MB6005.namprd02.prod.outlook.com>
References: <1550192184-13460-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<1550192184-13460-2-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<679c61e2-f179-c986-b6ca-b69b95b5e22a@balister.org>
	<BYAPR02MB6005274C95E7FE6ACA65292DB97C0@BYAPR02MB6005.namprd02.prod.outlook.com>
	<6fe6cbadaf29e01975ec71a1b005d2fdb7885484.camel@linuxfoundation.org>
	<BYAPR02MB6005A0C02E838863D370C7B4B97E0@BYAPR02MB6005.namprd02.prod.outlook.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel-fitimage.bbclass: Introduce a way to provide external dtb
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
X-List-Received-Date: Thu, 21 Feb 2019 08:37:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-02-21 at 03:53 +0000, Manjukumar Harthikote Matha wrote:
> From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
> > On Tue, 2019-02-19 at 19:34 +0000, Manjukumar Harthikote Matha
> > 
> > > > PREFERRED_PROVIDER_virtual/dtb = "devicetree"
> > > > 
> > > 
> > > Yes, I should have added this in the commit message. I will
> > > update it
> > > and re-send V2
> > 
> > What may also help a lot here would be some tests. This is
> > currently a blackhole in
> > the tests :(
> > 
> Are there examples of having tests only for bbclass in OE-Core? 

There are. See meta/lib/oeqa/selftest/cases/wic.py

I appreciate wic is a tool, not a class but the examples there should
help. You can trigger them with oe-selftest -r wic.

Another example which is a bbclass is selftest/cases/archiver.py which
does use a class inherit.

> We need a recipe or create-one to inherit this class and probably add
> that as a testcase. 
> I am not sure how to proceed, any example would help to implement the
> same

See above, they show how to add small config fragments. If you do need
a full recipe, then the meta-selftest layer of OE-Core should be able
to help too.

If you have any other questions or run into issues please do ask!

Cheers,

Richard




