Return-Path: <ross.burton@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C98087E830
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 12:27:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Sep 2019 05:27:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="179661876"
Received: from asomsiko-mobl1.ccr.corp.intel.com (HELO blackadder.local)
	([10.252.54.186])
	by orsmga008.jf.intel.com with ESMTP; 13 Sep 2019 05:27:13 -0700
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20190911042903.3047253-1-raj.khem@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <984e3147-bddd-56a5-ea90-eea87d8a792c@intel.com>
Date: Fri, 13 Sep 2019 13:27:12 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190911042903.3047253-1-raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH V3] weston-init: Add possibility to run weston as non-root user
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
X-List-Received-Date: Fri, 13 Sep 2019 12:27:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 11/09/2019 05:29, Khem Raj wrote:
>   .../wayland/weston-init/weston.ini            | 74 +++++++++++++++++++

core-image-weston now fails:

   file /etc/xdg/weston/weston.ini conflicts between attempted installs 
of weston-init-1.0-r0.noarch and weston-conf-1.0-r0.qemux86_64

Ross

