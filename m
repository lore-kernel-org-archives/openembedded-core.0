Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1EA347E13E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 May 2019 10:17:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x4CAHWPc027568
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 12 May 2019 03:17:33 -0700 (PDT)
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 12 May 2019 03:17:10 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <cover.1557628550.git.hongxu.jia@windriver.com>
	<6dbeb5070ef6a86368ebcf1934ff543e963ba0fc.1557628550.git.hongxu.jia@windriver.com>
	<20190512083010.GA15611@localhost>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <a84d947c-9d0e-1265-e944-8730b04f4b88@windriver.com>
Date: Sun, 12 May 2019 18:17:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190512083010.GA15611@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/10] bash: upgrade 4.4.18 -> 5.0
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
X-List-Received-Date: Sun, 12 May 2019 10:17:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 5/12/19 4:30 PM, Adrian Bunk wrote:
> On Sun, May 12, 2019 at 04:16:24PM +0800, Hongxu Jia wrote:
>> ...
>>   ...1-help-fix-printf-format-security-warning.patch | 35 -----------------
>>   meta/recipes-extended/bash/bash/build-tests.patch  |  7 +++-
>>   meta/recipes-extended/bash/bash/execute_cmd.patch  | 19 ++++++---
>>   meta/recipes-extended/bash/bash/pathexp-dep.patch  | 13 -------
>>   meta/recipes-extended/bash/bash_4.4.18.bb          | 41 --------------------
>>   meta/recipes-extended/bash/bash_5.0.bb             | 45 ++++++++++++++++++++++
>>   6 files changed, 64 insertions(+), 96 deletions(-)
>>   delete mode 100644 meta/recipes-extended/bash/bash/0001-help-fix-printf-format-security-warning.patch
>>   delete mode 100644 meta/recipes-extended/bash/bash/pathexp-dep.patch
>>   delete mode 100644 meta/recipes-extended/bash/bash_4.4.18.bb
>>   create mode 100644 meta/recipes-extended/bash/bash_5.0.bb
>> ...
>> -           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-019;apply=yes;striplevel=0;name=patch019 \
>> -           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-020;apply=yes;striplevel=0;name=patch020 \
>> -           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-021;apply=yes;striplevel=0;name=patch021 \
>> -           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-022;apply=yes;striplevel=0;name=patch022 \
>> -           ${GNU_MIRROR}/bash/bash-4.4-patches/bash44-023;apply=yes;striplevel=0;name=patch023 \
>> ...
>> +           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-001;apply=yes;striplevel=0;name=patch001 \
>> +           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-002;apply=yes;striplevel=0;name=patch002 \
>> +           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-003;apply=yes;striplevel=0;name=patch003 \
>> +           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-004;apply=yes;striplevel=0;name=patch004 \
>> +           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-005;apply=yes;striplevel=0;name=patch005 \
>> +           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-006;apply=yes;striplevel=0;name=patch006 \
>> +           ${GNU_MIRROR}/bash/bash-${PV}-patches/bash50-007;apply=yes;striplevel=0;name=patch007 \
>> ...
> Some "git add/rm" seems to be missing around these patches.

Do you mean I miss the patches? They should be fetch from remote upstream.

Or do you mean `git mv' rather than `git add/rm'?

I use scripts/create-pull-request to generate patch, it uses `git 
format-patch  -M40' which

seems `git add/rm' rather than `git mv', and `-M10'  will be `git mv' here

//Hongxu

> cu
> Adrian
>


