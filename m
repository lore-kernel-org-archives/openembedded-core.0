Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 741F476DEB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 12:58:43 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 04 Sep 2015 05:58:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,469,1437462000"; d="scan'208";a="797753863"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 04 Sep 2015 05:58:43 -0700
Message-ID: <55E995EA.9030802@linux.intel.com>
Date: Fri, 04 Sep 2015 16:00:26 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1441293149.git.alexander.kanavin@linux.intel.com>
	<c8274a56a32fedca57f68f757c27acf0525b98b4.1441293149.git.alexander.kanavin@linux.intel.com>
	<CAMKF1spvHGZ_+4fNNZ-qNJJni_Rz2dOFPF0QJydx3K_cxt6kGw@mail.gmail.com>
In-Reply-To: <CAMKF1spvHGZ_+4fNNZ-qNJJni_Rz2dOFPF0QJydx3K_cxt6kGw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/12] uclibc: update PV to 0.9.33.2 to match latest upstream release
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
X-List-Received-Date: Fri, 04 Sep 2015 12:58:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/03/2015 11:14 PM, Khem Raj wrote:
>> -PV = "0.9.33+git${SRCPV}"
>> +PV = "0.9.33.2+git${SRCPV}"
>
> technically its not right since we are not on 0.9.33 branch at all.
> We could use 0.9.33+0.9.34+git${SRCPV}

You're right. Nevermind then, uclibc is anyway one of those projects 
that can't be bothered to make a release. So there is no sensible 
upstream version check to perform.

Alex


