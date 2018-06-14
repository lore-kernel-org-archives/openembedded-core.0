Return-Path: <maxin.john@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 938D7789DB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 07:46:39 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jun 2018 00:46:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,222,1526367600"; d="scan'208";a="49255862"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by orsmga008.jf.intel.com with ESMTP; 14 Jun 2018 00:46:39 -0700
Date: Thu, 14 Jun 2018 10:39:15 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180614073915.GA9986@mbabyjoh-desk.ger.corp.intel.com>
References: <1528901652-14840-1-git-send-email-maxin.john@intel.com>
	<696212b6-cfe1-a882-9395-21093895ad42@gmail.com>
MIME-Version: 1.0
In-Reply-To: <696212b6-cfe1-a882-9395-21093895ad42@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] sqlite3: upgrade to 3.24.0
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
X-List-Received-Date: Thu, 14 Jun 2018 07:46:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

On Wed, Jun 13, 2018 at 08:37:14AM -0700, Khem Raj wrote:
> Hi Maxin
> 
> On 6/13/18 7:54 AM, Maxin B. John wrote:
> >Disable fts5 support as it causes build errors for pseudo.
> >
> >Signed-off-by: Maxin B. John <maxin.john@intel.com>
> >---
> >  meta/recipes-support/sqlite/sqlite3.inc                              | 1 +
> >  meta/recipes-support/sqlite/{sqlite3_3.23.1.bb => sqlite3_3.24.0.bb} | 4 ++--
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> >  rename meta/recipes-support/sqlite/{sqlite3_3.23.1.bb => sqlite3_3.24.0.bb} (59%)
> >
> >diff --git a/meta/recipes-support/sqlite/sqlite3.inc b/meta/recipes-support/sqlite/sqlite3.inc
> >index 95ec89c..7312c84 100644
> >--- a/meta/recipes-support/sqlite/sqlite3.inc
> >+++ b/meta/recipes-support/sqlite/sqlite3.inc
> >@@ -31,6 +31,7 @@ EXTRA_OECONF = " \
> >      --enable-shared \
> >      --enable-threadsafe \
> >      --disable-static-shell \
> >+    --enable-fts5=no \
> >  "
> 
> is this causing issues for pseudo target recipe ?
> perhaps its better to turn it into a packageconfig

Ok, Will do that.

> >  CFLAGS_append = " -fPIC"
> >diff --git a/meta/recipes-support/sqlite/sqlite3_3.23.1.bb b/meta/recipes-support/sqlite/sqlite3_3.24.0.bb
> >similarity index 59%
> >rename from meta/recipes-support/sqlite/sqlite3_3.23.1.bb
> >rename to meta/recipes-support/sqlite/sqlite3_3.24.0.bb
> >index 3755761..ce18fec 100644
> >--- a/meta/recipes-support/sqlite/sqlite3_3.23.1.bb
> >+++ b/meta/recipes-support/sqlite/sqlite3_3.24.0.bb
> >@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
> >  SRC_URI = "\
> >    http://www.sqlite.org/2018/sqlite-autoconf-${SQLITE_PV}.tar.gz \
> >    "
> >-SRC_URI[md5sum] = "99a51b40a66872872a91c92f6d0134fa"
> >-SRC_URI[sha256sum] = "92842b283e5e744eff5da29ed3c69391de7368fccc4d0ee6bf62490ce555ef25"
> >+SRC_URI[md5sum] = "dcd96fb9bbb603d29f6b0ad9554932ee"
> >+SRC_URI[sha256sum] = "d9d14e88c6fb6d68de9ca0d1f9797477d82fc3aed613558f87ffbdbbc5ceb74a"

Best Regards,
Maxin

