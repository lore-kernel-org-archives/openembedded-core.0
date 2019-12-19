Return-Path: <ross.burton@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5692C6C0B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 20:55:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Dec 2019 12:55:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,333,1571727600"; d="scan'208";a="213114015"
Received: from brzodkie-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.32.172])
	by fmsmga007.fm.intel.com with ESMTP; 19 Dec 2019 12:55:38 -0800
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	oe-core <openembedded-core@lists.openembedded.org>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
	<20191218143758.129308-12-alex.kanavin@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <8c5d060d-c77e-d6ef-cd41-672724245cb6@intel.com>
Date: Thu, 19 Dec 2019 20:55:37 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191218143758.129308-12-alex.kanavin@gmail.com>
Subject: Re: [PATCH 12/25] acl/attr: update to latest upstream releases
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
X-List-Received-Date: Thu, 19 Dec 2019 20:55:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 18/12/2019 14:37, Alexander Kanavin wrote:
> The latest release use standard autotools, so drop all
> the build system related hacks and patches.

ea-acl.inc used to have:

PACKAGES =+ "lib${BPN}"
FILES_lib${BPN} = "${base_libdir}/lib*${SOLIBS}"

And then attr.bb had:

LICENSE = "LGPLv2.1+ & GPLv2+"
LICENSE_${PN} = "GPLv2+"
LICENSE_lib${BPN} = "LGPLv2.1+"

Now there's just one package, attr, which contains the binaries and the 
libraries.

I don't think this was intentional?

Ross

