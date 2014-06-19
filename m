Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5B4586FD3E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jun 2014 17:04:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2014 10:03:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,508,1400050800"; d="scan'208";a="531116499"
Received: from akagikob-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.96])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2014 10:03:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 19 Jun 2014 18:03:34 +0100
Message-ID: <2002914.Bs3XxDhjX7@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.7-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <20140619163922.GR2117@jama>
References: <1403177022-19086-1-git-send-email-Martin.Jansa@gmail.com>
	<3503275.YjDqJfgFMA@peggleto-mobl5.ger.corp.intel.com>
	<20140619163922.GR2117@jama>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] usbinit, weston-init, run-postinsts, qt-demo-init: Drop allarch
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
X-List-Received-Date: Thu, 19 Jun 2014 17:04:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 19 June 2014 18:39:22 Martin Jansa wrote:
> On Thu, Jun 19, 2014 at 02:54:59PM +0100, Paul Eggleton wrote:
> > Hi Martin,
> > 
> > On Thursday 19 June 2014 13:23:42 Martin Jansa wrote:
> > > * update-rc.d.bbclass now adds dependency on TUNE_PKGARCH initscripts,
> > > so
> > > these cannot be allarch
> > 
> > As I've said before, I really dislike this change. The system should be
> > made to handle the situation properly instead of working around the
> > issue.
>
> This one is new :) (I think) I had clean state (with my unmerged
> changes) with dylan (now I'm testing dora, daisy, master as well), these
> are "new" as the initscripts dependency was added recently.

I'm aware that it's a new instance, but of the same situation.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

