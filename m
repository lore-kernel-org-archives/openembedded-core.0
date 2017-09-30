Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ACE4E71A15
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Sep 2017 03:20:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8U3KIYa012304
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 29 Sep 2017 20:20:18 -0700 (PDT)
Received: from [128.224.162.167] (128.224.162.167) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Fri, 29 Sep 2017 20:20:17 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>, "Burton, Ross"
	<ross.burton@intel.com>
References: <cover.1506411760.git.Qi.Chen@windriver.com>
	<c3ea84ced42e2cec87720d21edeb96c007e9984f.1506411760.git.Qi.Chen@windriver.com>
	<18117d38-34b5-e0de-8ab9-676352142fba@linux.intel.com>
	<972d9b8d-9647-68eb-3793-e6af563af2b8@windriver.com>
	<7a335457-3f37-d110-12f5-d034f5443d21@linux.intel.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <786711e4-a496-7e99-e11a-c8b3c5e6e571@windriver.com>
Date: Sat, 30 Sep 2017 11:26:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <7a335457-3f37-d110-12f5-d034f5443d21@linux.intel.com>
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
X-List-Received-Date: Sat, 30 Sep 2017 03:20:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/26/2017 03:56 PM, Alexander Kanavin wrote:
> On 09/26/2017 10:57 AM, ChenQi wrote:
>
>> I agree with you. I have tried to do the upgrade, and it's easy.
>> However, at the current stage, it's unlikely for an upgrade patch to 
>> be accepted. That's why I did the backport.
>
> If the upgrade patch brings a new feature release, then yes. But in 
> this case it's clearly:
>
> a) bugfix only (nearly all commits since 3.3.3 start with 'fix' or 
> 'check') and
> b) contains security fixes
>
> I think it's only a matter of explaining these two things clearly in 
> the commit message: if you do it, the patch will be accepted.
>
> Alex
>

Alex,
Thanks for your suggestion.
I've sent out an upgrade patch with explanation of why 3.3.4 is a bug 
fix version.

Boss,
For the upgrade patch and this cve fixing patch, you can pick either of 
them.
If we cannot merge the patch at this point, it's also OK for me to wait 
for the next development cycle.

Best Regards,
Chen Qi


