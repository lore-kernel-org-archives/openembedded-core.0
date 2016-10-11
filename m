Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 49FFB60939
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 12:56:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9BCugfB010298
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 11 Oct 2016 05:56:42 -0700
Received: from soho-mhatle-m.local (147.11.116.82) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 11 Oct 2016 05:56:41 -0700
To: Phil Blundell <pb@pbcl.net>, Yuanjie Huang <Yuanjie.Huang@windriver.com>, 
	<openembedded-core@lists.openembedded.org>
References: <20161011080241.24267-1-Yuanjie.Huang@windriver.com>
	<1476186839.16008.43.camel@pbcl.net>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <91bf66ab-ed87-3f98-b7b1-cd75344e61f0@windriver.com>
Date: Tue, 11 Oct 2016 14:56:40 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1476186839.16008.43.camel@pbcl.net>
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
X-List-Received-Date: Tue, 11 Oct 2016 12:56:42 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 10/11/16 1:53 PM, Phil Blundell wrote:
> On Tue, 2016-10-11 at 16:02 +0800, Yuanjie Huang wrote:
>> From: Yuanjie Huang <yuanjie.huang@windriver.com>
>>
>> Source file plural.c might be updated with bison from plural.y, touch
>> it
>> before applying patches so that this file is consistent across
>> builds.
> 
> I think it would be better to just configure glibc explicitly without
> bison (BISON=no).  It doesn't DEPEND on bison-native anyway so it ought
> never to be using it.

This was the first instance of the patch.  However after discussing the issue w/
Khem Raj (in person), we came to the conclusion that we did want a way to permit
people to modify the plural.y via a patch, otherwise someone could make a change
and not realize it was ignored.

--Mark

> p.
> 


