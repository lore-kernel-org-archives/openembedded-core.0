Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id E1AFB7F940
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 22:19:10 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id h7so1008870wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2019 15:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=sm+PxNqva0xy/3FYgxjpJRthIH/0Kp1QIQvHPhotD0E=;
	b=RntSjmTDBpbnKlhQ5u+a2jWcPW9ruoWSPE8B3xP+f5VY4wxfgXutxy5oChfGisyQyu
	WYjDcy5SABZGXpwNKV+VZTfBnReNbDEFxpAjsDJWah4EfIGX0KmSCHEyozI8ovQ6k3QG
	PeRlS1fxr1EDEf8wbavFw9om6pj9F3lY09Nt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=sm+PxNqva0xy/3FYgxjpJRthIH/0Kp1QIQvHPhotD0E=;
	b=q6hGIDBiM1iZ61rVox+tehKhOkcXgGksj8bO5uDd3nU8atbQdYeB1dZxiwwb7fTfEt
	BjvRGJGCK3rv6TY1ov3qRkuVbbQObFxokM184JSh1aAbwmmRMHw0fOpbOl6iSgFPPskv
	eVCsn2Kkkon9L7Qy74kmryODpznRGHSZSTnMdlpkDg//fp8mauZIyKf2ZB/ygrEQCCZn
	rYQktHqrglt2apkUzK5M6itOpyUvZA1B4Mb/n33/hfEek3WPmNNJiXOexksOmx2lv2df
	esBPrPCwyC5IMe44xMMCrcOni6SHcYum3SahiHAIEEIfuOIK+Y7FWJpyUIW4546OOnCN
	/yRA==
X-Gm-Message-State: APjAAAXcx1xojjjAJgvMkSMNzf0b/INoKZ9rMwoY7C8uiibSllOg4ZNH
	1ifOxxQDXIYKmSJ5Wi34wocS5A==
X-Google-Smtp-Source: APXvYqzLOVCanBQRbUjrMqV0Hh90LZcMt+VJHoc4PWcC5n7rRHeWrhTDDYfCLiKshZ1z5cEoyokBuQ==
X-Received: by 2002:adf:fc0e:: with SMTP id i14mr449658wrr.302.1568672351659; 
	Mon, 16 Sep 2019 15:19:11 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id l1sm319057wrb.1.2019.09.16.15.19.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 16 Sep 2019 15:19:10 -0700 (PDT)
Message-ID: <ea9b12e8a04445f0a3f36f84b00ca3f420b86802.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Ross Burton <ross.burton@intel.com>
Date: Mon, 16 Sep 2019 23:19:09 +0100
In-Reply-To: <CAMKF1sr9S=7H5_2QL7eeZFnGfNAo=PeHMkSX5B+CJ=WnoQE_Sw@mail.gmail.com>
References: <20190911042903.3047253-1-raj.khem@gmail.com>
	<984e3147-bddd-56a5-ea90-eea87d8a792c@intel.com>
	<CAMKF1sr9S=7H5_2QL7eeZFnGfNAo=PeHMkSX5B+CJ=WnoQE_Sw@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] weston-init: Add possibility to run weston as non-root user
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
X-List-Received-Date: Mon, 16 Sep 2019 22:19:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-09-13 at 06:41 -0700, Khem Raj wrote:
> On Fri, Sep 13, 2019 at 5:27 AM Ross Burton <ross.burton@intel.com>
> wrote:
> > On 11/09/2019 05:29, Khem Raj wrote:
> > >   .../wayland/weston-init/weston.ini            | 74
> > > +++++++++++++++++++
> > 
> > core-image-weston now fails:
> > 
> >    file /etc/xdg/weston/weston.ini conflicts between attempted
> > installs
> > of weston-init-1.0-r0.noarch and weston-conf-1.0-r0.qemux86_64
> > 
> 
> on x86 qemu right. Sent a V4. give it a try

Fails oe-selftest:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/383/steps/8/logs/step2d

oe-selftest -r statetests.SStateTests.test_sstate_sametune_samesigs

Cheers,

Richard


