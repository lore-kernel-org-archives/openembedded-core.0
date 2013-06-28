Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2BE046AA07
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 07:35:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5S7Z30j018007
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Jun 2013 00:35:03 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 28 Jun 2013 00:35:02 -0700
Message-ID: <51CD3C69.7010803@windriver.com>
Date: Fri, 28 Jun 2013 15:34:01 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1371621343.git.liezhi.yang@windriver.com>
	<51CA5F8E.9070504@windriver.com> <51CB1145.4060009@linux.intel.com>
	<51CCEF2E.6070800@windriver.com> <20130628065050.GJ3261@jama>
In-Reply-To: <20130628065050.GJ3261@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] make DESCRIPTION support newline
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
X-List-Received-Date: Fri, 28 Jun 2013 07:35:05 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 06/28/2013 02:50 PM, Martin Jansa wrote:
> On Fri, Jun 28, 2013 at 10:04:30AM +0800, Robert Yang wrote:
>>
>>
>> On 06/27/2013 12:05 AM, Saul Wold wrote:
>>> On 06/25/2013 08:27 PM, Robert Yang wrote:
>>>>
>>>> Ping for this one.
>>>>
>>> Robert,
>>>
>>> There were some comments on your patch set and I think an issue with the ipk one.
>>>
>>
>> Hi Saul,
>>
>> I think that you meant Martin's comment on the ipk one, Phil had explained to
>> him, and it worked well with the opkg-utils.
>
> I've confused DESCRIPTION and SUMMARY, but I was talking about this
> change:
> http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/commit/?id=7f0a7976c29b34feaf4f6b00f0a63626614d1c7d
>
> And longer description here:
> https://lists.yoctoproject.org/pipermail/yocto/2012-March/007851.html
>
> So please make sure that your change doesn't break it, but with this
> applied it shouldn't.
>

Yes, I had taken the patch, and it doesn't break the opkg-utils.

// Robert

