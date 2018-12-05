Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 40F056C1AF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Dec 2018 10:57:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wB5AvTwu010157
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Dec 2018 02:57:29 -0800 (PST)
Received: from [128.224.5.148] (128.224.5.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 5 Dec 2018 02:57:29 -0800
To: "Hongzhi, Song" <hongzhi.song@windriver.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
References: <3fdeffd5-0d20-b50a-0d8c-8aec3715ebb2@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <a545e5df-65fc-1249-4fcd-d0c9b0175e27@windriver.com>
Date: Wed, 5 Dec 2018 05:57:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <3fdeffd5-0d20-b50a-0d8c-8aec3715ebb2@windriver.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IElzIGl0IG5lY2Vzc2FyeSB0byBmaXggdGhlIEJ1Z3ppbGxhIOKAkyBCdWcgMTE4MDcgYW5kIDU4NzYgPw==?=
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
X-List-Received-Date: Wed, 05 Dec 2018 10:57:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/5/18 5:17 AM, Hongzhi, Song wrote:
> Hi all,
> 
> I don't know if it is necessary to do this enhancement.
> 
> 1. Bug 11807:
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=11807
> 
> 
> 'CONFIG_EXTRA_FIRMWARE' is used to be set to the names of firmware files 
> which
> 
> should be provided by driver vendors.
> 
> 'CONFIG_EXTRA_FIRMWARE_DIR' is set to a path which contains above firmware
> 
> files. The default path is /lib/firmware if the 
> 'CONFIG_EXTRA_FIRMWARE_DIR' is not set.
> 
> 
> The path and firmware files must exist in rootfs eventually.
> 
> 
> 2. Bug 5876:
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5876
> 
> 
> I think it mean that bbclass should check the state of menuconfig.
> 
> 
> I don't know if is necessary to fix these bugs. Could you give me help?

I have some enhancements and other things in flight that can already do
what these two bugs are talking about. Paul and I had discussed some of
the config auditing on the list about a year ago, and agreed that
there's no sense duplicating the functionality that already exists
(rather I was going to tweak a few things to make it more easily
accessible).

If you want, you could assign 5876 to me, and I could take care of it.

As for 11807, that is simply a kernel configuration option and it should
be handled like any other. I don't see the need for anything special to
be done.

Bruce


> 
> 
> --Honghzi
> 
> 


