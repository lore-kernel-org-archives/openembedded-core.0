Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f43.google.com (mail-pl0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 724C57825C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 20:57:58 +0000 (UTC)
Received: by mail-pl0-f43.google.com with SMTP id u11-v6so8172012plq.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 13:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=L6bo2yXx8h+Q5y9X+Mdu7dwud9R77VnAs9HSo/QI5Wg=;
	b=QwgTSVpFbLxmcGvyB0O5lRbZ5T9/V/8M3iUB0oCAk5D0f0tGUYdIe9IfQSc9tXuCZb
	uSylUL/P2COLMNZfx1FxGv0RgKxiLPMJi84jBqA4N+gP38+0RfUat0cFr0uJVyhMWH4e
	SdDP0NZPXvKH+vHAvTI1wlTkJYnDyDE3FmDMPyKkA+DCdK3/0zgrzA151idKszEt3QHP
	QggF/qfZ64f80ltSScG0pNcF2ljP/uoddRNs4uZDgOGxmRQkLPPG0Cr1nqTsil1ofU1x
	gPawYbWo+szD6v1lQ+gGgIEynZ/xLj0HqQRZW7zzK38rqU1r1H5G13KbykKFnTWbE+Es
	kP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=L6bo2yXx8h+Q5y9X+Mdu7dwud9R77VnAs9HSo/QI5Wg=;
	b=T+rNzOaBwjIYMl2l5ELIFyZ69Ql484ALBTstrj0D8MgvID7U7/wNbRpH+dS2egj1pd
	zfZM+vqcjf5kPnKpP5nj072cAhAom1Vqsa3phicTSbTbMCwoAi4jUaoh5pd4Lu9ssM05
	QyOzGu61/Exr5+qzO9v7/HwW4kwFMZ7uhPn/wo8RrevKqrz03KNK7BjRUNP5/Uk5nDJs
	z7v5pxuElfYlXsMUPBz/yNgI4tkQYPSEXS4T+Gnc5HL5qqsHOhzHQquPhf09wRQGuhTS
	lWalkxTh64xZba0qpu1lkvqpRTbZ3y0UlPTZEIidQLf0Uc++gJJoU9rZld2vOakQfJRz
	BU5w==
X-Gm-Message-State: AElRT7F6zUTYp+V1dvr0ZFeOgstYraef27tnKCpqlARtDO8MRH5QCpCX
	uU6hK1o+kj5QvsUxg9rpJ2+tEg==
X-Google-Smtp-Source: AG47ELtXe8g5yUe288wDrPpNrzAlmwKBhN9EWs9d4BscbNjBQlPVEOmyIEx5UiQa5O/oDvt5iOQs0Q==
X-Received: by 2002:a17:902:c6:: with SMTP id
	a64-v6mr25566341pla.408.1521838680417; 
	Fri, 23 Mar 2018 13:58:00 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:a96b:97ea:4935:383?
	([2601:202:4000:1184:a96b:97ea:4935:383])
	by smtp.gmail.com with ESMTPSA id
	r129sm22621534pfc.83.2018.03.23.13.57.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Mar 2018 13:57:59 -0700 (PDT)
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
Message-ID: <fbad2385-798f-bc58-4a6a-8b1a711fd5e5@gmail.com>
Date: Fri, 23 Mar 2018 13:57:57 -0700
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
X-List-Received-Date: Fri, 23 Mar 2018 20:57:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 03/15/2018 10:49 AM, Denys Dmytriyenko wrote:
> Ping. Any ETA for when it will be merged to morty?

Not sure if I answered this. Its now in morty

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=morty&id=34b26ec18450a3bc72f7b8a0f2df0bfaae1140dd

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


