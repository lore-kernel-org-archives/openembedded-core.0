Return-Path: <koen.kooi@linaro.org>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3FF3160644
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 14:03:04 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id ex4so4382309wid.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 06:03:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=GEsJW/qgFb5M9KxZw1WF1TdSMMRL2WAI4gS9qcyUz5E=;
	b=jGKrYJx47CEUVdIGDstdJp4pDk5VWODu6GTS+/2iuW+aaAuHVaRlo2ze/y29tKpOgK
	5UW7Q4ou552og5tbsu+cwla1eWln3Z2YKAc7s7ZuLAYXMyTDDk9lNXxqmA+L/N3rFJpI
	xM6NOuAjeVgMtOBM/1QGA/Nk+IKveBbNMvjiWGkcR2e0NWp1q29A4cYBEMnwGFp9TRwa
	oB6ehaztxYuiH3NGCsAR50aHBXvyGv5uh8wVM5UgIjC8cfGIeSn8goS9lbpI21Ug5mNR
	uz0uk01rKxI5WtaNyReP2FRQDM8M1vCUR/twyFwWviEz+wwR2rvilTWK+3umLRoFSk4B
	7WUA==
X-Gm-Message-State: ALoCoQnjWB5HO+11zVFdvymt8T0wz9hCJTgKYsL1lJq8PINQuf8Q44XicHE1FkYZima+c7V+VzZw
X-Received: by 10.194.62.243 with SMTP id b19mr1548767wjs.63.1390312984864;
	Tue, 21 Jan 2014 06:03:04 -0800 (PST)
Received: from ?IPv6:2001:610:612:0:5e51:4fff:fec8:7c15?
	([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id k10sm7980353wjf.11.2014.01.21.06.03.03
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 21 Jan 2014 06:03:04 -0800 (PST)
Message-ID: <52DE7E17.2090301@linaro.org>
Date: Tue, 21 Jan 2014 15:03:03 +0100
From: Koen Kooi <koen.kooi@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1390297632-9966-1-git-send-email-koen.kooi@linaro.org>
	<1390312633.874.84.camel@ted>
In-Reply-To: <1390312633.874.84.camel@ted>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] package.bbclass: fix strip and split logic
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
X-List-Received-Date: Tue, 21 Jan 2014 14:03:05 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/21/2014 02:57 PM, Richard Purdie wrote:
> On Tue, 2014-01-21 at 10:47 +0100, Koen Kooi wrote:
>> Marks original commit message and variable documentation state that stripping and splitting are independent of eachother, but package.bbclass ANDs the two INHIBIT flags to see which files can be stripped and/or split.
>>
>> Original behaviour:
>>
>> INHIBIT_PACKAGE_STRIP: no strip, no debug split
>> INHIBIT_PACAKGE_DEBUG_SPLIT: no strip, no debug split
>>
>> Behaviour after this patch:
>>
>> INHIBIT_PACKAGE_STRIP: no strip, no debug split
>> INHIBIT_PACKAGE_DEBUG_SPLIT: strip, no split
>>
>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>> ---
>>   meta/classes/package.bbclass | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>
> FWIW this resulted in a failure on minnow:
>
> http://autobuilder.yoctoproject.org/main/builders/minnow/builds/15/steps/BuildImages/logs/stdio
>
> So we may have some fixing up to do before this change can be merged...

I have that QA issue as warning not as error. I guess that's why my 
builds kept working :)

Aside from that, what are your thoughts on this patch?

regards,

Koen

