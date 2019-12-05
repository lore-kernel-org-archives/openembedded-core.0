Return-Path: <ross.burton@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 26FF07F816
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 14:33:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Dec 2019 06:33:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,281,1571727600"; d="scan'208";a="205785594"
Received: from aaronsan-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.32.186])
	by orsmga008.jf.intel.com with ESMTP; 05 Dec 2019 06:33:50 -0800
To: Adrian Bunk <bunk@stusta.de>
References: <20191205131113.GB3151@localhost>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <c5d244f0-2f18-2f22-211b-b346f0e630b6@intel.com>
Date: Thu, 5 Dec 2019 14:33:48 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191205131113.GB3151@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Is the CVE-2016-10739 fix in thud incomplete?
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
X-List-Received-Date: Thu, 05 Dec 2019 14:33:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 05/12/2019 13:11, Adrian Bunk wrote:
> https://sourceware.org/bugzilla/show_bug.cgi?id=20018#c15
> 
> meta/recipes-core/glibc/glibc/CVE-2016-10739.patch seems to only contain
> the "resolv: Reformat inet_addr, inet_aton to GNU style" commit.

Erm, yes.  Not sure what happened there.

Build-testing a revised patch now.  I wonder if I accidentally forgot to 
concatenate the patches... :/

Ross

