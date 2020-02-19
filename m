Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
	[209.85.216.68])
	by mail.openembedded.org (Postfix) with ESMTP id 550E761580
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 03:35:06 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id n96so1961147pjc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 19:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=/oxYcQ9s8F0Wh6hgnT/GSJvJYYJ/ktpXU0+WeyfdkCQ=;
	b=dd3ilFkoSd7R3Pxv0bJy1I+BqN0ICAEZ61+aHRczeFgxtkrgyozRvQ99gi0ve2gUhj
	g4CyORiiFw4aqH57Mj87h9cDTZOKeP7OaAJvJaGmYdZ0ZI0t9i8t1Rzyr4FZYuqt/6Bx
	6W/z0dlLiIifW2JwV9xKACUXSUPrmyraE38nAn9lZqdhRRDydVxjDVvQDok6yjnmxUaR
	7ejsS87Orux7J45OAB05kGEiopKBMg71OBa/JX9VQJqx20cvRdmAlqF+DKf5ozwXLBZq
	pWZdbVJgrjxiT2Nu94mANfqMeMLoi3089ljdS+Ivf97sSYZsLfrHCghZdSasw8TMc8F9
	VJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/oxYcQ9s8F0Wh6hgnT/GSJvJYYJ/ktpXU0+WeyfdkCQ=;
	b=mHTrGVlIJ1xsTT2LQGkSG6DbPXyS44c+rQYPum0VO7OTVCgQ323Hwpb1IbxXUs9AUQ
	wEXhz/i9XU8ppF7iYvKEMuRgFutc6aZBLFHHscwf7XzgNUpPF/EslMbNtZh7Ywzz11NY
	WVvcSsYPfS7ED8dosvRUwUj3teMuB0Z2C8PG4t3JICBpgSe9znwpjALvLDscjGjLubqy
	Fsr3EKl6ldgoAipXB33kBmU0X7XPKK2BSog7Llcm0Gtr+bZW9KdMIaBHFTI0autw947t
	E/Jbj249p+QHuQbRhoZ59RKD3vCsfn/LVvvTJauLaClzUV3h34DvY/l7T5HKj1B+X61u
	403Q==
X-Gm-Message-State: APjAAAWbs9pn9YzXODmV+Illxo8Gz6RmczSZ4n9u7IQvs76f4oRYObyr
	wVA49s7+Qi9LFVp1qCBm20PF3eyEyTA=
X-Google-Smtp-Source: APXvYqxCv7iG1Ggu7PWXvlZ8X/reu1g9XFLskHOSgmrKnbl/GM+qpCyUaC5KGcwKt3offs8gUrVG0Q==
X-Received: by 2002:a17:902:9a94:: with SMTP id
	w20mr24414408plp.6.1582083306738; 
	Tue, 18 Feb 2020 19:35:06 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:cca7:f312:1961:a4b9?
	([2601:646:9200:4e0:cca7:f312:1961:a4b9])
	by smtp.gmail.com with ESMTPSA id u11sm381307pjn.2.2020.02.18.19.35.05
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 18 Feb 2020 19:35:06 -0800 (PST)
To: "Mittal, Anuj" <anuj.mittal@intel.com>
References: <20200219023641.3308-1-anuj.mittal@intel.com>
	<CAMKF1srt7WNXNxqXEAWoFM=Xqx5H4WVKHtdWNXwP8PHNpmcKdg@mail.gmail.com>
	<bc67d00aa872e879748e6b05fe3a104304194c07.camel@intel.com>
	<c03634be-a243-4975-97fc-0211313ab32a@gmail.com>
	<92a4baed36443295a7ce12444120bb1afb09f1e5.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <06a1d07e-6418-c1ab-211a-4f03f9278948@gmail.com>
Date: Tue, 18 Feb 2020 19:35:05 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <92a4baed36443295a7ce12444120bb1afb09f1e5.camel@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] gstreamer1.0-plugins-good: change EXTRA_OECONF -> EXTRA_OEMESON
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
X-List-Received-Date: Wed, 19 Feb 2020 03:35:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 2/18/20 7:04 PM, Mittal, Anuj wrote:
> On Tue, 2020-02-18 at 18:55 -0800, Khem Raj wrote:
>> On 2/18/20 6:43 PM, Mittal, Anuj wrote:
>>> On Tue, 2020-02-18 at 18:39 -0800, Khem Raj wrote:
>>>> On Tue, Feb 18, 2020 at 6:37 PM Anuj Mittal <
>>>> anuj.mittal@intel.com>
>>>> wrote:
>>>>> Use the correct variable so options actually get used and use
>>>>> the
>>>>> correct qt option name to prevent errors.
>>>>>
>>>>> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>>>>> ---
>>>>>    .../gstreamer/gstreamer1.0-plugins-
>>>>> good_1.16.1.bb             | 4
>>>>> ++--
>>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-
>>>>> plugins-good_1.16.1.bb b/meta/recipes-
>>>>> multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.1.bb
>>>>> index a6eb9986dd..07a0bf5085 100644
>>>>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
>>>>> good_1.16.1.bb
>>>>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-
>>>>> good_1.16.1.bb
>>>>> @@ -55,7 +55,7 @@ PACKAGECONFIG[x11]        =
>>>>> "${X11ENABLEOPTS},${X11DISABLEOPTS},${X11DEPENDS}"
>>>>>    # This is better done in a separate qt5 layer (which then
>>>>> should
>>>>> add a "qt5" packageconfig
>>>>>    # in a gstreamer1.0-plugins-good bbappend).
>>>>>
>>>>> -EXTRA_OECONF += " \
>>>>> +EXTRA_OEMESON += " \
>>>>>        -Daalib=disabled \
>>>>>        -Ddirectsound=disabled \
>>>>>        -Ddv=disabled \
>>>>> @@ -64,7 +64,7 @@ EXTRA_OECONF += " \
>>>>>        -Doss4=disabled \
>>>>>        -Dosxaudio=disabled \
>>>>>        -Dosxvideo=disabled \
>>>>> -    -Dqt=disabled \
>>>>> +    -Dqt5=disabled \
>>>> this perhaps should be a packageconfig so people using meta-qt5
>>>> can
>>>> enable it
>>> Yes probably but in a separate change I think. This just ensures
>>> that
>>> the right options are used and nothing else is changed.
>>
>> perhaps no, since it will regress meta-qt5 which already does
>> something
>> like this
>>
>> https://github.com/meta-qt5/meta-qt5/blob/master/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_%25.bbappend
>>
>>
>> this being wrong in OE-core was ok for meta-qt5.
> 
> Okay, should that PACKAGECONFIG be added here? I don't use or test qt
> so can't test the change.

thats fine, add it as a PACKAGECONFIG as done in bbappend and then we 
can eventually stop defining it from meta-qt5

> 
> Thanks,
> 
> Anuj
> 

