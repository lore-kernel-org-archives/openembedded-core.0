Return-Path: <ross.burton@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 96EBB7F8D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 21:34:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Oct 2019 14:34:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,241,1569308400"; d="scan'208";a="189739502"
Received: from koernerm-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.41.216])
	by orsmga007.jf.intel.com with ESMTP; 28 Oct 2019 14:34:22 -0700
To: openembedded-core@lists.openembedded.org
References: <1572278996-14306-1-git-send-email-hongxu.jia@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <c562c525-2d16-9777-a137-2f6f693be454@intel.com>
Date: Mon, 28 Oct 2019 21:34:22 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1572278996-14306-1-git-send-email-hongxu.jia@windriver.com>
Subject: Re: [PATCH] classes/image_types_wic.bbclass: fix racing risk on rootfs
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
X-List-Received-Date: Mon, 28 Oct 2019 21:34:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 28/10/2019 16:09, Hongxu Jia wrote:
> Since wic image creation will temporarily update rootfs/etc/fstab
> (*temporarily* means the fstab will be recovered after wic image creation),
> there is still racing risk during the temporarily time for other image
> creation (such as tar, ext)

Could this be done with a hardlink tree instead of literally copying the 
entire filesystem?

Ross

