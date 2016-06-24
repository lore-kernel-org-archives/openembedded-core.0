Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 313B26FFCD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 09:41:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5O9fW2m000866
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Jun 2016 02:41:32 -0700 (PDT)
Received: from [128.224.162.229] (128.224.162.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Fri, 24 Jun 2016 02:41:30 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Khem Raj
	<raj.khem@gmail.com>
References: <cover.1466669684.git.Qi.Chen@windriver.com>
	<888ea509ee84e93297278e52a394057993b9a8a4.1466669684.git.Qi.Chen@windriver.com>
	<825a92a1-c9ed-11f3-7580-0cef384914db@linux.intel.com>
	<CAMKF1so3JSBtJC6_Uz4L5NJ50HCjtpztxoJ+_H+aU1mVLOduxA@mail.gmail.com>
	<f82a34ab-311a-b69e-8922-de59e6c4f971@linux.intel.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <576D0054.1080302@windriver.com>
Date: Fri, 24 Jun 2016 17:41:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <f82a34ab-311a-b69e-8922-de59e6c4f971@linux.intel.com>
X-Originating-IP: [128.224.162.229]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] systemd: upgrade to 230
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
X-List-Received-Date: Fri, 24 Jun 2016 09:41:35 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/23/2016 10:31 PM, Alexander Kanavin wrote:
> On 06/23/2016 04:56 PM, Khem Raj wrote:
>
>>> This is not correct. Systemd is configured using --without-python, 
>>> and so
>>> the python scripts are not added to the list of tests in the top level
>>> Makefile.am. However they are still installed by the recipe - the 
>>> correct
>>> fix is to remove them from the test target directory after all the 
>>> tests
>>> have been copied into it.
>>
>> python support could be added too. Using packageconfig
>
> Yes, if Python 3.x is used. Python 2.x is no longer the default choice 
> in oe-core.
>
> Alex
>

Thanks all for your feedbacks.
I'll send out a new patch.

Best Regards,
Chen Qi


