Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id EAD457EBD7
	for <openembedded-core@lists.openembedded.org>;
	Sat,  6 Jul 2019 17:02:43 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id h19so9686893wme.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Jul 2019 10:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ZJ7DFGAmsiPX9ldcb1/FkXt5T/1bnJWPQic6Y0esFVg=;
	b=E8JKKp8XF3M2cxHHUn/hMunKkUdWyt4BqXD8Jo+/Pg2EeRS4/+J2JHxy9V36L6rqau
	zkt9AZPDL3iFoPCtW+/VlFd316ykBn9IstI5JeU23jCZ6QGihmpgI/kG4/pgmb4ZcBs7
	gJZVc3AW1ociQhWxfgziLjtd45qpJZnXzRuSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ZJ7DFGAmsiPX9ldcb1/FkXt5T/1bnJWPQic6Y0esFVg=;
	b=OvBi0ZTTdxmCeZer5GFnIv60IQCeKhpJelGExu4V3/3WHHz2mrRH1+/eVBwQ5+gh5S
	6Qd9TbnmEfGE9VEHlGxIbq7wrkea/V4F7CZ/cjyFpgGKnFCkL+rtu40+HwOMnaJXGEew
	4nETmrfDsP29n49T8V2AEldql9p4H7Joz2SItm1iReNoK7P+38eAruiWUP4hrR+1pZ1m
	5jqLpCoy2qLssrtXCvDNoFSTdYjAG86+SIgu53w+HIIlxi3tbuzfci5A9TnuZC1Eou5u
	v33Xi2+YlGEBnlapvPrYwSUcrtjgzZjt+gwuh3LkE4IP6+e5zcwWrlALxQCKVMhaWg4d
	CYMw==
X-Gm-Message-State: APjAAAXtk5VmskYDuOmHMe9nZtEZcF+c+EYKzP0VqzFQ6o+sGxEAEIzZ
	w63x8SwiceQ52cX18/+qUz89WQ==
X-Google-Smtp-Source: APXvYqyKURx76EvhohyJSxi8ZC59n+qaoJa27Xs1uhN7ZTlojH0M68vUhUcLR0sSUIPFApcjk4CFuw==
X-Received: by 2002:a7b:c251:: with SMTP id b17mr8906937wmj.143.1562432564712; 
	Sat, 06 Jul 2019 10:02:44 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o185sm11864105wmo.45.2019.07.06.10.02.43
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 06 Jul 2019 10:02:44 -0700 (PDT)
Message-ID: <a61dd366580f1f902b3e5297fb665f5fe4e6c7cc.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 06 Jul 2019 18:02:43 +0100
In-Reply-To: <6fb887e88cff19493dfe98332f7265418bb57dd1.camel@linuxfoundation.org>
References: <20190703150405.GA23280@linux-uys3>
	<1008b3f46332ba67abe67586b176bc7f565b11ad.camel@linuxfoundation.org>
	<20190704142709.GA3410@linux-uys3>
	<a8811c40e7aab0303c7069c5acc00823567821e6.camel@linuxfoundation.org>
	<985c750cab28264567c6e4e532160d44ed07fbbb.camel@linuxfoundation.org>
	<6fb887e88cff19493dfe98332f7265418bb57dd1.camel@linuxfoundation.org>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: build failures due to pigz host tool
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
X-List-Received-Date: Sat, 06 Jul 2019 17:02:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-07-06 at 09:14 +0100, Richard Purdie wrote:
> I can't see anything obvious wrong with the way job->calc is being
> handled.
> 
> I get the feeling this doesn't happen when uninative is in use which
> suggests its something odd going on with libpthread on opensuse but
> its hard to know that for sure.

https://github.com/madler/pigz/issues/68

Others are seeing this outside of OE and it seems specific to suse,
probably to its pthread version/patches.

Cheers,

Richard


