Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A92B774F9D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 04:31:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w514Uha3006597
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 31 May 2018 21:31:19 -0700
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 31 May 2018 21:30:56 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <cover.1527755434.git.Qi.Chen@windriver.com>
	<7874302a34c726c1980006cfeb0850a755a99f12.1527755435.git.Qi.Chen@windriver.com>
	<CANNYZj_JiC4h8s7oqgrw_Faq-2K2Hm64Zy0ZjfdBvQCdWAB7cQ@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <fc6f0043-ec1a-c8c5-c41c-6e19cfdce7ec@windriver.com>
Date: Fri, 1 Jun 2018 12:33:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj_JiC4h8s7oqgrw_Faq-2K2Hm64Zy0ZjfdBvQCdWAB7cQ@mail.gmail.com>
X-Originating-IP: [128.224.162.218]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 13/14] testimage-auto.bbclass: execute the same codes as testimage task
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
X-List-Received-Date: Fri, 01 Jun 2018 04:31:38 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/31/2018 09:50 PM, Alexander Kanavin wrote:
> 2018-05-31 11:45 GMT+03:00 Chen Qi <Qi.Chen@windriver.com>:
>>   python do_testimage_auto() {
>> +    testimage_sanity(d)
>> +
>> +    if (d.getVar('IMAGE_PKGTYPE') == 'rpm'
>> +       and ('dnf' in d.getVar('TEST_SUITES') or 'auto' in d.getVar('TEST_SUITES'))):
>> +        create_rpm_index(d)
>> +
>>       testimage_main(d)
> Why not simply move these lines to testimage_main()? They might become
> out of sync again in the future otherwise.
>
> Alex
>
Done.
V2 will be sent out soon.

Thanks,
Chen Qi

