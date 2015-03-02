Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B797C72D75
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 16:09:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 02 Mar 2015 08:09:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,676,1418112000"; d="scan'208";a="659255589"
Received: from unknown (HELO [10.219.4.47]) ([10.219.4.47])
	by orsmga001.jf.intel.com with ESMTP; 02 Mar 2015 08:09:17 -0800
Message-ID: <1425312555.3431.1.camel@besquive-mobl.amr.corp.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 02 Mar 2015 10:09:15 -0600
In-Reply-To: <CAMKF1som-Oj+QtmaHyKhvJYvfMfjCcBFhm8G4O-nQyruxn4x6w@mail.gmail.com>
References: <1424685241-17960-1-git-send-email-benjamin.esquivel@linux.intel.com>
	<54ECD3C2.8040005@linux.intel.com>
	<1424816244.6730.14.camel@besquive-mobl.amr.corp.intel.com>
	<CAJTo0LYsD6SZO71Q6BBnX0td8LZWBeRGWXJ-Ga2LbuWMYN6OHw@mail.gmail.com>
	<1424888075.6730.19.camel@besquive-mobl.amr.corp.intel.com>
	<CAJTo0LZVJc1=OptZG4vaxyqAq7AgYYkJeMbA5kGg_1n3o+jC5Q@mail.gmail.com>
	<CAMKF1som-Oj+QtmaHyKhvJYvfMfjCcBFhm8G4O-nQyruxn4x6w@mail.gmail.com>
Organization: Intel OTC
X-Mailer: Evolution 3.10.4 (3.10.4-4.fc20) 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: 'yes' within the path sets wrong variables
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: benjamin.esquivel@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Mar 2015 16:09:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-02-26 at 08:17 -0800, Khem Raj wrote:
> On Thu, Feb 26, 2015 at 4:22 AM, Burton, Ross <ross.burton@intel.com> wrote:
> >
> > On 25 February 2015 at 18:14, Benjamin Esquivel
> > <benjamin.esquivel@linux.intel.com> wrote:
> >>
> >> Saul, is there a specific part of the glibc's run.do_configure that
> >> should re-conf?
> >
> >
> > The glibc recipe explicitly avoids autoreconfig:
> >
> > "# override this function to avoid the autoconf/automake/aclocal/autoheader
> > calls for now"
> 
> it is intentional since glibc would use older versions of autotools.
> 2.21 should be using 2.69, so in theory we
> can reconf, but this needs to be tested thoroughly.

Indeed it starts bleeding all over with failures if a reconf is
attempted. I'll stick to the bug fix for now.

> 
> >
> > Khem is the person to ask if this is something that can be removed but for
> > now, patching the configure is all we can do (and sending the patch upstream
> > so we don't need to patch configure in the future).
> >
> > Ross



