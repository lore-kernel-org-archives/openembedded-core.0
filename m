Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5FA0F73E65
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 15:01:56 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 09 Jun 2015 08:01:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,581,1427785200"; d="scan'208";a="584762469"
Received: from alefebvr-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.29.139])
	by orsmga003.jf.intel.com with ESMTP; 09 Jun 2015 08:01:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Date: Tue, 09 Jun 2015 16:01:55 +0100
Message-ID: <6837948.BxYHk4oixu@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/4.0.4-202.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <1433435514-28677-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1433435514-28677-1-git-send-email-markus.lehtonen@linux.intel.com>
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 09 Jun 2015 15:01:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Markus,

On Thursday 04 June 2015 19:31:44 Markus Lehtonen wrote:
> This patchset contains contains some refactoring of the devtool code,
> hopefully making the code more maintainable and somewhat easier to read.

Unfortunately something in here breaks the QA tests - and this time I've 
double-checked that they pass without this patchset (well, deploy_target seems 
to be failing on one of my machines but not another - am looking into that). 

Could you please investigate?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

