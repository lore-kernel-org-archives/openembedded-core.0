Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 35B5A71B31;
	Mon, 18 Dec 2017 16:36:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2017 08:36:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,422,1508828400"; 
   d="scan'208";a="3688632"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga007.jf.intel.com with ESMTP; 18 Dec 2017 08:36:46 -0800
To: mark.asselstine@windriver.com, Christopher Larson <kergoth@gmail.com>
References: <1512414044-1012-1-git-send-email-mark.asselstine@windriver.com>
	<CADNbA1qnmF3-MKo=fqQQeWEedE5A-wzkUkCgdCNArOePjMaXQw@mail.gmail.com>
	<CAPuovEKdqQP35XwP3bgBrE4EFbM2LwpHrHzxF3my9qaWfAaCbA@mail.gmail.com>
	<CABcZANku-aE5a69GpJxXmd2F0+uYVhiRZB3Uut7F2RG1e3R9EA@mail.gmail.com>
	<CAPuovEJNf=qefXX6wKJGaH+HkM6aan49AgVQ3TEWVWPSCn3cNw@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <711527ad-77fa-947f-2186-1d7835e1783e@linux.intel.com>
Date: Mon, 18 Dec 2017 18:37:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAPuovEJNf=qefXX6wKJGaH+HkM6aan49AgVQ3TEWVWPSCn3cNw@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH] python-pyroute2: uprev to v0.4.21 (from 0.3.22)
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
X-List-Received-Date: Mon, 18 Dec 2017 16:36:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/18/2017 06:15 PM, Mark Asselstine wrote:
> On Mon, Dec 18, 2017 at 10:36 AM, Christopher Larson <kergoth@gmail.com> wrote:
>> All our python recipes should be explicitly listing the python module
>> packages they require. No python module recipes should be depending on
>> python-modules or python3-modules, but explicitly what they require.
> 
> This is a giant PITA for little gain in my opinion. The typical python
> 'vehicles' to define dependencies, things like setup.py, requires.txt,
> requirements.txt..., never bother to list stdlibs. These are standard
> libs that are just expected to be there. If a system is being
> installed with only select python modules it will behave differently
> than python found on any other system violating the rule of least
> surprise. On top of this most of these modules are ~40K in size and
> there are roughly 60 in the stdlib so the size gain in installing a
> few vs. all of them is extremely negligible. All of this seems to add
> way more work and churn that outweighs any real benefit.

I tend to agree with this. Add also the situation that the yocto project 
needs to upgrade oe-core to python 3.6 as soon as possible, and to 3.7 
soon after, no one has enough time to do this rather non-trivial job, 
and I'm beginning to wonder if the best way out is to remove the module 
splitting altogether, and write a clean, simple and maintainable python3 
recipe from scratch with minimal amount of custom patching and hopefully 
no write-only hacks.

Alex

