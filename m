Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0EBFF6011A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 22:24:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Jan 2016 14:24:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,549,1444719600"; d="scan'208";a="890395425"
Received: from mariacha-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.175.41])
	by fmsmga002.fm.intel.com with ESMTP; 10 Jan 2016 14:24:14 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <pb@pbcl.net>,
	Matthias Schiffer <mschiffer@universe-factory.net>
Date: Mon, 11 Jan 2016 11:24:12 +1300
Message-ID: <13451091.uX0xhFoV9Y@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.8-300.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <1452464539.1950.19.camel@pbcl.net>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<5692CD35.2060304@universe-factory.net>
	<1452464539.1950.19.camel@pbcl.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/53] musl fixes 3
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
X-List-Received-Date: Sun, 10 Jan 2016 22:24:17 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sun, 10 Jan 2016 22:22:19 Phil Blundell wrote:
> On Sun, 2016-01-10 at 22:29 +0100, Matthias Schiffer wrote:
> > systemd has been relying on ln's -r (--relative) option for some time
> > for similar reasons, but it's a fairly recent addition to ln, so I'm not
> > sure if it's acceptable for OE. If not, adding a symlink helper based on
> > python's os.path.relpath might be a good idea.
> 
> As a general rule, if it's not in POSIX (and I don't think "ln -r" is)
> then we probably don't want OE to rely on it.  As far as I know, oe-core
> doesn't currently require GNU ln to build.

This is why we have scripts/lnr to provide equivalent functionality.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

