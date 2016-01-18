Return-Path: <rpjday@crashcourse.ca>
X-Greylist: delayed 633 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Jan 2016 17:27:36 UTC
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 0782F6FFEA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 17:27:36 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20160118171702221_0684
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 17:17:02 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [127.0.0.1] (port=51976 helo=localhost)
	by astoria.ccjclearline.com with esmtpa (Exim 4.80)
	(envelope-from <rpjday@crashcourse.ca>) id 1aLDRL-0003tZ-Bj
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jan 2016 12:18:03 -0500
Received: from 66.46.196.8 ([66.46.196.8]) by crashcourse.ca (Horde
	Framework) with HTTP; Mon, 18 Jan 2016 12:18:03 -0500
Message-ID: <20160118121803.56251mr08uelicsg@crashcourse.ca>
Date: Mon, 18 Jan 2016 12:18:03 -0500
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
User-Agent: Internet Messaging Program (IMP) H3 (4.3.11)
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: how to get OE/rpm5 and rpms being built with rpm4 on centos7 to play together?
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
X-List-Received-Date: Mon, 18 Jan 2016 17:27:37 -0000
Content-Type: text/plain;
 charset=ISO-8859-1;
 DelSp="Yes";
 format="flowed"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

   was just presented with the following issue ... friend was asked to start
creating RPMs to add to a system being created with wind river linux 7 (soon
to be WRL8), but effectively, yocto project. last time i looked, YP uses
rpm5 and i never thought too much about it.

   said friend, however, has a home-grown build system that involves
hand-rolled spec files and running "rpmbuild" manually on centos 7,
which uses rpm4, which means (as i gather) that the generated rpms
are simply incompatible with the target system. so, possible solutions?

   one is to recreate the target system entirely with a PREFERRED_VERSION
for rpm of 4, but that seems like overkill.

   second is to somehow get rpmbuildv5 onto his centos 7 box, and alter
his search path to pick up that version just for the sake of his build.

   last option (and my preference) is to ditch his whole hand-rolling
and use YP (in this case, WRL) and define actual recipes for his
software and build that way.

   thoughts? am i understanding the problem here correctly? is there a
simpler solution i'm overlooking? thanks.

rday



