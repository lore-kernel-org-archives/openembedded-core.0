Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E8E316FF23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 18:16:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2EIGXuO002430
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 11:16:33 -0700 (PDT)
Received: from seebs-worktop (172.25.40.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 14 Mar 2016 11:16:31 -0700
Date: Mon, 14 Mar 2016 13:16:31 -0500
From: Peter Seebach <peter.seebach@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Message-ID: <20160314131631.0584f867@seebs-worktop>
X-Mailer: Claws Mail 3.9.3 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Seeking volunteer(s) for pseudo code review
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
X-List-Received-Date: Mon, 14 Mar 2016 18:16:33 -0000
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit

So, long story short, there were some relatively straightforward patches
recently which led to discovering a weird race condition during startup, and
careful debugging of that convinced me to rework the server-spawning code,
and the server startup code, and some other things.

At which point, I think I would be interested in code review rather than just
sending patches, and I'm wondering if anyone on the list has an interest in
reviewing some patches and sanity-checking them.

-s
-- 
Listen, get this.  Nobody with a good compiler needs to be justified.

