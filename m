Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 17532605B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 19:48:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4NJmdRr006784
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 12:48:40 -0700 (PDT)
Received: from [172.25.44.2] (172.25.44.2) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 23 May 2018 12:48:39 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20180519162102.GL19965@denix.org>
	<CAMKF1srt3AbRBgdBZp2ya-VkWm1K6r8eywFbqr3nMFe7EqNuFw@mail.gmail.com>
	<20180519193341.GM19965@denix.org>
	<CAMKF1sqfpZhKJKjFoouGhpRbZEfJBqXJxmqunepAx2weVsQEnA@mail.gmail.com>
	<20180520005742.GN19965@denix.org>
	<e718c04f-fbe8-4235-aae7-1c2a335498b4@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <e4c12866-e26b-c7b0-e70a-e0c4c6ebefb3@windriver.com>
Date: Wed, 23 May 2018 15:48:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <e718c04f-fbe8-4235-aae7-1c2a335498b4@gmail.com>
X-Originating-IP: [172.25.44.2]
Subject: Re: GCC 9 Drops Support For Older ARM Microarchitecture Versions
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
X-List-Received-Date: Wed, 23 May 2018 19:48:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 05/20/2018 10:59 AM, akuster808 wrote:
> Maybe a bug is in order and then we might be able to add it to the 2.6
> planning?

Not my bug to file... anyone?
> 
> Maybe a QEMU strategy for OE going forward may also be a topic.

There is meta-qemuarma9:
   https://github.com/OverC/meta-qemuarma9.git
I'm not an arm man but would it make sense for oe-core to
drop qemuarm and use qemuarma9?

-- 
# Randy MacLeod
# Wind River Linux

