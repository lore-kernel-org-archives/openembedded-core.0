Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C4F59744AA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 08:20:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8J8KBit029986
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Sep 2018 01:20:11 -0700 (PDT)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 19 Sep 2018 01:20:10 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <1537327350-27510-1-git-send-email-hongxu.jia@windriver.com>
	<CANNYZj_hOv++eoQA1dfv8TntJw6LrG0xOTB964esa3sHKwjQKQ@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <12ed2e32-4dfd-6146-5f4c-a964da9e032e@windriver.com>
Date: Wed, 19 Sep 2018 16:20:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj_hOv++eoQA1dfv8TntJw6LrG0xOTB964esa3sHKwjQKQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: upgrade 7.8p1 -> 7.8p2 to support openssl 1.1.x
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
X-List-Received-Date: Wed, 19 Sep 2018 08:20:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月19日 16:01, Alexander Kanavin wrote:
> 2018-09-19 5:22 GMT+02:00 Hongxu Jia <hongxu.jia@windriver.com>:
>> - Convert from tarball to git repository which support
>>    openssl 1.1.x
>>
>> - There is no specific minor version that contains the
>>    openssl fix (it was merged to master a few days agao),
>>    but their next minor version will be p2.
> That version does not yet exist. We should not be giving the incorrect
> impression that we are taking stable, upstream-tested code. 7.8p1+git
> or something like that is better.
>
> libressl recipe should be removed at the same time.

OK, no problem

//Hongxu

> Alex



