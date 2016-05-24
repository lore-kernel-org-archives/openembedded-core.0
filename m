Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F381060107
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 03:34:59 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2016 20:35:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="707883356"
Received: from jchang2-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.174.130])
	by FMSMGA003.fm.intel.com with ESMTP; 23 May 2016 20:34:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 24 May 2016 15:34:56 +1200
Message-ID: <1551285.Qn0PiMd4j4@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.9-300.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <cover.1464060246.git.liezhi.yang@windriver.com>
References: <cover.1464060246.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] remove unneeded python2 recipes
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
X-List-Received-Date: Tue, 24 May 2016 03:35:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Robert,

On Mon, 23 May 2016 20:25:36 Robert Yang wrote:
> They were required by buildtools-tarball, now replaced by python3 ones.

It's not so much that they are required by buildtools-tarball, they are 
required by various scripts that we have. When you say unneeded, I assume only 
on the python3 branch? In master python-git very definitely is still needed.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

