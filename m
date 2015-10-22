Return-Path: <sledz@dresearch-fe.de>
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 34AC775E2D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 08:52:16 +0000 (UTC)
Received: by lfbn126 with SMTP id n126so5614067lfb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 01:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe_de.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=AQy6fWn9ybrxS49bcP0lFNHtz/4pGgAVodJq4V3Eako=;
	b=eqgoowZqBO7Opsd+INlt5fCIroo3qNCDOlh5UTA+j7jARHa73oyhg/4bZClWIYM2GI
	q4d/WOu60QpFPoBFg816f+1I4j86LsSrwSD/6U/UNtri8bm0oMf5MipyxZHVMXkN9aYb
	Vlr4H8NMtOK4hjNnkII1pI5Avwg4yl1TwHe1sqFgBCGw+JQWM9lNx5UG1XutAuzusM2/
	ecu9b2GeEIDihfO9Q54oNjwb2Gu6Z1c3BssYITd5iqlzBrXj0P4vDjbR2UedaRTn80mL
	3L9GYI20ju1ftnF2Y13PaJqCohMvQEshz0CtAeoDylqfgt0/LMx6+LlzLdpQHpsxP99b
	HbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=AQy6fWn9ybrxS49bcP0lFNHtz/4pGgAVodJq4V3Eako=;
	b=NAPEJP8WIAFxrIuHpYk/dBK6LogwB0dwea8J0MlkIPgD25XCGJmsgknfeepr/BjlKi
	x2nWT3vXBIVMe59aDsoZnwoEtAHTkE/EHJIYCNjo7VlFoUnp6xmm9ByvTAEVqjyLY5UI
	P6zAEuVNBjNL2n7DTj1UpYeEsiheKTC/trtaAMfeD/ES+YYpAvQjOjH2dGtTYdaJ2P00
	hRDi24nEvDIYsyo1ec6NM0DvZyqUiHPnHtTiGcDyhG6xuAKT44dG587zbRd8FSmVwRk3
	Zzzsn+MNVmyI/eptqavbsdK3pU9ZbkiTS/wGVbJHMwy/75P6gUnuyliVlOX7DpBg5jRY
	N3nA==
X-Gm-Message-State: ALoCoQmCCWqdC4c7A+Ih/yoydwwiYSR7XL4JaZHve8dPs2wSOdpuwB/d78Uo6RNawWGdVCv8NUHy
X-Received: by 10.112.17.105 with SMTP id n9mr8106486lbd.78.1445503935795;
	Thu, 22 Oct 2015 01:52:15 -0700 (PDT)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	b193sm2189397lfb.46.2015.10.22.01.52.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Oct 2015 01:52:15 -0700 (PDT)
To: Richard Leitner <richard.leitner@skidata.com>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <56279AAF.4050704@dresearch-fe.de> <5628952C.8080706@skidata.com>
From: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <5628A3BE.3010403@dresearch-fe.de>
Date: Thu, 22 Oct 2015 10:52:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <5628952C.8080706@skidata.com>
Cc: Benjamin Reikowski <reikowski@dresearch-fe.de>
Subject: Re: [oe] cups-filters
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
X-List-Received-Date: Thu, 22 Oct 2015 08:52:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 22.10.2015 09:50, Richard Leitner wrote:
> On 10/21/2015 04:01 PM, Steffen Sledz wrote:
>> Does anybody know about a recipe providing cups-filters?
>>
>> http://layers.openembedded.org was not really helpful here.
> 
> I have one which works for my purposes but it is not really tested...
> It is based on something I found somewhere on the web (I don't remember
> the source).

Any plans to make this part of an official layer?

Regards,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

