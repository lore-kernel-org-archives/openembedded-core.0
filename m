Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 05E90774E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 02:25:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBM2PfHq012959
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 21 Dec 2016 18:25:41 -0800 (PST)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Wed, 21 Dec 2016 18:25:40 -0800
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1482308378-15213-1-git-send-email-mingli.yu@windriver.com>
	<CAJTo0LYT4YrWxex7mOLhBsWqKR_9cmJgO66dxzCoJT-U6kWDqQ@mail.gmail.com>
	<f00958f8-1c4a-e0ae-8a13-d6f672c8a850@linux.intel.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
Message-ID: <585B397B.6080206@windriver.com>
Date: Thu, 22 Dec 2016 10:24:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <f00958f8-1c4a-e0ae-8a13-d6f672c8a850@linux.intel.com>
X-Originating-IP: [128.224.162.168]
Subject: Re: [PATCH] gpgme: add GPGME_STATUS_KEY_CONSIDERED
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
X-List-Received-Date: Thu, 22 Dec 2016 02:25:41 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2016年12月21日 20:25, Alexander Kanavin wrote:
> On 12/21/2016 01:14 PM, Burton, Ross wrote:
>>
>> https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commitdiff;h=315fb73d4a774e2c699ac1804f5377559b4d0027
>>
>>
>> <https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commitdiff;h=315fb73d4a774e2c699ac1804f5377559b4d0027>
>>
>>
>>
>> Can you explain *why* we should cherry pick a patch from upstream?
>
> Because someone didn't check RRS, which would suggest an update to gpgme
> 1.8.0 should be done instead.
>
> http://recipes.yoctoproject.org/rrs/recipedetail/834/


Thanks Alex!
Actually I ever tried to upgrade gpgme to 1.8.0 before send out this 
patch, but there comes other ptest failed issues for python-pygpgme 
which not exist on current gpgme 1.6.0 if we simply update gpgme to 1.8.0.

Anyway I prefer to wait for more update for python-pygpgme from 
https://pagure.io/pygpgme/commits/master before we move forward to gpgme 
1.8.0.

Thanks,
Mingli

>
> Alex
>
>

