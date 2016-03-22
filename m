Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2768660116
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 22:51:21 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Mar 2016 15:51:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,379,1455004800"; d="scan'208";a="769437062"
Received: from szexingn-mobl4.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.129.75])
	by orsmga003.jf.intel.com with ESMTP; 22 Mar 2016 15:51:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 23 Mar 2016 11:51:17 +1300
Message-ID: <28053801.mWnzexDvGB@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.5-300.fc23.x86_64; KDE/4.14.18; x86_64; ;
	)
In-Reply-To: <CAJTo0LYKCiNA73zWkvXCHSz8-sWKQ4oAbQnqkyCZubf4BJ-xJA@mail.gmail.com>
References: <1458670391-26915-1-git-send-email-sgw@linux.intel.com>
	<1458683790.18406.33.camel@linux.intel.com>
	<CAJTo0LYKCiNA73zWkvXCHSz8-sWKQ4oAbQnqkyCZubf4BJ-xJA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] linux-firmware: Break out some additional firmware
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
X-List-Received-Date: Tue, 22 Mar 2016 22:51:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 22 Mar 2016 22:37:24 Burton, Ross wrote:
> On 22 March 2016 at 21:56, Saul Wold <sgw@linux.intel.com> wrote:
> > > | linux-firmware-iwlwifi-7265D
> > > | *** Error: Package name  contains illegal characters, (other than
> > > 
> > > [a-z0-9.+-])
> > 
> > Gah, no CAPS?  Sorry I did not do the full package specturm tests.
> 
> Yeah...  tempting to file a bug against opkg!

Honestly I think we're better off with this restriction - it keeps package 
names simple. I don't have to remember whether there's subtly different casing 
for certain recipe/package names (like I do on Fedora).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

