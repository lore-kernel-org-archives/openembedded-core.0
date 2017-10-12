Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 532B770100;
	Thu, 12 Oct 2017 04:32:11 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 21:32:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,364,1503385200"; d="scan'208";a="322314942"
Received: from stan55-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.68])
	by fmsmga004.fm.intel.com with ESMTP; 11 Oct 2017 21:32:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Oct 2017 17:32:06 +1300
Message-ID: <50262241.T8AzmBLD0O@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <CAMKF1sptwf=LMdHmXCKN1tCyPGgQcezhvKqHX3rNs113pL1dnQ@mail.gmail.com>
References: <150754017019.10662.17591818165714630277@git.openembedded.org>
	<20171012015609.GA3832@jama>
	<CAMKF1sptwf=LMdHmXCKN1tCyPGgQcezhvKqHX3rNs113pL1dnQ@mail.gmail.com>
MIME-Version: 1.0
Cc: "openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 01/01: bitbake.conf: add tools required by testimage to HOSTTOOLS conditionally
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
X-List-Received-Date: Thu, 12 Oct 2017 04:32:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, 12 October 2017 3:15:12 PM NZDT Khem Raj wrote:
> On Wed, Oct 11, 2017 at 6:56 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Mon, Oct 09, 2017 at 09:09:31AM +0000, git@git.openembedded.org wrote:
> >> --- a/meta/conf/bitbake.conf
> >> +++ b/meta/conf/bitbake.conf
> >> @@ -484,7 +484,7 @@ HOSTTOOLS += " \
> >>  "
> >>
> >>  # Tools needed to run testimage runtime image testing
> >> -HOSTTOOLS += "ip ping ps scp ssh stty"
> >> +HOSTTOOLS += "${@['', 'ip ping ps scp ssh stty'][bb.data.inherits_class('testimage', d)]}"
> >
> > Shouldn't we include at least ssh by default?
> 
> I would say no, since nothing in OE-Core depends on it. more we
> abstract from host system better it is.

I'm with Martin on this one, let's not make it painful for people to use
the SSH protocol in git URLs in their recipes. I don't see much potential
for host contamination.

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre

