Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id 3AEDE60603
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2016 09:11:08 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20161030091108593_0486
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2016 09:11:08 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=40872 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c0m8s-0008PS-KY for openembedded-core@lists.openembedded.org;
	Sun, 30 Oct 2016 05:11:02 -0400
Date: Sun, 30 Oct 2016 05:10:00 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1610300507330.27931@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: any issue with duplicate recipes spread over different layers?
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
X-List-Received-Date: Sun, 30 Oct 2016 09:11:10 -0000
Content-Type: text/plain; charset=US-ASCII


  not a burning issue, but while cataloguing some python recipes, i'm
running across stuff like this:

$ find . -name python-six_1.10.0.bb
./meta-virtualization/recipes-devtools/python/python-six_1.10.0.bb
./openembedded-core/meta/recipes-devtools/python/python-six_1.10.0.bb
./meta-openembedded/meta-python/recipes-devtools/python/python-six_1.10.0.bb
...

$ find . -name python3-six_1.10.0.bb
./openembedded-core/meta/recipes-devtools/python/python3-six_1.10.0.bb
./meta-openembedded/meta-python/recipes-devtools/python/python3-six_1.10.0.bb
...

  so it appears the same(?) recipe for python-six appears in three
different layers ... is there any effort expended to identify
redundancy and remove it?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


