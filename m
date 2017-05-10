Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0271071B04
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 21:08:55 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v4so2550395wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 14:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cBDEOnlTYqC2oCNerkse3zwfIkiNOuUb59YskCHZML8=;
	b=rPcde4PUrOpEsbct3BU4vRmyeX+V0+Zo9wT/rxYZrhLrmASM3UILVLgw9bfwH8ykdl
	VNmDpWngFv12X9Ew/xVsLmeNQhVrVyhKRu8/pNn1/C72l4rhZx0n3K6wTBx3FJLM0gcu
	tElu9SIxtLsGsK+2drNDnBJpg2ZuC5yZlcjV9x6fFiiva1S7YvLA+KnRcLFF0XSskiv4
	ZU5HSIUqd2o4dEHgmIF+WsTqW4Ztk4f5ZnmpmTWJ/48lXewXu9gSfLBxIKNMnZBD+TyK
	Qw9JX4WoVEpmoqYEpZQUYU8Qq7YQcti/Ci+dP9d0fFKVO6Z/a2tz6Z5+IarJDimBgSff
	5iIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cBDEOnlTYqC2oCNerkse3zwfIkiNOuUb59YskCHZML8=;
	b=qvI78ql8Ui6ye0fthNZjAd0EjekiZdGhDzIt5dNbg4/Zt70FtBnU1OoD8Hk+d9R1D1
	VRGNFaL6HkzP0s3sjXIyd/EWzpyMu22RCaKgohDL3u5EzvS4bpFe5RwyLcc4vi5V8q14
	IfyQ/EhZx7E2PonF6tQXXxs5fN0zZ0xGRfoyGHMV3AghdNoIsYQymkmv3W1YZyWHKBZ6
	HXk6LLx9iFwMX8dj0LKv4g+nCmNrTYzE2yJR4+2cfe+Owdurrnj31Xd0ZHWrjcj7DQm3
	Zf6S/Zlh2yYAz1+3ftWwvBo48iRZiIs0HbRg3HWR3GTr7Hi3iap+gWX7mzehdfUmkeox
	ptdA==
X-Gm-Message-State: AODbwcAFCes61WOXqmatIEJiJdhZwsLb+e4qMK6CZMmw7oVXUz/E7Hu8
	ixP8rJkXm20yoEBnBPWiSS+JHCwU8w==
X-Received: by 10.80.182.50 with SMTP id b47mr5879679ede.123.1494450536903;
	Wed, 10 May 2017 14:08:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Wed, 10 May 2017 14:08:26 -0700 (PDT)
In-Reply-To: <655290B7709079438B7932553958E60D16D2C9F2@ESS-EX01.essvote.corp.local>
References: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
	<655290B7709079438B7932553958E60D16D2C5FA@ESS-EX01.essvote.corp.local>
	<7f60f107-1157-3991-b5bc-0fa4564e6905@linux.intel.com>
	<655290B7709079438B7932553958E60D16D2C67F@ESS-EX01.essvote.corp.local>
	<6f1e8992-7469-12bc-1307-2a9d0ca7d61e@linux.intel.com>
	<811d49ba-ac83-5a52-6687-e3447d06659b@mlbassoc.com>
	<abc26baf-5417-7565-cb69-08aff5559e95@linux.intel.com>
	<CAMKF1sqvc3YsrMNxkyv1ZHXF82Uy1hYRUL4sduaayYcf1Le5_g@mail.gmail.com>
	<655290B7709079438B7932553958E60D16D2C9F2@ESS-EX01.essvote.corp.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 May 2017 14:08:26 -0700
Message-ID: <CAMKF1sr8ZypyM4mk=s1-W9oajRr952x7iVe9L8eDu-Hddthzpg@mail.gmail.com>
To: "Davis, Michael" <michael.davis@essvote.com>
Cc: Gary Thomas <gary@mlbassoc.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 00/10] Add openssl 1.1
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
X-List-Received-Date: Wed, 10 May 2017 21:08:57 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 10, 2017 at 1:48 PM, Davis, Michael
<michael.davis@essvote.com> wrote:
> I think most of the major distros have either switched or are in the process
> this year.
>

are there some info on the policy decisions of other distros ?
we should try to follow the suite then

>
>
>
>
>
>
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of Khem
> Raj
> Sent: Wednesday, May 10, 2017 3:36 PM
> To: Alexander Kanavin; Gary Thomas; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [RFC PATCH 00/10] Add openssl 1.1
>
>
>
>
>
> On Wed, May 10, 2017 at 12:34 PM Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>
> On 05/10/2017 09:56 PM, Gary Thomas wrote:
>> Why not do this in a "softer" way - make the new 1.1 package have the
>> obscured name (and not be preferred by default)?  That way existing
>> uses of the older 1.0 package can continue but users can migrate to
>> 1.1 as they see fit?
>
> I have an answer which you might not particularly like. But here goes:
>
> What will actually happen is that no one will do anything to port their
> stuff until it's time to remove 1.0 because upstream has EOLd it. And
> then there'll still be complaints that more time is needed for the
> transition. I'd like to gently push people to plan this transition
> already now - and it's as gentle as it can be: if you pull from master
> and your things no longer build, make one simple change and they will.
> It's part and parcel of being on the bleeding edge, or rebasing to the
> new yocto release: not everything works exactly as before, and most
> components are newer and different and not always fully compatible.
>
>
>
>
>
> It is a cross distro item really we should find out what other Linux
> distributions are doing about it moving forward unless major distros also
> have same policy there won't be much momentum this would gain among the
> packages ecosystems this could also help in sharing the porting burden
>
>
>
> The other reason is that it's more work for me: I would have to update
> everything in oe-core to use the new recipe, instead of fixing just a
> few recipes that need to stay with 1.0. And then again the same thing
> will happen when 1.2 is out.
>
> Alex
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

