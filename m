Return-Path: <maxin.john@intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id E95D875167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2018 14:23:33 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Jun 2018 07:23:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,219,1526367600"; d="scan'208";a="66679792"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by orsmga002.jf.intel.com with ESMTP; 13 Jun 2018 07:23:33 -0700
Date: Wed, 13 Jun 2018 17:16:08 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20180613141607.GA20630@mbabyjoh-desk.ger.corp.intel.com>
References: <1528802295-11278-1-git-send-email-maxin.john@intel.com>
	<1528802295-11278-10-git-send-email-maxin.john@intel.com>
	<CAJTo0La2YZcarxHy8PCPV8s6BGvRNkWC80XOfovgz-Ag-YyLDQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0La2YZcarxHy8PCPV8s6BGvRNkWC80XOfovgz-Ag-YyLDQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/12] sqlite3: upgrade to 3.24.0
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
X-List-Received-Date: Wed, 13 Jun 2018 14:23:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

On Tue, Jun 12, 2018 at 04:22:30PM +0100, Burton, Ross wrote:
> Fails for me when building pseudo:
> 
> | /data/poky-tmp/master/work/x86_64-linux/pseudo-native/1.9.0+gitAUTOINC+fddbe854c9-r0/recipe-sysroot-native/usr/lib/libsqlite3.a(sqlite3.o):
> In function `fts5Bm25Function':
> | sqlite3.c:(.text+0x2a3b8): undefined reference to `log'

In the previous version of sqlite3, FTS5 (full-text search) support was disabled
by default. However, in version 3.24.0, fts5 is "silently" enabled by default.
That causes this build failure. We can explicitly disable fts5 in sqlite3 to fix it.

> Ross

Best Regards,
Maxin

> On 12 June 2018 at 12:18, Maxin B. John <maxin.john@intel.com> wrote:
> > 3.23.1 -> 3.24.0
> >
> > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > ---
> >  meta/recipes-support/sqlite/{sqlite3_3.23.1.bb => sqlite3_3.24.0.bb} | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-support/sqlite/{sqlite3_3.23.1.bb => sqlite3_3.24.0.bb} (59%)
> >
> > diff --git a/meta/recipes-support/sqlite/sqlite3_3.23.1.bb b/meta/recipes-support/sqlite/sqlite3_3.24.0.bb
> > similarity index 59%
> > rename from meta/recipes-support/sqlite/sqlite3_3.23.1.bb
> > rename to meta/recipes-support/sqlite/sqlite3_3.24.0.bb
> > index 3755761..ce18fec 100644
> > --- a/meta/recipes-support/sqlite/sqlite3_3.23.1.bb
> > +++ b/meta/recipes-support/sqlite/sqlite3_3.24.0.bb
> > @@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
> >  SRC_URI = "\
> >    http://www.sqlite.org/2018/sqlite-autoconf-${SQLITE_PV}.tar.gz \
> >    "
> > -SRC_URI[md5sum] = "99a51b40a66872872a91c92f6d0134fa"
> > -SRC_URI[sha256sum] = "92842b283e5e744eff5da29ed3c69391de7368fccc4d0ee6bf62490ce555ef25"
> > +SRC_URI[md5sum] = "dcd96fb9bbb603d29f6b0ad9554932ee"
> > +SRC_URI[sha256sum] = "d9d14e88c6fb6d68de9ca0d1f9797477d82fc3aed613558f87ffbdbbc5ceb74a"
> > --
> > 2.4.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

