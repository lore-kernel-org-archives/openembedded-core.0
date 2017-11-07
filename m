Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DA36E78431
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 16:41:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vA7GfAIg012564
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Nov 2017 08:41:10 -0800 (PST)
Received: from soho-mhatle-m.local (172.25.36.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 7 Nov 2017 08:41:10 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
References: <20171018121423.1310-1-alexander.kanavin@linux.intel.com>
	<264c9619-62e7-ef43-9412-f00e9a1028ba@linux.intel.com>
	<634edf6c-23d9-1dbf-6c51-caef2f30c06f@windriver.com>
	<d4391631-e05e-bae9-363e-6d9fb7f3e3b6@linux.intel.com>
	<f7c3b1e5-b5d1-37e3-0a19-24dfd2cab276@windriver.com>
	<bfd7b5d5-328b-c0d9-0b61-75e60237b149@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <bdc9fa2c-70b0-f43a-f3b2-e86f6e6039b1@windriver.com>
Date: Tue, 7 Nov 2017 10:41:09 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <bfd7b5d5-328b-c0d9-0b61-75e60237b149@linux.intel.com>
Subject: Re: [PATCH] rpm: update to 4.14.0
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
X-List-Received-Date: Tue, 07 Nov 2017 16:41:12 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/7/17 8:53 AM, Alexander Kanavin wrote:
> On 11/06/2017 06:54 PM, Mark Hatle wrote:
>> You would need to interpret the dwarf symbols and find all of the referenced
>> files.  I can certainly be done with the libelf (libdwarf?), but I don't know if
>> it can be done with binutils or elfutils directly.  They may not have the
>> necessary translation to be able to assembly the pieces.
>>
>> (A lot of the filenames are listed related to a directory.. and the entries are
>> stored in different places and have to be assembled to get a similar output to
>> what debugedit gave us.)
>>
>> Writing a small standalone tool to give us this information may be very useful
>> to us though -- and would let us break the 'rpm' dependency for deb/ipkg
>> builds.. (probably)
> 
> 'readelf -wL <binary>' looks promising. I think we can simply process 
> its output from package.class (yes, a bit brittle, but easier than 
> writing a separate tool).

Yes, it looks like this has everything needed to identify the matching sources.

It will definitely have to be processed a bit, but it's all there.  (Only
concern is the processing may take significantly longer then debugedit used to..
but we won't know until we try.)

--Mark

> Alex
> 


