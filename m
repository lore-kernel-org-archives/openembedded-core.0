Return-Path: <ross.burton@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2BC267F7BE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2019 13:32:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Nov 2019 05:32:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,267,1569308400"; d="scan'208";a="226751185"
Received: from sptommas-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.252.55.33])
	by fmsmga004.fm.intel.com with ESMTP; 04 Nov 2019 05:32:27 -0800
To: He Zhe <zhe.he@windriver.com>, Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1572517219-382824-1-git-send-email-zhe.he@windriver.com>
	<CADkTA4OvFRd7wCFQRHZAv+BMki9nsX_g5_TuogsHUvSnmDGLxg@mail.gmail.com>
	<5e5f4937-0465-49c0-66aa-71b79628fdf2@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <c2ae56dd-61e2-f58c-a362-1d75a02663dd@intel.com>
Date: Mon, 4 Nov 2019 13:32:26 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5e5f4937-0465-49c0-66aa-71b79628fdf2@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-dummy: Add package kernel
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
X-List-Received-Date: Mon, 04 Nov 2019 13:32:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 01/11/2019 02:01, He Zhe wrote:
> It's the "efi" in MACHINE_FEATURES who asks for "kernel".
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/packagegroups/packagegroup-core-boot.bb#n31

I'd just rip out 'kernel' from that as that doesn't look right to me.

Ross

