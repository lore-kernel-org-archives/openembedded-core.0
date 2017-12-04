Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 10B7378678
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 17:46:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vB4HkEqn022871
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Dec 2017 09:46:14 -0800 (PST)
Received: from server.local (128.224.21.208) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 4 Dec 2017 09:46:14 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj
	<raj.khem@gmail.com>
References: <cover.1512401707.git.bruce.ashfield@windriver.com>
	<fc66fbd898d637782560e123ec6a87a62dde89fc.1512401707.git.bruce.ashfield@windriver.com>
	<CAMKF1soUD8m1vOyzVwiygp3ib4jCyy7dfdqxde2Y-LG_CXqOTA@mail.gmail.com>
	<ad367df7-795c-20c9-eef3-436f12038f97@windriver.com>
	<1512409179.862.212.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <7f2d5178-671a-033b-26f1-aee270b9607b@windriver.com>
Date: Mon, 4 Dec 2017 12:46:13 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1512409179.862.212.camel@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH 8/8] linux-yocto-dev: update to v4.15+
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
X-List-Received-Date: Mon, 04 Dec 2017 17:46:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2017-12-04 12:39 PM, Richard Purdie wrote:
> On Mon, 2017-12-04 at 12:24 -0500, Bruce Ashfield wrote:
>> On 2017-12-04 11:38 AM, Khem Raj wrote:
>>>
>>> On Mon, Dec 4, 2017 at 7:39 AM, Bruce Ashfield
>>> <bruce.ashfield@windriver.com> wrote:
>>>>
>>>> Outside of the normal patch refreshes and boot issues, there are
>>>> new
>>>> build time tools within the kernel that required the following
>>>> dependencies:
>>>>
>>>> For ORC_UNWINDER support in x86-64:
>>>>
>>>>    DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-
>>>> native elfutils', '', d)}"
>>> do we need both target and host elfutils
>> Yup. There were references to both. Some had to run for hostcc
>> and others in the target arch.
> 
> Just for reference this is pretty bad for performance as it delays the
> kernel compile until some substantial parts of userspace build.
> 
> Is ORC_UNWINDER useful and commonly used?

One other thought I had was that this could be a distro feature
toggle, versus an arch feature. i.e. if you want the more
accurate stack unwinding in a debug build.

Bruce

> 
> Cheers,
> 
> Richard
> 


