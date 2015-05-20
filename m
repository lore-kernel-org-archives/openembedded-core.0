Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5DF9B601E3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 12:06:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 20 May 2015 05:06:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,464,1427785200"; d="scan'208";a="697728339"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO [10.252.2.251])
	([10.252.2.251])
	by orsmga001.jf.intel.com with ESMTP; 20 May 2015 05:06:01 -0700
Message-ID: <1432123561.3930.8.camel@tkkaskin-mobl3.ger.corp.intel.com>
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 May 2015 15:06:01 +0300
In-Reply-To: <1432047964.1403.7.camel@tkkaskin-mobl3.ger.corp.intel.com>
References: <1431952843-25139-1-git-send-email-tanu.kaskinen@linux.intel.com>
	<1431952843-25139-2-git-send-email-tanu.kaskinen@linux.intel.com>
	<CAJTo0LYgeSkvr+U1OZG70PvH-OXY9suxkK=7wHM4ecOY8jbKCQ@mail.gmail.com>
	<CAJTo0Lbf1chJC0WqbwHFVomgc6r2i_kxsEnzXv3uN6M9sOvzmg@mail.gmail.com>
	<1432047964.1403.7.camel@tkkaskin-mobl3.ger.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - PL 281, 00181 Helsinki
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] alsa-plugins: initial recipe
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
X-List-Received-Date: Wed, 20 May 2015 12:06:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-05-19 at 18:06 +0300, Tanu Kaskinen wrote:
> On Tue, 2015-05-19 at 15:42 +0100, Burton, Ross wrote:
> > 
> > On 19 May 2015 at 15:31, Burton, Ross <ross.burton@intel.com> wrote:
> >         On 18 May 2015 at 13:40, Tanu Kaskinen
> >         <tanu.kaskinen@linux.intel.com> wrote:
> >                 +# The resampler plugins create some symlinks, which
> >                 have to be added to FILES
> >                 +# manually, since do_split_packages() rejects
> >                 symlinks. The symlinks also cause
> >                 +# QA errors, but those errors are false positives, so
> >                 we disable the QA checks.
> >                 
> >         
> >         Not true, there's an allow_symlink (default False) option to
> >         do_split_packages, so this can be cleaned up.
> >         
> >         
> >         Assuming that those symlinks are versioning (and so pointless
> >         for loadable modules), a neater fix might be to patch in
> >         libtool -avoid-version.
> > 
> > Investigate *before* sending, Ross.
> > 
> > 
> > Just pass allow_links=True to do_split_packages() and all of this can
> > be deleted.
> 
> Thanks, I'll do that.

Actually, no, I won't do that. I don't want the symlinks to go to
separate packages, they should be shipped in the same package that
contains the real plugin file.

-- 
Tanu


