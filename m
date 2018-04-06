Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id AA9F175063
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 08:31:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2018 01:31:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,414,1517904000"; d="scan'208";a="41149107"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 06 Apr 2018 01:31:21 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
	<20180404111321.10824-20-alexander.kanavin@linux.intel.com>
	<1522946621.11431.427.camel@linuxfoundation.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <0100cad7-cb55-cf49-a4ab-16608a275f58@linux.intel.com>
Date: Fri, 6 Apr 2018 11:24:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1522946621.11431.427.camel@linuxfoundation.org>
Subject: Re: [PATCH 20/22] procps: update to 3.3.13
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
X-List-Received-Date: Fri, 06 Apr 2018 08:31:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/05/2018 07:43 PM, Richard Purdie wrote:
> Does this build on musl?
> 
> https://autobuilder.yocto.io/builders/nightly-musl-x86-64/builds/389/st
> eps/BuildImages/logs/stdio
> 
> or was there some other bad interaction in master-next?

My bad, please remove the commit. The new version of procps is using a 
header (libio.h) that is absent in musl, deprecated in glibc 2.27 and 
removed in glibc 2.28. I reckon they will sort it soon enough.

Alex

