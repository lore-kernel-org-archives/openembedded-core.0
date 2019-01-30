Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 08EE87C3C6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 23:19:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0UNJP2X024582
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Jan 2019 15:19:25 -0800 (PST)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.435.0;
	Wed, 30 Jan 2019 15:19:24 -0800
To: Ruslan Bilovol <ruslan.bilovol@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1548507480-22805-1-git-send-email-ruslan.bilovol@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <9aaf65ce-c4d2-c9ef-24bb-e85bf667bd9c@windriver.com>
Date: Wed, 30 Jan 2019 18:19:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1548507480-22805-1-git-send-email-ruslan.bilovol@gmail.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH 0/6] Remove lost patches from oe-core
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
X-List-Received-Date: Wed, 30 Jan 2019 23:19:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 1/26/19 7:57 AM, Ruslan Bilovol wrote:
> Working with recent oe-core I noticed that there are
> patches not used by any recipe, which is confusing.
> This is caused by mistakes in recipe upgrades, when
> people remove patch from SRC_URI but forgets to
> delete actual patch.
> Instead of fixing only recipes I worked on,
> I wrote a simple bash script which found all 6
> lost patches in oe-core.


What's the 'simple bash script' ?
We could add it to scripts and use it later and for other layers.

-- 
# Randy MacLeod
# Wind River Linux

