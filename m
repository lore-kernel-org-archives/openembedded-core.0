Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id CC9136E83C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jan 2014 11:22:32 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id hq11so2436863vcb.14
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jan 2014 03:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=7lT6H63yDfP0l+rMh72dA67OPBfmWIpd9vz6afMFSaQ=;
	b=B5zVMECpoDwH/NQQW3KfHI4Rx+sf4gJXnkUMybEUi1VpvLrku/DJ7psTiyjVvxJw+j
	uiDwwoTbFZRHEJdSJqSCrDLd0P4rE6ITm9EjPhlrPIVVyrWoQJhqnYa+QL2QbY2rWquX
	aDsGy/S2ANcqapkkcgUaonfNHJrdjvobfB114STjmlVEsX1xl0u95o9YVHDPP/Azc3z6
	I74cw82+qhPtCdrwW/NsfNnFuvU7gnKDOs0EzRCKr7fJb8GyxiI2+1vVUq81s5WYriJs
	f91UFWfIiL/H1KNX24wtXeaUiVljS+zN6d+u1tWntABiL1F+47YMaiMuocKfbY/nBZPF
	Wp9g==
X-Received: by 10.58.58.3 with SMTP id m3mr5587080veq.32.1390648952926; Sat,
	25 Jan 2014 03:22:32 -0800 (PST)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Sat, 25 Jan 2014 03:21:52 -0800 (PST)
In-Reply-To: <52E2C97A.8010906@pseudoterminal.org>
References: <52E10247.8050700@pseudoterminal.org>
	<52E15760.8050606@balister.org>
	<52E2C97A.8010906@pseudoterminal.org>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Sat, 25 Jan 2014 11:21:52 +0000
X-Google-Sender-Auth: 2LiKf33HRDawooCUhXoGNAZzfYs
Message-ID: <CANyK_8dtZROz++1h+pHiram1bhJbeP1YJaV+DeZS20MJMyd=vA@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Berkeley DB fails to build
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
X-List-Received-Date: Sat, 25 Jan 2014 11:22:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 24 January 2014 20:13, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
> On 2014-01-23 18:54, Philip Balister wrote:
>>
>> On 01/23/2014 06:51 AM, Carlos Rafael Giani wrote:
>>>
>>> Hello,
>>>
>>> I noticed that since the C++ bindings for the berkeley DB were included
>>> in commit 23f29027db73d5759889b48fabdea7f6173217a7 , I cannot build db
>>> anymore.
>>> The error is:
>>>
>>>      /usr/lib/libstdc++.so: file not recognized: File format not
>>> recognized
>>>
>>> this is the offending part in the log.do_compile file:
>>
>> What distro is your build machine running? I've this from people using
>> Arch Linux.
>>
>> Philip
>>
>>
>
> Indeed I am using Arch Linux. I also checked the logs, and did not find any
> isolated /usr/include or /usr/lib/ paths.
>

It looks like the patch Tyler Hall just posted to the mailing list
solves this problem for me - give it a try!

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

