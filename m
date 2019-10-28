Return-Path: <ross.burton@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9D9D27FB19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 23:29:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Oct 2019 16:29:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,241,1569308400"; d="scan'208";a="189765927"
Received: from koernerm-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.249.41.216])
	by orsmga007.jf.intel.com with ESMTP; 28 Oct 2019 16:29:30 -0700
To: openembedded-core@lists.openembedded.org
References: <20191019155242.100169-1-trevor.gamblin@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <e678117f-93e0-c3d8-0561-49b6b048f713@intel.com>
Date: Mon, 28 Oct 2019 23:29:28 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191019155242.100169-1-trevor.gamblin@windriver.com>
Subject: Re: [PATCH] libgcrypt: upgrade 1.8.4 -> 1.8.5
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
X-List-Received-Date: Mon, 28 Oct 2019 23:29:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 19/10/2019 16:52, Trevor Gamblin wrote:
> Note that the patch 0001-Add-and-use-pkg-config-for-libgcrypt-instead-of-conf.patch
> was removed as its intent was to provide a pkg-config option, but
> libgcrypt upstream added one in commit 813b002eaf.

I think we need to retain portions of that patch:

| checking for libgcrypt-config... 
/data/poky-tmp/master/work/corei7-64-poky-linux/gcr/3.34.0-r0/recipe-sysroot/usr/bin/crossscripts/libgcrypt-config
| checking for LIBGCRYPT - version >= 1.4.5... ERROR: 
/usr/bin/libgcrypt-config should not be used, use an alternative such as 
pkg-config
| ../gcr-3.34.0/configure: line 14093: test: 
--should-not-have-used-/usr/bin/libgcrypt-config: integer expression 
expected
| ../gcr-3.34.0/configure: line 14096: test: 
--should-not-have-used-/usr/bin/libgcrypt-config: integer expression 
expected

Whilst it's great that libgcrypt is shipping a pc file, we need to 
retain the porting of the macro files to use that pc file.

Ross


