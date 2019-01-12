Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1C7596C42C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 03:13:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0C3CUV4003284
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 11 Jan 2019 19:12:41 -0800
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 11 Jan 2019 19:12:20 -0800
To: <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
References: <20190112030051.24130-1-Randy.MacLeod@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <f14333fd-4cf6-fc96-839c-fa032b5426cd@windriver.com>
Date: Fri, 11 Jan 2019 22:12:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190112030051.24130-1-Randy.MacLeod@windriver.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH] strace: update from 4.25 to 4.26
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
X-List-Received-Date: Sat, 12 Jan 2019 03:13:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 1/11/19 10:00 PM, Randy MacLeod wrote:
> Refresh patches using devtool.
> Update license since the main code is now covered by
> LGPL-2.1+ and the tests under GPL-2.
> Fix a MIPS build error with an upstream patch.
> 

Builds are fine for all qemus for both glibc and musl
aside from qemuarm64 and musl, were I see:
    duplicate definition of struct prctl_mm_map
but Khem said that this was a known issue. I confirm
that it happens for both 4.25 and 4.26. I'll file a
bug next week unless someone says otherwise.

Also, ptest results for qemux86-64 in full-cmdline image:

Version: 4.25   4.26
# TOTAL:  605    631
# PASS:   443    466
# SKIP:   141    145
# XFAIL:    1      0
# FAIL:    20     20
# XPASS:    0      0
# ERROR:    0      0

I suppose I could include these results in the commit log.

-- 
# Randy MacLeod
# Wind River Linux

