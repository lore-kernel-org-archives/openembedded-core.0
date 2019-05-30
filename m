Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B1D327E342
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 05:24:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4U5NmkB010889
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 May 2019 22:23:58 -0700
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Wed, 29 May 2019 22:23:37 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <1559122507-53104-1-git-send-email-changqing.li@windriver.com>
	<20190529122721.GA20876@localhost>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <cc06513a-d025-dc71-638c-435a862bea64@windriver.com>
Date: Thu, 30 May 2019 13:23:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190529122721.GA20876@localhost>
X-Originating-IP: [128.224.162.186]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] add rconflicts for systemd/resolvconf/tiny-init
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
X-List-Received-Date: Thu, 30 May 2019 05:24:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 5/29/19 8:27 PM, Adrian Bunk wrote:
> On Wed, May 29, 2019 at 05:35:04PM +0800, changqing.li@windriver.com wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>>
>> Changqing Li (3):
>> ...
>>    resolvconf: add rconflicts
>>    systemd: add rconflicts
>> ...
> This is only a conflict if PACKAGECONFIG[resolved] is enabled in systemd,
> other configurations should be fine.
>
> cu
> Adrian

Thanks.  yes,  only when enable resolved,  package resolvconf will 
conflict with systemd.

I will send a v2.

-- 
BRs

Sandy(Li Changqing)


