Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2CD0675D2A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 13:34:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Oct 2015 06:34:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,702,1437462000"; d="scan'208";a="830324051"
Received: from ggwalsh-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.6.253])
	by fmsmga002.fm.intel.com with ESMTP; 19 Oct 2015 06:34:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, "Burton,
	Ross" <ross.burton@intel.com>
Date: Mon, 19 Oct 2015 14:34:29 +0100
Message-ID: <6286161.Ei9s0vA4WQ@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.8-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <CAJTo0Las=qdUxwGa3w+OibykzRuMnpVs+5oZGojxSGAibH1=QQ@mail.gmail.com>
References: <1445249129-1475-1-git-send-email-ross.burton@intel.com>
	<20151019120904.GB2549@jama>
	<CAJTo0Las=qdUxwGa3w+OibykzRuMnpVs+5oZGojxSGAibH1=QQ@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] sanity: check that the host has file installed
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
X-List-Received-Date: Mon, 19 Oct 2015 13:34:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 19 October 2015 13:12:56 Burton, Ross wrote:
> On 19 October 2015 at 13:09, Martin Jansa <martin.jansa@gmail.com> wrote:
> > file or filex?
> 
> Well that was embarassing.  I wonder how that test change made it into git.

Since this test isn't run on every build, it can be broken or unsatisfied and 
the build will still start. Given how quick this check is and that people have 
stumbled across the results of the check not having run, I wonder whether that 
should be changed.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

