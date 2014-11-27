Return-Path: <lpapp@archlinux.us>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 1544E723A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 18:04:22 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id hy10so2384610vcb.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Nov 2014 10:04:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:date:message-id:subject:from
	:to:cc:content-type;
	bh=X4AuOG01Wi9WlXevGMINCIe+SyGyXUW/YQqyxquAh+E=;
	b=UW5hbKNB8M2n7cakO9MOrhOo4PuCFe+Ur1mHMLBoE3zIG/4d7fvocnqRnMEIstv8uL
	2640YvVUMzUAGJfAHR7e6Wy7kgZt7+hOZTvJkm8IZZ2N65CbpJc6D0+YZE4DYaESQB+M
	rmD2iymuoDgSYqgerhRl3yirYFV0ZJO9CuvXJnZXNBuq9DBdOGkyU4xgAxc4c021cMGq
	X7ykzSNK3H9jo4x9bRO2Tqc5siXklcaJNUS/FzO9Isj6gVcVVfPPMcHb0OcCk0CbjGtq
	2/pNTnfaw2Vys6jTSKFetM3LHgebsttinJmmneMs4XWPkpJUJuWRYUWQ0F5GPQ3t4rrJ
	jt/A==
X-Gm-Message-State: ALoCoQk4rlaaamNlHwDcm6Z1meFpm8Kn8EwRZkFnNTDiJj6IsE9uN0Yd8V/IvGmt48xpjNOytFak
MIME-Version: 1.0
X-Received: by 10.220.250.198 with SMTP id mp6mr20784272vcb.19.1417111463024; 
	Thu, 27 Nov 2014 10:04:23 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.31.188.129 with HTTP; Thu, 27 Nov 2014 10:04:22 -0800 (PST)
Date: Thu, 27 Nov 2014 18:04:22 +0000
X-Google-Sender-Auth: iVVOA_FVngNn_TrTS6D5-DHMzrs
Message-ID: <CAOMwXhNuu5_U_b-9X8JD+4tSG65++Y5h6tXFF6X_0jGpMsgJgg@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>,
	Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Adding cgdb to meta
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
X-List-Received-Date: Thu, 27 Nov 2014 18:04:25 -0000
Content-Type: text/plain; charset=UTF-8

Heh, I apparently inspired Ben who three days later added cgdb native
to meta-oe. Now, I gained enough motivation to retry this contribution
thing. Should I submit my cross version? We cannot use the native
variant due to our limited embedded system.

Martin, can you advise, please?

On Tue, Aug 12, 2014 at 4:56 PM, Laszlo Papp <lpapp@kde.org> wrote:
> On Tue, Aug 12, 2014 at 4:55 PM, Laszlo Papp <lpapp@kde.org> wrote:
>>
>> On Tue, Aug 12, 2014 at 4:51 PM, Laszlo Papp <lpapp@kde.org> wrote:
>>>
>>> On Tue, Aug 12, 2014 at 4:48 PM, Burton, Ross <ross.burton@intel.com>
>>> wrote:
>>>>
>>>> On 12 August 2014 16:46, Laszlo Papp <lpapp@kde.org> wrote:
>>>> > That layer is too big. It is nearly everything that is rejected from
>>>> > meta;
>>>> > ok there are some dedicated layers, like meta-networking, but it feels
>>>> > like
>>>> > the last resort shelter where everything can just be thrown at.
>>>> >
>>>> > I do not think it is just us who do not wanna pull it into their
>>>> > project.
>>>> > Never mind, it remains to be a feature in our layer, which is closed
>>>> > source,
>>>> > then. It is a pity, but I will move along.
>>>>
>>>> People who think its too big are welcome to copy recipes out of it and
>>>> sync them manually - that's still better than not sharing the recipe.
>>>
>>>
>>> I am unfortunately not interested in participating to something that I
>>> have no intent to even test myself before submitting. meta-oe became a
>>> monster can which I personally would not like to deal with. That is said
>>> with due-respect. If its goal were reconsidered and split into several small
>>> layers, then mayhaps... But it is not there, and I am not sure if it was any
>>> soon...
>>>
>>> Unfortunately, this feature remains proprietary at the point of writing
>>> this. As long as it works for me, I will not be too much bothered, although
>>> I feel sorry for those who will need to reinvent the recipe, modulo
>>> stabilization.
>>
>>
>> But that is alright as long as everyone else finds the IMHO cumbersome
>> workflow with gdb OK for debugging. I think pleasant debugging is very
>> important for developers, and cgdb is still a command line based tool,
>> basically a thing wrapper on top of gdb with ncurses. It is not like "ddd"
>> and other heavy tools. That is why I thought with minor addition, meta could
>> be increase the software development experience; gdb is just way too raw to
>> be effective. But again, no one else might share this opinion, so let us
>> move on.
>>
>> Here is a reminder screenshot for those who do not know it, just in case:
>> http://cgdb.github.io/images/screenshot_debugging.png
>
>
> Alternatively, feel free to advise any sufficient debugging experience with
> oe-core. I will happily switch to any opportunities that reach this level.
>

