Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2A69B60111
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Jul 2016 20:53:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 03 Jul 2016 13:53:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,571,1459839600"; d="scan'208";a="1014819979"
Received: from jylow-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.243])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jul 2016 13:53:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 04 Jul 2016 08:53:28 +1200
Message-ID: <3618884.St3QagO9zL@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.5.7-200.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <CAJTo0LaUQGUkKiPmuy+Pf6oPcpt8Rad0g6rx7hBOHtoqnH+-Dw@mail.gmail.com>
References: <cover.1466683248.git.paul.eggleton@linux.intel.com>
	<2291068.MjvgqpAC42@peggleto-mobl.ger.corp.intel.com>
	<CAJTo0LaUQGUkKiPmuy+Pf6oPcpt8Rad0g6rx7hBOHtoqnH+-Dw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 02/10] classes/cmake: enable progress for do_compile
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
X-List-Received-Date: Sun, 03 Jul 2016 20:53:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Mon, 27 Jun 2016 19:14:03 Burton, Ross wrote:
> On 27 June 2016 at 18:49, Paul Eggleton <paul.eggleton@linux.intel.com>
> wrote:
> > Great, that's just broken... any suggestions on what to do about it?
> 
> I'm wondering if cmake can be told to just output the "top level"
> percentages, or whether that is basically unknowable.

I can't seem to find an option for this.

However I'm wondering if this is something special to clang. Everything else 
that uses cmake that I've tried (including webkitgtk) is putting out sensible 
numbers. Have you observed it anywhere else?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

