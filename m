Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35E1278296
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 07:51:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8Q7piUN001470
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Sep 2017 00:51:44 -0700 (PDT)
Received: from [128.224.162.167] (128.224.162.167) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 26 Sep 2017 00:51:43 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1506411760.git.Qi.Chen@windriver.com>
	<c3ea84ced42e2cec87720d21edeb96c007e9984f.1506411760.git.Qi.Chen@windriver.com>
	<18117d38-34b5-e0de-8ab9-676352142fba@linux.intel.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <972d9b8d-9647-68eb-3793-e6af563af2b8@windriver.com>
Date: Tue, 26 Sep 2017 15:57:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <18117d38-34b5-e0de-8ab9-676352142fba@linux.intel.com>
X-Originating-IP: [128.224.162.167]
Subject: Re: [PATCH 1/1] ffmpeg: backport patches to fix 12 CVEs
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
X-List-Received-Date: Tue, 26 Sep 2017 07:51:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/26/2017 03:43 PM, Alexander Kanavin wrote:
> On 09/26/2017 10:43 AM, Chen Qi wrote:
>> Backport patches to fix the following CVEs.
>>
>> CVE-2017-14054
>> CVE-2017-14055
>> CVE-2017-14056
>> CVE-2017-14057
>> CVE-2017-14058
>> CVE-2017-14059
>> CVE-2017-14169
>> CVE-2017-14170
>> CVE-2017-14171
>> CVE-2017-14222
>> CVE-2017-14223
>> CVE-2017-14225
>
> I'd rather just update to 3.3.4. A lot less patch clutter, a lot less 
> chance of an important fix (CVE or not) having been missed, and it's 
> rather unlikely there's something that breaks compared to 3.3.3, as 
> feature development happens in a separate master branch.
>
> Alex
>

I agree with you. I have tried to do the upgrade, and it's easy.
However, at the current stage, it's unlikely for an upgrade patch to be 
accepted. That's why I did the backport.

Best Regards,
Chen Qi

