Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 151ED788E0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 11:21:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Mar 2018 04:21:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,344,1517904000"; d="scan'208";a="44355426"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 22 Mar 2018 04:21:35 -0700
To: ChenQi <Qi.Chen@windriver.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1520841539.git.Qi.Chen@windriver.com>
	<e0d90ab0b0aea86e2955dfa749fdad1add65e6ac.1520841539.git.Qi.Chen@windriver.com>
	<a0a682c8-6b75-2fa7-eba8-b451d09b1230@windriver.com>
	<88e2bc77-5959-fe48-6372-da4f0c017e15@linux.intel.com>
	<284e46cf-85e6-8950-396f-427085a201a8@windriver.com>
	<6c04cfc3-2553-98ef-1b43-6a08a02d9e9a@linux.intel.com>
	<16a50e80-4e34-e7aa-016e-12e2b1d32958@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <bf908c93-3935-e053-e601-445400ff7ed4@linux.intel.com>
Date: Thu, 22 Mar 2018 13:14:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <16a50e80-4e34-e7aa-016e-12e2b1d32958@windriver.com>
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
X-List-Received-Date: Thu, 22 Mar 2018 11:21:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/22/2018 08:06 AM, ChenQi wrote:
> The test framework meson uses is like:
> 
> |e = executable('prog', 'testprog.c') test('name of test', e)|
> 
> 
> http://mesonbuild.com/Unit-tests.html
> 
> So they could be defined in any valid meson.build file. In systemd's 
> case, most of them are in top-level meson.build.
> 
> I agree with you that it's possible to extract all these test cases and 
> hold them in a custom script we write. I think this could serve as a 
> fall-back approach to adding ptest support for systemd.
> But I'd like to spend some time to try to find a more general approach, 
> avoiding headaches when upgrading.

That's right. We probably need to put some kind of 'hook' inside meson's 
test() that would copy the test case to a ptest directory, instead of 
running it.

Alex

