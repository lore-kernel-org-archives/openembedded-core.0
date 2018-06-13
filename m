Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E8CC178923
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 08:36:49 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jun 2018 01:36:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,218,1526367600"; d="scan'208";a="56847846"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by fmsmga002.fm.intel.com with ESMTP; 13 Jun 2018 01:36:50 -0700
Date: Wed, 13 Jun 2018 11:29:24 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <20180613082924.GA16111@mbabyjoh-desk.ger.corp.intel.com>
References: <1528802295-11278-1-git-send-email-maxin.john@intel.com>
	<1528802295-11278-7-git-send-email-maxin.john@intel.com>
	<3063a563-3960-2a4a-d791-20bc066f7ab6@windriver.com>
MIME-Version: 1.0
In-Reply-To: <3063a563-3960-2a4a-d791-20bc066f7ab6@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 07/12] libunistring: upgrade to 0.9.10
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
X-List-Received-Date: Wed, 13 Jun 2018 08:36:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Randy,

On Tue, Jun 12, 2018 at 09:21:17PM -0400, Randy MacLeod wrote:
> On 06/12/2018 07:18 AM, Maxin B. John wrote:
> >License-Update: Checksum changed due to updation in documentation. There
> >are no changes in the license terms.
> 
> That's correct but I'm not sure if we should include
> a checksum on the (GPLv3) COPYING file since the README
> says [1] that:
>    This license is based on the GNU GPL version 3, see file COPYING.
> I'd like to know if the COPYING file changed to say the _actual_
> GPLv2 some day so a checksum would help track such changes.
> 
> 
> The README statement is an odd way to convey the license terms.
> Is this just standard FSFese?

Yes, it is odd.

README says 'The libunistring library and its header files are dual-licensed under
"the GNU LGPLv3+ or the GNU GPLv2"' and the project includes a GPL v3 license (COPYING).

Though not 100% sure, I would assume that it is ok continue with 
LICENSE = "LGPLv3+ | GPLv2"  

If anyone think it is the wrong way to go, please share your views/suggestions.

> The libunistring commit that sets out these terms is from 0.9:
> 
> commit 3c15d3a96963703fc02cddda7e968e508638d1b8
> Author: Bruno Haible <bruno@clisp.org>
> Date:   Sun Mar 15 02:10:58 2009 +0100
> 
>     License information.
> 
>  COPYING     | 674 ++++++++++++++++++++...++++++++++++++++++++
>  COPYING.LIB | 165 +++++++++...++++++++
>  ChangeLog   |   3 +
>  README      |   2 +-
>  4 files changed, 843 insertions(+), 1 deletion(-)
> 
> 
> which doesn't help much other than the ChangeLog:
> 
> +       * COPYING.LIB: New file, from gnulib/doc/COPYING.LESSERv3.
> +       * COPYING: New file, from gnulib/doc/COPYINGv3.
> 
> 
> ../Randy

Best Regards,
Maxin

> 
> [1] From README:
> 
> Copyright
> ---------
> 
> The libunistring library and its header files are dual-licensed under
> "the GNU LGPLv3+ or the GNU GPLv2". This means, you can use it under either
>   - the terms of the GNU Lesser General Public License (LGPL) version 3 or
>     (at your option) any later version, or
>   - the terms of the GNU General Public License (GPL) version 2, or
>   - the same dual license "the GNU LGPLv3+ or the GNU GPLv2".
> 
> You find the GNU LGPL version 3 in the file COPYING.LIB.  This license is
> based on the GNU GPL version 3, see file COPYING.
> 
> You can find the GNU GPL version 2 at
> <https://www.gnu.org/licenses/old-licenses/gpl-2.0.html>.
> 
> Note: This dual license makes it possible for the libunistring library
> to be used by packages under GPLv2 or GPLv2+ licenses, in particular. See
> the table in <https://www.gnu.org/licenses/gpl-faq.html#AllCompatibility>.
> 
> The documentation is under another license; see in the documentation.
> 
> >
> >Signed-off-by: Maxin B. John <maxin.john@intel.com>
> >---
> >  .../libunistring/{libunistring_0.9.9.bb => libunistring_0.9.10.bb}  | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >  rename meta/recipes-support/libunistring/{libunistring_0.9.9.bb => libunistring_0.9.10.bb} (85%)
> >
> >diff --git a/meta/recipes-support/libunistring/libunistring_0.9.9.bb b/meta/recipes-support/libunistring/libunistring_0.9.10.bb
> >similarity index 85%
> >rename from meta/recipes-support/libunistring/libunistring_0.9.9.bb
> >rename to meta/recipes-support/libunistring/libunistring_0.9.10.bb
> >index ab7cba5..97fac4e 100644
> >--- a/meta/recipes-support/libunistring/libunistring_0.9.9.bb
> >+++ b/meta/recipes-support/libunistring/libunistring_0.9.10.bb
> >@@ -16,15 +16,15 @@ SECTION = "devel"
> >  LICENSE = "LGPLv3+ | GPLv2"
> >  LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
> >                      file://README;beginline=45;endline=65;md5=08287d16ba8d839faed8d2dc14d7d6a5 \
> >-                    file://doc/libunistring.texi;md5=efb80a3799a60f95feaf80661d4f204c \
> >+                    file://doc/libunistring.texi;md5=287fa6075f78a3c85c1a52b0a92547cd \
> >                     "
> >  SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz \
> >             file://iconv-m4-remove-the-test-to-convert-euc-jp.patch \
> >             file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
> >  "
> >-SRC_URI[md5sum] = "4f689e37e4c3bd67de5786aa51d98b13"
> >-SRC_URI[sha256sum] = "f5e90c08f9e5427ca3a2c0c53f19aa38b25c500913510ad25afef86448bea84a"
> >+SRC_URI[md5sum] = "0d3274e9838396b12200f8b54ddaf43b"
> >+SRC_URI[sha256sum] = "a82e5b333339a88ea4608e4635479a1cfb2e01aafb925e1290b65710d43f610b"
> >  inherit autotools texinfo
> >  BBCLASSEXTEND = "native nativesdk"
> >
> 
> 
> -- 
> # Randy MacLeod
> # Wind River Linux

