Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4287C7D916
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 07:20:39 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id z11so5319742wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 00:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=gHueDPhlg6tz/+Xpy/gHl77vXljtVD4TsAZKL5ypdIQ=;
	b=iONDuByLEHNM21mMvIuZp0WB6p4GxeQNaMs4ys5EklO+AlLaN0clywXMyNnbElY+no
	kDiuQgXkDizx0+Hx709uiVctDUYGjm+LSC/0ikCabfv2wHgrgw9/HW4GBEBGKyMMn2+m
	WGLKpSRb5nmGht7+W4Olu9tVWh/twfLc3PFz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=gHueDPhlg6tz/+Xpy/gHl77vXljtVD4TsAZKL5ypdIQ=;
	b=tkJXOdOGgth8XTaW1XqIl5ltDRLqQJk3yvIRFmF51uSOk83TUqHCHtQf6lQttuABCO
	N8Z/E3pYLE72B2Rhu52Ix6tLO16oi6HxG1MNtkebAFMTSvj5IeEMeFc4O4yo0OTkQ3GU
	WkcwvSje8ZnmMp/47CSwZi9h72B+XpHXyetF0dbf80P7rI7ZZ1RNmUpH9XszcVFT63mi
	uZ+XpNg2OcMrOe9hLF3shpmZsbV44mG6dkvQ9BssxrcP/35xdNUG0BkZJPBsWyZjmd7+
	2sAL18ydBflJjplG45+TZzMWCYviE0CQ882+jQvAids3wrlklMnxfuxUXbtxhdCEIxJc
	2LrQ==
X-Gm-Message-State: APjAAAXRMVFFRcelTruVm+FGQLn5iog9I+jGyws0Ud+30Xp50wLo4I1C
	HIiqzHSm5mTD3hUUxyVmgEwClw==
X-Google-Smtp-Source: APXvYqynH31+773evqPkD37JY2XMXKwZmd2GYKN39FH+6sn6b77znheLZ1xs8iIJ0pPoE5yFQWQWAA==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr5417261wmk.108.1554967240027; 
	Thu, 11 Apr 2019 00:20:40 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i28sm106527711wrc.32.2019.04.11.00.20.38
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 11 Apr 2019 00:20:39 -0700 (PDT)
Message-ID: <7c1d84b0957f2831a7add461f73e3d9108176e9b.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: akuster808 <akuster808@gmail.com>, Yocto discussion list
	<yocto@yoctoproject.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Date: Thu, 11 Apr 2019 08:20:36 +0100
In-Reply-To: <05dd3911-b195-1d1f-b218-e4b41d80ec72@gmail.com>
References: <90d55754e9381759c8b70ebca0b880e6013f17f0.camel@linuxfoundation.org>
	<f8b3661d-a6cc-494e-de49-e462ba935535@gmail.com>
	<680dff761ebd04f8f240d12339b31569c70c48da.camel@linuxfoundation.org>
	<05dd3911-b195-1d1f-b218-e4b41d80ec72@gmail.com>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: [yocto] Eclipse support dropped with immediate effect
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
X-List-Received-Date: Thu, 11 Apr 2019 07:20:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-04-11 at 08:42 +0530, akuster808 wrote:
> 
> On 4/10/19 3:11 PM, richard.purdie@linuxfoundation.org wrote:
> > On Wed, 2019-04-10 at 05:56 +0530, akuster808 wrote:
> > > On 4/9/19 8:52 PM, Richard Purdie wrote:
> > > > I'm sorry to have to say this but the project is terminating
> > > > its
> > > > official eclipse plugin support with immediate effect.
> > > Does this affect the stable branches as well?
> > Yes, I think we'll just be removing the target from the autobuilder
> > entirely.
> 
> Have we every removed a feature from a release? Do we need to doc
> this ?

Its not so much remove as not release. No, we haven't and yes, we do
need to document it in the release notes.

Cheers,

Richard


