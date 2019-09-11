Return-Path: <ross.burton@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 417827D1E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 12:35:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Sep 2019 05:35:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="196878879"
Received: from unknown (HELO blackadder.local) ([10.249.39.47])
	by orsmga002.jf.intel.com with ESMTP; 11 Sep 2019 05:35:34 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>, fabio.berton@ossystems.com.br
References: <20190906184727.552-1-fabio.berton@ossystems.com.br>
	<CANNYZj8jseQc9Lnt8r1SuDdh4q_xUJy5FkpUukpLzUbVn5vW2g@mail.gmail.com>
	<a74c7fb7-451c-094a-36a3-49b62c66d742@intel.com>
	<CANNYZj-2tw_kkoj7OqwhbBggFE7dvZ7dv0FhmsVuA2vOWQBf-A@mail.gmail.com>
	<ac6643d7-da5a-0ec7-799b-06083b728381@intel.com>
	<CANNYZj_oMcEekZoLJ+2vsGc7UgOETJppY1UZ9jDj8z86PeSnXQ@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <268869ab-aa03-cf7c-c75d-9aa8dd7fd5ab@intel.com>
Date: Wed, 11 Sep 2019 13:35:33 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj_oMcEekZoLJ+2vsGc7UgOETJppY1UZ9jDj8z86PeSnXQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade 19.1.1 -> 19.1.6
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
X-List-Received-Date: Wed, 11 Sep 2019 12:35:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 10/09/2019 11:39, Alexander Kanavin wrote:
> Yes, if STAGING_LIBDIR is set, via this patch:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/python/python3/0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch
> 
> (don't shoot the pianist, it was working like this pre-rewrite as well).

See I knew that but had blocked it out because it's so horrible.

One day we need to sit down with upstream Python and figure out how to 
handle cross-compilation properly.

I finally managed to make my own builds fail (had to turn off Python in 
libxml2) and beat at it to build without a target Python.  Fabio: can 
you try building Mesa with these two patches:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=ross/mut&id=5f3559d8bb61212e0f9a6543f2dce2bdf77c48b5
http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=ross/mut&id=4f8995aaa2ec557a0603ddc664d929317b0c0b6e

Cheers,
Ross

