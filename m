Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5A6756AE6F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 17:41:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 02 Jul 2013 09:58:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,981,1363158000"; d="scan'208";a="363635961"
Received: from unknown (HELO helios.localnet) ([10.252.121.242])
	by orsmga002.jf.intel.com with ESMTP; 02 Jul 2013 10:01:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 02 Jul 2013 18:01:18 +0100
Message-ID: <3240350.pAAidjE0qp@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-25-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <20130702165027.GB3285@jama>
References: <cover.1372686507.git.laurentiu.palcu@intel.com>
	<CAJTo0LZ=m=no=aiTcBqgGM_J0b5t429xkztCO1gkf-z2hC7UPg@mail.gmail.com>
	<20130702165027.GB3285@jama>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/1] xinput-calibrator: move it from meta-oe to oe-core
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
X-List-Received-Date: Tue, 02 Jul 2013 17:41:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 02 July 2013 18:50:27 Martin Jansa wrote:
> On Tue, Jul 02, 2013 at 04:25:19PM +0100, Burton, Ross wrote:
> > > +++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
> > > +inherit autotools systemd
> > 
> > systemd?
> > 
> > > +RPROVIDES_${PN} += "${PN}-systemd"
> > > +RREPLACES_${PN} += "${PN}-systemd"
> > > +RCONFLICTS_${PN} += "${PN}-systemd"
> > 
> > It doesn't anymore, so these can be dropped.
> 
> That means that xinput-calibrator-systemd will stay installed on devices
> which already have it.

I'd suggest solving that with a bbappend in meta-systemd as with the rest of 
these.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

