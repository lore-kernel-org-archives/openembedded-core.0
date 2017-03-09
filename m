Return-Path: <adrian.freihofer@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 08B7A7750B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 22:33:20 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id n11so13122962wma.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 14:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=RANoTcw/wXNOdA7HyontS4ivmke0xT4jA5jl/wz6o3Q=;
	b=liWe+WA9O7qFoxedc2exzhZPPYvydUH+IlU05iRMJHWCu3HaW/dtle8jhqEgcsnKdN
	GsG7VI0xkSTaCfFOqz4OrDhHU/J2NdXfC2CkdULqfVDC7fjF0TTUlBZSNqgTYzLHprzv
	B2FZ6DmcYbKSNJ1m7HbZN766hy6NVsHbc2HZxLl91aoCjHotP1LCCXsZr362G6bv+pbj
	xg4GegAgqisCdaihH7QwX3AHRQVDCv4Ww1+ahv2vD0ApYKr8RssgcQoQXDIjkcO9UIHa
	XMYg1VbaaFLbFa8BNVIjTbPNet/ud+HpWjGEpBf3zKgFV5WbyPZdGDcyqd+R1zIvmesn
	Ii1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RANoTcw/wXNOdA7HyontS4ivmke0xT4jA5jl/wz6o3Q=;
	b=W7FKDnW+Gvv/jQvV6EdeN4Mbm7suYKi6T+m717Towt3vBh7YddbIknJjzQ0VqsD1ai
	SU4MtAkqxLiT8HlX8SvHNm4BMzDRHg40wes++3FnXrkwRCJBrY66WGgSfxEmwVHV3VBP
	fnwnjkTa/yGD5t5QTWhG7+Yxm2jbXBG6+qjYIPaAkWQXj4trq36rEHvM9ogn9GZtXtqf
	AlKMInmGe2vEqoClFoYGMVkoyOdd/A2XCMe5JiUcv28JhnI2EF/nTKZzIXEujlAIhN18
	mRu0teWGDiKUNBklmJoigMRVRjaRXppwUFMMHQhLnnAuoEpbsZOU2IB1MpmKu1mVUAAp
	m0VQ==
X-Gm-Message-State: AMke39kcKypLkYYAgtwg0d9S8Q3/3P/dPu2wfvjLdV3aIq+6+luSL3dW7ZMtEAAFuKrOoQ==
X-Received: by 10.28.47.15 with SMTP id v15mr12544685wmv.116.1489098801723;
	Thu, 09 Mar 2017 14:33:21 -0800 (PST)
Received: from wsadrian2.lan97.ffah.ch (c-93-184-18-27.customer.ggaweb.ch.
	[93.184.18.27]) by smtp.gmail.com with ESMTPSA id
	w207sm372616wmw.29.2017.03.09.14.33.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 09 Mar 2017 14:33:21 -0800 (PST)
Message-ID: <1489098798.1925.1.camel@gmail.com>
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 09 Mar 2017 23:33:18 +0100
In-Reply-To: <1488412401.24526.48.camel@linuxfoundation.org>
References: <8bbaa675-7c8b-d00d-3b22-f051abf763a2@windriver.com>
	<1488412401.24526.48.camel@linuxfoundation.org>
X-Mailer: Evolution 3.22.5 (3.22.5-1.fc25) 
Mime-Version: 1.0
Subject: Re: About scripts/oe-find-native-sysroot
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
X-List-Received-Date: Thu, 09 Mar 2017 22:33:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

scripts/runqemu-gen-tapdevs requires native sysroot as a command line
parameter. Which folder might be passed to the script now?

Regards,
Adrian

On Wed, 2017-03-01 at 23:53 +0000, Richard Purdie wrote:
> On Wed, 2017-03-01 at 13:58 +0800, Robert Yang wrote:
> > Hi RP,
> > 
> > The common STAGING_DIR_NATIVE is gone, so the OECORE_NATIVE_SYSROOT
> > defined in scripts/oe-find-native-sysroot doesn't make any sense
> > currently:
> > 
> > OECORE_NATIVE_SYSROOT=`bitbake -e | grep ^STAGING_DIR_NATIVE | cut
> > -d
> > '"' -f2`
> > 
> > But the following ones depend on it:
> > 
> > meta/classes/populate_sdk_ext.bbclass
> > meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
> > scripts/oe-run-native
> > scripts/runqemu-export-rootfs
> > scripts/runqemu-extract-sdk
> > 
> > What shall we do on oe-find-native-sysroot? Remove it and
> > make other ones work without it? Or let it depend on build-
> > sysroots,
> > please ?
> 
> If we could make other things survive without it that would be good.
> Some might want to use the addto_recipe_sysroot task:
> 
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=ce79111e73552954
> 6e8a20e4315e3566a556a936
> 
> In some cases build-sysroots would likely make the most sense.
> 
> Cheers,
> 
> Richard

