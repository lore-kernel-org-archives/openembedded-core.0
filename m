Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3A1FC77DA3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 09:11:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Mar 2018 02:11:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,329,1517904000"; d="scan'208";a="36181256"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 19 Mar 2018 02:11:32 -0700
To: ChenQi <Qi.Chen@windriver.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1520841539.git.Qi.Chen@windriver.com>
	<e0d90ab0b0aea86e2955dfa749fdad1add65e6ac.1520841539.git.Qi.Chen@windriver.com>
	<a0a682c8-6b75-2fa7-eba8-b451d09b1230@windriver.com>
	<88e2bc77-5959-fe48-6372-da4f0c017e15@linux.intel.com>
	<284e46cf-85e6-8950-396f-427085a201a8@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <6c04cfc3-2553-98ef-1b43-6a08a02d9e9a@linux.intel.com>
Date: Mon, 19 Mar 2018 11:04:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <284e46cf-85e6-8950-396f-427085a201a8@windriver.com>
Subject: Re: [PATCH 1/3] systemd: upgrade to 237
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
X-List-Received-Date: Mon, 19 Mar 2018 09:11:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/19/2018 06:53 AM, ChenQi wrote:

> For autotools,
> 1) if the test framework of some package is a standalone set of scripts 
> or it could be easily decoupled from Makefile, adding ptest support for 
> such package is easy.
> 2) if the test framework of some package is coupled with Makefile, we 
> need to adjust or replace vars in Makefile, install make on target and 
> rely on the Makefile to run tests. In such case, adding ptest is not easy.
> 
> For meson, the test framework is coupled with meson/ninja. We need to at 
> least install ninja and meson on target as a first step. Maybe we need 
> to adjust other things in do_install_ptest. That's why I said "there's 
> no easy way to add ptest support."
> 
> Why didn't I look further into this problem? Because I view ptest 
> support as optional, not necessary.
> What I thought was: "let's upgrade the package first. If ptest support 
> is required from community, deal with that in a separate patch."
> 
> Now that I've got feedback from you, I think I'll look further into this 
> issue and try to add ptest support via a separate patch.

But is it tightly coupled with meson/ninja? From what I see here:

https://github.com/systemd/systemd/blob/master/test/meson.build

there is no testing logic as such in the meson.build file, it simply 
runs a few test scripts, and checks the outcome. Which we can easily 
replicate in a script.

Alex

