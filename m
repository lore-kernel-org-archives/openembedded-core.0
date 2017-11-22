Return-Path: <kristian.amlie@northern.tech>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id AF50760017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 13:35:56 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id w23so18241081lfd.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 05:35:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=3aUlpVFoLOG1yImDT3pfwCA/OEwaTl17NbLCDc4NYbY=;
	b=WyyJaih7cljipkhEhPkB0giuGaM7piUSIw760sa10o7AcjiiMo9ASRdPsjnrd682uH
	oU5lQ6Ip2z81bN4Vz0UaoM2JOiCGMZL1gKv5EdZhQZDLpbPDWR1rvujW27ofp50J8csc
	1R3LQ8w3w+jidKRiUzWMdRtECaWtYTQbMwn2CLUozkgeC3DqVvVIvjU20KtWOfiWuxKg
	HHXXUUrL5lbL18CxHz6a7WtNABeryYfC2s2DFzrDraFu/hPUsJESZn1xm+y7yab+8kHv
	fgiImhCYOoYSs/BKGIFOf7CiR2YjeV50CLqMe8luperMduxvUT4e6EnMC+jJofirbHMr
	3u2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3aUlpVFoLOG1yImDT3pfwCA/OEwaTl17NbLCDc4NYbY=;
	b=XrBp1XMxmSlPqw1GVDhBnTMaIwIavuuHiANRSZELP8NSgHXDIhUo+eIa3ZVvt+G7N2
	VBPP5O96/gABfHwd/BMExfNmZkO14yCAkyjb2SY9IDcukMwerEo8QVsuHav3d0yqDARL
	du/neBh6hblHWpfyt1Omn+qET8kD8jvpFuJGUPXnk8+w2VJn0aIz1NTS8Wnbxu23/B2F
	HtQqgHHN1PM9NgqI+JBunOW+X78G9bZTy+IKwNkc0RH4VbQq/L4pTxGXSO0ANNmFNXns
	WZ4CK1ysJHF2zD9H98rPqTDKDXdis1ezsFqSaVm7fD0f9qnCVpl0oyVm8UqCO1R6VpUJ
	0CaA==
X-Gm-Message-State: AJaThX45FykjeQY81u4elUyjjIbgLM4Qqq9hig9CBhnXjNZLS3EvKZpL
	NurQbmKAnky3sRBxbZx+6Hjc+A==
X-Google-Smtp-Source: AGs4zMZmg4aRjZZWnpOqd27Te81YDPzPYcofbi4hFaWeIu+JNf9S0kOJuP2fZKrrhuzWD9Iif0Ji+g==
X-Received: by 10.46.66.69 with SMTP id p66mr2395743lja.18.1511357757212;
	Wed, 22 Nov 2017 05:35:57 -0800 (PST)
Received: from [10.20.33.141] ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	t25sm869604lja.92.2017.11.22.05.35.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Nov 2017 05:35:56 -0800 (PST)
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <6a525f12-f5ea-d079-83d8-46e6394be8ff@linux.intel.com>
	<1511356419-32334-1-git-send-email-kristian.amlie@northern.tech>
	<e4d7ba56-e92f-9322-6e37-be08bcab8ad8@linux.intel.com>
From: Kristian Amlie <kristian.amlie@northern.tech>
Message-ID: <111222f2-f6d9-f37d-c83c-0a73df0f967f@northern.tech>
Date: Wed, 22 Nov 2017 14:35:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <e4d7ba56-e92f-9322-6e37-be08bcab8ad8@linux.intel.com>
Subject: Re: [PATCH v6] do_image: Implement IMAGE_ROOTFS_EXCLUDE_PATH feature.
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
X-List-Received-Date: Wed, 22 Nov 2017 13:35:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22/11/17 14:31, Alexander Kanavin wrote:
> On 11/22/2017 03:13 PM, Kristian Amlie wrote:
> 
>>> Bear with the pre-release freeze period please; once rocko is out
>>> patches will start flowing to master again.
>>
>> So now that rocko has been out for a while, can we get this in please?
>> Already reviewed, and rebased patch is included.
> 
> Please do pay attention to what the recent Yocto Project Status emails
> say. Specifically:
> 
> " Until we resolve these issues patches will continue to be slow to
> merge, if at all. This also blocks several core developers from doing
> any feature work at this point in time (e.g. layer setup tool is on
> hold, again).
> 
> ·        We can only continue to stress that unless others step up and
> help to try and root cause these issues, things will stall with the
> project."
> 
> The way things are with the project now, contributors are many,
> maintainers are few. If you can balance things out a little bit, that
> would be much appreciated.

Oh sorry, I missed that, I will keep an eye on the status updates!

-- 
Kristian

