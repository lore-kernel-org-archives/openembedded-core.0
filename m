Return-Path: <s.mueller-klieser@phytec.de>
Received: from root.phytec.de (mail.phycore.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 8D08165D34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jul 2014 11:46:52 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id E83CABF092;
	Wed, 30 Jul 2014 13:46:51 +0200 (CEST)
Received: from [172.16.10.21] ([172.16.10.21])
	by idefix.phytec.de (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014073013465158-3878 ;
	Wed, 30 Jul 2014 13:46:51 +0200 
Message-ID: <53D8DB24.2070409@phytec.de>
Date: Wed, 30 Jul 2014 13:46:44 +0200
From: =?windows-1252?Q?Stefan_M=FCller-Klieser?= <s.mueller-klieser@phytec.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	David Vincent <freesilicon@gmail.com>
References: <1406541304-18741-1-git-send-email-freesilicon@gmail.com>
	<1406543035.13346.11.camel@ted>
In-Reply-To: <1406543035.13346.11.camel@ted>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 8.5.3FP6|November
	21, 2013) at 30.07.2014 13:46:51,
	Serialize by Router on Idefix/Phytec(Release 8.5.3FP6|November 21,
	2013) at 30.07.2014 13:46:51,
	Serialize complete at 30.07.2014 13:46:51
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] barebox: Add recipe
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
X-List-Received-Date: Wed, 30 Jul 2014 11:46:53 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=windows-1252; format=flowed

Hello everybody,

it happened that I am also preparing our barebox recipe for OE-core. I 
started similar to David but it evolved already. I added support for 
packages, configuration fragments and an the ipl, needed for some SoCs. 
I will send it to the list for comments. Even if it will not be 
accepted, it might be useful for some people. I will provide an 
explanation for the maintainer.

Regards, Stefan

On 28.07.2014 12:23, Richard Purdie wrote:
> On Mon, 2014-07-28 at 11:55 +0200, David Vincent wrote:
>> barebox (formerly known as u-boot-v2) is a bootloader that inherits the
>> best of U-Boot and the Linux kernel. This commit adds the possibility to
>> use it as a virtual/bootloader instead of U-Boot.
>>
>> Signed-off-by: David Vincent <freesilicon@gmail.com>
>> ---
>>   meta/recipes-bsp/barebox/barebox.inc          |   73 +++++++++++++++++++++++++
>>   meta/recipes-bsp/barebox/barebox_2014.07.0.bb |   15 +++++
>>   2 files changed, 88 insertions(+)
>>   create mode 100644 meta/recipes-bsp/barebox/barebox.inc
>>   create mode 100644 meta/recipes-bsp/barebox/barebox_2014.07.0.bb
>
> I have to admit I don't know a lot about this. To make it into OE-Core
> we need some kind of story about why its necessary and commonly used.
> Are there a number of BSPs using this? Can you give some background to
> why this is needed?
>
> Cheers,
>
> Richard
>

