Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 5BE4A60103
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 12:42:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 06 Oct 2016 05:42:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,453,1473145200"; d="scan'208";a="1041133766"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.29.86])
	by orsmga001.jf.intel.com with ESMTP; 06 Oct 2016 05:42:49 -0700
Message-ID: <1475757767.3146.12.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>, OE-core
	<openembedded-core@lists.openembedded.org>
Date: Thu, 06 Oct 2016 13:42:47 +0100
In-Reply-To: <41bbea13-30ce-4d55-441c-ffdbb0f863f1@jp.fujitsu.com>
References: <41bbea13-30ce-4d55-441c-ffdbb0f863f1@jp.fujitsu.com>
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
X-List-Received-Date: Thu, 06 Oct 2016 12:42:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Fan,

On Thu, 2016-10-06 at 20:18 +0900, Fan Xin wrote:
> By the way, could anyone give more detail info about the bugs in RPM

We removed rpm4 early this year[1] because rather than have people be
surprised that it didn't work we decided to drop support for rpm4 until
such time as the project had sufficient resources to properly maintain
it.

There were at least two issues[2][3] reported that indicated rpm4
support was incomplete, though I believe they were mostly related to
Smart's interactions with RPM 4 rather than any issue in RPM 4 itself.

It's also worth pointing out that we're strongly considering dropping
SMART in the next (2.3) development cycle[4].

Do you have a reason for wanting rpm4 beyond the proven Python3
support?

Regards,

Joshua

1. http://lists.openembedded.org/pipermail/openembedded-core/2016-March
/118849.html
2. https://bugzilla.yoctoproject.org/show_bug.cgi?id=8968
3. https://bugzilla.yoctoproject.org/show_bug.cgi?id=8969
4. https://bugzilla.yoctoproject.org/show_bug.cgi?id=9675

