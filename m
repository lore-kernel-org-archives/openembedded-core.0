Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id EF7107FD62
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 17:05:10 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id w2so1418996pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 09:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=g4MWHiAUwrcn1tYlhrtXjh8+uD+SVggdLEg3tPUsRIs=;
	b=C+Ze7Era4Nzyui/GnVfBONc8RnkhHcv0tyaqWgk5mIcgicvNUP4/m9Nm5fffGM97QV
	qCZhQ5Vf5is6XIfwqDw782Q5gi8dJcA3ssuAAfbpDSOppRqZEmL5Zb9GJBO74R+gt7NM
	oWw7mKmYDoMRS6D02TdZijhCV3R4WMgx9U7Iy2lQbbiyIGnOpn9ifSxvhtRZwMDyUAw2
	Wsmx6xUgQmP2mEXmiq6eK36pfbBtrglxYXV39DF1R+PFvh2sVZp4hJNN7SkTpWjvOZ+f
	8krhA3f0xUzSKILHGq2q86AkxxIFl1IC1VosQql+kL5G9PowUsUvsnMDHC7LZ0dbby+5
	sD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=g4MWHiAUwrcn1tYlhrtXjh8+uD+SVggdLEg3tPUsRIs=;
	b=FXunaHjrz8kd9i+682s/XvmgowY+K5aroGEw1xXS29/IMhD+pDq7NPEI92shancI7r
	ySjAP0yCsxAy18tUPCTO9gHU8dnOMNiDedjqXT7RGbnvc6/V3Kv4NR1dHbp6bRvn6qHD
	Apuu707pdCVhMXz7epuH2LyjZlMB0v8iNB1Jj7jDCenynbWqtnYfFcm94dWl6+jrAOty
	lKnicWW4HjKdLR/2i30pJF57Z1wd2DlC4Xhm+9xUcucrJS7WeSMfPJN5mdj003O+bGaf
	Aw91Z/eFvjdlQFgUypoolA3KPZWiQnrt3I1q20LQrpQfIBsmpLh9dPDJ/xweGGvxwPzt
	O+pA==
X-Gm-Message-State: APjAAAXAT6+9QzFC1ibOKSu8Jr4YfkvYIEwTRJf6sM1cE+CRADvzAsJ5
	jweYBphsP9iGOwWK7/idyeriz4+BfAo=
X-Google-Smtp-Source: APXvYqx5+V1XzlbsZ12hCW2q41SpJwlaQKa3iN7aim9tbWe2SvNjH1uRgSD9cKVQql7bjbcp0n04nQ==
X-Received: by 2002:a63:5a23:: with SMTP id o35mr5088381pgb.4.1579885511496;
	Fri, 24 Jan 2020 09:05:11 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:5dac:ba30:48e4:cb20?
	([2601:646:9200:4e0:5dac:ba30:48e4:cb20])
	by smtp.gmail.com with ESMTPSA id h3sm6880234pji.9.2020.01.24.09.05.10
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 24 Jan 2020 09:05:10 -0800 (PST)
To: Ross Burton <ross.burton@intel.com>, Denys Dmytriyenko <denis@denix.org>, 
	Andre McCurdy <armccurdy@gmail.com>
References: <1579813185-1950-1-git-send-email-denis@denix.org>
	<CADkTA4OUcmx2wFVf9NAR8D7c_3n+303YFR3gwAWv08KgT_o+ww@mail.gmail.com>
	<6f6a74c1-948e-e6f2-303b-639a08111d64@intel.com>
	<CAJ86T=VYsiBgrxPL-N4yy0S2FNUixxn6sfWjaaWQioFHqD=2-g@mail.gmail.com>
	<20200123224340.GG4735@denix.org>
	<0620f17c-53ca-7e95-1607-621507baedd8@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <51f70cda-9ddf-ea8c-e8a9-3a3f69db8167@gmail.com>
Date: Fri, 24 Jan 2020 09:05:09 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <0620f17c-53ca-7e95-1607-621507baedd8@intel.com>
Cc: Jon Mason <jdmason@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] arm-trusted-firmware: add upstream version 2.2
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
X-List-Received-Date: Fri, 24 Jan 2020 17:05:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 1/24/20 3:42 AM, Ross Burton wrote:
> On 23/01/2020 22:43, Denys Dmytriyenko wrote:
>>> Such as all the various cortex etc CPU tuning files?
>>
>> LOL! :) Of course, since ARM is such an inferior arch to x86. 
>> Otherwise we
>> should move everything that is not needed by qemux86 to meta-intel... 
>> JK :)
> 
> I almost pre-empted this comment in my reply because I knew it was 
> coming. :)
> 
> Personally, not a terrible idea.  The slight difference is that 
> meta-intel is *Intel's* BSP and we don't share stuff like 
> firmware/drivers with AMD.
> 
> Ross

it will be good to find what the overlap will be, is it something that 
BSPs can use with minimum changes, or are we providing a template that 
will be copied over and housed in form of bbappends or bbs. I am not 
familiar enough to assess that.

Perhaps it would be good to limit this to arm compatible machines, 
secondly, there is a point in having it in OE-Core if meta-arm is 
limiting itself to arm provided BSPs alone. I think it will be good to 
have a platform supported in core to be able to test it, between qemu 
and beaglebone, I guess it is not used. Or pehaps it is and we do not 
use it, so that change would be good to have as well.

