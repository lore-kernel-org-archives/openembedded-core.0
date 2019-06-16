Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D557F7D6A3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Jun 2019 15:50:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5GFnXv8011268
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Jun 2019 08:50:03 -0700
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 16 Jun 2019 08:49:28 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <7dfc2889b06074410d65ec1a2cda992a12e6a80a.camel@linuxfoundation.org>
	<20190614164542.7178-1-Randy.MacLeod@windriver.com>
	<5dd020eba3fd1bb36ac479db2127afbd4e74552a.camel@linuxfoundation.org>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <784eba9f-9440-4779-e3d4-f5b29cd14d2d@windriver.com>
Date: Sun, 16 Jun 2019 11:49:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5dd020eba3fd1bb36ac479db2127afbd4e74552a.camel@linuxfoundation.org>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH 1/4] util-linux: add setpriv utility
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
X-List-Received-Date: Sun, 16 Jun 2019 15:50:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 6/15/19 11:16 AM, Richard Purdie wrote:
> On Fri, 2019-06-14 at 12:45 -0400, Randy MacLeod wrote:
>> Enable the setpriv utility for targets only. It will be used in
>> the run-ptest script for bash and perhaps other packages where
>> the ptest code is expected to run as a user.
>>
>> setpriv uses libcap-ng which doesn't build natively so disable
>> it for native* builds. Also, busybox has a setpriv implementation
>> so ensure that setpriv adheres to the alternatives scheme.
>>
>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>> ---
>>   meta/recipes-core/util-linux/util-linux.inc | 15 +++++++++++----
>>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> No errors but the build is now seeing warnings e.g.:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/703
> 

Fixed for my populate_sdk_ext build at least and hopefully for the
autobuild tests. v3 sent.

../Randy

> Cheers,
> 
> Richard
> 


-- 
# Randy MacLeod
# Wind River Linux

