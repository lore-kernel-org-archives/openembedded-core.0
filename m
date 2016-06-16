Return-Path: <pascal.bach@siemens.com>
Received: from gecko.sbs.de (gecko.sbs.de [194.138.37.40])
	by mail.openembedded.org (Postfix) with ESMTP id 28B5D731BE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 12:51:04 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id u5GCp3WN004853
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Thu, 16 Jun 2016 14:51:03 +0200
Received: from [139.16.77.141] (MD1FZU9C.ww002.siemens.net [139.16.77.141])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTPS id u5GCp3BB026987
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 16 Jun 2016 14:51:03 +0200
To: Khem Raj <raj.khem@gmail.com>
References: <57614A9B.3090602@siemens.com>
	<AD9226CC-8ACA-4C9C-930D-48A1E8455A38@gmail.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <5762A0B7.70203@siemens.com>
Date: Thu, 16 Jun 2016 14:51:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <AD9226CC-8ACA-4C9C-930D-48A1E8455A38@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qemuppc kernel doesn't build with GCC 4.9 on korgoth
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
X-List-Received-Date: Thu, 16 Jun 2016 12:51:06 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit


>> On Jun 15, 2016, at 5:31 AM, Pascal Bach <pascal.bach@siemens.com> wrote:
>>
>> Hi
>>
>> I tried to build qemuppc on the latest korgoth branch using the GCC 4.9.3 from OE-core.
>>
>> The problem is that i get an error when trying to build the kernel.
>> I was able to trace the issue back to this commit:
>> https://github.com/openembedded/openembedded-core/commit/7a51776a830167e43cbd185505f62f328704e271
>>
>> And i can confirm that removing TARGET_CC_KERNEL_ARCH = "-mno-spe" from qemuppc.conf makes it work again.
>>
>> The question is how to best solve this?
>> Do the changes for GCC 5.3.0 that done in the commit mentioned above also need to be applied to 4.9?
>> Or is it just not supported to build qemuppc with GCC 4.9?
>>
> back port the gcc patch to 4.9
I just noticed it is already backported to 4.9 as 0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch
Is anybody else using a powerpc machine with Yocto2.1 and GCC4.9?

Regards
Pascal

