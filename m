Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AD7016079F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 02:02:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wAL21TYk002358
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Nov 2018 18:01:40 -0800
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 20 Nov 2018 18:01:18 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Jonathan Liu
	<net147@gmail.com>
References: <1541042117-20190-1-git-send-email-changqing.li@windriver.com>
	<CANwerB2J_darmy4oh=EQAC0kMmhkVfH_RBAMH8Cm7UH3dyS4Hw@mail.gmail.com>
	<a27dd970c17106dbda9b6e9fb1729ab1d4d790b0.camel@linuxfoundation.org>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <8d64347a-5cc0-ad19-d667-2b4ba1cb418b@windriver.com>
Date: Wed, 21 Nov 2018 10:01:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <a27dd970c17106dbda9b6e9fb1729ab1d4d790b0.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.228]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] apt: update SRC_URI
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
X-List-Received-Date: Wed, 21 Nov 2018 02:02:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11/20/18 10:10 PM, Richard Purdie wrote:
> On Mon, 2018-11-19 at 21:54 +1100, Jonathan Liu wrote:
>> -SRC_URI = "
>>> http://archive.ubuntu.com/ubuntu/pool/main/a/${BPN}/${BPN}_${PV}.tar.xz
>>>   \
>>> +SRC_URI = "
>>> https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/apt/1.2.24/${BPN}_${PV}.tar.xz
>>>   \
>> Why don't you replace apt with ${BPN} and 1.2.24 with ${PV} in
>> SRC_URI?
> I tweaked this since it was easier than trying to remember to track
> this :)
>
> Cheers,
>
> Richard
>
Thanks. :)

-- 
BRs

Sandy(Li Changqing)


