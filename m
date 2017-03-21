Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DDF9572FFC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 21:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490130470; x=1521666470;
	h=message-id:subject:from:to:cc:date:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=JlqugR5D3nkj+zHVxG8oFh0CLwpb+0sN4a0F41y60FU=;
	b=sxel+3M9TI/7NVwXzqVGomiNicdbG2WzvW7b0QHDSTXuQUQSLS7Pjilc
	m2j3RD/z3pAUqgvQ1A6tyLr58AELXA==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Mar 2017 14:07:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,201,1486454400"; d="scan'208";a="63344989"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by orsmga002.jf.intel.com with ESMTP; 21 Mar 2017 14:07:49 -0700
Message-ID: <1490130941.28281.19.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 21 Mar 2017 15:15:41 -0600
In-Reply-To: <1490129564.13980.160.camel@linuxfoundation.org>
References: <20170314093726.24891-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<1490129564.13980.160.camel@linuxfoundation.org>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] subversion: remove useless comment
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
X-List-Received-Date: Tue, 21 Mar 2017 21:07:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-03-21 at 20:52 +0000, Richard Purdie wrote:
> On Tue, 2017-03-14 at 09:37 +0000,
> leonardo.sandoval.gonzalez@linux.intel.com wrote:
> > From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> > 
> > Remove auto-builder comment shown on the recipe because it does not
> > add something
> > useful.
> 

> I disagree, it explains the error seen which caused parallel make
> install to be disabled in the first place. I suggest wrapping the
> comment rather than branding it "useless". You could also replace out
> "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-
> logrotate/build/build/tmp" with TMPDIR.
> 

With your explanation, it makes sense but in the recipe is just the log,
nothing more. Yes, pathnames should be shorter, so we do not have a line
with almost 500 chars.


Leo

> All too often we see things like parallel make disabled with no idea
> why.
> 
> Cheers,
> 
> Richard
> 
> > 
> > Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.in
> > tel.com>
> > ---
> >  meta/recipes-devtools/subversion/subversion_1.9.5.bb | 5 -----
> >  1 file changed, 5 deletions(-)
> > 
> > diff --git a/meta/recipes-devtools/subversion/subversion_1.9.5.bb
> > b/meta/recipes-devtools/subversion/subversion_1.9.5.bb
> > index 05fba67..5871b84 100644
> > --- a/meta/recipes-devtools/subversion/subversion_1.9.5.bb
> > +++ b/meta/recipes-devtools/subversion/subversion_1.9.5.bb
> > @@ -47,9 +47,4 @@ do_configure_prepend () {
> >  	sed -i -e
> > 's:with_sasl="/usr/local":with_sasl="${STAGING_DIR}":' ${S}/build/ac-
> > macros/sasl.m4
> >  }
> >  
> > -#| x86_64-linux-libtool: install: warning: `/home/pokybuild/yocto-
> > autobuilder/yocto-worker/nightly-qa-
> > logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-
> > r0/build/subversion/libsvn_ra_local/libsvn_ra_local-1.la' has not
> > been installed in `/home/pokybuild/yocto-autobuilder/yocto-
> > worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-
> > linux/usr/lib'| x86_64-linux-libtool: install: warning:
> > `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-
> > logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-
> > r0/build/subversion/libsvn_repos/libsvn_repos-1.la' has not been
> > installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-
> > qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'|
> > /usr/bin/ld: cannot find -lsvn_delta-1| collect2: ld returned 1 exit
> > status| x86_64-linux-libtool: install: warning:
> > `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-
> > logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-
> > r0/build/sub
> >  version/libsvn_ra_svn/libsvn_ra_svn-1.la' has not been installed in
> > `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-
> > logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'| x86_64-
> > linux-libtool: install: warning: `/home/pokybuild/yocto-
> > autobuilder/yocto-worker/nightly-qa-
> > logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-
> > r0/build/subversion/libsvn_ra_serf/libsvn_ra_serf-1.la' has not been
> > installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-
> > qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'
> > -#| x86_64-linux-libtool: install: error: relink `libsvn_ra_serf-
> > 1.la' with the above command before installing it
> > -#| x86_64-linux-libtool: install: warning:
> > `../../subversion/libsvn_repos/libsvn_repos-1.la' has not been
> > installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-
> > qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'
> > -#| /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-
> > logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-
> > r0/subversion-1.8.9/build-outputs.mk:1090: recipe for target
> > 'install-serf-lib' failed
> > -#| make: *** [install-serf-lib] Error 1
> >  PARALLEL_MAKEINST = ""
> > -- 
> > 2.10.2
> > 



