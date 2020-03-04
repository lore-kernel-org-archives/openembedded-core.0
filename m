Return-Path: <jpuhlman@mvista.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8DC3D60742
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 23:48:07 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id f21so3871334otp.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 15:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=CiOOK74IMREFpvC82kTuVIZka/apoQgF8P5j41WdbFo=;
	b=ukQ2e+JFBOJi2MNhEPXeAyC2YOOGQez0A3g/FVFYDw7Zf0JiNWY0Bl+fpMhsYx7G+M
	MShNTK8oMLMv9wbphU+M3cTN1jVYBcyyLXgZPvGlZHnHMy6g8ntlRcLtgvGN9XI2lvOY
	yjWe90GZeyNY+yc4SzA6eWtm6XWh77KroVPSNWsUXvKh2eIGsFVaqo05l+CekKKncoEP
	C2z9wz6aOcSo0rgep48A+2ZJ/XGgJAYzuExf/jg/csmuocfABFjR5FhPpqx166CQqPZz
	eTMtv2tq5hjP5kIhcCJYZEgL9+0lGTHmCFuoMcHJO4LyIL5JLn2ggCh+rZw9QoTeP7+6
	pBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=CiOOK74IMREFpvC82kTuVIZka/apoQgF8P5j41WdbFo=;
	b=cTWNKVJD0LcfB03JNQhFyPUWuMtS0Y3V6s/HBgNiq6L+OlENw2LkvnpMCrhAEgKa3f
	h0UF3SoHdXSSNw5/nyix9inSGOx8IZ/2aUySvZyhXKODD2D3O6zRyzxTLROuAn0cOrf2
	Xho07NBACFM4tZ0x03PAOJa1cqqs3EasvmkdLZf+VvKLs0Ez+swJSkDD1hFsnZGgzmsS
	6sTQF2CskxJNBSid1Tp99QDLtl6Rsr45nFn8f/jwhGiuH/jSm27JkzhsmXUABIjxoNLS
	vNABj15AV9PU0nuFeo5ByQnxsShRFVAwxmpMANLMBS5O1AnHIuvTm+z4kP38r5HyH6rH
	Y48w==
X-Gm-Message-State: ANhLgQ3BGq1TijEtMqIS9PK+ypQinwxdeGTexcu/IJ/UonhrZgq6FMd2
	YZX2wdWsovh7IdWf7Rl4OXT+PBT0xRU=
X-Google-Smtp-Source: ADFU+vsaoxMIeKaoWm2aNs9U5Ic6FHRnOwroCVdh6sDsmHG3Vs9IFDQgDFjJskRPPqqwtlgfSmQqbQ==
X-Received: by 2002:a05:6830:186:: with SMTP id
	q6mr4190022ota.10.1583365688098; 
	Wed, 04 Mar 2020 15:48:08 -0800 (PST)
Received: from ?IPv6:2600:1700:4c90:60a0:d40a:79d1:acb0:3414?
	([2600:1700:4c90:60a0:d40a:79d1:acb0:3414])
	by smtp.gmail.com with ESMTPSA id
	u62sm5278571oif.49.2020.03.04.15.48.06
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 04 Mar 2020 15:48:07 -0800 (PST)
To: Andre McCurdy <armccurdy@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <20200304222447.1787-1-jpuhlman@mvista.com>
	<CAMKF1so0sueuAe73mCuHkU99s9a70EiXDg+5P3CpRE3hbAYicQ@mail.gmail.com>
	<CAJ86T=WvfFrSFakLWEXE=TTi1aw9zcVWdAxrAS7N7ZiDA1mvww@mail.gmail.com>
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <e097eb31-2f0e-cdda-cb5e-2484aeceadf3@mvista.com>
Date: Wed, 4 Mar 2020 15:48:03 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WvfFrSFakLWEXE=TTi1aw9zcVWdAxrAS7N7ZiDA1mvww@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdbm: add depend on readline for consistent builds
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
X-List-Received-Date: Wed, 04 Mar 2020 23:48:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/4/2020 3:43 PM, Andre McCurdy wrote:
> On Wed, Mar 4, 2020 at 3:22 PM Khem Raj <raj.khem@gmail.com> wrote:
>> On Wed, Mar 4, 2020 at 2:25 PM Jeremy A. Puhlman <jpuhlman@mvista.com> wrote:
>>> From: Jeremy Puhlman <jpuhlman@mvista.com>
>>>
>>> Whether readline is installed on the build host or not
>>> influences the way gdbm builds. Depend on readline for
>>> a consistent build.
> It sounds like configuring with --without-readline would be a better solution?
Its an either/or. I suggested both in the bug(13714) basically either works.
>
>>> This fails to build on a system with readline, and using
>>> the buildtools-extended installer.
>>>
>>> Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
>>> ---
>>>   meta/recipes-support/gdbm/gdbm_1.18.1.bb | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta/recipes-support/gdbm/gdbm_1.18.1.bb b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
>>> index 7e2efe3c9b..5326184181 100644
>>> --- a/meta/recipes-support/gdbm/gdbm_1.18.1.bb
>>> +++ b/meta/recipes-support/gdbm/gdbm_1.18.1.bb
>>> @@ -15,6 +15,8 @@ SRC_URI[sha256sum] = "86e613527e5dba544e73208f42b78b7c022d4fa5a6d5498bf18c8d6f74
>>>
>>>   inherit autotools gettext texinfo lib_package ptest
>>>
>>> +DEPENDS_class-native += "readline"
> Don't use += with an over-ride. It doesn't do what you might expect.
Okay.

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


