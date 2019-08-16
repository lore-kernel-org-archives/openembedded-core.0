Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 018796C10F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 03:45:49 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id p3so2243564pgb.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 20:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=fu4FCQQ+5Tiiog14sqErEGo2up81Z6PXHNHgbMEaFDA=;
	b=gvey5/10on4JTTfYPIie6tFUsOg4IPD99MMvTqVRDabXDWCsKsyyGcTQEkU2bPznaI
	NEhX2E1EkcAqswajZ6f67pkKQVnre3yMeSeXi4exgZr7J+Bm6cxYcfdNnLDc4hed6X+U
	r2gnenlQRFYa2jcz9jc1+OYzTv3uGjvufZwUBKxkL3Kx1xJet1Ui2zkS9I8rOr/x6amr
	NaerXC3vxkL2zVBBZV2toQli7B+0nFP1SGMILd82rdWpzzFoQc3EAlxipuQEqI24CAMb
	LjQAyaz0rn7Pe9AdtJ06x15COWkGnRaMX+JAUUBrKjfCwguqvvGEbpJ5lTczKw8em5dm
	pFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=fu4FCQQ+5Tiiog14sqErEGo2up81Z6PXHNHgbMEaFDA=;
	b=n/O02zzFCS5D2ssYDoScXBUFipsakgb7ilp30vWhgmn6dG9NmUsPrWsh2S5y1MTR/7
	446m2JcSYWZ/8tAVbFjp/pYd4wbUFX+wyzFriDOKKQ3m/Qp4m+LJJDR65Snrh2cwRiiD
	w+0tvXCAoMchey8QkfoFDnoEgTuRXur7MpE0JZbyt9wq5eFO1R6sGD2RDjdmD2yRlqYQ
	nnCnzmP1cSYjjO4PLxM+QpDLQ5BaEkJWe5DcgGoOe9zLgHlV3/Kf4+Z3BRGsPwsGxpXh
	toI3lNDKq7flPU1/L1lQiRHfxRwDFZ+s0dhaszmty415xgmrItE9YUviQ3xcPqwg/LSz
	XFnA==
X-Gm-Message-State: APjAAAU6yzw2wDjywHD81lGY1lq4tYI9rdehwwFBKFMddLbmxwhaD8cd
	30+ahEjFpwcouYAsZRTizlhsoSUf
X-Google-Smtp-Source: APXvYqze9MkDEwjwr5h1Xlke7AEcwxubBykLLc54jUMQWMQNv4jjquI+MhER9FwAj/u788PJYJSCYg==
X-Received: by 2002:a63:e213:: with SMTP id q19mr5976170pgh.180.1565927150505; 
	Thu, 15 Aug 2019 20:45:50 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:b816:6e4b:1727:7819?
	([2601:202:4180:c33:b816:6e4b:1727:7819])
	by smtp.gmail.com with ESMTPSA id
	n128sm4236562pfn.46.2019.08.15.20.45.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Aug 2019 20:45:49 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20190815065343.5291-1-naveen.kumar.saini@intel.com>
	<7128b7d3-78c0-0a66-8e55-65fedeab2dd1@intel.com>
	<CA+chaQeeS+Ludz64ke19Hr5h1knrvbe769N5vhMQLH7=E_dmbQ@mail.gmail.com>
	<b2ae3b8bff8bf0c2f42d588841347ad8b6844ef6.camel@linuxfoundation.org>
	<CAJ86T=Ux9UQs3eVJR5NOyZYJMMDtNRHr-Nppq0d5D5JFMryaMw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <dc6b8ca1-411e-4381-e4da-7907052eca28@gmail.com>
Date: Thu, 15 Aug 2019 20:45:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Ux9UQs3eVJR5NOyZYJMMDtNRHr-Nppq0d5D5JFMryaMw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [warrior][PATCH] bitbake.conf: add git-lfs to HOSTTOOLS_NONFATAL
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
X-List-Received-Date: Fri, 16 Aug 2019 03:45:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 8/15/19 2:31 PM, Andre McCurdy wrote:
> On Thu, Aug 15, 2019 at 2:09 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Thu, 2019-08-15 at 09:23 +0200, Martin Jansa wrote:
>>> NAK
>>>
>>> Yes, the first part was merged in warrior and is correct.
>>>
>>> But this second part isn't good (you don't want git-lfs to sometimes
>>> work and sometimes fail) and that's why it was rejected for master
>>> and _shouldn't_ be merged to warrior. If you have recipes which need
>>> git-lfs, then add it to normal HOSTTOOLS in your builds to make sure
>>> it's always present when needed.
>> I don't like the patch but it did merge to master.
>>
>> Building a git-lfs-native is a nightmare due to all its dependencies (I
>> think its go based?) and there wasn't really any other way to sort it.
> Upstream provides generic binaries for at least x86, x86-64 and ARM64:
>
>   https://github.com/git-lfs/git-lfs/releases
>   https://github.com/git-lfs/git-lfs/releases/download/v2.8.0/git-lfs-linux-386-v2.8.0.tar.gz
>   https://github.com/git-lfs/git-lfs/releases/download/v2.8.0/git-lfs-linux-amd64-v2.8.0.tar.gz
>   https://github.com/git-lfs/git-lfs/releases/download/v2.8.0/git-lfs-linux-arm64-v2.8.0.tar.gz
>
> Would just downloading and installing the official upstream binaries be so bad?

making a big change like this seems to be a no-go for a stable branch.

- armin
>
>> Having recipe specific hosttools would be ideal but we don't have that.
>>
>> Cheers,
>>
>> Richard
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


