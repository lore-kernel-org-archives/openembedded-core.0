Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B02306131F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 14:10:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 01QEASf5012716
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 26 Feb 2020 06:10:29 -0800 (PST)
Received: from [128.224.56.226] (128.224.56.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 26 Feb 2020 06:10:27 -0800
To: Pierre-Jean Texier <pjtexier@koncepto.io>, <Mikko.Rapeli@bmw.de>
References: <1579631324-16775-1-git-send-email-pjtexier@koncepto.io>
	<20200122092837.GH34396@korppu>
	<a68132ef-a36b-b517-bde0-ca2419ae15fb@koncepto.io>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <3166a29d-cff4-93c4-760a-0795f19af04f@windriver.com>
Date: Wed, 26 Feb 2020 09:10:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <a68132ef-a36b-b517-bde0-ca2419ae15fb@koncepto.io>
X-Originating-IP: [128.224.56.226]
Cc: peter.kjellerstedt@axis.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: upgrade 2.34 -> 2.35
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
X-List-Received-Date: Wed, 26 Feb 2020 14:10:52 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 8bit

On 1/22/20 1:06 PM, Pierre-Jean Texier via Openembedded-core wrote:
> Hi Mikko,
> 
> Le 22/01/2020 à 10:28, Mikko.Rapeli@bmw.de a écrit :
>> Which parts of util-linux are now licensed with GPLv3?
> 
> As said by Peter previously, it's only for hwclock. In fact
> since commit 7a3000f7ba548cf7d74ac77cc63fe8de228a669e ("hwclock: use 
> parse_date function ") so the version 2.30,
> hwclock is linked with parse_date.y from gnullib.
> And gnulib code is distributed with GPLv3
> 
> Regards

It would be nice to get util-linux updated for 3.1.

Pierre-Jean do you have time to address the GPLv3/hwclock licensing
and re-submit (2.35.1?) this week?

-- 
# Randy MacLeod
# Wind River Linux

