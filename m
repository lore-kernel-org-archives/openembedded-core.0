Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 56799795D8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 08:48:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8C8mDuS007929
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Sep 2018 01:48:13 -0700 (PDT)
Received: from localhost.corp.ad.wrs.com (128.224.162.161) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 12 Sep 2018 01:48:12 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1536740787.git.liezhi.yang@windriver.com>
	<045d8e01516bc793c571107c2766d033af758941.1536740787.git.liezhi.yang@windriver.com>
	<8cac505e74afa2e749668a042dcb25f3ac684eb7.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <31d8ebd4-ddd6-2d26-171b-94f7b94fbd25@windriver.com>
Date: Wed, 12 Sep 2018 16:51:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <8cac505e74afa2e749668a042dcb25f3ac684eb7.camel@linuxfoundation.org>
Subject: Re: [PATCH 1/1] dump_cache.py: Move it from bitbake
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
X-List-Received-Date: Wed, 12 Sep 2018 08:48:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 09/12/2018 04:43 PM, Richard Purdie wrote:
> On Wed, 2018-09-12 at 16:27 +0800, Robert Yang wrote:
>> Add it to oe-core can make it's easier to use, e.g., we don't need
>> use
>> /path/to/bitbake/contrib/dump_cache.py to run it, just use
>> dump_cache.py after
>> the build is initialized.
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   scripts/dump_cache.py | 95
>> +++++++++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 95 insertions(+)
>>   create mode 100755 scripts/dump_cache.py
> 
> Since the script is heavily tied to bitbake itself, I don't think this
> change makes sense. The name is also too generic just to insert into
> PATH (dump which cache?).
> 
> We could move it within bitbake I guess but I have to ask the question,
> how many people really need to run this and is the location therefore a
> real problem? Any user needing this can like adjust their PATH or
> figure out the right path to the script easily enough?

I guess seldom people really uses it since seldom people cares the internal
of the cache. I'm fine to leave it in bitbake, let's drop the patch, thanks.

// Robert

> 
> Cheers,
> 
> Richard
> 

