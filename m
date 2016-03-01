Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id E4B2676806
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Mar 2016 14:58:47 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id x1so70003206qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Mar 2016 06:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9nWoh0KWQbRnE/h7GNtviyV+aKK4Vk+xuSj9VfMEOUQ=;
	b=tCTz9rNluNObZkEnV1D89J3qCBMHC4jejAdWfnLWk7KKHSDxBDm0K6hzUxQXoglMxi
	G9NYZg2mGJmCjw+4VgttjzEPixNx8tqdko6qkXMK2SX6/BPtUAPeZ8RUxCPrg3bGxaQA
	l0EbmeAVjHNjgBEGDNSBx7r6ZyOpSJyM6feeMnfktSoWigG7wcRsCeoMtqCQOD+0acp/
	qHPYvG9CC9NbAqysrbUW0ooOOsYwDMvYB/gn+Rqn3i9UniO8RVZBryt3j8a0aK+nRHaR
	YUAsw1z7/AKSfhUu8u/RS2D1K7Zsx5rqbyys3iZ7Fi1NuHHHqtb4YM+bWWnGxIyL47+L
	Z7Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9nWoh0KWQbRnE/h7GNtviyV+aKK4Vk+xuSj9VfMEOUQ=;
	b=SVcnOfrU5oFGz5i8CTNnmW5JV3q7sByaM3cUenu8IOpjAGUdQG51mqulkcZHDdYOd6
	DXJR+hL8Dl/tVC+DS8GiloH7IMnA4HFA5RfDP+0SuWMuki+pAf/Jn8fbNYESMlw9A1hE
	2Ni+7W/ormokNPR910YGBRgWEktBrZJnCFIUs749BTdvk1wsR6WilPgnDcYNjlFKwrBi
	zCDCH3FAvX1vUSELq+IMkr8gvqGqt/pI/JudAWugAlZ+mj9VprLhsgdfiSMHg1PBl+e3
	ZpGnVauEBNNWnEql085cMwFcp5992iCxwcPOJ+k+9qOHRFqGs1zXaGNupL/gcOnviqZi
	N+Sg==
X-Gm-Message-State: AD7BkJJhNM9Rq6448QNbFUWuSdGBDGmZoT5L1nszvVrm9Lp18/OhvjSaOumoC3+UNwaG/KtmsURTksW7GGx1Gg==
X-Received: by 10.55.80.68 with SMTP id e65mr27253746qkb.46.1456844328011;
	Tue, 01 Mar 2016 06:58:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Tue, 1 Mar 2016 06:58:18 -0800 (PST)
In-Reply-To: <56D5A3B1.8080008@linux.intel.com>
References: <cover.1456415870.git.alexander.kanavin@linux.intel.com>
	<549d5d18a9fe89af398559b3f8df60bb66643392.1456415870.git.alexander.kanavin@linux.intel.com>
	<89F0A1C5-6710-4F62-A646-0A2FDDDC75D8@gmail.com>
	<56D5A3B1.8080008@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Mar 2016 06:58:18 -0800
Message-ID: <CAMKF1sqDVjNH_XLhbY+86BdFx9vZZpaw8j-XNDTM67st=LWW=Q@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/19] nspr: update to 4.12
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
X-List-Received-Date: Tue, 01 Mar 2016 14:58:48 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 1, 2016 at 6:14 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 02/29/2016 08:39 PM, Khem Raj wrote:
>>
>> This broke musl builds see
>>
>>
>> http://errors.yoctoproject.org/Errors/Details/38154/
>
>
> The failing patch is applied only when musl is in use (and so the regression
> went unnoticed). Can you rework it so that it can be applied
> unconditionally?

This probably could be however OE-Core supports musl and poky-tiny
defaults to it. It will be good to test
changes for it when changing OE-Core at the least bitbake -cpatch <recipe>

>
> Alex
>

