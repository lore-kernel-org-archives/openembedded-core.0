Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4420E71490
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 00:25:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8H0PWCk010714
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Sep 2014 17:25:33 -0700 (PDT)
Received: from [128.224.162.141] (128.224.162.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 16 Sep 2014 17:25:32 -0700
Message-ID: <5418D4FF.9030103@windriver.com>
Date: Wed, 17 Sep 2014 08:25:35 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1410769631-5672-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LYYSxR7VDtZ8JyCg+MtgJQpnXgno6P9xs744Pzx=FRXJw@mail.gmail.com>
In-Reply-To: <CAJTo0LYYSxR7VDtZ8JyCg+MtgJQpnXgno6P9xs744Pzx=FRXJw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kmod: remove the setting of INHIBIT_PACKAGE_STRIP
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
X-List-Received-Date: Wed, 17 Sep 2014 00:25:52 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/16/2014 05:46 PM, Burton, Ross wrote:
> On 15 September 2014 09:27,  <rongqing.li@windriver.com> wrote:
>> Setting INHIBIT_PACKAGE_STRIP is added by 61cb45869c[kmod: ptest fixes], but I
>> can not reproduce the described issue, and seems it make wrong logical [
>> when enable ptest, INHIBIT_PACKAGE_STRIP is always 1; and when disable ptest,
>> INHIBIT_PACKAGE_STRIP is always 0]
>
> I take my comment back:
>
> ERROR: runstrip: ''arm-poky-linux-gnueabi-strip' --strip-debug
> --remove-section=.comment --remove-section=.note --preserve-dates
> '/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-arm/build/build/tmp/work/armv5te-poky-linux-gnueabi/kmod/18+gitAUTOINC+ae58de0fcb-r0/package/usr/lib/kmod/ptest/testsuite/rootfs/test-dependencies/lib/modules/4.0.20-kmod/kernel/fs/mbcache.ko''
> strip command failed
>
> The autobuilder failed dramatically on this.
>
> Instead of inhibiting the strip globally, I wonder if there's a way to
> avoid stripping the test suite.
>
> Ross
>

OK, I will see it

-Roy

>

-- 
Best Reagrds,
Roy | RongQing Li

