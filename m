Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8B15860190
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 14:25:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vBDEPXOj026227
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Dec 2017 06:25:33 -0800 (PST)
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 13 Dec 2017 06:25:33 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1513168490.19417.183.camel@linuxfoundation.org>
	<694b540b-1fc8-0388-5419-01c6e3f100c6@windriver.com>
	<1513173904.16507.1.camel@linuxfoundation.org>
	<85f7c521-01c4-7870-0f57-7ca217fce8e3@windriver.com>
	<1513174448.16507.8.camel@linuxfoundation.org>
	<9c348b48-b93c-f1b4-9ab5-707c3af2a947@windriver.com>
	<CAJTo0LYJ5X8QHgbggatAdMpPPH0Oj0m27TPEE1qBpO6N5fCH+A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <2bc45227-f190-3777-88e0-470862598c1b@windriver.com>
Date: Wed, 13 Dec 2017 09:25:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYJ5X8QHgbggatAdMpPPH0Oj0m27TPEE1qBpO6N5fCH+A@mail.gmail.com>
Cc: "Lock, Joshua" <joshua.g.lock@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Fix for the APIC hangs in qemux86-64
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
X-List-Received-Date: Wed, 13 Dec 2017 14:25:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12/13/2017 09:24 AM, Burton, Ross wrote:
> On 13 December 2017 at 14:17, Bruce Ashfield 
> <bruce.ashfield@windriver.com <mailto:bruce.ashfield@windriver.com>> wrote:
> 
>     yow-bashfiel-d4 [/home/bruc...poky/build]> oe-selftest -r
>     runqemu.RunqemuTests.test_boot_deploy
>     Traceback (most recent call last):
>        File "/home/bruce/poky/scripts/oe-selftest", line 43, in <module>
>          from oeqa.utils import load_test_components
>     ImportError: bad magic number in 'oeqa': b'\x03\xf3\r\n'
> 
> 
> You've been switching between master and a pre-py3 branch, and Python is 
> stupid so the py3 binary is trying to run py2 compiled binaries.


Yah. My build directory is three years old :D

> 
> find poky -name \*.pyc -delete will fix it.

Thanks. I'd have *never* come up with that!!!

Bruce

> 
> Ross


