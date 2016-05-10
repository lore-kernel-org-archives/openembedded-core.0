Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 30EE0731D5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 12:45:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4ACjPA7027188
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 May 2016 05:45:25 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 10 May 2016 05:45:24 -0700
To: Andreas Oberritter <obi@opendreambox.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1462867278.git.liezhi.yang@windriver.com>
	<a3a4ecac5e2b86715220ca18e6fdffef9de2c151.1462867278.git.liezhi.yang@windriver.com>
	<5731B679.30303@opendreambox.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5731D7E3.2020506@windriver.com>
Date: Tue, 10 May 2016 20:45:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <5731B679.30303@opendreambox.org>
Subject: Re: [RFC PATCH 1/8] qemu-boot.bbclass: add it for runqemu
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
X-List-Received-Date: Tue, 10 May 2016 12:45:29 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/10/2016 06:22 PM, Andreas Oberritter wrote:
> Hello Robert,
>
> On 10.05.2016 10:13, Robert Yang wrote:
>> --- /dev/null
>> +++ b/meta/classes/qemu-boot.bbclass
>> @@ -0,0 +1,39 @@
>> +QEMU_NAME ?= ""
>> +QEMU_MAHINE_SUBTYPE ?= ""
>
> typo: QEMU_MACHINE_SUBTYPE (here and in some of the .inc files).

Yes, thanks, RP also pointed out this:-).

>
> Maybe you should use "??=", so "?=" may be used in the arch specific
> .inc files, in order to let a machine override it more easily.

Make sense, thanks.

// Robert

>
> Regards,
> Andreas
>

