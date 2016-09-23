Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id ADA876025F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 12:13:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 23 Sep 2016 05:13:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,381,1470726000"; d="scan'208";a="1055310282"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.49])
	([10.237.68.49])
	by orsmga002.jf.intel.com with ESMTP; 23 Sep 2016 05:13:07 -0700
To: openembedded-core@lists.openembedded.org
References: <cover.1474619763.git.patrick.ohly@intel.com>
	<1474626443.7161.5.camel@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <2890fce9-ac23-d251-8b15-c8b11994e795@linux.intel.com>
Date: Fri, 23 Sep 2016 15:11:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1474626443.7161.5.camel@intel.com>
Subject: Re: [PATCH 0/1] openssl: update to 1.0.2i (CVE-2016-6304 and more)
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
X-List-Received-Date: Fri, 23 Sep 2016 12:13:32 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/23/2016 01:27 PM, Patrick Ohly wrote:
>
> There is one FAIL:
>
> ../util/shlib_wrap.sh ./dtlstest ../apps/server.pem ../apps/server.pem
> Starting Test 0
> Failed to load server certificate
> Unable to create SSL_CTX pair
> make[2]: Leaving directory '/usr/lib/openssl/ptest/test'
> FAIL: test_dtls
>
> That's because server.pem wasn't installed. I'll fix that.
>
> However, ptest-runner returns with 0, i.e. success? Should it do that?

What does the failing test itself return? After checking the 
ptest-runner source code, it shouldn't return 0 if one of the tests it 
runs fails with a non-zero exit.

Alex


