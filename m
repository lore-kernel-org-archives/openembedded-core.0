Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 49C4A71A5E;
	Tue, 19 Dec 2017 07:55:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2017 23:55:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,425,1508828400"; 
   d="scan'208";a="3877244"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga007.jf.intel.com with ESMTP; 18 Dec 2017 23:55:12 -0800
To: "S. Lockwood-Childs" <sjl@vctlabs.com>, Derek Straka <derek@asterius.io>, 
	Mark Asselstine <mark.asselstine@windriver.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1512414044-1012-1-git-send-email-mark.asselstine@windriver.com>
	<CADNbA1qnmF3-MKo=fqQQeWEedE5A-wzkUkCgdCNArOePjMaXQw@mail.gmail.com>
	<CAPuovEKdqQP35XwP3bgBrE4EFbM2LwpHrHzxF3my9qaWfAaCbA@mail.gmail.com>
	<CABcZANku-aE5a69GpJxXmd2F0+uYVhiRZB3Uut7F2RG1e3R9EA@mail.gmail.com>
	<CAPuovEJNf=qefXX6wKJGaH+HkM6aan49AgVQ3TEWVWPSCn3cNw@mail.gmail.com>
	<711527ad-77fa-947f-2186-1d7835e1783e@linux.intel.com>
	<CAPuovE+yd0kA_MmT4GuqXgvNDASsKLszL4uiypKDSa31icwgXg@mail.gmail.com>
	<CADNbA1psOtOeCcsLaSM4VWJV5PXqe=HmE9BuxcR4UYkJp5Erdw@mail.gmail.com>
	<20171218210256.GQ27580@vctlabs.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <2bc1c40c-3f63-7311-b8a3-81bd05ea474f@linux.intel.com>
Date: Tue, 19 Dec 2017 09:56:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171218210256.GQ27580@vctlabs.com>
Subject: splitting python's standard library
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
X-List-Received-Date: Tue, 19 Dec 2017 07:55:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/18/2017 11:02 PM, S. Lockwood-Childs wrote:
> On Mon, Dec 18, 2017 at 03:17:25PM -0500, Derek Straka wrote:
>> I have several customers who have optimized for space and would like to see
>> the capability maintained unless core removes the ability to split python
>> packages out.  They also remove the *.py files in favor of *.pyo files (via
>> a custom packaging mechanism).  I have automated tests that go through the
>> module importing on each of the meta-python packages to ensure it works on
>> minimal python installations.  When other contributors don't do provide
>> that functionality, I either catch it when I do package update or when it
>> breaks for one of my customers.  I'm fine if you don't want to perform the
>> checks yourself and it breaks my use case with missing dependencies, but I
>> would prefer that you don't remove the dependencies that are currently in
>> place.  Thanks.
> 
> Me too -- some of my projects still use NAND for rootfs, where space is tight and
> ability to split out python modules is very useful. Thus it is not an unused
> feature, though many projects have SD/eMMC for rootfs and those ones generally
> will not care about it.

This configuration can be supported by making a custom python3-modules 
package that whitelists precisely the needed files. But it shouldn't be 
imposed on everyone else - it's a significant burden to maintain the 
dependencies in every single python package, and keep the splitting 
working correctly in core python as well.

So I'd like to drop that - do keep in mind that very few people maintain 
oe-core (as opposed to sending occasional drive-by patches to fix 
specific issues raised in product development), and the headcount keeps 
getting smaller.

Alex


