Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E82D77213
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 18:53:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u53IrmKr015933
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 3 Jun 2016 11:53:48 -0700
Received: from soho-mhatle-m.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 3 Jun 2016 11:53:48 -0700
To: <alexander.kanavin@linux.intel.com>
References: <1464953991-4125-1-git-send-email-maxin.john@intel.com>
	<cf6e48c8-4fc8-aaec-87d2-940623951477@windriver.com>
	<54951.10.252.18.48.1464982415.squirrel@linux.intel.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <e0e0244c-0099-8c8c-0e47-5077b67ab22d@windriver.com>
Date: Fri, 3 Jun 2016 13:53:47 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.0
MIME-Version: 1.0
In-Reply-To: <54951.10.252.18.48.1464982415.squirrel@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] rpm: update patch to support db-6.2.23
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
X-List-Received-Date: Fri, 03 Jun 2016 18:53:51 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 6/3/16 2:33 PM, alexander.kanavin@linux.intel.com wrote:
>> On 6/3/16 6:39 AM, Maxin B. John wrote:
>>> Refresh the rpm-db60.patch to support db-6.2.23
>>
>> NAK NAK NAK
>>
>> Please do NOT merge this set.
>>
>> 6.2.23 does NOT work with the version of RPM.
> 
> Should db be updated to the latest 6.1 release then?

Latest 6.1 release has the same problem unfortunately.  So it needs to wait as well.

> Generally, Mark, do you want to be the maintainer of db recipe? Since it
> is so tightly coupled with rpm, and is full of nontrivial issues like
> this, it makes sense that you take care of updating both.

I'm fine with moving BDB maintenance to me, and I'll try to keep them in sync
moving forward.. (for the most part they are decoupled, it was only recently
that things broke like this.)

--Mark

> Alex
> 


