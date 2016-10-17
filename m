Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 06AF1719A2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 07:09:19 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP; 17 Oct 2016 00:09:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,356,1473145200"; d="scan'208";a="20365950"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.18.238])
	by orsmga005.jf.intel.com with ESMTP; 17 Oct 2016 00:09:16 -0700
Message-ID: <1476688143.2604.9.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: leonardo.sandoval.gonzalez@linux.intel.com, 
	openembedded-core@lists.openembedded.org
Date: Mon, 17 Oct 2016 08:09:03 +0100
In-Reply-To: <770d29435af19aed00bd15d8b95504218ad600ec.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<770d29435af19aed00bd15d8b95504218ad600ec.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: [PATCH 7/9] selftest: skip runtime-test's test_testimage_install on poky-tiny distro
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
X-List-Received-Date: Mon, 17 Oct 2016 07:09:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-10-14 at 11:40 -0500,
leonardo.sandoval.gonzalez@linux.intel.com wrote:
> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> 
> Distro poky-tiny cannot build the core-image-full-cmdline image, so
> skip the
> test if this is the case.
> 
> [YOCTO #8525]

Wouldn't it be better to use a different image, most likely with extra
packages installed, and maybe a different list of TEST_SUITES for poky-
tiny so that we're still testing this functionality on poky-tiny?

Thanks,

Joshua

> 
> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.in
> tel.com>
> ---
>  meta/lib/oeqa/selftest/runtime-test.py | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/lib/oeqa/selftest/runtime-test.py
> b/meta/lib/oeqa/selftest/runtime-test.py
> index c2d5b45..e17c261 100644
> --- a/meta/lib/oeqa/selftest/runtime-test.py
> +++ b/meta/lib/oeqa/selftest/runtime-test.py
> @@ -94,6 +94,8 @@ class TestImage(oeSelfTest):
>          Product: oe-core
>          Author: Mariano Lopez <mariano.lopez@intel.com>
>          """
> +        if self.distro == 'poky-tiny':
> +            self.skipTest('core-image-full-cmdline not buildable for
> poky-tiny')
>  
>          features = 'INHERIT += "testimage"\n'
>          features += 'TEST_SUITES = "ping ssh selftest"\n'
> -- 
> 2.1.4
> 

