Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7A49570703
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Oct 2014 16:58:59 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 10 Oct 2014 09:59:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="398299300"
Received: from ncmcquil-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.155])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Oct 2014 09:47:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>,
	Catalin Popeanga <Catalin.Popeanga@enea.com>
Date: Fri, 10 Oct 2014 17:54:30 +0100
Message-ID: <2201235.jOMcl3bBHv@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.1 (Linux/3.16.3-200.fc20.x86_64; KDE/4.14.1; x86_64; ; )
In-Reply-To: <1412857516-42476-1-git-send-email-sona.sarmadi@enea.com>
References: <1412857516-42476-1-git-send-email-sona.sarmadi@enea.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] bash: Fix-for-CVE-2014-6278
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
X-List-Received-Date: Fri, 10 Oct 2014 16:59:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 09 October 2014 14:25:15 Sona Sarmadi wrote:
> From: Catalin Popeanga <Catalin.Popeanga@enea.com>
> 
> This vulnerability exists because of an incomplete fix for CVE-2014-6271,
> CVE-2014-7169, and CVE-2014-6277
> 
> See: https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-6278
> 
> Signed-off-by: Catalin Popeanga <Catalin.Popeanga@enea.com>

I've build and runtime tested both versions of bash with these patches using 
shellshocker, and also double-checked that no regressions have been triggered 
for the 4.x version. Thanks!

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

