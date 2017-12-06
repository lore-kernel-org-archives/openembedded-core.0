Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 15C867869E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 16:22:05 +0000 (UTC)
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Dec 2017 08:22:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,368,1508828400"; 
   d="scan'208";a="407016"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by fmsmga007.fm.intel.com with ESMTP; 06 Dec 2017 08:22:06 -0800
Date: Wed, 6 Dec 2017 10:31:52 -0600
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20171206103152.170ada73@lsandov1-mobl2.zpn.intel.com>
In-Reply-To: <CAJTo0LZJJccVooX7P=Vfkw20S962c6iEKMCKNSj5P2rsrHrODA@mail.gmail.com>
References: <20171206145928.5497-1-ross.burton@intel.com>
	<20171206150257.2785.75026@do.openembedded.org>
	<20171206100021.3c757776@lsandov1-mobl2.zpn.intel.com>
	<CAJTo0LZJJccVooX7P=Vfkw20S962c6iEKMCKNSj5P2rsrHrODA@mail.gmail.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Patchwork <patchwork@patchwork.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJsaWJ4c2x0OiB1c2UgSFRUUCBpbnN0ZWFkIG9mIEYuLi4iIGFuZCAxIG1vcmU=?=
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
X-List-Received-Date: Wed, 06 Dec 2017 16:22:06 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 6 Dec 2017 16:03:13 +0000
"Burton, Ross" <ross.burton@intel.com> wrote:

> On 6 December 2017 at 16:00, Leonardo Sandoval <
> leonardo.sandoval.gonzalez@linux.intel.com> wrote:  
> 
> > On Wed, 06 Dec 2017 15:02:57 -0000
> > Patchwork <patchwork@patchwork.openembedded.org> wrote:
> >  
> > > == Series Details ==
> > >
> > > Series: "libxslt: use HTTP instead of F..." and 1 more
> > > Revision: 1
> > > URL   : https://patchwork.openembedded.org/series/10099/
> > > State : failure
> > >
> > > == Summary ==
> > >
> > >
> > > Thank you for submitting this patch series to OpenEmbedded Core. This is
> > > an automated response. Several tests have been executed on the proposed
> > > series by patchtest resulting in the following failures:
> > >
> > >
> > >
> > > * Issue             SRC_URI changed but checksums are the same  
> > [test_src_uri_checksums_not_changed]  
> > >   Suggested fix    Include the SRC_URI's checksums changes into your  
> > patch
> >
> >
> > I believe we need to improve this check. checksums do not necessary change
> > if URL changes.
> >  
> 
> Not sure how to improve it.  Maybe making the wording vague, as that is a
> common mistake and the URL changing but checksums not changing is  not
> common.

Rigth. Also bitbake fails if downloaded tarball does not match its checksums with the ones defined on recipe. Time to disable this check.

> 
> Ross

