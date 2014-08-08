Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8150565CC9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Aug 2014 07:54:44 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id uy5so3724520obc.39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Aug 2014 00:54:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4Wc3DtbYANMwpg9+Qz2XZSB4bR+p+ArymZiz8esP/Ck=;
	b=Cz1Qye+HqI8zBPRAW6CVfuMd86SFvsQ6A8fiG+0ko9aIg6v7JA86j+Y1yf9JH+RS5W
	kbcA8oxIuPRCzZtoYdHBI9Zwk94K0eNbPrYnJEhAR1lJjyhai+eWjuzcyjupdaDLVgcR
	DCnUOYyma80ThWIL2u+4JqFFN/qkH14jyim57aif3f6k2OhydKnu2KWpPVS/Z760Iyno
	oKtY9WtVAcqu1S2KpQjvzBLH58vr4vfECzlFDH82V0E9myFnFjwz4SpZzkr5kPXVjl4m
	VgbOTCiPo0vcsu/JOvu3zWrkg+jxkN5TzjgDyJrInDD+aD+HbRYZZM2nKe3mPQcSUr1B
	vFVw==
X-Gm-Message-State: ALoCoQnpsNdHm9/cnHDyn+ADI0Lq4JqNPwIXGDn0jtwOseGUn/3PnfM+Z5bA+/v9rP5bV5P4yh7a
X-Received: by 10.182.29.234 with SMTP id n10mr28687752obh.67.1407484485506;
	Fri, 08 Aug 2014 00:54:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.171.168 with HTTP; Fri, 8 Aug 2014 00:54:25 -0700 (PDT)
In-Reply-To: <2374073.Q4LByM6bcI@peggleto-mobl5.ger.corp.intel.com>
References: <1571948.CrPtZqAbFm@peggleto-mobl5.ger.corp.intel.com>
	<53E3512E.5090008@dynamicdevices.co.uk>
	<2374073.Q4LByM6bcI@peggleto-mobl5.ger.corp.intel.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 8 Aug 2014 09:54:25 +0200
Message-ID: <CAP71WjwFb-wtMa_CcXkK+Cv5KY_CEQao+rUb=pYMoWmbT80G-A@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Yocto list discussion <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] RFC: Improving the developer workflow
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
X-List-Received-Date: Fri, 08 Aug 2014 07:54:52 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 7, 2014 at 3:05 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Personally with how fragile package management can end up being, I'm convinced
> that full-image updates are the way to go for a lot of cases, but ideally with
> some intelligence so that you only ship the changes (at a filesystem level
> rather than a package or file level). This ensures that an upgraded image on
> one device ends up exactly identical to any other device including a newly
> deployed one. Of course it does assume that you have a read-only rootfs and
> keep your configuration data / logs / other writeable data on a separate
> partition or storage medium. However, beyond improvements to support for
> having a read-only rootfs we haven't really achieved anything in terms of out-
> of-the-box support for this, mainly due to lack of resources.
>
> However, whilst I haven't had a chance to look at it closely, there has been
> some work on this within the community:
>
> http://sbabic.github.io/swupdate/swupdate.html
> https://github.com/sbabic/swupdate
> https://github.com/sbabic/meta-swupdate/
>

fwiw, Ubuntu has started to do something like that for their phone images, see

https://wiki.ubuntu.com/ImageBasedUpgrades

I haven't used nor looked into the details... i just had heard about
it, and thought it was worth mentioning it here. however the main
design idea from that wiki page is exactly what we are discussing
here. e.g. build images on the 'server' side using our regular tools,
but deploy binary differences on targets.

