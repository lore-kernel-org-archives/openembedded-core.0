Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 00E937077E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 17:37:44 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Jul 2014 10:37:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,718,1400050800"; d="scan'208";a="574329332"
Received: from unknown (HELO [10.255.13.66]) ([10.255.13.66])
	by fmsmga002.fm.intel.com with ESMTP; 23 Jul 2014 10:37:44 -0700
Message-ID: <53CFF2E3.6040404@linux.intel.com>
Date: Wed, 23 Jul 2014 10:37:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Ben Shelton <ben.shelton@ni.com>, openembedded-core@lists.openembedded.org
References: <20140723171312.GA6118@bshelton-desktop>
In-Reply-To: <20140723171312.GA6118@bshelton-desktop>
Subject: Re: util-linux hwclock ALTERNATIVE_PRIORITY set to 10 for meta-nslu2 -- still needed?
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
X-List-Received-Date: Wed, 23 Jul 2014 17:37:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/23/2014 10:13 AM, Ben Shelton wrote:
> Hi all,
>
> In meta/recipes-core/util-linux/util-linux.inc, there exists the
> following:
>
> # There seems to be problem, atleast on nslu2, with these, untill they are
> # fixed the busybox ones have higher priority
> ALTERNATIVE_PRIORITY[hwclock] = "10"
>
> Is this still necessary?  Right now, we're carrying a commit in our
> local repo to change this to ALTERNATIVE_PRIORITY[hwclock] ?= "100" so
> we can use the util-linux version of hwclock rather than the busybox one
> (as Saul had proposed at one point, so meta-nslu2 could override it).
>
Seems like a reasonable suggestion, I just checked the meta-nslu2 and 
there has not been a patch submitted to Khem for it, so that might need 
to happen also.

Sau!

> Thanks,
> Ben
>

