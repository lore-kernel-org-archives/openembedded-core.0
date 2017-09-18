Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1427377DD7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 12:42:08 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Sep 2017 05:42:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,412,1500966000"; d="scan'208";a="153065061"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 18 Sep 2017 05:42:09 -0700
To: Jussi Laako <jussi.laako@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <20170915120300.35572-1-jussi.laako@linux.intel.com>
	<20170915120300.35572-2-jussi.laako@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <6cb906dd-4a3e-daba-a287-1db781eae5f0@linux.intel.com>
Date: Mon, 18 Sep 2017 15:38:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170915120300.35572-2-jussi.laako@linux.intel.com>
Subject: Re: [meta-oe][PATCH v3 2/2] libgcrypt: provide libgcrypt-config wrapper around pkg-config
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
X-List-Received-Date: Mon, 18 Sep 2017 12:42:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/15/2017 03:03 PM, Jussi Laako wrote:
> This patch adds a libgcrypt-config wrapper for pkg-config support in
> order to avoid patching all upstream packages using libgcrypt, while
> otherwise keeping pkg-config functionality.
> 
> Signed-off-by: Jussi Laako <jussi.laako@linux.intel.com>
> ---
>   .../libgcrypt/files/libgcrypt-config-wrapper.patch | 113 +++++++++++++++++++++
>   meta/recipes-support/libgcrypt/libgcrypt_1.8.1.bb  |   5 +-
>   2 files changed, 115 insertions(+), 3 deletions(-)
>   create mode 100644 meta/recipes-support/libgcrypt/files/libgcrypt-config-wrapper.patch
> 
> diff --git a/meta/recipes-support/libgcrypt/files/libgcrypt-config-wrapper.patch b/meta/recipes-support/libgcrypt/files/libgcrypt-config-wrapper.patch
> new file mode 100644
> index 0000000000..167706535b
> --- /dev/null
> +++ b/meta/recipes-support/libgcrypt/files/libgcrypt-config-wrapper.patch
> @@ -0,0 +1,113 @@
> +diff -ur libgcrypt-1.8.1.orig/src/libgcrypt-config.in libgcrypt-1.8.1.new/src/libgcrypt-config.in
> +--- libgcrypt-1.8.1.orig/src/libgcrypt-config.in	2013-03-15 21:25:38.000000000 +0200
> ++++ libgcrypt-1.8.1.new/src/libgcrypt-config.in	2017-09-15 13:56:20.368277151 +0300

Please don't add bare patches with no information. In addition to mssing 
signed-off-by and upstream-status (you should have gotten an automated 
check failure for those), you should also add a 'commit message' for the 
patch, so that anyone looking at it can quickly see what it's for 
without digging through commit history. You can simply copy-paste the 
message to the oe-core commit then.

It's most convenient to add recipe patches using 'devtool 
modify/update-recipe' - that will automate away the boring bits.

Alex

