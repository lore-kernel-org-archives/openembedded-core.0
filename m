Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8FA636041F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 14:52:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jun 2013 07:52:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,889,1363158000"; d="scan'208";a="355457656"
Received: from unknown (HELO helios.localnet) ([10.252.122.72])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2013 07:52:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 18 Jun 2013 15:52:36 +0100
Message-ID: <2128990.WGsIo4pG3K@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <CAP9ODKo+VwrLEOH7coCbGWqDCp8CYKVVS_XVtV8Wbw=9jpL6=w@mail.gmail.com>
References: <cover.1370896990.git.chris_larson@mentor.com>
	<7f9158be5a4849dccea0ed848d29f963697c22e3.1370896990.git.chris_larson@mentor.com>
	<CAP9ODKo+VwrLEOH7coCbGWqDCp8CYKVVS_XVtV8Wbw=9jpL6=w@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] connman: use PACKAGECONFIG for WISPr support
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
X-List-Received-Date: Tue, 18 Jun 2013 14:52:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 10 June 2013 18:06:19 Otavio Salvador wrote:
> This seems safe for backporting to 1.4.2 and would allow for more control
> on connman build; Paul?

At the moment we don't seem to have the other PACKAGECONFIG options for 
connman in dylan so this patch doesn't apply cleanly. If people are especially 
keen to have them I can backport these options, but I'd rather not just take 
them on a whim as these are more of an optimisation than a bug fix.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

