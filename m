Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 57F316079F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 14:56:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 23 Sep 2016 07:54:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,381,1470726000"; d="scan'208";a="1044693230"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.49])
	([10.237.68.49])
	by fmsmga001.fm.intel.com with ESMTP; 23 Sep 2016 07:54:26 -0700
To: Patrick Ohly <patrick.ohly@intel.com>
References: <cover.1474619763.git.patrick.ohly@intel.com>
	<1474626443.7161.5.camel@intel.com>
	<2890fce9-ac23-d251-8b15-c8b11994e795@linux.intel.com>
	<1474636754.8561.6.camel@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <9cf4971f-05d0-84b4-47cf-14002e9689c6@linux.intel.com>
Date: Fri, 23 Sep 2016 17:52:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1474636754.8561.6.camel@intel.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Fri, 23 Sep 2016 14:56:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/23/2016 04:19 PM, Patrick Ohly wrote:

> OpenSSL seems to rely on output checking. Not sure whether a patch
> changing that would be accepted.
>
> How are ptests used in the autobuilders? Does the return code of
> ptest-runner matter, or is the output checked for ^PASS|SKIP|FAIL?

I'm not sure about it, but regardless of the autobuilders, it's best to 
fail when there is a failure, so the patch to fix that would be accepted 
here (don't know about upstream).

Alex


