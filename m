Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f177.google.com (mail-ve0-f177.google.com
	[209.85.128.177])
	by mail.openembedded.org (Postfix) with ESMTP id 71A756AF9F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 11:35:51 +0000 (UTC)
Received: by mail-ve0-f177.google.com with SMTP id oz11so2979944veb.36
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2013 04:35:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=d9IW1uIuT3yHRKmtoB9qZis9zxPXhvFUCVTEhVHpa+k=;
	b=TUk1PzFLL4CsV9DaCZ+52FmSoYKmno8Ur/4vvwLgJI4z0fnC1A4mP1XZjpm4CKRbfr
	g2x8li6bF7OI2eR8WhkQuPjkezPGfwhqtHJKnLRV1uR43oOJ0QCS+VeUeMlynx9qb6+T
	Y8DRE3VVA7thqrENrRTjTwvJhD4uwDXoBC3SrnijmzetSINCM0J4BYEpxBGZrvzxglIy
	Dyy67syOQ4R1cy0TAe8EwtOzMQ3WB9BnFEEsfimztaZ2HsRL1oGL1VGnVJ466W3OHXUT
	b9DOFf4tdYWQL4s7c6ZVFaIpk0iPhC0pwEPmY57jR0zoDuulfj4COLU5mHkdB/EwDF62
	l1XA==
X-Gm-Message-State: ALoCoQkXa0FxmYpm8A6rfUGa0zTFoUK7RoDBpVwdM1Ho18rb0FanLe4r9SZ4t8WERsOIr5mZJeWt
X-Received: by 10.58.143.17 with SMTP id sa17mr1590624veb.14.1383305753045;
	Fri, 01 Nov 2013 04:35:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 1 Nov 2013 04:35:31 -0700 (PDT)
In-Reply-To: <2e9cfab0ee89692c85b78802b1804aa3e7856ef8.1383197850.git.blloyd@familyhonor.net>
References: <cover.1383197850.git.blloyd@familyhonor.net>
	<2e9cfab0ee89692c85b78802b1804aa3e7856ef8.1383197850.git.blloyd@familyhonor.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Nov 2013 11:35:31 +0000
Message-ID: <CAJTo0LbjScOrHHBW5HK_WcOCnYabRvwP2CnYpHuSDJGxVqny3Q@mail.gmail.com>
To: blloyd <blloyd@familyhonor.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Enhancements to allow core file debugging to work properly from devices
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
X-List-Received-Date: Fri, 01 Nov 2013 11:35:52 -0000
Content-Type: text/plain; charset=UTF-8

On 31 October 2013 06:54, blloyd <blloyd@familyhonor.net> wrote:
> +FILES_gcore = "${bindir}/gcore"

Why can't this script just be added to the gdb package?

Ross

