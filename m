Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id ECEA0783C6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 07:07:28 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id 196so12225269iti.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 23:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=wJT0gSLcyWwuHSJ45Mz2qX84ddC05NYRmFS1xJ1uMdA=;
	b=rv6CmKZtoNJl/Ci7iBVEPsaYhNXmsHEXWarM16+h0p091czr2JQjrBCeRJrJ33x3gQ
	2BDMHw8ItI7Hy5sfoGfiAt8593DLf7siIDtjz61asoHW+2VndohN1ezSc2VtIG2EDnXS
	7X3jvfrZJ1hDU88sgibS44L8UJkUxtTaV2YuTn1XHZBg7w3jVFfF583B7FqVGLLeeZbf
	n+s+A+js5lxD/Wy18dhsVJCjAl6DOQUljN7j+qZQqqns96bHlEibKsxQBoa6MKCthPbT
	/8Ph9ViFMiJbGpQL0z238RMj8fxn3qt/sGtzm3uGkZ7vsMwhQhDilT+dvwB2iJGnXt5r
	K4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=wJT0gSLcyWwuHSJ45Mz2qX84ddC05NYRmFS1xJ1uMdA=;
	b=qsUhzOop/h1wJIO5bbrCXaqCNq3spLus6CLyLab3csuwdyCW2xmjzIJ0yZxPkz+BL+
	wDGcc1sQOhXBCPi3z7PBUkIJnKZto8fz81KwwOJy0MvdUnplO4Wbq/1Q9H7vGEU0DrQZ
	I6RCVu9sqqPALQhs4c68P6If8lT7q2RDC2z0+j6P66C8XBtJrr5feMxr7T6d3EhOyIMc
	MOEUIuJD9k/haljpsrmPS0oUlz2+4MoMFtPDLKumPm74djHUejiKaPdGptjZBDfWabqW
	FGEopzYoPTqXzzcL7F5WEW1o2cXj1DLke2grLam4Cm3Qc9axHX8GRQU3x8tC2ykrNRmu
	FBog==
X-Gm-Message-State: AKwxytemWXhNknJ1MYgBfAPgBdGgES4OfOFrf9xnK3K5iZnAvI1uI7Oj
	fGFjs7El9HZ5sC4kiCj1hCT+6kTl
X-Google-Smtp-Source: AH8x227fq3L1B6DESlgNMbe9uXYLpFXZ4ogdXxGq+qIvEEDfc+l+iv2Bx5OVUTcLetDaOo7AP1u/eg==
X-Received: by 10.36.157.69 with SMTP id f66mr30253475itd.136.1517296049679;
	Mon, 29 Jan 2018 23:07:29 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:fd41:97d0:e3d:7877])
	by smtp.gmail.com with ESMTPSA id
	x87sm7127402ita.32.2018.01.29.23.07.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jan 2018 23:07:29 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <20180129174724.26768-1-niko.mauno@vaisala.com>
	<2afb5638-31ca-39fa-bf28-d305fea507c0@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <48a79520-c02f-2dfe-b25b-0b89beb182d6@gmail.com>
Date: Mon, 29 Jan 2018 23:07:27 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <2afb5638-31ca-39fa-bf28-d305fea507c0@linux.intel.com>
Subject: Re: [PATCH] bitbake.conf: Add comm to HOSTTOOLS
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
X-List-Received-Date: Tue, 30 Jan 2018 07:07:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 1/29/18 10:38 PM, Alexander Kanavin wrote:
> On 01/29/2018 07:47 PM, Niko Mauno wrote:
>> This mitigates following issues during u-boot do_compile() step --
>> otherwise, if comm is not available, they are quietly ignored:
>>
>>    .../scripts/check-config.sh: line 33: comm: command not found
>>    .../scripts/check-config.sh: line 39: comm: command not found
>>
>> Since 'comm' is provided by coreutils package, adding it to HOSTTOOLS
>> was considered a lower impact fix compared to adding coreutils-native
>> buildtime dependency to u-boot recipe.
> 
> I disagree. Expanding HOSTTOOLS just to cater to the needs of a single 
> recipe is not optimal, IMO.

alternative are
build time dep on coreutils-native.
fix uboot script to not use comm
do not invoke check-config.sh at all.

none of them are any better.

> 
> Alex

