Return-Path: <ian.arkver.dev@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 16D8971ABF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 09:18:20 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id v42so12035227wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 May 2017 02:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=QVNpb/mzDvEe1yWZmqa9uQieeaOYlH4MrY/pJ/soC8g=;
	b=gCDEBhcTW8yKdOV7E7wSZpHZQQOeMdVAUYRAPmU4Xm7MqqWjBqQbWtKQkP/i7brWLk
	OJX1OmIOwPgklB0kFSQEHulJnOOf4tLVZGKXSCYhqk0E8/5Zz2hh2UCYpxlrGI+ujMZl
	3lp7XhZCi/0D/Y9UMNH2S0iqx2dMjInyLlEbxZIAN41+VWwina6hG8Ff8u+Z7Ui69jh3
	qvgdPxs4NKj6ybYJqMOo0/oHa3so0W33SWA10hnh+IDWaDfX84i1sUVlvBFbkn2eRd4k
	ZrX9y5ocgZxhtY6zq5jpvjDr3vnfo7LExFhdudlyTv+mIKDYEV4LWOwvFcVdroncLL8W
	iGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=QVNpb/mzDvEe1yWZmqa9uQieeaOYlH4MrY/pJ/soC8g=;
	b=HgwocVRFohHGxUT0XRwxvQgL0tnaB49rt9EqgXQcLHcmbDoqlesjx2pVlf5QsmMqno
	DbGEuyMLl1HtLSbI09ucm4KgjbfiUc0zA/jaaJJEtvQIlBkDC+5PWh28JkATnMEQz3Rm
	QTQEIdcS+YvgapUWkLIgCXDzAQsizyKOoOnCFZWVOT2oiIWDlDNIrWMN9Hio5s7Piynp
	kx4DDcqjCuF7y4bemN1y3Dsdg1uoWr2h6Vd1OVkJnI8b81UKpS7KmRTflGos5TqqGSE9
	4ljXWoFKFKJxL52LxLta0hoZ0DUQV6nd4vKNgt4IGBqhf6o1eYji5VEsTJ7/3ZugXjv7
	sTsQ==
X-Gm-Message-State: AN3rC/528p0ClFothOInxNV9XVnLKHYQgzeCX3hU1mGstFia4pMHBxcC
	3SdysQX2AzrB69t8
X-Received: by 10.223.143.70 with SMTP id p64mr39921469wrb.120.1494321501739; 
	Tue, 09 May 2017 02:18:21 -0700 (PDT)
Received: from [192.168.19.15] ([95.147.75.190])
	by smtp.googlemail.com with ESMTPSA id
	r60sm20150209wrb.37.2017.05.09.02.18.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 May 2017 02:18:21 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1494240698452.53619@mentor.com>
	<CAHiDW_GPTu0WcuNd143TaBsD=8hiv6SPowWHcBF_0h8DG1x+fw@mail.gmail.com>
	<16a6f453-9856-36c0-e160-036d23e98111@linux.intel.com>
	<19161543.bPvO6Cp06Y@peggleto-mobl.ger.corp.intel.com>
	<be95c443-df9a-2c9a-394b-4b02c8710fdc@linux.intel.com>
	<931ee9bc-a5cb-fcc2-278b-20a07731524d@dynamicdevices.co.uk>
From: Ian Arkver <ian.arkver.dev@gmail.com>
Message-ID: <70344400-e36e-497e-e061-56821561c353@gmail.com>
Date: Tue, 9 May 2017 10:18:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <931ee9bc-a5cb-fcc2-278b-20a07731524d@dynamicdevices.co.uk>
Subject: Re: GUI based images
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
X-List-Received-Date: Tue, 09 May 2017 09:18:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 09/05/17 09:44, Alex J Lennon wrote:
> 
> 
> On 09/05/17 09:05, Alexander Kanavin wrote:
>> On 05/09/2017 01:15 AM, Paul Eggleton wrote:
>>>> LXDE in particular is Gtk2 based, it's no longer being developed, and
>>>> has been superseded by LXQt. So it's a non-starter (and so is LXQt,
>>>> which should be clear from its name :).
>>>
>>> FWIW I think this is a little short-sighted. Why are we ruling out Qt 
>>> exactly?
>>
>> We would first have to agree that Qt5 belongs in oe-core with 
>> appropriate level of maintenance and QA, and that it's okay to add 
>> half an hour or more to the building time of a standard GUI image.
>>
>> From the screenshots of LxQT, it looks like yet another Win95 clone 
>> meant strictly for desktop use that would certainly scale poorly to 
>> small resolution screens. Who would be the target audience for it in 
>> the embedded space? For the purposes of 'engineering UI', Sato is 
>> fine, and we don't need something else.
>>
>> Alex
> 
> fwiw. I would love to be able to develop devices like those pictured 
> below, which I believe are based on Qt for Device Creation.
> 
> https://d33sqmjvzgs8hq.cloudfront.net/wp-content/uploads/2014/08/devices.png 
> 
> 
> ref: https://www.qt.io/qt-for-device-creation/
> 
> Cheers,
> 
> Alex
> 

They have their own meta-b2qt layer for that. See "Embedded 
documentation" and "Building Your Own Embedded Linux Image" from that
page.

It's not an OE-core thing, imho.

Regards,
Ian

