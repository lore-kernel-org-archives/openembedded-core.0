Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0EEBA78A29
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 09:03:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6493rY6018575
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Jul 2018 02:03:54 -0700 (PDT)
Received: from [128.224.16.191] (128.224.16.191) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 4 Jul 2018 02:03:53 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1530672257.git.liezhi.yang@windriver.com>
	<38a8087461acbc6628b6b60a11393cf2431fbeb9.1530672257.git.liezhi.yang@windriver.com>
	<CAJTo0LZUkmav3kxtRpYqWwSxVenj-ZsYeoEX+mV91Z6vXhZf6A@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <ffb3689c-3e00-3b97-7d5a-a5799fa870ac@windriver.com>
Date: Wed, 4 Jul 2018 17:03:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZUkmav3kxtRpYqWwSxVenj-ZsYeoEX+mV91Z6vXhZf6A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] nfs-utils: 2.1.1 -> 2.3.1
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
X-List-Received-Date: Wed, 04 Jul 2018 09:03:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 07/04/2018 04:55 PM, Burton, Ross wrote:
> On 4 July 2018 at 03:47, Robert Yang <liezhi.yang@windriver.com> wrote:
>> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-musl-res_querydomain.patch
>> @@ -0,0 +1,22 @@
>> +Fixed:
>> +configure: error: res_querydomain needed
>> +
>> +Upstream-Status: Backport [https://git.alpinelinux.org/cgit/aports/tree/main/nfs-utils/musl-res_querydomain.patch?id=f6734a77d3caee73325f8cc1f77d1b5117a75096]
> 
> That's not a backport, it's a patch that Alpine created (U-S: Pending).

Thanks, updated in the repo, now it is:

Upstream-Status: Pending 
[https://git.alpinelinux.org/cgit/aports/tree/main/nfs-utils/musl-res_querydomain.patch?id=f673
4a77d3caee73325f8cc1f77d1b5117a75096]

And for another patch:

Upstream-Status: Pending 
[https://git.alpinelinux.org/cgit/aports/tree/main/nfs-utils/limits.patch?id=f6734a77d3caee73325f8cc1f77d1b5117a75096]

// Robert


> 
> Ross
> 

