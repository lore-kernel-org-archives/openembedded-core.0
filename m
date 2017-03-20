Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C05DE776C7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 09:45:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2K9jLfA013670
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Mar 2017 02:45:21 -0700 (PDT)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 20 Mar 2017 02:45:21 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1489657029.git.liezhi.yang@windriver.com>
	<751ae73c98c1280f2b5ada3b442cf3f5828ed437.1489657029.git.liezhi.yang@windriver.com>
	<1489751659.13980.135.camel@linuxfoundation.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <46fc4288-5cb2-cfbf-62da-582621f6f22e@windriver.com>
Date: Mon, 20 Mar 2017 17:45:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1489751659.13980.135.camel@linuxfoundation.org>
Subject: Re: [PATCH 4/6] oeqa/targetcontrol.py: modify it to test runqemu
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
X-List-Received-Date: Mon, 20 Mar 2017 09:45:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 03/17/2017 07:54 PM, Richard Purdie wrote:
> On Thu, 2017-03-16 at 03:13 -0700, Robert Yang wrote:
>> Modify the following files to test runqemu:
>>     targetcontrol.py
>>     utils/commands.py
>>     utils/qemurunner.py
>>
>> We need simulate how "runqemu" works in command line, so when test
>> "runqemu", the targetcontrol.py, utils/commands.py and
>> utils/qemurunner.py don't have to find the rootfs or set env vars.
>>
>> [YOCTO #10249]
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>  meta/lib/oeqa/targetcontrol.py    | 20 +++++++++++++++-----
>>  meta/lib/oeqa/utils/commands.py   | 13 +++++++++++--
>>  meta/lib/oeqa/utils/qemurunner.py | 28 +++++++++++++++++-----------
>>  3 files changed, 43 insertions(+), 18 deletions(-)
>
> This change breaks "oe-selftest -r wic.Wic.test_qemu_efi" which just
> hangs afterwards.

Sorry, I will fix it.

// Robert

>
> Cheers,
>
> Richard
>

