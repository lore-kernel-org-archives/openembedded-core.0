Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D45C3605B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 23:13:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 10 Dec 2015 15:13:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,410,1444719600"; d="scan'208";a="838826109"
Received: from exxie-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.172.26])
	by orsmga001.jf.intel.com with ESMTP; 10 Dec 2015 15:13:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Fri, 11 Dec 2015 12:13:26 +1300
Message-ID: <11154409.cTsW6tvGPG@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.6-301.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <566958EC.9030103@linux.intel.com>
References: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
	<5668866A.7030900@gmail.com> <566958EC.9030103@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 01/10] openssl: update to 1.0.2e
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
X-List-Received-Date: Thu, 10 Dec 2015 23:13:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thu, 10 Dec 2015 12:50:20 Alexander Kanavin wrote:
> On 12/09/2015 09:52 PM, akuster808 wrote:
> > Can we get the CVE's fix by this update included in the commit?
> 
> It's a version update to oe-core's development branch (e.g.
> non-production, frequently updated), why have the CVEs in the commit
> message?

So that it's clearer when a CVE has been resolved, however we ended up 
resolving it. We currently have a massive gap in what we know about CVE 
resolution because upgrades that fix them aren't tracked in any way.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

