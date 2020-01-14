Return-Path: <ross.burton@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id A076D7FA21
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 10:24:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jan 2020 02:24:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,432,1571727600"; d="scan'208";a="242414581"
Received: from jmmarti7-mobl1.amr.corp.intel.com (HELO rburton-mac01.local)
	([10.252.51.74])
	by orsmga002.jf.intel.com with ESMTP; 14 Jan 2020 02:24:42 -0800
To: openembedded-core@lists.openembedded.org, sbabic@denx.de
References: <20200103123322.8396-1-sbabic@denx.de>
	<33870edb-953c-0b64-d7b9-884a53395749@windriver.com>
	<1a30e3ce-0931-57f2-130d-17c24372ef50@denx.de>
	<01dd1ae4-751b-15dc-5408-fb5afe44aa24@windriver.com>
	<34dd85e0-dd1d-e5d0-3510-f628d4d66c08@denx.de>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <3464c950-4c63-d587-d3ca-511a1ace920b@intel.com>
Date: Tue, 14 Jan 2020 10:24:41 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <34dd85e0-dd1d-e5d0-3510-f628d4d66c08@denx.de>
Subject: Re: [PATCH V4] u-boot-fw-utils: Add support for libubootenv
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
X-List-Received-Date: Tue, 14 Jan 2020 10:24:42 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 14/01/2020 10:00, Stefano Babic wrote:
> Thanks for this - I have fixed it, too, fast exactly in the same way you
> did, but directly into libubootenv. This avoids to track the patch into OE:
> 
> 	http://patchwork.ozlabs.org/patch/1222627/

As you're using GNUInstallDirs there to get libdir, you might as well 
use it for all of the other paths too (bindir, libdir, etc).

Ross

