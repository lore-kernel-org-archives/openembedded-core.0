Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 29ED16212F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 09:58:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2L9wO1u016712
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 21 Mar 2016 02:58:24 -0700 (PDT)
Received: from [128.224.163.174] (128.224.163.174) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 21 Mar 2016 02:58:23 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1457938286.git.liezhi.yang@windriver.com>
	<1458513637.20442.5.camel@linuxfoundation.org>
	<56EF5420.7030809@windriver.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <56EFC5BE.4070906@windriver.com>
Date: Mon, 21 Mar 2016 17:58:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56EF5420.7030809@windriver.com>
Subject: V2 Re: [PATCH 0/7] fixes for runqemu
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
X-List-Received-Date: Mon, 21 Mar 2016 09:58:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/21/2016 09:53 AM, Robert Yang wrote:
>
>
> On 03/21/2016 06:40 AM, Richard Purdie wrote:
>> On Sun, 2016-03-13 at 23:52 -0700, Robert Yang wrote:
>>> The following changes since commit
>>> 9d5fa6da5ae14b26a83ec1af609d4c45944bfd44:
>>>
>>>    cross-canadian/libgcc: fix aarch64's multilib SDK (2016-03-13
>>> 19:36:57 -0700)
>>>
>>> are available in the git repository at:
>>>
>>>    git://git.openembedded.org/openembedded-core-contrib rbt/runqemu
>>>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log
>>> /?h=rbt/runqemu
>>>
>>> Robert Yang (7):
>>>    runqemu: fix ROOTFS for vmdk
>>>    runqemu: simplify the checking for vm images
>>>    runqemu: remove ISO and RAMFS from help text
>>>    runqemu: add support for qcow2 and vdi
>>>    runqemu: simplify checking for iso and ramfs
>>>    runqemu-internal: cleanup unsed code
>>>    runqemu-internal: split the code into functions
>>
>> I have a feeling one of these causes:
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/
>> builds/426/steps/Running%20oe-selftest/logs/stdio
>>
>> (the  test_qemu (oeqa.selftest.wic.Wic) failure)
>
> Sorry, I will fix it.

I updated the patches in the repo, now:
$ oe-selftest -r wic.Wic.test_qemu
and
$ oe-selftest -r wic.Wic.test_qemux86_directdisk

Work well.

* Changes of V2:
- Update "runqemu: fix ROOTFS for vmdk", check for ide/scsi drive, if not
   found, then use virtio block drive.


   git://git.openembedded.org/openembedded-core-contrib rbt/runqemu
   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/rpm

Robert Yang (7):
   runqemu: fix ROOTFS for vmdk
   runqemu: simplify the checking for vm images
   runqemu: remove ISO and RAMFS from help text
   runqemu: add support for qcow2 and vdi
   runqemu: simplify checking for iso and ramfs
   runqemu-internal: cleanup unsed code
   runqemu-internal: split the code into functions

// Robert

>
> // Robert
>
>>
>> Cheers,
>>
>> Richard
>>

