Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3F5616FF78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 12:21:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 Dec 2015 04:21:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,413,1444719600"; d="scan'208";a="858769765"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 11 Dec 2015 04:21:07 -0800
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
	<5668866A.7030900@gmail.com> <566958EC.9030103@linux.intel.com>
	<11154409.cTsW6tvGPG@peggleto-mobl.ger.corp.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <566ABF24.8030807@linux.intel.com>
Date: Fri, 11 Dec 2015 14:18:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.3.0
MIME-Version: 1.0
In-Reply-To: <11154409.cTsW6tvGPG@peggleto-mobl.ger.corp.intel.com>
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
X-List-Received-Date: Fri, 11 Dec 2015 12:21:11 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2015 01:13 AM, Paul Eggleton wrote:
>> Can we get the CVE's fix by this update included in the commit?
>>
>> It's a version update to oe-core's development branch (e.g.
>> non-production, frequently updated), why have the CVEs in the commit
>> message?
>
> So that it's clearer when a CVE has been resolved, however we ended up
> resolving it. We currently have a massive gap in what we know about CVE
> resolution because upgrades that fix them aren't tracked in any way.

CVE database includes information about which upstream versions are 
affected by the vulnerability and which have the fix. We can use this 
information in our RRS to determine if there are any CVEs to be fixed 
and even send notifications to maintainers.

Asking recipe maintainers to inspect the commit log for any new CVEs 
fixed when doing a version update of any package, and then placing those 
numbers into the recipe commit message is unnecessary manual work that 
is also error-prone.

Alex

