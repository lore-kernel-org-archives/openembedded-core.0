Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5181D60291
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 22:18:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAPMI1RC032561
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 25 Nov 2015 14:18:01 -0800
Received: from Marks-MacBook-Pro.local (172.25.36.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Wed, 25 Nov 2015 14:18:00 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <1448484269-132667-1-git-send-email-mark.hatle@windriver.com>
	<CAJTo0LabcacC1K9SWicuFnNQ445Up7ah_g9tngggPdYOFcnRSg@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <56563397.4010605@windriver.com>
Date: Wed, 25 Nov 2015 16:17:59 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LabcacC1K9SWicuFnNQ445Up7ah_g9tngggPdYOFcnRSg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] [jethro/master] Misc fixes
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
X-List-Received-Date: Wed, 25 Nov 2015 22:18:02 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 11/25/15 3:26 PM, Burton, Ross wrote:
> 
> On 25 November 2015 at 20:44, Mark Hatle <mark.hatle@windriver.com
> <mailto:mark.hatle@windriver.com>> wrote:
> 
>     The following fixes have been tested on Jethro, I believe they are
>     also applicable on master.
> 
> 
> As we generally want to ensure fixes go to master before jethro, can you rebase
> these to master (at least 1 and 2 don't apply anymore).

Luckily master hasn't deviated much.  But honestly, I don't have time to rebase
right now.  Next week would likely be the earliest.

> Also is the python2 fix applicable to python3 too?

The python2 fix was derived from the fix python3 already had.

HOWEVER, we've found conditions where it breaks python2.  So it should not be
applied.

There is still a host contamination issue that needs to be resolved, but I don't
have any idea of a fix.

> Ross


