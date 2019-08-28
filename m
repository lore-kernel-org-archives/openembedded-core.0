Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 736717EC5D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 01:31:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7S1UmgI009283
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 27 Aug 2019 18:30:58 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 27 Aug 2019 18:30:37 -0700
To: <richard.purdie@linuxfoundation.org>, Hongxu Jia
	<hongxu.jia@windriver.com>,
	<openembedded-core@lists.openembedded.org>, <armccurdy@gmail.com>,
	<alex.kanavin@gmail.com>
References: <CAJ86T=WtuV46YbMMcGigKRrsvTNTtgWWdNLDp2P27-Zx6Rn+Yw@mail.gmail.com>
	<1566279918-9733-1-git-send-email-hongxu.jia@windriver.com>
	<7210fb6d-563e-497c-a25b-bc53ffe15954@windriver.com>
	<dbf4f8583c8616bdc437c37cc68a0f76e98d608f.camel@linuxfoundation.org>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <84d55359-1e84-688f-553b-0d0cdc175e35@windriver.com>
Date: Wed, 28 Aug 2019 09:29:49 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <dbf4f8583c8616bdc437c37cc68a0f76e98d608f.camel@linuxfoundation.org>
Subject: Re: [PATCH V3] nfs-utils: decrease RLIMIT_NOFILE to 4k for systemd
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
X-List-Received-Date: Wed, 28 Aug 2019 01:31:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/8/28 上午7:29, richard.purdie@linuxfoundation.org wrote:
> On Tue, 2019-08-27 at 17:43 +0800, Kang Kai wrote:
>> Hi Richard,
>>
>> This patch could fix the test_image failure with systemd. Would like
>> to
>> try systemd as default init manager on yocto build again
>> to check whether any more blocking issues?
>
> There is at least one issue:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/67/builds/967
>
> Please monitor this build which should show up any other issues:

Got it. Thanks.


>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/645
>
> (master-next was looking green other than this change).

It fails with libedit-native do fetch errors. I'll check it but it seems 
not systemd related at first sight.

Regards,
Kai


>
> Cheers,
>
> Richard
>
>

-- 
Kai Kang


