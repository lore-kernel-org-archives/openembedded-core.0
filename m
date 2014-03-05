Return-Path: <alexandrux.palalau@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A47156E754
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 08:41:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Mar 2014 00:40:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,591,1389772800"; d="scan'208";a="466910807"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 05 Mar 2014 00:40:38 -0800
Received: from [10.237.108.167] (apalalax-mobl.ger.corp.intel.com
	[10.237.108.167])
	by linux.intel.com (Postfix) with ESMTP id 31D7E6A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 00:40:26 -0800 (PST)
Message-ID: <5316E304.30709@linux.intel.com>
Date: Wed, 05 Mar 2014 10:40:36 +0200
From: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
Organization: Intel OTC
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1394008127-27700-1-git-send-email-alexandrux.palalau@linux.intel.com>
In-Reply-To: <1394008127-27700-1-git-send-email-alexandrux.palalau@linux.intel.com>
Subject: Re: [PATCH] oe-selftest: add new test for image manifest file creation
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
X-List-Received-Date: Wed, 05 Mar 2014 08:41:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Scratch that, will send V2
On 3/5/2014 10:28 AM, Alexandru Palalau wrote:
> Signed-off-by: Alexandru Palalau <alexandrux.palalau@linux.intel.com>
> ---
>   meta/lib/oeqa/selftest/bbtests.py | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
> index 01e0099..b78d2a7 100644
> --- a/meta/lib/oeqa/selftest/bbtests.py
> +++ b/meta/lib/oeqa/selftest/bbtests.py
> @@ -74,6 +74,13 @@ class BitbakeTests(oeSelfTest):
>           for f in ['pn-buildlist', 'pn-depends.dot', 'package-depends.dot', 'task-depends.dot']:
>               os.remove(f)
>
> +    def test_image_manifest(self):
> +        bitbake('core-image-minimal')
> +        deploydir = get_bb_var("DEPLOY_DIR_IMAGE", target="core-image-basic")
> +        imagename = get_bb_var("IMAGE_LINK_NAME", target="core-image-basic")
> +        manifest = os.path.join(deploydir, imagename + ".manifest")
> +        self.assertTrue(os.path.islink(manifest), msg="No manifest file created for image")
> +
>       def test_invalid_recipe_src_uri(self):
>           data = 'SRC_URI = "file://invalid"'
>           self.write_recipeinc('man', data)
>


-- 
Alexandru Palalau

