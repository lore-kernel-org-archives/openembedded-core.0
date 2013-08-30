Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 752056BD13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 08:32:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7U8WCAq025312
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 30 Aug 2013 01:32:12 -0700 (PDT)
Received: from [128.224.159.157] (128.224.159.157) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Fri, 30 Aug 2013 01:32:12 -0700
Message-ID: <52205889.6080504@windriver.com>
Date: Fri, 30 Aug 2013 16:32:09 +0800
From: Yi Zhao <yi.zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <CAOMwXhPL4J8irv+8t02Mck-vAH47+9rqvncEkCUZpPHZWdSz1g@mail.gmail.com>
	<521B9AD8.6060400@linux.intel.com>
In-Reply-To: <521B9AD8.6060400@linux.intel.com>
X-Originating-IP: [128.224.159.157]
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: update to 2013.07 - Beagleboard XM Issue?
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
X-List-Received-Date: Fri, 30 Aug 2013 08:32:22 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


于 2013年08月27日 02:13, Saul Wold 写道:
> On 08/26/2013 11:06 AM, Laszlo Papp wrote:
>> On Mon, Aug 26, 2013 at 7:04 PM, Saul Wold <sgw@linux.intel.com
>> <mailto:sgw@linux.intel.com>> wrote:
>>
>> On 08/26/2013 10:56 AM, Laszlo Papp wrote:
>>
>> What exactly is the problem for beagle board?
>>
>> The QA team did not provide the details.
>>
>>
>> I wonder if you could ask for that?
>
> Yi,
>
> Can you be specific about the Beagleboard XM issue.

The system can not boot up when using the 2013.07 u-boot. It hangs after 
the following messages show in the serial port:

Texas Instruments X-Loader 1.5.0 (Aug 28 2013 - 06:34:32)
Beagle xM
Reading boot sector
Loading u-boot.bin from mmc


There was a bug https://bugzilla.yoctoproject.org/show_bug.cgi?id=5077 
to report it. The developer had given a possible cause.


Thanks,
Yi

>
> Thanks
> Sau!
>
>
>


