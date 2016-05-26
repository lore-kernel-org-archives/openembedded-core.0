Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 305C271951
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 08:12:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u4Q8CrIW000916
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 26 May 2016 01:12:53 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 26 May 2016 01:12:52 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1464168189.git.liezhi.yang@windriver.com>
	<1357d837c72abd1d9552aa77fd63126f7275aa23.1464168189.git.liezhi.yang@windriver.com>
	<CAJTo0Lb0W-tTtcjnAA1pVFU2=nDWxX2Fc7HXjYs2WYGfRYQx-A@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5746B002.8090908@windriver.com>
Date: Thu, 26 May 2016 16:12:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb0W-tTtcjnAA1pVFU2=nDWxX2Fc7HXjYs2WYGfRYQx-A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] utility-tasks.bbclass: fix do_listtasks
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
X-List-Received-Date: Thu, 26 May 2016 08:12:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/25/2016 07:17 PM, Burton, Ross wrote:
>
> On 25 May 2016 at 10:23, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     It lists deleted tasks which is unexpected, use __BBTASKS to fix the
>     problem since deltask() which is defined in bitbake/lib/bb/build.py
>     updates __BBTASKS correctly.
>
>
> Wouldn't an alternative be to change deltask so that it also remove the "task"
> flag from the variable?

The problem is, if we do:

d.delVarFlag(task, 'task')

Then maybe we should remove the whole task from d rather than only
remove the flags ?

// Robert

>
> Ross

