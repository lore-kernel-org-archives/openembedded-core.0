Return-Path: <bruno.bottazzini@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 92C4172491
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 21:38:17 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 28 Apr 2015 14:38:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,666,1422950400"; d="scan'208";a="717371945"
Received: from bottazzini-thinkpad-t430.bz.intel.com (HELO [10.218.99.159])
	([10.218.99.159])
	by fmsmga002.fm.intel.com with ESMTP; 28 Apr 2015 14:38:18 -0700
Message-ID: <1430257073.5364.1.camel@bottazzini-ThinkPad-T430>
From: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 28 Apr 2015 18:37:53 -0300
In-Reply-To: <20150428213007.GC2322@jama>
References: <1430251922-28699-1-git-send-email-ross.burton@intel.com>
	<20150428213007.GC2322@jama>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: bring back the patch to customise root's $HOME
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
X-List-Received-Date: Tue, 28 Apr 2015 21:38:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Thanks Ross!

This slipped trough my fingers when I have remade the first version to
use the stable branch.

Martin,

The patch removed will be applied automatically because they are
upstreamed on the stable branch.

Best Regards,

On Ter, 2015-04-28 at 23:30 +0200, Martin Jansa wrote:
> On Tue, Apr 28, 2015 at 09:12:02PM +0100, Ross Burton wrote:
> > This patch appears to have been accidently dropped in the move to 219-stable,
> > probably because it didn't apply.  Update the patch and re-add it.
> 
> what about the unused .patch files reported in:
> http://lists.openembedded.org/pipermail/openembedded-core/2015-April/104197.html
> ?
> 
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >  .../systemd/systemd/0010-Make-root-s-home-directory-configurable.patch | 3 ++-
> >  meta/recipes-core/systemd/systemd_219.bb                               | 1 +
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch b/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
> > index 41b9039..b65fe42 100644
> > --- a/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
> > +++ b/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-configurable.patch
> > @@ -26,10 +26,11 @@ diff --git a/Makefile.am b/Makefile.am
> >  index 0fb3f9f..4623963 100644
> >  --- a/Makefile.am
> >  +++ b/Makefile.am
> > -@@ -199,6 +199,7 @@ AM_CPPFLAGS = \
> > +@@ -199,7 +199,8 @@ AM_CPPFLAGS = \
> >   	-DKEXEC=\"$(KEXEC)\" \
> >   	-DLIBDIR=\"$(libdir)\" \
> >   	-DROOTLIBDIR=\"$(rootlibdir)\" \
> > + 	-DROOTLIBEXECDIR=\"$(rootlibexecdir)\" \
> >  +	-DROOTHOMEDIR=\"$(roothomedir)\" \
> >   	-DTEST_DIR=\"$(abs_top_srcdir)/test\" \
> >   	-I $(top_srcdir)/src \
> > diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
> > index d1303f7..c196017 100644
> > --- a/meta/recipes-core/systemd/systemd_219.bb
> > +++ b/meta/recipes-core/systemd/systemd_219.bb
> > @@ -38,6 +38,7 @@ SRC_URI = "git://anongit.freedesktop.org/systemd/systemd-stable;branch=v219-stab
> >             file://0007-util-Use-mkostemp-only-if-libc-supports-it.patch \
> >             file://0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-conf.patch \
> >             file://0009-sysv-generator-add-support-for-executing-scripts-und.patch \
> > +           file://0010-Make-root-s-home-directory-configurable.patch \
> >             file://0011-systemd-user-avoid-using-system-auth.patch \
> >             file://0012-systemd-tmpfiles.c-Honor-ordering-within-files-as-th.patch \
> >             file://0014-Revert-rules-remove-firmware-loading-rules.patch \
> > -- 
> > 2.1.4
> > 
> > -- 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



