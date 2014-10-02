Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 235D965E1A;
	Thu,  2 Oct 2014 10:24:49 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 02 Oct 2014 03:14:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="394557376"
Received: from cpariyar-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.78])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Oct 2014 03:17:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bryan Evenson <bevenson@melinkcorp.com>
Date: Thu, 02 Oct 2014 11:24:20 +0100
Message-ID: <2267005.PMGg7bo8KU@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.1 (Linux/3.16.3-200.fc20.x86_64; KDE/4.14.1; x86_64; ; )
In-Reply-To: <92223d60b43647d8ba3265cdd621166e@BLUPR05MB037.namprd05.prod.outlook.com>
References: <92223d60b43647d8ba3265cdd621166e@BLUPR05MB037.namprd05.prod.outlook.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] Status of bash patches for dora and dylan?
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
X-List-Received-Date: Thu, 02 Oct 2014 10:24:59 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Bryan,

On Wednesday 01 October 2014 12:54:31 Bryan Evenson wrote:
> I see that patches for bash to fix CVE-2014-7169 and CVE-2014-6271 have been
> applied to the daisy and master branches of openembedded-core two days ago.
>  I saw some talk on this mailing list about applying the patches to the
> dora and dylan.  Are the patches still planned to be applied to the dora
> and dylan branches?  If so, does someone have a timeframe in mind for
> backporting the patches?  If not, do you need someone to cherry-pick the
> commits and verify they work as expected on the dora and dylan branches?

[The bash recipe is part of OE-Core, so this kind of question should really go 
to the OE-Core mailing list, adding it to CC]

Yes, dora patches have just been sent by Robert. I'm in the process of 
backporting and testing these for the dylan branch.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

