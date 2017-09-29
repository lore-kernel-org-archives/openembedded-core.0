Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id A37CC600EB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 11:40:11 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 29 Sep 2017 04:40:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,452,1500966000"; d="scan'208";a="157494507"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 29 Sep 2017 04:40:12 -0700
To: "Burton, Ross" <ross.burton@intel.com>,
	Libertad Cruz <libertad.cruz@intel.com>
References: <1506545019-4144-1-git-send-email-libertad.cruz@intel.com>
	<CAJTo0LaLdMPpsypShHpxfdQRfBrxwgVSBUAFNS+mPKkohFVbDw@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <32c6875f-c796-5eb3-a720-5b9145837680@linux.intel.com>
Date: Fri, 29 Sep 2017 14:36:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaLdMPpsypShHpxfdQRfBrxwgVSBUAFNS+mPKkohFVbDw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] dpky.py: Adds testcases for dpkg package manager
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
X-List-Received-Date: Fri, 29 Sep 2017 11:40:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 09/28/2017 04:28 PM, Burton, Ross wrote:
> On 27 September 2017 at 21:43, <libertad.cruz@intel.com 
> <mailto:libertad.cruz@intel.com>> wrote:
> 
>     From: libertad <libertad.cruz@intel.com
>     <mailto:libertad.cruz@intel.com>>
> 
>     Adds dpkg testcases for testing basic operation functionality for
>     the dpkg packgage manager.Adds new assert function to verify
>     expected results given by the dpkg package
> 
> 
> Basic functionality of a package manager is list packages, add packages, 
> remove packages.
> 
> Whereas the bulk of this this test verifies that four combinations of 
> --help or --version work, which isn't actually testing anything beyond 
> "is dpkg installed".
> 
> Can we just remove all of them?  I don't see the point in cluttering 
> testopia and the source with test cases that don't actually test anything.

Useful dpkg testcases could be modeled on, for instance, 
meta/lib/oeqa/runtime/cases/rpm.py.

Alex

