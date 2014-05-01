Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1357F6098B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 May 2014 11:34:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 May 2014 04:34:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,964,1389772800"; d="scan'208";a="531823240"
Received: from abamaras-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.26])
	by fmsmga002.fm.intel.com with ESMTP; 01 May 2014 04:34:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Valentin Popa <valentin.popa@intel.com>
Date: Thu, 01 May 2014 12:34:47 +0100
Message-ID: <1823217.vjqjHS5tvm@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.13.10-200.fc20.x86_64; KDE/4.12.4; x86_64; ;
	)
In-Reply-To: <cff8f1a8914290689c411c19e78f7118036eda9c.1398871949.git.valentin.popa@intel.com>
References: <cover.1398871949.git.valentin.popa@intel.com>
	<cff8f1a8914290689c411c19e78f7118036eda9c.1398871949.git.valentin.popa@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] nettle: add nettle to poky
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
X-List-Received-Date: Thu, 01 May 2014 11:34:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Valentin,

On Wednesday 30 April 2014 18:39:31 Valentin Popa wrote:
> Newer versions of gnutls depends on nettle.
> 
> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
> ---
>  meta/recipes-support/nettle/nettle_2.7.1.bb | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta/recipes-support/nettle/nettle_2.7.1.bb
> 
> diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb
> b/meta/recipes-support/nettle/nettle_2.7.1.bb new file mode 100644
> index 0000000..eb7c9de
> --- /dev/null
> +++ b/meta/recipes-support/nettle/nettle_2.7.1.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION = "A low level cryptographic library"

Since this value is short, could you please set it as SUMMARY instead?

> +HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
> +SECTION = "libs"
> +LICENSE = "GPLv2+"

Is this license value correct? From the documentation:

"Nettle is distributed under the GNU Lesser General Public License (LGPL), see 
the file COPYING.LIB for details"

It looks like it might be even more complicated than that, since there is also 
a GPLv2 copying file in the 2.7.1 source.

> +LIC_FILES_CHKSUM =
> "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"

Given the above we'd probably want to checksum more than just this file.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

