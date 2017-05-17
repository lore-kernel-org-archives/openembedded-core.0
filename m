Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id B531577D49
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 10:47:06 +0000 (UTC)
Received: by mail-io0-f175.google.com with SMTP id f102so6558996ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 03:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=vDcrffjwTwV2KYAQDMKR3dWwnH8pBmM9XGPgMMZ3oKo=;
	b=VE3adJOrkshYmH6/DBAwh3f7+vjF8euB0W5jhtlW7kXztmAA9O0QLsb8Iy6AKP4QwV
	GY706fwmkXGp3TRJgyg4ik8dwDowSafnI6GmDoSfEgI/MZcdkV9Hyh/141ursKtEgUf9
	wqcfAQR8V7yTZjfu9c240AqiZ7oPgID2ceWKT+gvSsqtpmV/tCqoxzzzj97zYNNivplZ
	EFr/aPuI1xZ7C7ZE1UIbelZSXMzlKgw3U8iiz0jSNstwVjI76fH8P+wSbI5nwYWHMeI0
	quzuerq2U6IA30QAOVa1qId3H7tH8fgh6L+IaRrw7X7HinFo450+UrMa4rhShOhSbUZU
	R0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=vDcrffjwTwV2KYAQDMKR3dWwnH8pBmM9XGPgMMZ3oKo=;
	b=prveL6hZX/igsmeXegkwXAZ+PfjfD+4UkWrsG257pLLswfZY6w0KRlHsfb7ZbPrTRo
	WrJDl5jN08hZ8Te/pd7zca+kBfffyXiM3ysyGLF1DrklzVciJDGlZNsPle8m0/MFW+Ha
	9VHtPqpMkagdCfCz39fkNNzQe9AYYV5nk5tqNYUW0SCMFWxs9GHrrkjjek97r2JXquNA
	884pHfSjGR/7GQezATWcQuiqHYI3yYMznf2R/YE4pEab+MgynwsPH1c1w7o1A93/Hp7U
	PXt8TF5jxtj54/L0ZlDqhgnTwqBzepINwwV/hgjarrhK2lxSkAfn6oC04mYsKHkW31n1
	fDxQ==
X-Gm-Message-State: AODbwcDOUWNEm1fsrSXF+Y/ovwLA5luPxeBAD83w82wj28G5NvMLtPGH
	stOTl8IFcYOMWGTu
X-Received: by 10.107.180.130 with SMTP id d124mr2332110iof.47.1495018028249; 
	Wed, 17 May 2017 03:47:08 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8F2FD.dip0.t-ipconnect.de. [93.232.242.253])
	by smtp.gmail.com with ESMTPSA id y7sm7403750itc.27.2017.05.17.03.47.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 17 May 2017 03:47:06 -0700 (PDT)
Message-ID: <1495018023.28624.38.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Wed, 17 May 2017 12:47:03 +0200
In-Reply-To: <6d634eb4-a0e6-7f56-0d6e-b1324eece035@linux.intel.com>
References: <cover.eea09064b94ca036ef2177896c19070d316ee965.1495007905.git-series.patrick.ohly@intel.com>
	<8810a4bbb1c67b438a7320df810db02099fcb5a0.1495007905.git-series.patrick.ohly@intel.com>
	<6d634eb4-a0e6-7f56-0d6e-b1324eece035@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/1] image-mode.bbclass: common infrastructure for choosing image defaults
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
X-List-Received-Date: Wed, 17 May 2017 10:47:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-05-17 at 12:49 +0300, Alexander Kanavin wrote:
> On 05/17/2017 10:58 AM, Patrick Ohly wrote:
> > A distro might want to offer developers different, pre-defined ways of
> > building an image, for example a "development" mode with easy (but
> > insecure) login methods and a "production" mode with hardened
> > settings.
> 
> Apologies Patrick, I still think this brings more complication than 
> benefits. And it's not even showcased anywhere in poky: you add the 
> variable, but don't take it into use anywhere. Which means it also won't 
> get tested.
>
> You can do this thing by creating separate image recipes, each with 
> their hand picked IMAGE_FEATURES. And that includes showing appropriate 
> motd as well - but that perhaps would not be necessary because the image 
> mode would be encoded in its file name.

Can you be specific? Which image recipes should I add?

The feature by design is now meant to be used by distros. OE-core
doesn't contain a distro definition, so the feature cannot really be
used in OE-core in a realistic, reusable way. I can write a selftest
with a custom distro or image configuration, if that addresses your
concern about not getting the code tested.

I know that you prefer defining more image recipes over allowing the
reconfiguration of the same image recipe. I disagree on that, because
when you have independent aspects (like content and login
configuration), then you end up with various combinations of those
configuration options. Writing down all combinations in pre-defined
image recipes just doesn't scale. But you are welcome to proof me wrong
by showing how the existing image recipes in OE-core should be changed
so that they not only cover different content selection, but also what's
currently done via EXTRA_IMAGE_FEATURES in local.conf.sample.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




