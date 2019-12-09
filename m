Return-Path: <ross.burton@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id DE0D57FC26
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Dec 2019 10:34:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Dec 2019 02:34:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,294,1571727600"; d="scan'208";a="224737809"
Received: from pozo-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.252.33.212])
	by orsmga002.jf.intel.com with ESMTP; 09 Dec 2019 02:34:00 -0800
To: akuster808 <akuster808@gmail.com>,
	oe-core <openembedded-core@lists.openembedded.org>
References: <20191205144551.26888-1-ross.burton@intel.com>
	<b0e36eed-340b-7c1b-bcc3-5f4e302c737b@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <116ca0a5-846f-c519-3469-9d2525151942@intel.com>
Date: Mon, 9 Dec 2019 10:33:59 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <b0e36eed-340b-7c1b-bcc3-5f4e302c737b@gmail.com>
Subject: Re: [PATCH][thud] glibc: finish incomplete fix for CVE-2016-10739
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
X-List-Received-Date: Mon, 09 Dec 2019 10:34:01 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 08/12/2019 21:37, akuster808 wrote:
> 
> 
> On 12/5/19 6:45 AM, Ross Burton wrote:
>> Somehow the patch for this CVE only included one of the four required patches.
> 
> fails:
> 
> Applying patch CVE-2016-10739.patch
> patching file resolv/inet_addr.c
> patching file resolv/nss_dns/dns-host.c
> patching file NEWS
> Hunk #1 FAILED at 10.
> Hunk #2 succeeded at 18 with fuzz 2 (offset -39 lines).
> 1 out of 2 hunks FAILED -- rejects in file NEWS
> patching file include/arpa/inet.h
> patching file nscd/gai.c
> patching file nscd/gethstbynm3_r.c
> patching file nss/digits_dots.c
> patching file resolv/Makefile
> patching file resolv/Versions
> patching file resolv/inet_addr.c
> patching file resolv/res_init.c
> patching file resolv/tst-aton.c
> patching file resolv/tst-inet_aton_exact.c
> patching file resolv/tst-resolv-nondecimal.c
> patching file resolv/tst-resolv-trailing.c
> patching file sysdeps/posix/getaddrinfo.c
> patching file nscd/Makefile
> patching file nscd/gai.c
> patching file nscd/nscd-inet_addr.c
> Patch CVE-2016-10739.patch does not apply (enforce with -f)

Whaaaaaaat?


