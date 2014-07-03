Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 166756AC95
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 02:26:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s632QNGe025657
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 2 Jul 2014 19:26:23 -0700 (PDT)
Received: from [128.224.163.186] (128.224.163.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Wed, 2 Jul 2014 19:26:22 -0700
Message-ID: <53B4BF4B.5090306@windriver.com>
Date: Thu, 3 Jul 2014 10:26:19 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <1404286429-13962-1-git-send-email-ming.liu@windriver.com>
	<CABcZANn4B6SzNTT+eCi9bsWQxDcDJ4PCFT5kHwV6c5nxShmyhg@mail.gmail.com>
	<53B45FDC.1050703@linux.intel.com>
In-Reply-To: <53B45FDC.1050703@linux.intel.com>
X-Originating-IP: [128.224.163.186]
Cc: Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initscripts: add usleep support from RHEL
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
X-List-Received-Date: Thu, 03 Jul 2014 02:26:25 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2014 03:39 AM, Saul Wold wrote:
> On 07/02/2014 10:37 AM, Christopher Larson wrote:
>> On Wed, Jul 2, 2014 at 12:33 AM, Ming Liu <ming.liu@windriver.com> 
>> wrote:
>>
>>> Add usleep in to support sleeping some number of microseconds.
>>>
>>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>>>
>>
>> Maybe it's just me, but initscripts seems like a horrible place to 
>> put this.
>>
>>
>>
> It's not just you!  Not sure why it's being added here and I don't see 
> any usage of it, so more information is required.
Why I've sent this is because I noticed there was no usleep binary in 
any of the packages in oe repositories, and I assumed that the end user 
might like to use it in their rootfs, so I migrated it from initscripts 
package of RHEL. Anyway, if all you guys think it's not necessary and 
not appropriate, I will not insist it, we could just ignore my proposal. :)

the best,
thank you
>
> Sau!
>
>


