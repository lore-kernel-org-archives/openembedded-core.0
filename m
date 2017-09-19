Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BED9977EAC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 02:11:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8J2BpeS014709
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 18 Sep 2017 19:11:51 -0700
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 18 Sep 2017 19:11:50 -0700
To: Khem Raj <raj.khem@gmail.com>, Martin Jansa <martin.jansa@gmail.com>,
	"Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
References: <20170911203056.22156-1-otavio@ossystems.com.br>
	<CA+chaQcUnbBq_f3zkAOxSF_E8M9RUMSaefncSgF6Hdt-j+Q0qg@mail.gmail.com>
	<CAMKF1spThq_ChRsvqVsRBuJhH6SBcwDZ_m5UPm8KPn=Arbt=wg@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <c24ebc61-2c66-ed77-e73f-c00061339929@windriver.com>
Date: Mon, 18 Sep 2017 22:11:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1spThq_ChRsvqVsRBuJhH6SBcwDZ_m5UPm8KPn=Arbt=wg@mail.gmail.com>
X-Originating-IP: [172.25.44.7]
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
	Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Core Mailing List
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2017.09
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
X-List-Received-Date: Tue, 19 Sep 2017 02:11:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-09-17 11:35 AM, Khem Raj wrote:
> I am seeing same failures too. havent yet dug into it.

Same here.

Jackie said that he's going to investigate now.

We've only seen this failure since 2017-09-15 06:00 AM ET
after we rebased onto 2017-09-14 content/ this commit:
   583dca2 meta/conf/layers.conf: Add ca-certificates as ABISAFE
   75e918d linux-firmware: package Marvell PCIe WiFi firmwares
   0001cee insane: don't pass skip list to functions which don't ...
   340d413 u-boot: Upgrade to 2017.09
   ...

-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

