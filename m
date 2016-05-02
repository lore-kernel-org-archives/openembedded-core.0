Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B0B9F73181
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 10:13:39 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 02 May 2016 03:13:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,566,1455004800"; d="scan'208";a="796776599"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 02 May 2016 03:13:40 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <571E0BF3.8080408@linux.intel.com>
	<CAMKF1sq+Bk+74RQbdevy9U6QtVpJ1UB_ghq5THHf4=jNK0271A@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <57272877.7000905@linux.intel.com>
Date: Mon, 2 May 2016 13:14:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq+Bk+74RQbdevy9U6QtVpJ1UB_ghq5THHf4=jNK0271A@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: moving OpenEmbedded-core to Python 3
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
X-List-Received-Date: Mon, 02 May 2016 10:13:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/29/2016 11:43 PM, Khem Raj wrote:

> Can you clarify the scope, are you addressing the case where target
> images would prefer python3
> and you are making sure that packages that use python on target are
> ready for using it.

There is no way to set a 'preference' for Python 3. Either version of 
Python is pulled into images either through dependencies, or explicit 
inclusion into some package list.

I'm going to move recipes that are dependent on Python 2 to Python 3, 
whenever possible. I'm not porting the upstream code from Python 2 from 
Python 3, just configuring the recipes to use Python 3, when the Python 
code in them has already been ported.

> bitbake itself is a separate task but then we do write scriptlets that
> are executed as part of
> build, are you addressing those too ?

Not sure what you mean here exactly, but if the scriptlets are executed 
by bitbake, then I'm not addressing that.

> Thirdly, there is general pythonic code in metadata meant to control
> build policies

Again, can you provide an example?

> Which of these are you addressing specifically.

Please start using the question mark (?), so I can see more easily what 
is a question when responding.

Thanks,
Alex


