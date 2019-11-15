Return-Path: <ross.burton@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B24146C129
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2019 13:24:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Nov 2019 05:24:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,308,1569308400"; d="scan'208";a="199198939"
Received: from bpuehrin-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.252.43.253])
	by orsmga008.jf.intel.com with ESMTP; 15 Nov 2019 05:24:17 -0800
To: openembedded-core@lists.openembedded.org
References: <20191115051628.925-1-zangrc.fnst@cn.fujitsu.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <75221638-afd5-e2fd-57a3-879f678146eb@intel.com>
Date: Fri, 15 Nov 2019 13:24:15 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191115051628.925-1-zangrc.fnst@cn.fujitsu.com>
Subject: Re: [PATCH] make-mod-scripts:remove make-mod-scripts from RDEPENDS
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
X-List-Received-Date: Fri, 15 Nov 2019 13:24:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 15/11/2019 05:16, Zang Ruochen wrote:
> +RDEPENDS_make-mod-scripts-dev_remove = "make-mod-scripts (= 1.0-r0)"

You're hardcoding PV-PR there, don't do that.

Easier is probably to just set RDEPENDS_${PN}-dev = "" if the package 
doesn't have any other dependencies.

Ross

