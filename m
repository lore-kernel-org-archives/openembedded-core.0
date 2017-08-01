Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5C04178240
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 14:56:10 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id y129so3044767pgy.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 07:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=lLhEivnUcTINUViMShF3JODgHatAkh6VFjGdiF684XA=;
	b=REcASDKnuTiTi53tEwfhwy+hMOUwzTXb/5GGxpqSQiOHdNbrqZCsmNU37SE0MlJKLG
	EWm/fKQSjS0FTgO+65SKl8usNGtPIva05R03v/qdJoGnn0jT5bI4gEuHgtPX0FcrRjvw
	wGrNIRx9+cXHFC64cVpEk5B2EvS8YSMVr6NjxAFm7rziBwoSGpGdWUdBbKb6LwymNttc
	DTzE34HuXAVKRsnqVwRx2n0t9tfwQWCT6wZTYfW15CiX2acBn94fzYhyi954XSFpBQf2
	3Qj4o1hHkgFaRum9RAp6usDVFdhKeqatWmDeGR0Z5QvUbFiwwV09/EGuS0AhhUVbHcge
	E3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=lLhEivnUcTINUViMShF3JODgHatAkh6VFjGdiF684XA=;
	b=ii9Q36bjJMQUCvUwyb5/iJvMvUJ35/y9TPDztp0LZhkBlwgJYs3pgl3lIk9ojK8svZ
	NoBwrhHajQMXQG2F+UHylb0D+xwwDETEyx6vosayzMWs8l5f7lvZFs5L/QK/SRZoEXG7
	gM/Yfypaj2x0zhzKaqU5hvZeJIu43Bp4WxdpJOa+ndLY/mNZB+9MDV9THblE8i/+rM0g
	0Smb5CRsIA4U5fTcpx5Fwbw8nQvDN9O24BMLZIQCESXgdhJ6r3FAstB2nOB98dWKEHvF
	NZQCBqweoZl7Z1FLJKkrFm3xZqvo/tBFmkfnaQi9KUKIyro+T8DXDTvK2eN5vQmFxGMB
	nJiw==
X-Gm-Message-State: AIVw110S9RPGgDyF6t2wj6zQebcmftatOt71Zdq1HHbHiZ+VU4GYhKOZ
	dbREtVLdmGbDAZ6w
X-Received: by 10.84.241.3 with SMTP id a3mr21085383pll.160.1501599371581;
	Tue, 01 Aug 2017 07:56:11 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:2ddd:cc9a:59f3:2754?
	([2601:202:4001:9ea0:2ddd:cc9a:59f3:2754])
	by smtp.gmail.com with ESMTPSA id
	b89sm27732171pfe.95.2017.08.01.07.56.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Aug 2017 07:56:10 -0700 (PDT)
To: "Maxin B. John" <maxin.john@intel.com>
References: <1500551462-19196-1-git-send-email-maxin.john@intel.com>
	<11c0cdf9-c369-f90e-1c3c-3e1e60ac9e57@gmail.com>
	<20170801084316.GA33379@mbabyjoh-desk.ger.corp.intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <55503283-ee4e-7094-06b7-e2d745c00c3a@gmail.com>
Date: Tue, 1 Aug 2017 07:56:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170801084316.GA33379@mbabyjoh-desk.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [morty][PATCH 1/2] libpng: move SRC_URI back to SOURCEFORGE_MIRROR
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
X-List-Received-Date: Tue, 01 Aug 2017 14:56:10 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 08/01/2017 01:43 AM, Maxin B. John wrote:
> Hi Armin,
>
> On Mon, Jul 24, 2017 at 09:04:40PM -0700, akuster808 wrote:
>>
>> On 07/20/2017 04:51 AM, Maxin B. John wrote:
>>> Since GENTOO_MIRROR removes older binaries, move back to
>>> SOURCEFORGE_MIRROR
>> your fix is cleaner than what I had stagged.
>> thanks,
>> Armin
>>> [YOCTO #11554]
> Please ignore this fix. I will send v2 which fixes the MIRRORS.

this series already in morty-next. I pull them for your v2

- armin
>
>>> Signed-off-by: Maxin B. John <maxin.john@intel.com>
>>> ---
>>>   meta/recipes-multimedia/libpng/libpng_1.6.24.bb | 6 ++++--
>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.24.bb b/meta/recipes-multimedia/libpng/libpng_1.6.24.bb
>>> index f91ab7f..4ee5983 100644
>>> --- a/meta/recipes-multimedia/libpng/libpng_1.6.24.bb
>>> +++ b/meta/recipes-multimedia/libpng/libpng_1.6.24.bb
>>> @@ -6,8 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5089214833586ba444048fd1dbbc76a4 \
>>>                       file://png.h;endline=149;md5=376d8ff7f69b7c4ad3a09f4672cec696"
>>>   DEPENDS = "zlib"
>>> -SRC_URI = "${GENTOO_MIRROR}/libpng-${PV}.tar.xz \
>>> -          "
>>> +LIBV = "16"
>>> +
>>> +SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng${LIBV}/older-releases/${PV}/libpng-${PV}.tar.xz"
>>> +
>>>   SRC_URI[md5sum] = "ffcdbd549814787fa8010c372e35ff25"
>>>   SRC_URI[sha256sum] = "7932dc9e5e45d55ece9d204e90196bbb5f2c82741ccb0f7e10d07d364a6fd6dd"
> Best Regards,
> Maxin


