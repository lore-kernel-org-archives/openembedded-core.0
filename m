Return-Path: <jpuhlman@mvista.com>
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by mail.openembedded.org (Postfix) with ESMTP id AE88D60B17
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2020 19:17:00 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id y21so1976148pfp.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2020 11:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=+ZxbN1F/pbKOTCRw3Jkr0vOqw/+PVnI20fbjQ6xYqiU=;
	b=QAm/mjkAo+setm9N1xrcIi8XMWcDFp5eUVhOwkkrqoeXTS1g+m1JwD3yuB6cHdGhr3
	bhJOwR4RisKyuPD1xERY8uL4ark7+Q4Uog64FoEUCszrLzHQlDU8hIzuanFL5kVfRMxC
	EuVHP3JfC/YX5d77JklpcjxJW/j+JXIB1LlB7neoPhY/8xo0ZfjnlIIzPMWQsJjGnVhq
	oyQ4HLrexclIYRiPP3nED0ev+oj/t6xlvlGSqq4T7v/V45L/ib3oDtvBRr3M898AfydV
	ED7LHkgr4ZgeDOIfE+PO7fYZno+riCwAupHOa2AMpo0rprRxNokgkEAaayvV+F13QGzl
	+gWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=+ZxbN1F/pbKOTCRw3Jkr0vOqw/+PVnI20fbjQ6xYqiU=;
	b=N1Nny379p82Q60oPbsMoFXaaYxiEDfghoaQhFVkbSXnHMvOrLZ3uZ2gOaNYn7I9jm2
	tMWGWsD5vtTD63QZN6bfTrIhmePpHmD3wq/7K0rczRnehn/Su7OB1JzusKGHFMyFYPGF
	wuEZrkYs4vgglA8+wfR+59M+nN2ULkWwJQmmPyq5LH2rxxD45ImG2a7VNTZ446A2JazA
	8Ttj5wOp+dzoTQeOOrsn5Bm+UA4LpEhMw4UDlBNmGBu/SDC4LVyiandBDzMyKdQkAaoc
	NaPP2R2GMk4wl0N1OcrsKhH0NaxnY84NW+qBwrRzikfF1fzie+SomJB1PzHcWsV9Hja/
	d6mw==
X-Gm-Message-State: ANhLgQ1aTqBZs9DU5bTYD/wZ2sYzEhQfaDKVgJTC251Wrs/+lKnkwri/
	/6YWq+mpLFbsWcs8tpDtN5J1jxVKNQQ=
X-Google-Smtp-Source: ADFU+vv9iKJN1AI3Y920VHotkJwdvS+JlHBq06S12vGz+k5YlmSD50HaXTjevqAAOzReC4cREaX2rg==
X-Received: by 2002:a63:4a58:: with SMTP id j24mr5497211pgl.166.1583263021160; 
	Tue, 03 Mar 2020 11:17:01 -0800 (PST)
Received: from [10.20.245.7] ([45.19.219.178])
	by smtp.googlemail.com with ESMTPSA id
	q11sm25642530pff.111.2020.03.03.11.16.59
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 03 Mar 2020 11:17:00 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Tim Orling <ticotimo@gmail.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
References: <20200302074035.Horde.5xguZSt_-_Yd241eE1Zo8Pb@crashcourse.ca>
	<52350a7bd080413c9dbc6e1783f14e2c@XBOX03.axis.com>
	<CANx9H-Ci4Rsw3WDkYdwzw1AYeZMhiHrZWkiTkHp7WG1j5hhFUQ@mail.gmail.com>
	<c2e7a031d09edec6cb85fedf49b9afc3f55ac821.camel@linuxfoundation.org>
From: Jeremy Puhlman <jpuhlman@mvista.com>
Message-ID: <418c43d7-a2ce-6ad6-e9e5-c72ed390df9f@mvista.com>
Date: Tue, 3 Mar 2020 11:17:40 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c2e7a031d09edec6cb85fedf49b9afc3f55ac821.camel@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: how to cleanly centralize a zillion BBCLASSEXTEND += "nativesdk" settings?
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
X-List-Received-Date: Tue, 03 Mar 2020 19:17:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/3/2020 6:38 AM, Richard Purdie wrote:
> On Tue, 2020-03-03 at 06:25 -0800, Tim Orling wrote:
>>
>> On Tue, Mar 3, 2020 at 4:32 AM Peter Kjellerstedt <
>> peter.kjellerstedt@axis.com> wrote:
>>>> -----Original Message-----
>>>> From: openembedded-core-bounces@lists.openembedded.org
>>> <openembedded-core-
>>>> bounces@lists.openembedded.org> On Behalf Of
>>> rpjday@crashcourse.ca
>>>> Sent: den 2 mars 2020 13:41
>>>> To: openembedded-core@lists.openembedded.org
>>>> Subject: [OE-core] how to cleanly centralize a zillion
>>> BBCLASSEXTEND +=
>>>> "nativesdk" settings?
>>>>
>>>> layer i'm currently perusing has many, many bbappend files, of
>>> which
>>>> quite a number are nothing more than the single line:
>>>>
>>>>     BBCLASSEXTEND += "nativesdk"
>>>>
>>>> literally, at least a hundred append files are like that. so
>>> rather
>>>> than clutter up the layer with all those trivial .bbappend files,
>>>> can one cram all that into a single .conf file? as i read it, can
>>> i
>>>> do something like:
>>>>
>>>>     BBCLASSEXTEND_append_pn-pkg1 = " nativesdk"
>>>>     BBCLASSEXTEND_append_pn-pkg2 = " nativesdk"
>>>>     ... and on and on ...
>>>>
>>>> and toss all that into a distro.conf file or something?
>>>>
>>>>     and even if that works, is it considered good coding style?
>>>>
>>>> rday
>>> Sounds perfectly fine. We do something similar, but in our case we
>>> need
>>> to add "native" to BBCLASSEXTEND for a whole bunch of recipes.
>>>
>> Should patches be sent to add native and nativesdk? Drop the
>> technical debt by upstreaming...
> I'm torn on this since adding these does have performance impact. We've
> talked about adding them as defaults but it does increase parsing time
> and so on...

Why not a couple of distro level classes?
all-recipes-native
all-recipes-nativesdk

Or something similar.

Then you can turn it on if you need it, and leave it optional to not 
impose a parse performance pentalty on those that don't need or want it.

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


