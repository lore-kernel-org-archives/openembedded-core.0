Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 43AF57830D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 19:18:54 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Nov 2017 11:18:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,353,1505804400"; d="scan'208";a="332814162"
Received: from sbairi-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.71.36])
	by fmsmga004.fm.intel.com with ESMTP; 06 Nov 2017 11:18:52 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 07 Nov 2017 08:18:48 +1300
Message-ID: <5121452.M8NYrTEKNB@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <CAJ86T=VN8PDUWrNAuW=y_RpUEoOtGa-TyufyGwbZT6APPMsm9A@mail.gmail.com>
References: <CAEg-Je9nrUypvdDyTXMDTqgv9qBB_R0VSA_hzs6pswkzPJgr7Q@mail.gmail.com>
	<CAJTo0La7eK950Up4033qmX_1PQnS5nJJt4zb_P7uJn1Y8eO0QQ@mail.gmail.com>
	<CAJ86T=VN8PDUWrNAuW=y_RpUEoOtGa-TyufyGwbZT6APPMsm9A@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Releases of BitBake to package for Fedora?
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
X-List-Received-Date: Mon, 06 Nov 2017 19:18:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 7 November 2017 8:16:06 AM NZDT Andre McCurdy wrote:
> On Mon, Nov 6, 2017 at 3:33 AM, Burton, Ross <ross.burton@intel.com> wrote:
> > The bitbake API isn't really stable and has a reasonable amount of change,
> > so if you were to package it then there's a good chance it would be out of
> > date within six months and people who wanted to use the latest oe-core
> > release against the packaged bitbake would hit API version errors.  The
> > recommended usage is to bundle in some way bitbake and the metadata
> > (combo-layer, submodules, repo, whatever).
> >
> > As such there are no tarballs.  There are branches for each version and
> > commits where the version is bumped, if you're really determined to
> > package a snapshot.
> 
> If there's no realistic hope of (or need for) using bitbake standalone
> then maybe it's time to move bitbake into oe-core?

Well, there are folks out there using bitbake with their own (non-OE) 
metadata, and that is absolutely supported, so even in the absence of stable 
releases of BitBake that distros could pick up the separation does still have 
a purpose.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

