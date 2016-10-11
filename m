Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 24CDB71995
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 10:29:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9BATJE8007097
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 11 Oct 2016 03:29:19 -0700
Received: from soho-mhatle-m.local (147.11.116.80) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 11 Oct 2016 03:29:18 -0700
To: Yuanjie Huang <yuanjie.huang@windriver.com>, "Burton, Ross"
	<ross.burton@intel.com>
References: <20161011080241.24267-1-Yuanjie.Huang@windriver.com>
	<39a3791d-d74a-21de-5806-edda4c26b33f@windriver.com>
	<CAJTo0Lb04c39Qz-oTpP-BrLT=ARmr8z9uwEugrc2vK1n6wOp7w@mail.gmail.com>
	<d3ff1e21-3b54-e32f-e4b4-63f94970b0f8@windriver.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <b8fc0f21-8aa3-3711-3a03-dff5df22a84c@windriver.com>
Date: Tue, 11 Oct 2016 12:29:16 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <d3ff1e21-3b54-e32f-e4b4-63f94970b0f8@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Fix timestamp of plural.c after unpack
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
X-List-Received-Date: Tue, 11 Oct 2016 10:29:24 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 10/11/16 11:50 AM, Yuanjie Huang wrote:
> The generated parser contains huge hunks of code actually shipped with bison, so
> I think we should also expect some semantic difference.

Exactly the problem.  Unless the plural.y has been modified, we should not be
regenerating the .c file as shipped by glibc.  It has the possibility of
introducing problems.... but the immediate concern is the non-determinism where
some builds rebuild, some do not.

--Mark

> Yuanjie
> 
> On 10/11/2016 05:17 PM, Burton, Ross wrote:
>>
>> On 11 October 2016 at 09:37, Mark Hatle <mark.hatle@windriver.com
>> <mailto:mark.hatle@windriver.com>> wrote:
>>
>>     My understanding of the issue is that the extraction of the plural.c and
>>     plural.y files happens so quickly that it is unclear to make if one is older
>>     then the other -- so it sometimes uses bison to rebuild the plural.c.  This
>>     produces a non-deterministic build.
>>
>>
>> Surely the rebuilt plural.c should be identical to the shipped one?
>> (semantically if not literally)
>>
>> Ross
> 


