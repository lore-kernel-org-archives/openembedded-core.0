Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 21EC366129
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2013 12:07:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 19 Dec 2013 04:07:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,512,1384329600"; d="scan'208";a="446923387"
Received: from williams-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.12])
	by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2013 04:07:53 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
	Javier Viguera <javier.viguera@digi.com>
Date: Thu, 19 Dec 2013 12:07:52 +0000
Message-ID: <2543921.MaLJXs2tkU@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAP71WjxnUnjL8b1yQxGsiaReLUbavc5kh4zQ2YeT9kHfv6UjVw@mail.gmail.com>
References: <1387276932-26461-1-git-send-email-paul.eggleton@linux.intel.com>
	<52B2CED8.3020707@digi.com>
	<CAP71WjxnUnjL8b1yQxGsiaReLUbavc5kh4zQ2YeT9kHfv6UjVw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libsoup-2.4: add intltool-native to DEPENDS
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
X-List-Received-Date: Thu, 19 Dec 2013 12:07:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 19 December 2013 11:54:14 Nicolas Dechesne wrote:
> On Thu, Dec 19, 2013 at 11:47 AM, Javier Viguera
> <javier.viguera@digi.com>wrote:
> > On 17/12/13 11:42, Paul Eggleton wrote:
> >> -DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3"
> >> +DEPENDS = "glib-2.0 gnutls libxml2 libproxy sqlite3 intltool-native"
> > 
> > +1 for this change.
> > 
> > I was bitten by this bug using a DISTRO with no X11 support (removed X11
> > from DISTRO_FEATURES). In that case the 'intltool-native' dependence is
> > not
> > fulfilled and libsoup fails to build.
> > 
> > Could it be *backported* to Dora/Dylan?
> 
> it will. Paul said on IRC the other day, that it should reach dylan by the
> end of this week .

FYI It's now merged in dylan thanks to Richard. I've also sent a patch for 
dora (cc'd to Robert).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

