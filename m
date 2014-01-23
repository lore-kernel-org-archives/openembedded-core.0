Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f180.google.com (mail-ve0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 312276C742
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 11:53:20 +0000 (UTC)
Received: by mail-ve0-f180.google.com with SMTP id db12so1036771veb.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 03:53:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Gd0Tcv3Pb7bUR7IKmIBgtmlkqbXU18m9kLSMIcM1rr4=;
	b=Zc+NsITQEAx0bM88tjS2FwkJR7ubS6SRLYolVPaxUnOtPi3/EY88AY7S3yX+L4jFm3
	uBW1AaNNCsdEAVNt40uojxw3wW23FlrI/J4b13T4N5LA31ahZNG4EwBHSQ5b8jRpD6ZJ
	reCKn/tT5uQ4egf+9tQXWUPGRi7QM0Hz2eJnlFI/sBpJDo/OUzHGt9PPeiOTaImBlf9q
	xbsqrSMYhVf2kUNMIcck5uB2dd/H+hbBRJMK7fmOMFT7HlKC9XZIrMnKIGxDeLfa03He
	Ia54LHZM4bPQ1UBZ0am1J5bkxiwjRl9Q93Xn4yr2Gq515BCk1pVDmRZhT9nmpPvcOrA9
	/YUg==
X-Gm-Message-State: ALoCoQkcEP5TZXQGuAGBllkwWH7s2x554GaCtGr0xaz/HLW37dFe4L8D+OlO12f120kTFVZUnWMb
X-Received: by 10.59.0.193 with SMTP id ba1mr4338400ved.12.1390478000919; Thu,
	23 Jan 2014 03:53:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.96.84 with HTTP; Thu, 23 Jan 2014 03:53:00 -0800 (PST)
In-Reply-To: <CAP9ODKoOqcghweT8ta5tx4=5hqxHdt6Hi75ksuegxikvYFAj+Q@mail.gmail.com>
References: <1390467988-25693-1-git-send-email-koen.kooi@linaro.org>
	<CAP9ODKoU+va9SbCJAfZ4HMkz+==Ec9va0KjJX07c4d4cZ90bjg@mail.gmail.com>
	<17C27E68-3F62-414D-A02A-8AD06ACE0B66@dominion.thruhere.net>
	<CAP9ODKrUBJJJHTTBkRmq9j+yOrgGyUfX3TC5L69-ynaDbefo0A@mail.gmail.com>
	<B6D70178-C80E-4804-9786-47A67B9EB230@dominion.thruhere.net>
	<CAJTo0Lb3xQTSJdfXHpMyGTPMALcCHki4pgG5MvEFHiX-yNYezw@mail.gmail.com>
	<CAP9ODKoOqcghweT8ta5tx4=5hqxHdt6Hi75ksuegxikvYFAj+Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Jan 2014 11:53:00 +0000
Message-ID: <CAJTo0LYNfpP6k9e8GTEgX=fr99BxG-sEv-BUJVzSO3uFnBeYPg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Koen Kooi <koen@dominion.thruhere.net>, Koen Kooi <koen.kooi@linaro.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lz4: actually install things
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
X-List-Received-Date: Thu, 23 Jan 2014 11:53:21 -0000
Content-Type: text/plain; charset=UTF-8

On 23 January 2014 11:49, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> Personally a recipe should only inherit autotools if it actually uses
>> autotools.  Hand crafted makefiles should mean hand-crafted recipes.
>
> I will respect your opinions but I see no reason to not use autoconf
> if do_configure checks for it.

Extra build dependencies, extra logic beyond what is needed, the need
to be careful in the future when we can't assume that
autotools.bbclass is used with autotools-using recipes.

Ross

