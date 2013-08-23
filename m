Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E478C6065F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 11:38:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 23 Aug 2013 04:35:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,941,1367996400"; d="scan'208";a="392167313"
Received: from timevans-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.235])
	by orsmga002.jf.intel.com with ESMTP; 23 Aug 2013 04:38:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <pb@pbcl.net>
Date: Fri, 23 Aug 2013 12:38:18 +0100
Message-ID: <6096684.k7US353FUD@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1377257296.5452.13.camel@phil-desktop.brightsign>
References: <1377256830-10748-1-git-send-email-paul.eggleton@linux.intel.com>
	<1377257296.5452.13.camel@phil-desktop.brightsign>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox: enable shared memory logging for systemd
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
X-List-Received-Date: Fri, 23 Aug 2013 11:38:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Phil,

On Friday 23 August 2013 12:28:16 Phil Blundell wrote:
> On Fri, 2013-08-23 at 12:20 +0100, Paul Eggleton wrote:
> > +        if [ -f ${WORKDIR}/busybox-syslog.default ] ; then
> > +            install -d ${D}${sysconfdir}/default
> > +            install -m 0644 ${WORKDIR}/busybox-syslog.default
> > ${D}${sysconfdir}/default/busybox-syslog +        fi
> > +
> 
> Does this mean that sysvinit users will now get a decoy version of
> busybox-syslog.default which isn't actually used by anything?

These lines are being added into a block which is conditional upon systemd 
being in DISTRO_FEATURES, so no; however FYI the meta-oe bbappend was 
installing the file unconditionally.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

