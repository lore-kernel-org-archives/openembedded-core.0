Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C5C56607A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 07:42:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 25 Jul 2016 00:42:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,418,1464678000"; d="scan'208";a="1001852876"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.139.129])
	by orsmga001.jf.intel.com with ESMTP; 25 Jul 2016 00:42:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Jul 2016 19:42:08 +1200
Message-ID: <1948585.XiSYCAuUde@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.6.4-201.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1493839.LtSXxTmLfS@peggleto-mobl.ger.corp.intel.com>
References: <cover.1469190931.git.paul.eggleton@linux.intel.com>
	<CAJTo0LZZD0poopBgYb9BbeJ_UUaJc5KZxTXSV5jndnLJC8EiCQ@mail.gmail.com>
	<1493839.LtSXxTmLfS@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] Extensible SDK improvements
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
X-List-Received-Date: Mon, 25 Jul 2016 07:42:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sat, 23 Jul 2016 13:11:39 Paul Eggleton wrote:
> On Fri, 22 Jul 2016 23:31:38 Burton, Ross wrote:
> > On 22 July 2016 at 13:38, Paul Eggleton <paul.eggleton@linux.intel.com>
> > 
> > wrote:
> > > Some fixes and enhancements centered around how the toolchain is
> > > incorporated in the eSDK, as well as a couple of tweaks for buildhistory
> > > that I found we needed during development.
> > 
> > This is happening in mut, could your branch be responsible:
> > 
> > http://errors.yoctoproject.org/Errors/Details/73022/
> > 
> > Ross (who will look further when its not 23:30 on Friday!)
> 
> Hmm, it will be, but I can't tell immediately from the error message what
> could be wrong...

Ah, I believe this is bash vs. dash. Fix incoming, just need to test it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

