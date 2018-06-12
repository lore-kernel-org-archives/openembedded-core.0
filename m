Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C49C578EE3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 15:38:42 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jun 2018 08:38:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,215,1526367600"; d="scan'208";a="236524475"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by fmsmga005.fm.intel.com with ESMTP; 12 Jun 2018 08:38:42 -0700
Date: Tue, 12 Jun 2018 18:31:15 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20180612153115.GC40594@mbabyjoh-desk.ger.corp.intel.com>
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
X-List-Received-Date: Tue, 12 Jun 2018 15:38:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

On Tue, Jun 12, 2018 at 04:22:30PM +0100, Burton, Ross wrote:
> Fails for me when building pseudo:
> 
> | /data/poky-tmp/master/work/x86_64-linux/pseudo-native/1.9.0+gitAUTOINC+fddbe854c9-r0/recipe-sysroot-native/usr/lib/libsqlite3.a(sqlite3.o):
> In function `fts5Bm25Function':
> | sqlite3.c:(.text+0x2a3b8): undefined reference to `log'

Will look into that. Thanks.

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

