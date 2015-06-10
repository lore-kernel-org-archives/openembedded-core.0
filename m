Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3ED236AC24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 12:29:01 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 10 Jun 2015 05:29:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,587,1427785200"; d="scan'208";a="585343873"
Received: from cpmcinty-mobl5.ger.corp.intel.com (HELO [10.252.0.209])
	([10.252.0.209])
	by orsmga003.jf.intel.com with ESMTP; 10 Jun 2015 05:28:59 -0700
User-Agent: Microsoft-MacOutlook/14.5.0.150423
Date: Wed, 10 Jun 2015 15:28:59 +0300
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <D19E080E.51B21%markus.lehtonen@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 00/10] devtool refactoring
References: <1433435514-28677-1-git-send-email-markus.lehtonen@linux.intel.com>
	<6837948.BxYHk4oixu@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <6837948.BxYHk4oixu@peggleto-mobl.ger.corp.intel.com>
Mime-version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/10] devtool refactoring
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
X-List-Received-Date: Wed, 10 Jun 2015 12:29:03 -0000
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit

Hi,

On 09/06/15 18:01, "Paul Eggleton" <paul.eggleton@linux.intel.com> wrote:

>Hi Markus,
>
>On Thursday 04 June 2015 19:31:44 Markus Lehtonen wrote:
>> This patchset contains contains some refactoring of the devtool code,
>> hopefully making the code more maintainable and somewhat easier to read.
>
>Unfortunately something in here breaks the QA tests - and this time I've
>double-checked that they pass without this patchset (well, deploy_target
>seems 
>to be failing on one of my machines but not another - am looking into
>that). 
>
>Could you please investigate?

Hmm, strange. I will investigate and get back to this.


Thanks,
   Markus



