Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 219546017E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 14:27:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA7ERkwp017149
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Nov 2014 06:27:47 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Fri, 7 Nov 2014 06:27:46 -0800
Message-ID: <545CD6E1.5080807@windriver.com>
Date: Fri, 7 Nov 2014 08:27:45 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1415350038.git.kai.kang@windriver.com>
	<4BAF41A0-2647-427A-9F10-B2DF8D721FF5@dominion.thruhere.net>
In-Reply-To: <4BAF41A0-2647-427A-9F10-B2DF8D721FF5@dominion.thruhere.net>
Subject: Re: [PATCH 00/24] V2: Add machine qemuarm64
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
X-List-Received-Date: Fri, 07 Nov 2014 14:27:51 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/7/14, 3:18 AM, Koen Kooi wrote:
>
>> Op 7 nov. 2014, om 09:51 heeft Kai Kang <kai.kang@windriver.com> het volgende geschreven:
>>
>> V2:
>> * rebase on master and drop qemu upgrade commit
>> * built for lib32-core-image-sato core-image-sato-sdk meta-toolchain and world
>>
>> V1:
>> The original configuration files and tune fils for arm arch64 are from linaro.
>> And we rename it to qemuarm64 for consistency.
>
> Consistent to what? All current qemu machines are named after the qemu arch, so consistent would be 'qemuaarch64'. The 'arm64' moniker is *only* used in the kernel and that was caused by Linus being grumpy, everything else is 'aarch64' or 'armv8'
>

The arm64 name -did- come from Linaro:

http://git.linaro.org/openembedded/meta-linaro.git/tree/HEAD:/meta-aarch64/conf/machine/include

The arch-armv8.inc file (that arch-arm64.inc was based on) is located in the 
directly "arm64".

In addition, the tune file that forms the basis of the ARM tunes is called 
'arch-arm.inc'.  Not arch-aarch32.inc.  If you want to rename that, we can 
discuss it.. but to match that naming I chose 'arch-arm64.inc'.

(arch-armv8.inc was kept, but only includes the arch-arm64.inc file since there 
are no custom optimizations for 'v8' that I can find.)


As far as the machine name goes the original Linaro version, genericarmv8.conf 
and genericarmv8b.conf, don't match any of the naming conventions that are 
currently used by QEMU BSPs.

Looking at the existing machine names:

qemuarm.conf  qemumips64.conf  qemumips.conf  qemuppc.conf  qemux86-64.conf 
qemux86.conf

Each of the suffix names used match the Linux kernel arch naming.

So based on that reasoning the generic little endian machine was defined as 
qemuarm64.conf.

--Mark

