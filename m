Return-Path: <tom.zanussi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 855236CF07
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 22:19:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Oct 2013 15:19:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,494,1378882800"; d="scan'208";a="419107779"
Received: from unknown (HELO [10.255.15.157]) ([10.255.15.157])
	by orsmga002.jf.intel.com with ESMTP; 14 Oct 2013 15:19:39 -0700
Message-ID: <1381789179.1665.3.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: "Woegerer, Paul" <Paul_Woegerer@mentor.com>
Date: Mon, 14 Oct 2013 17:19:39 -0500
In-Reply-To: <1381768366.19281.64.camel@empanada>
References: <525C13C0.4020805@mentor.com> <1381768366.19281.64.camel@empanada>
X-Mailer: Evolution 3.4.4 (3.4.4-2.fc17) 
Mime-Version: 1.0
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: lttng-modules may trigger deadlock in the timekeeping subsystem with Linux <= 3.10.13, <= 3.11.2
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
X-List-Received-Date: Mon, 14 Oct 2013 22:19:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-10-14 at 11:32 -0500, Tom Zanussi wrote:
> On Mon, 2013-10-14 at 17:54 +0200, Woegerer, Paul wrote:
> > Hi,
> > 
> > looking at the following commits shows that the current version of
> > lttng-modules 2.3.x can trigger a deadlock in the timekeeping subsystem
> > of Linux.
> > 
> > http://git.lttng.org/?p=lttng-modules.git;a=commit;h=fc8216ae9ec5d18172d8227d179475e7cc1fb45c
> > http://git.lttng.org/?p=lttng-modules.git;a=commit;h=9998f5216f4641a79e158135c4c1658dcc6cd2d8
> > http://git.lttng.org/?p=lttng-modules.git;a=commit;h=e14bf96416c39675a5f785b032d1c5279020b93d
> > 
> > This is caused by a bug in the kernel that was introduced in 3.10. The
> > problem is already fixed in Linux 3.10.14, 3.11.3 and 3.12. See:
> > http://marc.info/?l=linux-kernel&m=137894350929349
> > 
> > lttng-modules 2.3.2 contains preprocessor-code that makes sure that
> > building of lttng-modules fails for the unlucky combinations of kernel
> > and lttng-modules. The problem is when we update our lttng-modules 2.3.0
> > to 2.3.2 then we would have lttng-modules failing to build for our qemu*
> > MACHINEs.
> > 
> > Any recommendations on how we should address this ?
> > 
> 
> Probably just get Bruce to update linux-yocto-3.10 to 3.10.14, or pull
> the specific commit that fixes it in.
> 

Adding Bruce to Cc:

Tom

> Tom
> 
> > Many thanks,
> > Paul
> > 
> 



