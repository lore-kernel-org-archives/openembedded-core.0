Return-Path: <Yuanjie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CE2BD77C73
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 06:18:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3B6ICS2008022
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 10 Apr 2017 23:18:12 -0700
Received: from [128.224.162.180] (128.224.162.180) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 10 Apr 2017 23:18:11 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20170410103425.333195-1-yuanjie.huang@windriver.com>
	<1491862224.6264.0.camel@linuxfoundation.org>
From: Yuanjie Huang <yuanjie.huang@windriver.com>
Message-ID: <79336d8d-845d-b4ef-7eb5-acc8f10f675d@windriver.com>
Date: Tue, 11 Apr 2017 14:18:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491862224.6264.0.camel@linuxfoundation.org>
Subject: Re: [PATCH] binutils: Fix CVE-2017-6965 and CVE-2017-6966
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
X-List-Received-Date: Tue, 11 Apr 2017 06:18:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/11/2017 06:10 AM, Richard Purdie wrote:
> On Mon, 2017-04-10 at 03:34 -0700, Yuanjie Huang wrote:
>> meta/recipes-devtools/binutils/binutils-2.27.inc
> Given master contains 2.28, I don't think this patch was based on or
> tested against master?
Not yet, I will work on that, and will send the patch for master later. 
Our current product is based on Morty, so I fixed it first.

Cheers,
Yuanjie
> Cheers,
>
> Richard


