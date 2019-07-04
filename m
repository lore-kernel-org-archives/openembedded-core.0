Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 52FEF7E958
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 09:03:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6492v9o027574
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 Jul 2019 02:03:18 -0700
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Thu, 4 Jul 2019 02:02:58 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>, William Bourque
	<wbourque@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <20190702182403.24099-1-wbourque@gmail.com>
	<20190702183053.2330.89816@do>
	<CANBSh+N4AL=o5bsuVEWJRUX+VzpsLv=dPBSo=OWCZBZnx_vrpw@mail.gmail.com>
	<ab85111307d8ed9b93c0fb8026a91ae5f24c4ed3.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <aaa7a2fe-b44e-8495-4759-4479ca51a505@windriver.com>
Date: Thu, 4 Jul 2019 17:02:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <ab85111307d8ed9b93c0fb8026a91ae5f24c4ed3.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.186]
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHdpYy9wbHVnaW5zOiBTb3VyY2UgdGhhdCBzdXBwb3J0IGJvdGggRUZJIGFuZCBCSU9T?=
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
X-List-Received-Date: Thu, 04 Jul 2019 09:04:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 7/3/19 3:51 PM, Richard Purdie wrote:
> On Tue, 2019-07-02 at 15:22 -0400, William Bourque wrote:
>> Hi,
>>
>> The error "scripts/lib/wic/plugins/source/bootimg-biosplusefi.py does
>> not exist" is a bit puzzling : this is the new file my patch is
>> adding.
>> Is this test failure expected for new files?
>>
>> I sent this using git-sendmail; should I submit using a different way
>> (pull request, ...)?
> I think the test is broken so we can ignore that. I've cc'd Sandy so
> she might be able to look into this issue if possible as we've seen it
> a few times.

I checked the test case,  and current test only support modified file well,

for new add file,  enhancement is needed, I have file a bug in bugzilla,

I will fix this when have time.

>
> What I did wonder is whether we should be adding some tests to wic for
> this new plugin though?
>
> The existing tests are in meta/lib/oeqa/selftest/cases/wic.py and can
> be run with "oe-selftest -r wic", would it make sense to add something
> to this as part of this change?
>
> Cheers,
>
> Richard
>
>
-- 
BRs

Sandy(Li Changqing)


