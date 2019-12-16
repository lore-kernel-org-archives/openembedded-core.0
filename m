Return-Path: <ross.burton@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 2EA3F7F838
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2019 12:20:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Dec 2019 04:20:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,321,1571727600"; d="scan'208";a="212028161"
Received: from kdobros-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.252.33.194])
	by fmsmga007.fm.intel.com with ESMTP; 16 Dec 2019 04:20:36 -0800
To: openembedded-core@lists.openembedded.org
References: <20191212214140.19648-1-git@andred.net>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <dc5711aa-c5f6-4575-6c6c-48df1ae2d353@intel.com>
Date: Mon, 16 Dec 2019 12:20:35 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191212214140.19648-1-git@andred.net>
Subject: Re: [PATCH] e2fsprogs: split dumpe2fs into its own package
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
X-List-Received-Date: Mon, 16 Dec 2019 12:20:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 12/12/2019 21:41, André Draszik wrote:
> This is a mere 24KB (on 32bit arm), avoiding to pull in
> all of the remainder +300KB in small initramfs images
> when not needed.
> Add this new package to RDEPENDS of e2fsprogs so as to
> not break existing users.

Between this and util-linux, there's a lot of boilerplate to split up a 
recipe into every smaller fragments.  Should we just take this to the 
logical conclusion and split it per-binary?

I'm starting to wonder if we need a "split binaries" class that can just 
split a recipe into a package-per-binary, adding the dependencies for you.

Ross

