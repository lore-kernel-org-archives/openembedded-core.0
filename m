Return-Path: <ross.burton@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 233C57F7C0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 21:28:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2019 13:28:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,301,1569308400"; d="scan'208";a="229890095"
Received: from bhatavin-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.249.42.178])
	by fmsmga004.fm.intel.com with ESMTP; 13 Nov 2019 13:28:02 -0800
To: openembedded-core@lists.openembedded.org
References: <20191112223119.47941-1-paul@betafive.co.uk>
	<20191112223119.47941-2-paul@betafive.co.uk>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <b7cf9efa-6caf-c2f2-40ff-e84205f6e4ea@intel.com>
Date: Wed, 13 Nov 2019 21:28:01 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191112223119.47941-2-paul@betafive.co.uk>
Subject: Re: [PATCH 1/1] cdrtools-native: Don't set uid/gid during install
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
X-List-Received-Date: Wed, 13 Nov 2019 21:28:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 12/11/2019 22:31, Paul Barker wrote:
> +++ b/meta/recipes-devtools/cdrtools/cdrtools-native/0001-Don-t-set-uid-gid-during-install.patch

ERROR: cdrtools-native-3.01a31+really3.01-r0 do_fetch: Fetcher failure: 
Unable to find file file://0001-Don-t-set-uid-gid-during-install.patch 
anywhere. The paths that were searched were:
 
/home/ross/Yocto/poky/meta/recipes-devtools/cdrtools/cdrtools-3.01a31+really3.01/poky
     /home/ross/Yocto/poky/meta/recipes-devtools/cdrtools/cdrtools/poky
     /home/ross/Yocto/poky/meta/recipes-devtools/cdrtools/files/poky
 
/home/ross/Yocto/poky/meta/recipes-devtools/cdrtools/cdrtools-3.01a31+really3.01/
     /home/ross/Yocto/poky/meta/recipes-devtools/cdrtools/cdrtools/
     /home/ross/Yocto/poky/meta/recipes-devtools/cdrtools/files/
 
/home/ross/Yocto/poky/meta/recipes-devtools/cdrtools/cdrtools-3.01a31+really3.01/x86-64
     /home/ross/Yocto/poky/meta/recipes-devtools/cdrtools/cdrtools/x86-64
     /home/ross/Yocto/poky/meta/recipes-devtools/cdrtools/files/x86-64
 
/home/ross/Yocto/poky/meta/recipes-devtools/cdrtools/cdrtools-3.01a31+really3.01/
     /home/ross/Yocto/poky/meta/recipes-devtools/cdrtools/cdrtools/
     /home/ross/Yocto/poky/meta/recipes-devtools/cdrtools/files/
     /home/ross/Yocto/downloads/

Put it in /cdrtools/ not cdrtool-native.

> +Upstream-status: Inappropriate [native]

As the pedantic patchtest says, Upstream-Status.

Ross

