Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 988B160B48
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Mar 2020 06:14:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,543,1574092800"; d="scan'208";a="86205824"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Mar 2020 14:14:37 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 67904406AB15;
	Thu, 12 Mar 2020 14:04:38 +0800 (CST)
Received: from localhost.localdomain (10.167.225.81) by
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 12 Mar 2020 14:14:37 +0800
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <b1aa0d35-35bb-8043-fdd2-d57261eeb714@cn.fujitsu.com>
	<CADkTA4NOf2MXDkdta6o4MbEVTehSF+vY_D8ez53HjBgSzoDG6w@mail.gmail.com>
From: zangrc <zangrc.fnst@cn.fujitsu.com>
Message-ID: <c82b8e9e-28e7-b703-3ffc-06e0c06e5458@cn.fujitsu.com>
Date: Thu, 12 Mar 2020 14:16:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4NOf2MXDkdta6o4MbEVTehSF+vY_D8ez53HjBgSzoDG6w@mail.gmail.com>
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
	G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 67904406AB15.A754E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Cc: openembedded-core@lists.openembedded.org
Subject: Re: CVE related consulting on linux-yocto on zeus branch
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
X-List-Received-Date: Thu, 12 Mar 2020 06:14:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Our team plans to submit CVE-related patches that are not included in 
-stable, but we found that the current version of the linux-yocto recipe 
is lower than the linux-yocto git repository. On which version should we 
make the patch.

On 3/11/20 8:36 PM, Bruce Ashfield wrote:
> On Wed, Mar 11, 2020 at 2:02 AM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>>
>> Hello,
>>
>>
>> our team is currently working on CVE-related work. I would like to ask
>> if the zeus branch of yocto has an update plan for linux-yocto in the
>> near future. If not, can we submit a CVE-related patch for the
>> linux-yocto of the zeus branch.
> If it is part of -stable, then yes, it will be integrated into any of
> the active upstream kernels. If it is in 5.2, we also have a -stable
> process for those kernels as well.
>
> If it doesn't fall into those categories, then send any patches
> (against the kernel itself) to the linux-yocto mailing list, do not
> send them as patches to the linux-yocto recipe itself.
>
> Cheers,
>
> Bruce
>
>>    --
>> Best Regards!
>> Zang Ruochen
>>
>>
>>
>



