Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A2E1761D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 09:45:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6S9j5dJ015899
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Jul 2015 02:45:05 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 28 Jul 2015 02:44:49 -0700
Message-ID: <55B74F1F.2050409@windriver.com>
Date: Tue, 28 Jul 2015 17:45:03 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Burton, Ross"
	<ross.burton@intel.com>
References: <55B734EA.8050903@windriver.com>	
	<CAJTo0LaAkEcLK=7Bzne+N8fQa2+KsA_EbuK4r1syEjR7YVcMbw@mail.gmail.com>
	<1438076219.24778.4.camel@linuxfoundation.org>
In-Reply-To: <1438076219.24778.4.camel@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: About upgrade a package to a Release Candidate version (RCX)
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
X-List-Received-Date: Tue, 28 Jul 2015 09:45:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 07/28/2015 05:36 PM, Richard Purdie wrote:
> On Tue, 2015-07-28 at 09:09 +0100, Burton, Ross wrote:
>> On 28 July 2015 at 08:53, Robert Yang <liezhi.yang@windriver.com>
>> wrote:
>>          Is it a good idea to upgrade a package to a Release Candidate
>>          version,
>>          such as RC1, RC2 and so on ? I think no because:
>>
>>          1) Maybe the RC version is not stable enough.
>>          2) Maybe the package's final version doesn't release when
>>             oe-core/meta-oe releases, I think that use an older but
>>          stable
>>             version is better than new RC version usually.
>>
>> In general that's true, - qemu is the obvious recent exception because
>> they should be releasing before we freeze and there were major fixes
>> in the RC compared to the latest stable release.
>>
> Agreed. If there is a pressing reason for an RC release which gives us
> more benefit than drawback, we can consider it on a case by case basis.
> With QEMU and the autobuilder issues we've been seeing, we decided we're
> better off being close to upstream right now.
>

Got it , thanks.

// Robert

> Cheers,
>
> Richard
>
>
>
>

