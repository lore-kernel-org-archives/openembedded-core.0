Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E13B573212
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 01:33:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u821XeCk022391
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 1 Sep 2016 18:33:40 -0700 (PDT)
Received: from [128.224.162.177] (128.224.162.177) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 1 Sep 2016 18:33:40 -0700
To: Seebs <seebs@seebs.net>
References: <e33a2d23-6067-cf14-57ab-d40623a3597a@windriver.com>
	<1A4DD5F0-D89E-4FC1-820A-457817B4FCD3@seebs.net>
From: wenzong fan <wenzong.fan@windriver.com>
Message-ID: <b59ea47c-1b82-c480-5d9f-7dfb8051f83a@windriver.com>
Date: Fri, 2 Sep 2016 09:33:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1A4DD5F0-D89E-4FC1-820A-457817B4FCD3@seebs.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: pseudo 1.8.1 doesn't work with docker & dumb-init
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
X-List-Received-Date: Fri, 02 Sep 2016 01:33:44 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/31/2016 11:48 PM, Seebs wrote:
> On 31 Aug 2016, at 4:21, wenzong fan wrote:
>
>> Finally I narrowed it down to pseudo commit:
>
> Yes, that makes sense, we expect that there'd be potential issues, but I
> didn't have a reproducer for any. Thanks! I'll see whether it reproduces
> for me now. Any specific version of docker I might need?

No, I didn't think it's related to any specific docker version.

I tested it on "Docker version 1.7.1, build 786b29d" & "Docker version 
1.11.2, build b9f10c9".

BTW, I also tested the docker build w/o dumb-init, and the build works ...

Thanks
Wenzong

>
> -s
>

