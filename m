Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0D1076059F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 11:20:25 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Oct 2017 04:20:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,504,1500966000"; d="scan'208";a="137039501"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 10 Oct 2017 04:20:25 -0700
To: Andre McCurdy <armccurdy@gmail.com>
References: <20171009141227.21795-1-otavio@ossystems.com.br>
	<d31de312-7137-d95d-7cf6-2f15ac4ac1b6@linux.intel.com>
	<CAJ86T=UGY1LciuKpDvpDFot8fQaJHaQEGp=N0zVHo9nMP+4vJw@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <0eea3119-a905-9a62-6572-1cab90a43a2d@linux.intel.com>
Date: Tue, 10 Oct 2017 14:16:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=UGY1LciuKpDvpDFot8fQaJHaQEGp=N0zVHo9nMP+4vJw@mail.gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Upgrade to 3.9.3 release
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
X-List-Received-Date: Tue, 10 Oct 2017 11:20:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/10/2017 04:01 AM, Andre McCurdy wrote:

>>> -LIC_FILES_CHKSUM =
>>> "file://Copyright.txt;md5=8d8c7bc32f8797d23f5cf605d9339d2d \
>>> +LIC_FILES_CHKSUM =
>>> "file://Copyright.txt;md5=24600643e5d1d2b8f7478ae5c9074949 \
>>>
>>> file://Source/cmake.h;beginline=1;endline=3;md5=4494dee184212fc89c469c3acd555a14"
>>
>> What has changed in Copyright.txt? If it's just the copyright years, you can
>> exclude the line using beginline/endline.
> 
> The copyright statement and copyright year(s) are part of the license.
> Slicing and dicing the license text to get a consistent hash probably
> isn't the right approach.

The purpose of LIC_FILES_CHECKSUM is to establish whether what the 
recipe claims in LICENSE matches what the upstream says in the source 
tree. For that purpose, when the code was published, who owns the code, 
or who made contributions to it are all not relevant and can be 
excluded. Also, such exclusions remove a major nuisance from recipe 
maintainers' job, and that is always a good thing.

As a technicality, the years of publication and code owners are not a 
part of the license, they a part of the copyright notice (which may also 
include the license text if it's short, or a reference to it if it's long):

https://en.wikipedia.org/wiki/Copyright_notice


Alex

