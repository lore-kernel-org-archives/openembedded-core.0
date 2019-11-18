Return-Path: <ross.burton@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1F1FC7F98A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 14:35:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Nov 2019 06:35:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,320,1569308400"; d="scan'208";a="204216273"
Received: from unknown (HELO blackadder.local) ([10.252.49.82])
	by fmsmga007.fm.intel.com with ESMTP; 18 Nov 2019 06:35:47 -0800
To: openembedded-core@lists.openembedded.org
References: <ea9c1aec639f2c505e8beb3faa7366ee7db4174a.camel@verisure.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <6fedce54-e7dd-71bd-dd0d-96fc542664ce@intel.com>
Date: Mon, 18 Nov 2019 14:35:46 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <ea9c1aec639f2c505e8beb3faa7366ee7db4174a.camel@verisure.com>
Subject: Re: [PATCH] do_image_cpio: Improve reproducibility
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
X-List-Received-Date: Mon, 18 Nov 2019 14:35:47 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 18/11/2019 09:40, Ernst Sjöstrand wrote:
> Find lists files in the order that the filesystem has registered them,
> which can vary. Adding a sort should have minimal performance impact.
> Also use the --reproducible option to cpio.

For some reason this doesn't apply:

Applying: do_image_cpio: Improve reproducibility
Using index info to reconstruct a base tree...
error: patch failed: meta/classes/image_types.bbclass:128
error: meta/classes/image_types.bbclass: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.
Patch failed at 0001 do_image_cpio: Improve reproducibility

Ross

