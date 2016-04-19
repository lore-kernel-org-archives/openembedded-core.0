Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 012DB6FEF6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 03:33:13 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 18 Apr 2016 20:33:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,504,1455004800"; d="scan'208";a="688511225"
Received: from sadnan1-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.175.36])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Apr 2016 20:33:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Apr 2016 15:33:08 +1200
Message-ID: <2192667.VMn04Uynna@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.6-301.fc23.x86_64; KDE/4.14.18; x86_64; ;
	)
In-Reply-To: <CAJTo0LY7wbsghY5ypPSKAQ5tPN=pJkmQ=ZsC8+8SjARBqh4zoQ@mail.gmail.com>
References: <cover.1460947932.git.liezhi.yang@windriver.com>
	<1dc231d4e16a29c432524c1dcbce24be1e5e61cc.1460947932.git.liezhi.yang@windriver.com>
	<CAJTo0LY7wbsghY5ypPSKAQ5tPN=pJkmQ=ZsC8+8SjARBqh4zoQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] meta.bbclass: set INHIBIT_DEFAULT_DEPS
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
X-List-Received-Date: Tue, 19 Apr 2016 03:33:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Mon, 18 Apr 2016 21:27:25 Burton, Ross wrote:
> On 18 April 2016 at 03:57, Robert Yang <liezhi.yang@windriver.com> wrote:
> > The recipe which inherits meta.bbclass doesn't require any default deps.
> 
> meta is only inherited by one class (populate_sdk_base.bbclass) and three
> recipes (two of which indirectly inherit populate_sdk_base) so do we really
> need this class?  Maybe we should drop it in the 2.2 cycle.

I don't think we ought to be in too much of a hurry to remove this - it's 
still a handy class. Besides I was planning on using it to solve this issue:

  https://bugzilla.yoctoproject.org/show_bug.cgi?id=9257 

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

