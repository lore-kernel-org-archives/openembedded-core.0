Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 375D56E8CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 20:11:45 +0000 (UTC)
Received: from [192.168.178.14] (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id 2863824F71;
	Fri, 24 Jan 2014 21:11:42 +0100 (CET)
Message-ID: <52E2C97A.8010906@pseudoterminal.org>
Date: Fri, 24 Jan 2014 21:13:46 +0100
From: Carlos Rafael Giani <dv@pseudoterminal.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Philip Balister <philip@balister.org>
References: <52E10247.8050700@pseudoterminal.org>
	<52E15760.8050606@balister.org>
In-Reply-To: <52E15760.8050606@balister.org>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 24 Jan 2014 20:11:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-01-23 18:54, Philip Balister wrote:
> On 01/23/2014 06:51 AM, Carlos Rafael Giani wrote:
>> Hello,
>>
>> I noticed that since the C++ bindings for the berkeley DB were included
>> in commit 23f29027db73d5759889b48fabdea7f6173217a7 , I cannot build db
>> anymore.
>> The error is:
>>
>>      /usr/lib/libstdc++.so: file not recognized: File format not recognized
>>
>> this is the offending part in the log.do_compile file:
> What distro is your build machine running? I've this from people using
> Arch Linux.
>
> Philip
>
>

Indeed I am using Arch Linux. I also checked the logs, and did not find 
any isolated /usr/include or /usr/lib/ paths.

