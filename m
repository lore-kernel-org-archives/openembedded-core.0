Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 625EF6A5AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 14:55:36 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Jul 2013 07:55:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,974,1363158000"; d="scan'208";a="338716724"
Received: from unknown (HELO helios.localnet) ([10.252.121.225])
	by orsmga001.jf.intel.com with ESMTP; 01 Jul 2013 07:55:36 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 01 Jul 2013 15:55:35 +0100
Message-ID: <137271775.y6VAVELV8v@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <CAJTo0Laa1Y4NtDbQsGEJRaP+K31y_CF9Hmk=drvFs1GOArPBzw@mail.gmail.com>
References: <1372688477-27863-1-git-send-email-paul.eggleton@linux.intel.com>
	<CAJTo0Laa1Y4NtDbQsGEJRaP+K31y_CF9Hmk=drvFs1GOArPBzw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lttng-modules: allow building without tracepoints enabled in kernel
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
X-List-Received-Date: Mon, 01 Jul 2013 14:55:36 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 01 July 2013 15:44:10 Burton, Ross wrote:
> On 1 July 2013 15:21, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> > +       find ${D}/lib -depth -type d -empty -exec rmdir {} \;
> 
> A slightly cleaner form of this:
> 
> $ find ${D}/lib -type d -empty -delete

Right, I did check the find manpage but it only mentioned that -delete deletes 
files. Testing here I see that it does work though. I'll wait for further 
reviews before sending a v2.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

