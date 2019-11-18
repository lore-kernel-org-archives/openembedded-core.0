Return-Path: <ross.burton@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3F2337F88E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 16:53:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Nov 2019 08:53:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,320,1569308400"; d="scan'208";a="209136872"
Received: from unknown (HELO blackadder.local) ([10.252.49.82])
	by orsmga006.jf.intel.com with ESMTP; 18 Nov 2019 08:53:41 -0800
To: akuster808 <akuster808@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Stefan Agner <stefan@agner.ch>, openembedded-core@lists.openembedded.org
References: <20191108091419.25156-1-stefan@agner.ch>
	<7e0b2e1cc9931c92c2bcdcf5ef1f6f75@agner.ch>
	<4b4629ef84240f6d5e7da1363d88ebe15f4ab049.camel@linuxfoundation.org>
	<e03eeb0f-f8cd-f6ea-ad02-44f41bdf1e84@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <eb8e027d-2797-4bce-a59d-e7e2eb369aa6@intel.com>
Date: Mon, 18 Nov 2019 16:53:40 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <e03eeb0f-f8cd-f6ea-ad02-44f41bdf1e84@gmail.com>
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH v3 1/2] zstd: move recipe to oe-core from meta-oe
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
X-List-Received-Date: Mon, 18 Nov 2019 16:53:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 18/11/2019 16:47, akuster808 wrote:
> Does a possible Poky LTS have any factor in deciding to add more
> packages to core?

Even without the LTS there's a (relatively) long-term commitment to 
maintain recipes.

Personally, I'm happy with Zstd being in meta-oe for now, and possibly 
re-evaluating in the next cycle.

Ross

