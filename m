Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 982EC6DC8B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 12:43:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0NCgxJ2002090
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 23 Jan 2014 04:42:59 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Thu, 23 Jan 2014 04:42:59 -0800
Message-ID: <52E10E51.10701@windriver.com>
Date: Thu, 23 Jan 2014 20:42:57 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <1390479566.17424.99.camel@ted>
	<CAP9ODKqTjAESi+B56QFCuKpNJ3fxxmO+_Tx1_gWUxt+VyejycA@mail.gmail.com>
In-Reply-To: <CAP9ODKqTjAESi+B56QFCuKpNJ3fxxmO+_Tx1_gWUxt+VyejycA@mail.gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libtool-cross/native: Force usage of bash due to sstate inconsistencies
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
X-List-Received-Date: Thu, 23 Jan 2014 12:43:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/23/2014 08:37 PM, Otavio Salvador wrote:
> On Thu, Jan 23, 2014 at 10:19 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> Scenario:
>> a) libtool script is built on system with bash as /bin/sh
>> b) machine B installs sstate from build a)
>> c) machine B has dash as /bin/sh
>>
>> In this scenario, the script fails to work properly since its expecting
>> /bin/sh to have bash like syntax and it no longer does have it.
>>
>> This patch forces the configure process to use /bin/bash, not /bin/sh
>> and hence allows the scripts to work correctly when used from sstate.
>>
>> (From OE-Core rev: 2c66aa0fc98b092ebb37baee94e92d1965afd76b)
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Does this work for Fedora, using bash in /usr/bin/bash?
>

Yes, I think so, on Fedora:

$ readlink -f /bin/
/usr/bin


/bin is a symlink which points to /usr/bin.

// Robert

