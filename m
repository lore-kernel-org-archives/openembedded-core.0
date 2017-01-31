Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8AC5B60766
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 15:04:24 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 31 Jan 2017 07:04:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,315,1477983600"; d="scan'208";a="928572867"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga003.jf.intel.com with ESMTP; 31 Jan 2017 07:04:24 -0800
Date: Tue, 31 Jan 2017 17:05:24 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20170131150524.GA11350@mbabyjoh-desk.ger.corp.intel.com>
References: <1485777358-32699-1-git-send-email-maxin.john@intel.com>
	<b054aebd-10df-6cb5-841d-b06df81e9fb6@gmail.com>
MIME-Version: 1.0
In-Reply-To: <b054aebd-10df-6cb5-841d-b06df81e9fb6@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] libtasn1: Upgrade 4.9 -> 4.10
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
X-List-Received-Date: Tue, 31 Jan 2017 15:04:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

On Mon, Jan 30, 2017 at 11:23:42AM -0800, Khem Raj wrote:
> 
> 
> On 1/30/17 3:55 AM, Maxin B. John wrote:
> > Removed the following Backported patches:
> >  1. 0001-configure-don-t-add-Werror-to-build-flags.patch
> >  2. 0002-ASN.y-corrected-compiler-warning.patch
> >  3. 0003-parser_aux-corrected-potential-null-pointer-derefere.patch
> >  4. 0004-tools-eliminated-compiler-warnings.patch
> > 
> > fixed the following build error with musl
> > ...
> > |                  from ../../libtasn1-4.10/gl/getopt.c:28:
> > | ./stdint.h:89:5: error: #if with no expression
> > |  #if
> > |      ^
> > 
> 
> are we missing including wint_t.m4
>

Somehow we have an old wint_t.m4 provided by gettext-0.18.2 in the  aclocal search path.
Looking into that now.

> > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > ---
> >  ...configure-don-t-add-Werror-to-build-flags.patch | 28 ---------
> >  ...reintroduce-GNULIB_OVERRIDES_WINT_T-check.patch | 63 +++++++++++++++++++
> >  .../0002-ASN.y-corrected-compiler-warning.patch    | 28 ---------
> >  ...corrected-potential-null-pointer-derefere.patch | 73 ----------------------
> >  .../0004-tools-eliminated-compiler-warnings.patch  | 56 -----------------
> >  .../gnutls/{libtasn1_4.9.bb => libtasn1_4.10.bb}   |  9 +--
> >  6 files changed, 66 insertions(+), 191 deletions(-)
> >  delete mode 100644 meta/recipes-support/gnutls/libtasn1/0001-configure-don-t-add-Werror-to-build-flags.patch
> >  create mode 100644 meta/recipes-support/gnutls/libtasn1/0001-stdint.m4-reintroduce-GNULIB_OVERRIDES_WINT_T-check.patch
> >  delete mode 100644 meta/recipes-support/gnutls/libtasn1/0002-ASN.y-corrected-compiler-warning.patch
> >  delete mode 100644 meta/recipes-support/gnutls/libtasn1/0003-parser_aux-corrected-potential-null-pointer-derefere.patch
> >  delete mode 100644 meta/recipes-support/gnutls/libtasn1/0004-tools-eliminated-compiler-warnings.patch
> >  rename meta/recipes-support/gnutls/{libtasn1_4.9.bb => libtasn1_4.10.bb} (59%)
> >
Best Regards,
Maxin

