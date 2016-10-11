Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E9A7770016
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 14:05:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 11 Oct 2016 07:05:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,329,1473145200"; d="scan'208";a="1043221620"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.31.77])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2016 07:05:47 -0700
Message-ID: <1476194745.2912.27.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>, OE-core
	<openembedded-core@lists.openembedded.org>
Date: Tue, 11 Oct 2016 15:05:45 +0100
In-Reply-To: <354af725-27e7-ba35-2a45-514151904c32@jp.fujitsu.com>
References: <41bbea13-30ce-4d55-441c-ffdbb0f863f1@jp.fujitsu.com>
	<1475757767.3146.12.camel@linux.intel.com>
	<354af725-27e7-ba35-2a45-514151904c32@jp.fujitsu.com>
X-Mailer: Evolution 3.20.5 (3.20.5-1.fc24) 
Mime-Version: 1.0
Subject: Re: rpm: Recover RPM4 to OE-core
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
X-List-Received-Date: Tue, 11 Oct 2016 14:05:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-10-07 at 12:19 +0900, Fan Xin wrote:
> Hi Joshua,
> 
> Thanks for your info.
> 
> Actually, our origin motivation is that we found smartpm is not 
> maintained any more. We maintain smartpm for our distro at
> https://github.com/ubinux/smart2

Indeed, the lack of maintenance for Smart is one of the reasons we're
looking to switch away from it.

> Then we realize smartpm should switch to python3. In order to solve
> this 
> issue, there are four solutions as follows.
> 
> [1] smart/RPM5
> [2] smart/RPM4
> [3] dnf/RPM5
> [4] dnf/RPM4
> 
> I confirm that RPM5 have some bugs with python3 and I am not
> familiar 
> with RPM. So I think the easy way to solve this issue is [2],
> recover 
> RPM4 and solve the bugs in smartpm.
> 
> > 
> > 
> > It's also worth pointing out that we're strongly considering
> > dropping
> > SMART in the next (2.3) development cycle[4].
> > 
> Considering YP would like to drop smart in 2.3, I wonder YP would
> use 
> [3]dnf/RPM5 or [4]dnf/RPM4 ?

There are two main reasons we want to switch away from Smart. Firstly
we made a concerted effort to switch to Python3 in the 2.2 cycle —
Smart is one of the few recipes in OE-Core which still pulls in
Python2, maybe the only one we use by default (for RPM using distros).

Secondly Smart is unmaintained and has several known issues related to
its abstraction over package backends.

So far as I'm aware no decision has been made as to what we'll replace
Smart with yet. I believe the first step will be to investigate RPM5 &
dnf.

Regards,

Joshua

