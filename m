Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 949E360767;
	Tue, 15 Mar 2016 15:52:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2016 08:51:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,339,1455004800"; d="scan'208";a="911094073"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 15 Mar 2016 08:51:58 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20150904153710.BBCFA50436@opal.openembedded.org>
	<20160310115851.GD2573@jama>
	<1457643705.2804.229.camel@linuxfoundation.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56E82EBA.10008@linux.intel.com>
Date: Tue, 15 Mar 2016 17:48:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <1457643705.2804.229.camel@linuxfoundation.org>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Alexander Kanavin : remake: update to 4.1+dbg-1.1
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
X-List-Received-Date: Tue, 15 Mar 2016 15:52:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/2016 11:01 PM, Richard Purdie wrote:

>> Fails to build after make was built. Shouldn't it be at least
>> blacklisted
>> by default so that potential user will need to explicitly decide
>> between
>> make and remake (and unmerge the other one from sysroot first)?
>
> I think (but can't remember for sure) that if you make both recipes
> PROVIDE virtual/make, the right things should happen?

remake recipe already includes this line:
PROVIDES += "make"

And we also have this in distro config:
PREFERRED_PROVIDER_make ?= "make"

And yet, if you try to build remake after make, the right thing 
(clearing out the sysroot files installed by make) does not happen. Any 
suggestions?

Alex

