Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id A2B7A60F4F
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Feb 2020 16:36:28 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id g6so1048049plt.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Feb 2020 08:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=NnPFjEUltl29Eh3NJXbxCVgHghviBU0iFOX2cZv5/Cc=;
	b=DzdnxCUonXGs3pZYRMJLlymJp2EsmXGCJHxQN3BtnEUncD3bjFjiBGv+ytThNuorrN
	qMAEHfjg66TRooaF4BDMYi+4ZYYwQwBQTusKDG0fCsnjqIXG1t6BwxyHr587VNxLN2Ri
	Yel7+CMtmc7FYKNML0MZyZkZiPh8X9et9LGf58jyb16UqleTxKrbiDb0G/7/PC6L0eH9
	M9Zc4WBNjrr5ugNRzcQunqYAIaU6ooHtze03iooTfdPpLfJ36Ooyl0SjRacQpCW4EBLH
	KpgEChxZ+6Aa+/opqHAut9hElpxID+Mv7ArTTXr67kBSkZyAvdJLEmMM9yrMc/gyZIze
	Rbrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=NnPFjEUltl29Eh3NJXbxCVgHghviBU0iFOX2cZv5/Cc=;
	b=GFJINjmujQh6koP4GeQ9E9pFYts83NcQr2YCP2wiuPTsZdL1oZZkuIvJ36HW6bxDm1
	7srUncOSvlePufn+2LWa0DRobWPcJ2Q6g5k78jN1DY0TTIY3NinmkSwWcgm8f+RXN7Vm
	LuD8HVN8m6kD2G4bS5gK0WL8s6tdZrOkmHUiE8h0eAjyvjMur8xWTfJkjMn+qztfTMX3
	7sB3N4uYYNpIvNbVm+MQmzi0nyoqlzqIoWi1/ZIH+cFWg6d9WbpIs70ZLD4B0E+fR9XR
	9h1R2qpy8OvJXGfU93fC7WSOGQoc9MYjxdTFvRkGZij3LKhWHNeYp3oznsd26tNd1qvF
	VmAA==
X-Gm-Message-State: APjAAAWmgk31CnONnIUEY5jrb2lf6gL2BEM7S9v8Vmyd49sEMFlc8Nuv
	L+cqCVnVk/133pFvCJgSlbc=
X-Google-Smtp-Source: APXvYqx2DdkbOnc8NGvTiVg3otAVZsUm5etadS99nt6A19nVVrUjhfrIkIY23VDv2rLFioR8VD+1Tw==
X-Received: by 2002:a17:902:bb93:: with SMTP id
	m19mr4744052pls.310.1581179789597; 
	Sat, 08 Feb 2020 08:36:29 -0800 (PST)
Received: from ?IPv6:2601:202:4180:a5c0:2c7a:b2c:b402:2f65?
	([2601:202:4180:a5c0:2c7a:b2c:b402:2f65])
	by smtp.gmail.com with ESMTPSA id
	w17sm6907613pfi.56.2020.02.08.08.36.28
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 08 Feb 2020 08:36:29 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <836aaccb82a2781c00e26249ab896d7ef0e25a27.camel@linuxfoundation.org>
	<6207024170e32fe8ef7262433124efc64d614132.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <36734d21-1649-3a14-1355-eb998c0ede12@gmail.com>
Date: Sat, 8 Feb 2020 08:36:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6207024170e32fe8ef7262433124efc64d614132.camel@linuxfoundation.org>
Subject: Re: Reproducible Build Status (and implications for zeus 3.0.2)
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
X-List-Received-Date: Sat, 08 Feb 2020 16:36:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US



On 2/8/20 5:56 AM, Richard Purdie wrote:
> On Fri, 2020-02-07 at 14:23 +0000, Richard Purdie wrote:
>> I think we're now down to:
>>
>> sudo path issues (Ross is poking)
>> ncurses-doc issue (assigned to JPEW)
>> perl host compiler flags issue=20
>> sysvinit missing group problem (assigned to Mingli Yu at present)
> We're now down to:
>
> A gstreamer issue with libcap:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13786
>
> and some potential perl host compiler flags leaking in
> (no bug for that, we've not seen it in the last build and I'm not 100%
> sure if we fixed it or not yet)
>
> I've queued up the recent fixes into zeus-next as I think they're
> stable material.
I can not=C2=A0 find your changes so that puts a hold on any zeus work I =
was
planning on doing.=C2=A0 I guess this frees up my weekend.=C2=A0
>
> I'm seriously considering letting 3.0.2 wait a little to include those
> fixes in an rc2 and abandon rc1.=20
My vote was for rc2 if it counts.
> If we do that, we may want to get the
> bitbake hashequiv+multiconfig fixes in master-next sorted too.
Is we "You" in this case to?

- Armin
>
> Cheers,
>
> Richard
>
>
>



