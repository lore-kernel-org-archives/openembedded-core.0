Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id BCC3F65CBC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 19:54:53 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id j2so5282723qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 12:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zLjyGR+2TvdIUmrcHaCXg557pWleiHheUEtZrCTDgB0=;
	b=pvkqvzNKxjbUWex2TM9MfcX7GnRIe/gDs5jLazmZ+KUBnxoxQmq8TucW2nHBSakmk6
	4E9FMIBm+32yMo8vxU3M+A0WB+hh25BJRhmqmW0BQ05/s4Yd4GlRZ/SkmGdymGWMG/wB
	w6FkxkMh9MuvOyz6cDpHeVj0VrmOW97qo1O1P4gN3W/Px/4nTfunG8BG1QaTa3WGZmHU
	UJdrh0Vv4E/lrRG+hQYkPDhZvNZvPt1C47q+SDoIXpPcXtpgkKF/OFEAYW8zOpnsDO66
	DYleOe0T1lHwcymwSHWtz7Zd52DvhNcEwbdjOt4TXHgoJj+rSPbGbMJOYrod+3Cn5wBh
	BpCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zLjyGR+2TvdIUmrcHaCXg557pWleiHheUEtZrCTDgB0=;
	b=UO2mLomKxpayOaIA0GbQD7PZUZwWueVCSib33fiVhWdJVI+Rsfi05UvaiBZz2aBmcF
	HEwGkF9YAm+AUvQ6Vcl+/2azFUZtGAYYSfpV33Tcvpwpt8uScSRY+VS93ASBqgWMQiMU
	tz+ds0H95gBDEerVEcn+6XaCdIxfkHQBCguajoac98InjQ02lr6fV7m39Gk07WOSgwYc
	m1tL4p2ooyC8cDTr/OX1ODDIbCOOlEOiUlDQNiD/ddof1CBBLZrQUmeLIAZv873jRxvv
	08cPg6UR7QgARwB0bQ4GbqPKIi6a4PEVYvFRpgKtmmzovuKoLNHFUnNA6rQ/uf5B+nLB
	YBSw==
X-Gm-Message-State: ALyK8tJ1JE7E/e91+qUdS5S8zvmf1U03krtzNhYi9jr8OJZDKubfFHMkLLWJ17vVJsylOuQ01pxiPd8e7ANQsg==
X-Received: by 10.233.239.18 with SMTP id d18mr33385118qkg.41.1466538893956;
	Tue, 21 Jun 2016 12:54:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.8.133 with HTTP; Tue, 21 Jun 2016 12:54:24 -0700 (PDT)
In-Reply-To: <57698C05.7020704@mvista.com>
References: <1466519942-5978-1-git-send-email-akuster808@gmail.com>
	<CAMKF1spPd9sX7DmuLtzOuYuQT+jRgZhze6hCiNWwbW2-U_MytA@mail.gmail.com>
	<57698C05.7020704@mvista.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Jun 2016 12:54:24 -0700
Message-ID: <CAMKF1sqV89fOAUo26zgZArWDfELjm=6OVBBYiD-MT6ANL9=ibg@mail.gmail.com>
To: akuster <akuster@mvista.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Add qemuppc64 target
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
X-List-Received-Date: Tue, 21 Jun 2016 19:54:53 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 21, 2016 at 11:48 AM, akuster <akuster@mvista.com> wrote:
>
>
> On 06/21/2016 08:59 AM, Khem Raj wrote:
>> Can you also see if usermode qemu needs to be changed for ppc64 as well
>
> It has one issue. It wont display input from keyboard. it over runs the
> usb-kbd buffer. This is why I sent this series first. Working on bug
> 9778 should also address usermode.

OK thanks. I am not worried about kbd bug. We require qemu usermode to do a lot
of stuff during cross builds too now a days.

>
> thanks,
> Armin
>
>> On Jun 21, 2016 7:39 AM, "Armin Kuster" <akuster808@gmail.com> wrote:
>>
>>> This is step 1 in support of Yocto bug 9778
>>>
>>> Boot tested on Ubuntu 14.04 (qemu 2.0)
>>>
>>> Armin Kuster (3):
>>>   machine: add qemuppc64 machine
>>>   linux-yocto: add qemuppc64
>>>   runqemu: Add qemuppc64
>>>
>>>  meta/conf/machine/qemuppc64.conf             | 13 +++++++++++++
>>>  meta/recipes-kernel/linux/linux-yocto_4.1.bb | 22 ++++++++++++----------
>>>  meta/recipes-kernel/linux/linux-yocto_4.4.bb | 22 ++++++++++++----------
>>>  scripts/runqemu                              |  9 ++++++---
>>>  scripts/runqemu-internal                     | 24 ++++++++++++++++++------
>>>  5 files changed, 61 insertions(+), 29 deletions(-)
>>>  create mode 100644 meta/conf/machine/qemuppc64.conf
>>>
>>> --
>>> 1.9.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>

