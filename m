Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id D642E7823D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 19:16:33 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP; 23 Aug 2017 12:16:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,417,1498546800"; d="scan'208";a="143815989"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by fmsmga006.fm.intel.com with ESMTP; 23 Aug 2017 12:16:28 -0700
Message-ID: <1503516331.2166.6.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Wed, 23 Aug 2017 14:25:31 -0500
In-Reply-To: <4f2466a7aaa2e40ec506c6483d35e8b391838ceb.1503507784.git.alexander.kanavin@linux.intel.com>
References: <cover.1503507784.git.alexander.kanavin@linux.intel.com>
	<4f2466a7aaa2e40ec506c6483d35e8b391838ceb.1503507784.git.alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/7] meson: add a recipe and class from meta-oe
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
X-List-Received-Date: Wed, 23 Aug 2017 19:16:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

> +
> +inherit setuptools3
> +
> +RDEPENDS_${PN} = "ninja python3-core python3-modules"
> +

if (python3) modules depends on core, I believe core can be dropped from
RDEPENDS

> +BBCLASSEXTEND = "native"
> -- 
> 2.14.1
> 



