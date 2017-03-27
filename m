Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6053F77A31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 12:20:27 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 27 Mar 2017 05:20:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,231,1486454400"; d="scan'208";a="948583918"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 27 Mar 2017 05:20:28 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20170324210816.13530-1-alexander.kanavin@linux.intel.com>
	<1490464615.13980.250.camel@linuxfoundation.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5eab5be9-580f-d869-f7c0-b32d3e30daf3@linux.intel.com>
Date: Mon, 27 Mar 2017 15:19:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <1490464615.13980.250.camel@linuxfoundation.org>
Subject: Re: [PATCHv2] dnf: move the entire dnf/rpm4 stack to Python 3
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
X-List-Received-Date: Mon, 27 Mar 2017 12:20:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/25/2017 07:56 PM, Richard Purdie wrote:
>> [YOCTO #11180]
>
> So close but:
>
> https://autobuilder.yocto.io/builders/nightly-multilib/builds/226
> https://autobuilder.yocto.io/builders/nightly-x32/builds/206

This is actually a bug in our target Python 3 installation. No idea how 
it went unnoticed - does no one use Python 3 on target with multilib or 
x32 at all?


Python 3.5.2 (default, Mar 27 2017, 11:43:41)
[GCC 6.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
 >>> import site
 >>> site.getsitepackages()
['/usr/lib/python3.5/site-packages']
        ^^^ !!!



Alex


