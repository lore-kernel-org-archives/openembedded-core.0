Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 957DE6AE6E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 15:34:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 26 Jul 2013 08:34:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,752,1367996400"; d="scan'208";a="376628660"
Received: from unknown (HELO helios.localnet) ([10.252.122.182])
	by fmsmga002.fm.intel.com with ESMTP; 26 Jul 2013 08:34:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, Saul Wold <sgw@linux.intel.com>
Date: Fri, 26 Jul 2013 16:34:15 +0100
Message-ID: <4930472.WmY8LRsmSd@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-26-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAJTo0LZddy=dtdm_wdqg+GJQmxmt24uhmNe8J6hM6gnK_ikocw@mail.gmail.com>
References: <cover.1374822498.git.sgw@linux.intel.com>
	<CAJTo0LZddy=dtdm_wdqg+GJQmxmt24uhmNe8J6hM6gnK_ikocw@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [CONSOLIDATED PULL 00/78] Review & ACK
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
X-List-Received-Date: Fri, 26 Jul 2013 15:34:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 26 July 2013 10:35:20 Burton, Ross wrote:
> On 26 July 2013 08:14, Saul Wold <sgw@linux.intel.com> wrote:
> > Emilia Ciobanu (12):
> >   babeltrace: fix recipe name
> >   build-appliance-image: fix recipe name add GIT revision to PV variable
> >   chkconfig-alternatives-native: fix recipe name and add GIT revision to
> >   
> >     PV variable
> >   
> >   connman-gnome: fix recipe name add GIT revision to PV variable
> >   docbook-sgml-dtd-3.1-native: fix recipe name
> >   docbook-sgml-dtd-4.1-native: fix recipe name
> >   hwlatdetect: fix recipe name and add GIT revision to PV variable
> >   lttng-ust: fix recipe name and add GIT revision to PV variable
> >   mtd-utils: fix recipe name and add GIT revision to PV variable
> >   neard: fix recipe name
> >   rt-tests: fix recipe name add GIT revision to PV variable
> >   update-rc.d: fix recipe name and add GIT revision to PV variable
> 
> I meant to chime in on this yesterday but was... tied up.  For
> packages where the SRC_URI is a git repo *but* we're only ever
> checking out release tags do we really need to rename the package to
> _git?  The _git version to me implies "a mostly working snapshot of
> the development release" not "a stable release".

It's also going to be hard to be consistent in renaming everywhere as well 
because I think in a few cases we already have a bleeding-edge _git recipe in 
addition to the release recipe being built from git.

I guess I've not been very coherent on this, sorry for the confusion Emilia. I 
think we need to take a step back and make sure we're doing the right thing 
here, especially if we're only doing it to accommodate the current behaviour 
of distrodata.bbclass.

> >   bluez5: disable obex by default
> 
> The message seems to allude to some other reason for disabling it
> apart from a systemd user service not being packaged.  Is there a
> reason, as the systemd issue should be fixable in systemd.bbclass.
> 
> Apart from that, Acked-By: Ross Burton <ross.burton@intel.com>.

I've also looked over the rest of the patches, they're OK by me as well.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

