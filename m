Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A104277BF0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jul 2017 02:06:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6I26PiW021812
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Jul 2017 19:06:25 -0700 (PDT)
Received: from [128.224.162.212] (128.224.162.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 17 Jul 2017 19:06:24 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1499241206.git.kai.kang@windriver.com>
	<b11709a0-3c5e-9bbf-9b09-b94768ae5f09@linux.intel.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <21473033-fecc-2951-e251-49815a822e1f@windriver.com>
Date: Tue, 18 Jul 2017 10:09:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <b11709a0-3c5e-9bbf-9b09-b94768ae5f09@linux.intel.com>
Subject: Re: [PATCH 0/2] Introduce a distro feature openssl-no-weak-ciphers
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
X-List-Received-Date: Tue, 18 Jul 2017 02:06:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2017年07月17日 21:20, Alexander Kanavin wrote:
> On 07/05/2017 10:58 AM, kai.kang@windriver.com wrote:
>
>> Introduce a distro feature openssl-no-weak-ciphers to make openssl 
>> disable weak
>> ciphers support, including:
>>
>> * des
>> * ec
>> * ecdh
>> * ecdsa
>> * md2
>> * mdc2
>
> How are those handled in openssl 1.1? If they are disabled by default, 
> then maybe the whole distro feature is not needed when 1.1 is in oe-core.

It depends on whether all the packages which depends on openssl in Yocto 
have options to disable such weak ciphers. I am afraid it could not build
some packages if disable these weak ciphers by default.

Thanks,
Kai

>
> Alex
>
>
> Alex
>

-- 
Regards,
Neil | Kai Kang


