Return-Path: <paul.eggleton@linux.intel.com>
X-Greylist: delayed 574 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 28 Aug 2016 21:57:47 UTC
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 856226010B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Aug 2016 21:57:47 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 28 Aug 2016 14:48:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,593,1464678000"; 
   d="scan'208";a="2085599"
Received: from aupadhy1-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.181.46])
	by fmsmga006.fm.intel.com with ESMTP; 28 Aug 2016 14:48:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
Date: Mon, 29 Aug 2016 09:48:09 +1200
Message-ID: <32722850.I1xrKX1UQb@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.6.6-200.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1472245661-28013-1-git-send-email-humberto.ibarra.lopez@intel.com>
References: <1472245661-28013-1-git-send-email-humberto.ibarra.lopez@intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] The current syntax of oe-selftest is messy. This patch reorganizes it in a clearer way by grouping all functions in a 'run' subcommand and a 'list' subcommand.
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
X-List-Received-Date: Sun, 28 Aug 2016 21:57:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Humberto,

On Fri, 26 Aug 2016 16:07:41 Humberto Ibarra wrote:
> A different patch is going to be send to avoid this syntax change from
> breaking autobuilder. Both patches belong to same bug (8938) and should be
> integrated together.

This patch is missing a shortlog (short summary in the first line of the 
commit message).

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

