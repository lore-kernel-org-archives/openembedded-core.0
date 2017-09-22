Return-Path: <Liwei.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DC1BA71A92
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 05:11:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8M5BHsC023627
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Sep 2017 22:11:17 -0700 (PDT)
Received: from [128.224.162.229] (128.224.162.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 21 Sep 2017 22:11:15 -0700
Message-ID: <59C49BAA.3040305@windriver.com>
Date: Fri, 22 Sep 2017 13:12:10 +0800
From: Liwei Song <liwei.song@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1504603652-262027-1-git-send-email-liwei.song@windriver.com>
	<CAJTo0LYXE=s8tphMTfS9avaM-4ttTpO1=mo-A+rsd46PKFgMRg@mail.gmail.com>
In-Reply-To: <CAJTo0LYXE=s8tphMTfS9avaM-4ttTpO1=mo-A+rsd46PKFgMRg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-firmware: package qat-firmware
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
X-List-Received-Date: Fri, 22 Sep 2017 05:11:17 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit



On 09/20/2017 12:50 AM, Burton, Ross wrote:
> On 5 September 2017 at 10:27, Liwei Song <liwei.song@windriver.com> wrote:
> 
>> +             ${PN}-qat-license ${PN}-qat_895xcc ${PN}-qat_895xcc_mmp
>> ${PN}-qat_c3xxx ${PN}-qat_c3xxx_mmp ${PN}-qat_c62x ${PN}-qat_c62x_mmp
>> ${PN}-qat_mmp \
>>
> 
> *** Error: Package name  contains illegal characters, (other than
> [a-z0-9.+-])
> 
> You can't use _ in packages, please just use -.

Got it, Thanks, I will resend a V2, please ignore this one.

Thanks,
Liwei.

> 
> Ross
> 

