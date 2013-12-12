Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C5D986C732
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Dec 2013 06:51:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rBC6pRN9009479
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Dec 2013 22:51:27 -0800 (PST)
Received: from [128.224.162.242] (128.224.162.242) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Wed, 11 Dec 2013 22:51:26 -0800
Message-ID: <52A95CEC.4030603@windriver.com>
Date: Thu, 12 Dec 2013 14:51:24 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1386752561.git.liezhi.yang@windriver.com>
	<1386771992.4332.76.camel@ted>
In-Reply-To: <1386771992.4332.76.camel@ted>
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 000/122 V2] [dora] fixes for dora (cover leter only)
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
X-List-Received-Date: Thu, 12 Dec 2013 06:51:29 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 12/11/2013 10:26 PM, Richard Purdie wrote:
> Hi Robert,
>
> Can you confirm that all these patches have an equivalent change in
> master already? I can see some which I can't find equivalent changes in
> master for :(
>
> You also do need to drop the "kernel: restore scripts in the sysroot"
> patch since it was reverted in master and is not a correct fix for
> anything.
>

Thanks, I've dropped it and started new builds on the local autobuilder,
it will be finished in a while.

// Robert

> Cheers,
>
> Richard
>
> On Wed, 2013-12-11 at 04:21 -0500, Robert Yang wrote:
>> * V2:
>>    + Create the PULL based on oe-core
>>    + Remove the 2 patches after more discussions with the submitter:
>>      - native-python: bad interpreter error message
>>      - Fix conflict between procps and base-files
>>
>> * V1 (Initial version)
>>    + Main changes:
>>      - Wic fixes
>>      - Update the kernel to 3.10.17
>>      - CVE fixes
>>      - Other Bug fixes
>>
>> // Robert
>>
>> The following changes since commit c303f5ecf7cda1c3b8bb776a6800946c0487cd93:
>>
>>    Revert "utils.bbclass: Fix override ordering for FILESPATH" (2013-12-03 12:55:47 +0000)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib robert/dora-next-oecore
>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/dora-next-oecore
>
>
>
>

