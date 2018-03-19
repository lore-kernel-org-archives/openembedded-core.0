Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3DDB778449
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 04:53:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2J4r4qS019466
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 18 Mar 2018 21:53:04 -0700
Received: from [128.224.162.197] (128.224.162.197) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Sun, 18 Mar 2018 21:53:03 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Randy MacLeod
	<randy.macleod@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1520841539.git.Qi.Chen@windriver.com>
	<e0d90ab0b0aea86e2955dfa749fdad1add65e6ac.1520841539.git.Qi.Chen@windriver.com>
	<a0a682c8-6b75-2fa7-eba8-b451d09b1230@windriver.com>
	<88e2bc77-5959-fe48-6372-da4f0c017e15@linux.intel.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <284e46cf-85e6-8950-396f-427085a201a8@windriver.com>
Date: Mon, 19 Mar 2018 12:53:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <88e2bc77-5959-fe48-6372-da4f0c017e15@linux.intel.com>
X-Originating-IP: [128.224.162.197]
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
X-List-Received-Date: Mon, 19 Mar 2018 04:53:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/17/2018 03:27 AM, Alexander Kanavin wrote:
> On 03/16/2018 09:30 PM, Randy MacLeod wrote:
>>> This new version has dropped ptest support, as there's no easy
>>> way to do this in the framework of meson.
>>
>> Are you talking to the meson developers to see if we/they can
>> come up with a way to do that? Is there an issue opened:
>>     https://github.com/mesonbuild/meson/issues
>> I didn't find one.
>
> Yes - please be more specific. What are the difficulties in building 
> and packaging tests when meson is used, as compared to autotools? If 
> you need to patch meson build files in systemd source tree, it's 
> totally fine to do that.
>
> Alex
>

Hi Randy & Alex,

For autotools,
1) if the test framework of some package is a standalone set of scripts 
or it could be easily decoupled from Makefile, adding ptest support for 
such package is easy.
2) if the test framework of some package is coupled with Makefile, we 
need to adjust or replace vars in Makefile, install make on target and 
rely on the Makefile to run tests. In such case, adding ptest is not easy.

For meson, the test framework is coupled with meson/ninja. We need to at 
least install ninja and meson on target as a first step. Maybe we need 
to adjust other things in do_install_ptest. That's why I said "there's 
no easy way to add ptest support."

Why didn't I look further into this problem? Because I view ptest 
support as optional, not necessary.
What I thought was: "let's upgrade the package first. If ptest support 
is required from community, deal with that in a separate patch."

Now that I've got feedback from you, I think I'll look further into this 
issue and try to add ptest support via a separate patch.

Best Regards,
Chen Qi

