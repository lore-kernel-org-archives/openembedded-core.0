Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id EED8F77811
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 21:10:10 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id u5so3321887pfh.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 14:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=abiprFVLqYDhE294uFCHZCqR6/b62Wet2ec3okRSKf4=;
	b=W2hTmZr67M/zoIKliXvica94V0m13aFWjnTK32rMaBxbZvseG3Whw5CEyeeP5bfPze
	PFc3GfN535KlLo7KDpfMTb7wjGxtNSAMh3WlDo3xA8EpeZKOkgtFeIcPJkoZR/+mHI+n
	yhHOTWnYERLtWfDOjislrLulYHgg8+vYsuV52bcXFxE/+J0m6Oyky6QQslXv2m0r4o1p
	bj1gaX4LshqPJn8KYjRaJZTzjQPa5IjyEoieE/b6yJ0iwG5M0RCEQ0+ojbOeqtOFjDK6
	m3EnLNufFwBnvXIhJZ/5HvUIZMqafx54RHj2wZcv6NRzvebcTlg3p097piyXZOtdK5Na
	Z+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=abiprFVLqYDhE294uFCHZCqR6/b62Wet2ec3okRSKf4=;
	b=V4lVC75ISm4L6QcUyHMbOdMxTm22HZeFHHdoUTXp8L9W0gr0yrNZAwqSYXZ7JiN64u
	bihOHxIbp1a/mBMIh4DtcCwaibQdJBVnGXZt5e6GuD6vvkinUg3PA0OUF1XyeVG0XD3w
	M/iYF7C7/vhKm1D/uqf6kZUxlUQsGw8WRsg8IVEFEPj/JjpoUb7W27cvM6rZcjPygigT
	6jO3oWGPaMpBrgxR9W6bdwq1cnv+qgMjmJC9GEWh1s6IbZisfPVpMv/QIiwdYgTviPRi
	7X2F2RqY3LgNcGadP0FAVCcLKNyLMC/RqVRZM7tjdUW/KfJGG46hQn2ycT7RGWXjabiQ
	rBwA==
X-Gm-Message-State: AElRT7H9riatcFhEOKEYw5lK2VfgQ4QAW5DVqpf4H2OzgWxIAJaqDHNh
	tu20MMyq1jy7jdw75kjMwlTViQ==
X-Google-Smtp-Source: AG47ELtdPfCEptUDkkbFLTHJh3524+g3r0MqHhVllaE/kZ9ddnvbG7obMXsrcL779hfJ7AoNsgxNHw==
X-Received: by 10.101.96.142 with SMTP id t14mr7660601pgu.58.1521148210961;
	Thu, 15 Mar 2018 14:10:10 -0700 (PDT)
Received: from [172.16.131.121] (nat-wv.mentorg.com. [192.94.38.34])
	by smtp.gmail.com with ESMTPSA id
	o3sm10099550pgp.18.2018.03.15.14.10.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Mar 2018 14:10:09 -0700 (PDT)
To: Denys Dmytriyenko <denis@denix.org>, akuster <akuster@mvista.com>
References: <CAK18fxEEZRnHzobX=Lt2By_VYgEzi36nSU+X_94Etegh8E81mg@mail.gmail.com>
	<cc978b8d-afa0-5ea2-ba5d-9700bab26fdc@linux.intel.com>
	<EBAEBC3AA1B73F4887F286A6723535236597E79C@BGSMSX102.gar.corp.intel.com>
	<CAK18fxGNk3vxKeLVpoa7TCuuCq_jkkmMmj3D6Z-hM494ASF5kA@mail.gmail.com>
	<CAK18fxHDUWXhLuqRn0h2Kq+m3M34PwPhJTpwhAnm3bEqN22x0g@mail.gmail.com>
	<2be633e3-4845-fe97-07fe-dbf12beaf9d4@gmail.com>
	<EBAEBC3AA1B73F4887F286A67235352365980978@BGSMSX102.gar.corp.intel.com>
	<EBAEBC3AA1B73F4887F286A67235352365982A04@BGSMSX102.gar.corp.intel.com>
	<20180305202408.GE2786@denix.org>
	<20ae973a-1a8e-3950-193c-4adda84c513f@mvista.com>
	<20180315174854.GW2786@denix.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <82bfa84f-c352-5997-829c-26434f100c10@gmail.com>
Date: Thu, 15 Mar 2018 14:10:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180315174854.GW2786@denix.org>
Cc: "Palleti, Avinash Reddy" <avinash.reddy.palleti@intel.com>,
	'openembedded' <openembedded-core@lists.openembedded.org>
Subject: Re: Linux firmware for iwlwifi 8000c disappeared in pyro
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
X-List-Received-Date: Thu, 15 Mar 2018 21:10:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 03/15/2018 10:49 AM, Denys Dmytriyenko wrote:
> Ping. Any ETA for when it will be merged to morty?
I will run a build this weekend for formal submission to morty.

next week maybe?
- armin
>
>
> On Mon, Mar 05, 2018 at 01:29:22PM -0800, akuster wrote:
>> its in stable/mory-next
>>
>>
>> thanks,
>>
>> Armin
>>
>>
>> On 03/05/2018 12:24 PM, Denys Dmytriyenko wrote:
>>> Same thing just broke morty!
>>>
>>> http://cgit.openembedded.org/openembedded-core/commit/?h=morty&id=c134c583e0ef315e88644d94e5a3920b92c6f39d
>>>
>>>
>>> On Mon, Feb 26, 2018 at 08:16:55AM +0000, Palleti, Avinash Reddy wrote:
>>>> Gentle Reminder.
>>>>
>>>> Thanks,
>>>> Avinash
>>>>
>>>> From: Palleti, Avinash Reddy
>>>> Sent: Wednesday, February 21, 2018 10:22 AM
>>>> To: akuster808 <akuster808@gmail.com>; Andrei Gherzan <andrei@gherzan.ro>; akuster@mvista.com
>>>> Cc: openembedded <openembedded-core@lists.openembedded.org>
>>>> Subject: RE: [OE-core] Linux firmware for iwlwifi 8000c disappeared in pyro
>>>>
>>>> It needs to be merged in both pyro and pyro-next.
>>>>
>>>> Thanks,
>>>> Avinash
>>>>
>>>> From: akuster808 [mailto:akuster808@gmail.com]
>>>> Sent: Wednesday, February 21, 2018 10:17 AM
>>>> To: Andrei Gherzan <andrei@gherzan.ro<mailto:andrei@gherzan.ro>>; Palleti, Avinash Reddy <avinash.reddy.palleti@intel.com<mailto:avinash.reddy.palleti@intel.com>>; akuster@mvista.com<mailto:akuster@mvista.com>
>>>> Cc: openembedded <openembedded-core@lists.openembedded.org<mailto:openembedded-core@lists.openembedded.org>>
>>>> Subject: Re: [OE-core] Linux firmware for iwlwifi 8000c disappeared in pyro
>>>>
>>>>
>>>> in stable/pyro-next
>>>>
>>>> On 02/20/2018 04:50 AM, Andrei Gherzan wrote:
>>>> On Fri, Feb 16, 2018 at 2:08 PM, Andrei Gherzan <andrei@gherzan.ro<mailto:andrei@gherzan.ro>> wrote:
>>>> On Fri, Feb 16, 2018 at 1:48 PM, Palleti, Avinash Reddy <avinash.reddy.palleti@intel.com<mailto:avinash.reddy.palleti@intel.com>> wrote:
>>>>  I submitted a fix sometime back,
>>>> http://lists.openembedded.org/pipermail/openembedded-core/2018-February/147291.html
>>>>
>>>>
>>>> Great. We have the fix available and approved by Saul. Shall we merge?
>>>>
>>>> Adding the pyro maintainer to this thread.
>>>>
>>>> --
>>>> Andrei Gherzan
>>>>
>>>>
>>>> -- 
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


