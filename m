Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B847161DDD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 20:41:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7EKfX8Z022157
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 14 Aug 2013 13:41:33 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Wed, 14 Aug 2013 13:41:32 -0700
Message-ID: <520BEB7B.8060909@windriver.com>
Date: Wed, 14 Aug 2013 15:41:31 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
	<CAJTo0La-PsajOhDmPHyMONi9_u2ytgWLpnGoQNvf1tewV5dYCQ@mail.gmail.com>
In-Reply-To: <CAJTo0La-PsajOhDmPHyMONi9_u2ytgWLpnGoQNvf1tewV5dYCQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/11] Update the way we control the construction of filesystems
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
X-List-Received-Date: Wed, 14 Aug 2013 20:41:32 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/13 3:35 PM, Burton, Ross wrote:
> On 14 August 2013 21:29, Mark Hatle <mark.hatle@windriver.com> wrote:
>>   Debian(apt-get) does not appear to be capable of
>> BAD_RECOMEMNDATIONS,
>
> The semantics of BAD_RECOMMENDATIONS is "these packages may be listed
> as recommendations, but don't install them", right?  You *might* be

Correct.  If it's a dependency, it -will- be installed.  Helps trim some of the 
recommended packages from the final filesystem, without introducing potentially 
irreconcilable dependency failures.

> able to do this with dpkg by setting the package state to
> "not-installed hold".

I tried that and it did not work.  The hold semantic in dpkg/apt-get appears to 
say once it's installed keep it at a specific version.  But it doesn't allow you 
to hold in the not-installed mode.

(I'd be more then happy for someone to prove me wrong btw..)  I tried everything 
from setting special Pin-Priorities to playing with the state file, etc.. 
eventually I gave up and made it a warning instead.  (This is not a regression 
BTW, it has never worked in the past... it's just functionality someone may want.)

> Ross
>


