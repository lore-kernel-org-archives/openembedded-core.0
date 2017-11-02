Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f42.google.com (mail-pg0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3A461782D7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 16:06:49 +0000 (UTC)
Received: by mail-pg0-f42.google.com with SMTP id j3so22045pga.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Nov 2017 09:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ezJO+gZES6ANsRl8AizWOYfr+UQIOYE2oAL2MobOIUc=;
	b=NUoAlkLEt5QhDtsAy5H1CfT0lEq0ymelWKG7p+eaqXG7LRLXuqy8NZAQp3GYj7kJT2
	awCOH0G1c1aqU3dN4p3DWMTuiutbs1I7m6QVsZEM18onesjyRurPbMtxFHx8yrBosb9X
	UO6MWKESfgROw3xXMOgzDpzDw4+T1d7WB2Vw1o422hbv5qI7/DayNGoz8BDrIUEzWT7E
	R83qYR2GktFpN2r8xNsFBK0kWB6lTYNFf425t2GSKjyWVviAeYxrTl6W/Pa9lvfQ04xi
	3eT4roU+KTbC2Rl9HB+pICY6NdNjBbNFsUjhY6rVTLU4aHUVE41Rmj5oWs/wCC17DYDx
	VGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ezJO+gZES6ANsRl8AizWOYfr+UQIOYE2oAL2MobOIUc=;
	b=f6Y/Eu4ZXWUjjtbiq7kIWV83U/GI2YrOJudcMKOagiYUkLha4QJZ0a8GcEu25uCNfQ
	ONwFv5l5Dsf8FwxoRpFXRPROYuUClkzTzG7uUMSOkUtO7XY+efAzn9QXorB7lF5X0X3e
	aeiHX3VxRdDBgkje960S5LTTtO1Yds4H6W66OW/sGsbtyNwQJS1jbq9YpisF2niZl91X
	efZ3lZdkV2iI7GmF4Voi4E036fBlJbJpeAMhVrl3KuRmrnPGvubA2XsXhSVwMPT2Y1OW
	foz+wqk31u5D3SATnjGKljhiajww0ciuqA4hNQUEN2ClHSrTbuu30ZSU3TXX3OdKkqVJ
	ooFg==
X-Gm-Message-State: AMCzsaUuJ6vLBvtyHXMkktfEVHI342Ekg8E3UFa//WPOvBtRwa3TcHLj
	ciq/6g9SBDYNsD96CFN+ueOHeMayApjTNJhfXgs=
X-Google-Smtp-Source: ABhQp+TZrhP3MDNMJxZLPwVp6l5eASAOSjNrus6qPxVl7tFMLheFpBvZ9iPLpOKUNrUus2lptQm+vGZhgpTtSuW/jc8=
X-Received: by 10.101.100.216 with SMTP id t24mr3978914pgv.439.1509638811212; 
	Thu, 02 Nov 2017 09:06:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Thu, 2 Nov 2017 09:06:20 -0700 (PDT)
In-Reply-To: <5256d5a7-4060-b00a-07db-ca3b993bc853@linux.intel.com>
References: <20171102053922.33426-1-raj.khem@gmail.com>
	<44258d74-acbd-45cf-0a00-c82554be03ec@linux.intel.com>
	<CAP9ODKqKMjmPLm0yP91ojS3OX5rLkEW34uwrvR02V5rcs4VWGA@mail.gmail.com>
	<e7b239be-9c34-18b1-7b63-006334d7d2db@linux.intel.com>
	<CAMKF1soe__AzR_0O4YHMup1hd1U4jdc6Vq8O-Jt4Fc87HwAnHQ@mail.gmail.com>
	<5256d5a7-4060-b00a-07db-ca3b993bc853@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 2 Nov 2017 09:06:20 -0700
Message-ID: <CAMKF1sonNMkmunkHd4Wxz=m_VZO01ntAos8R170RRSiRnpOmYw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] musl: Update to 1.1.18
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
X-List-Received-Date: Thu, 02 Nov 2017 16:06:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 2, 2017 at 8:30 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 11/02/2017 05:28 PM, Khem Raj wrote:
>
>>      >> Can you drop this, and simply rename the recipe to
>>     musl_1.1.18.bb <http://musl_1.1.18.bb> please?
>>      >
>>      > Why? keeping it on _git makes sense to me.
>>
>>
>> We always use a given srcrev always this time
>> It just happens to match with release
>
>
> But why the need to pick mid-development commits, rather than stick with
> tagged releases?

We do not carry any patches and musl releases aren't frequent. It has
served us well
since we have been able to get regression fixed upstream as they
happened with musl on OE
I wish every project was usable in this fashion.
>
> Alex

