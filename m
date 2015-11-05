Return-Path: <Jian.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 77DF060034
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 02:14:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tA52ECEf015477
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Nov 2015 18:14:13 -0800 (PST)
Received: from [128.224.163.183] (128.224.163.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 4 Nov 2015 18:14:12 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <1446445418-31492-1-git-send-email-jian.liu@windriver.com>
	<CAMKF1sqBfdSMphfZJ_O3nEd3cMA7A=5tKa2Xu0wGUsSr-HtuNg@mail.gmail.com>
	<56387CE7.5040907@windriver.com>
	<6A9FCF09-82E7-4A16-AEDD-D081F67704E7@gmail.com>
From: Jian Liu <jian.liu@windriver.com>
Message-ID: <563ABB70.8060400@windriver.com>
Date: Thu, 5 Nov 2015 10:14:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <6A9FCF09-82E7-4A16-AEDD-D081F67704E7@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] archiver.bbclass: do checkout for kernel
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
X-List-Received-Date: Thu, 05 Nov 2015 02:14:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

All kernels I list bellow will perform do_fetch(), do_unpack(), 
do_kernel_checkout().
do_unpack() will put a bare git repo under WORKDIR and then 
do_kernel_checkout()
will move the bare repo to bitbake/tmp/work-share/<board 
name>/kernel-source(value of variable S),
then performing "git checkout".

So do_ar_original must wait until do_kernel_checkout() is completed and 
then make tarball using the code under S.
Do I make that clear?


You refer to kernels other than linux-yocto. Can you give me an example?
I do not know how to build such kernel.

Thanks!
Jian

On 2015年11月04日 13:57, Khem Raj wrote:
>> On Nov 3, 2015, at 1:22 AM, Jian Liu<jian.liu@windriver.com>  wrote:
>> >
>> >Hi,
>> >
>> >I test linux-dummy linux-yocto-dev linux-yocto-rt linux-yocto-tiny and the result is as follows,
>> >
>> >linux-dummy: this package just meets some dependency and there is no source code for it.
>> >                      The patch does not impact it
>> >linux-yocto, linux-yocto-dev, linux-yocto-rt, linux-yocto-tiny: The S variable of all packages is set to STAGING_KERNEK_DIR.
>> >                       do_fetch and do_unpack just leave a bare git repo of kernel and do_kernel_checkout gets the source code
>> >
> does it cover the case when kernel is not linux-yocto was basic question, I am not clear if thats covered in any of above
>
>> >Thanks!


