Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5EA46771A3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Aug 2017 15:21:17 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id t138so3538821wmt.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Aug 2017 08:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=NzUdgWM7iO0f7apeCSzp5pAbexCkNcazrdqBfpCCmqA=;
	b=Hgb3pAPm+NBeLuvvQdHUueLnPbUOW10kYtuMl42OeWoCgjwa8XQeUAebwhNi9zAgcY
	B9utCGBrSKZXcCFAttv62JgGSZT9EcTbFJvss6aisDcWMdJFf2iyudmrOuRm/9ps1AU0
	nb79Hz8sixTzo7wn5qrDNbkqycOAuElGjkVjqKkfKk9i0HKPyaOASpS7bjqvuOk5djw0
	WutEPFgcXBsXJ/EjDJMWqC+bksJlO3RDxWBl8iIR1H/2FeALBhAy/fW26pQwK5jJGb4H
	gHXuw9ANay2pEN0nPjNOOAONVOFpbPWR+YMSTGC8+Vtgi5UIzU6Q5T1eMHtfrS9NQ3El
	b0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=NzUdgWM7iO0f7apeCSzp5pAbexCkNcazrdqBfpCCmqA=;
	b=jppCHLZTv1WRh79TFEKliSnKdoA4P86I85x0ZwoFPmqmt3MtcLfGgfZzqtnQy38dzs
	51uZhNcAdOnBe9ptoBorzQ2QYOIuyms/f10/k+CSMCXHIpn77lAna3nV03nOdgSWQbcN
	aul5mJ/8ePox9H2LUrYmOEuxyzdhgS+gKl+my45i+aKYv9vOD2WkckUS+eBZ3h3mYLOd
	CPyGY1e1kQA5SGrZvnNwJdI55M7llC1Een8NZVcMzRRQtm6Fq84UBhJct02+FwoK5n1E
	ffrYrX2p9JY5HDbM/7KPHUIH1/tyrIbv4f1pEyQoIY9gcSfKDKnPudfOFMEGzIz1EhTx
	aOcw==
X-Gm-Message-State: AIVw112xpaR3QQdkXuxCJ2C6IkH5ymUPLsktVthznywDLp6vyJFboOKN
	QBU1mWtJhMo5dcvIRr7mFGlxvrk1Yg==
X-Received: by 10.80.176.162 with SMTP id j31mr18475161edd.186.1501600878979; 
	Tue, 01 Aug 2017 08:21:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.181 with HTTP; Tue, 1 Aug 2017 08:20:48 -0700 (PDT)
In-Reply-To: <ef1580a9-9643-f8ad-1865-78fc5f6aeec4@gmail.com>
References: <1501521367-17192-1-git-send-email-akuster808@gmail.com>
	<1501521367-17192-2-git-send-email-akuster808@gmail.com>
	<b07d8080-7ad5-c68e-5c8b-471db09ff515@windriver.com>
	<1984b5e8-8d54-4f03-dcdb-b086605b4a91@gmail.com>
	<c5907c3e-ae33-625a-d214-30d130a5a37b@windriver.com>
	<e0e65de3-e49a-b1af-9bd7-67a6d33ba859@gmail.com>
	<ef1580a9-9643-f8ad-1865-78fc5f6aeec4@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Aug 2017 08:20:48 -0700
Message-ID: <CAMKF1sp+4C4XPUf5Xhc=fhKiidy-YHqrkLZzhGpToTexCV=1pg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] armv8: update to use armv8-a tune
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
X-List-Received-Date: Tue, 01 Aug 2017 15:21:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 1, 2017 at 8:17 AM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 07/31/2017 12:04 PM, Khem Raj wrote:
>>
>>
>> On 7/31/17 10:51 AM, Mark Hatle wrote:
>>>
>>> On 7/31/17 12:40 PM, akuster808 wrote:
>>>>
>>>>
>>>> On 07/31/2017 10:31 AM, Mark Hatle wrote:
>>>>>
>>>>> On 7/31/17 12:16 PM, Armin Kuster wrote:
>>>>>>
>>>>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>>>>> ---
>>>>>>   meta/conf/machine/include/arm/arch-armv8.inc | 25
>>>>>> +++++++++++++++++++++++++
>>>>>>   1 file changed, 25 insertions(+)
>>>>>>
>>>>>> diff --git a/meta/conf/machine/include/arm/arch-armv8.inc
>>>>>> b/meta/conf/machine/include/arm/arch-armv8.inc
>>>>>> index 5e832fa..dc1ba5e 100644
>>>>>> --- a/meta/conf/machine/include/arm/arch-armv8.inc
>>>>>> +++ b/meta/conf/machine/include/arm/arch-armv8.inc
>>>>>> @@ -1 +1,26 @@
>>>>>> +DEFAULTTUNE ?=3D "armv8-a"
>>>>>
>>>>> do we want the '-a'?  The other arm (7) are of the format armv7a (no
>>>>> '-').
>>>>
>>>> works for me either way.
>>>>
>>>> While we are at it. How would we want =E2=80=98armv8.1-a=E2=80=99, =E2=
=80=98armv8.2-a=E2=80=99,
>>>> =E2=80=98armv8.3-a'
>>>> formated as?
>>>
>>> My preference is to drop the '-'.  As for the '.', I'm not sure.. not
>>> something
>>> we've run across before.
>>>
>>> We could just drop it (the '.'), but it really depends on if armv81a
>>> would
>>> confuse someone (familiar with arm) or not.
>>
>> I would suggest to also sync  with other distros and ensure that we dont
>> do something different. Its very costly later. Since applications get
>> ported to most common combination
>
> Sync what part? naming of file? ( sorry lost regarding your comment)

naming convention for arch e.g.

