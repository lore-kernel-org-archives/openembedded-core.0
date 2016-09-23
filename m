Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0E6496025F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 12:03:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 Sep 2016 05:03:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,381,1470726000"; d="scan'208";a="1044635043"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.49])
	([10.237.68.49])
	by fmsmga001.fm.intel.com with ESMTP; 23 Sep 2016 05:03:20 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1474619763.git.patrick.ohly@intel.com>
	<d96c9d2d55f4f6dcc78a51fadfb847711e89a09a.1474619763.git.patrick.ohly@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <67fabe6e-fb01-7462-2e5e-8424d5d24571@linux.intel.com>
Date: Fri, 23 Sep 2016 15:01:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <d96c9d2d55f4f6dcc78a51fadfb847711e89a09a.1474619763.git.patrick.ohly@intel.com>
Subject: Re: [PATCH 1/1] openssl: update to 1.0.2i (CVE-2016-6304 and more)
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
X-List-Received-Date: Fri, 23 Sep 2016 12:03:19 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/23/2016 11:39 AM, Patrick Ohly wrote:
> This update fixes several CVEs:
> * OCSP Status Request extension unbounded memory growth (CVE-2016-6304)
> * SWEET32 Mitigation (CVE-2016-2183)
> * OOB write in MDC2_Update() (CVE-2016-6303)
> * Malformed SHA512 ticket DoS (CVE-2016-6302)
> * OOB write in BN_bn2dec() (CVE-2016-2182)
> * OOB read in TS_OBJ_print_bio() (CVE-2016-2180)
> * DTLS buffered message DoS (CVE-2016-2179)
> * DTLS replay protection DoS (CVE-2016-2181)
> * Certificate message OOB reads (CVE-2016-6306)
>
> Of these, only CVE-2016-6304 is considered of high
> severity. Everything else is low. CVE-2016-2177 and CVE-2016-2178 were
> already fixed via local patches, which can be removed now.

This demonstrates that:

a) if CVEs are fixed with backported patches, the process must be 
*thorough* and not shotgun-ish like now. It's pointless to fix some CVEs 
and ignore the others, just because that's what automated tools like 
cve-checker reported or someone saw some mail on a mailing list.

b) it's okay to not fix low-severity CVEs until the upstream makes a new 
release. Upstream is much more competent than we are to judge that, and 
if the issue is high severity, they should make a new release anyway.

Please feel free to disagree.

Alex

