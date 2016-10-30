Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 72AC66060F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2016 14:45:41 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20161030144541618_0685
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2016 07:45:41 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [174.118.92.171] (port=45926 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c0rMd-0001go-Uc for openembedded-core@lists.openembedded.org;
	Sun, 30 Oct 2016 10:45:36 -0400
Date: Sun, 30 Oct 2016 10:44:36 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1610301042290.19661@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: postgresql: "Taskhash mismatch"
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
X-List-Received-Date: Sun, 30 Oct 2016 14:45:43 -0000
Content-Type: text/plain; charset=US-ASCII


  i've never seen one of these before -- this was generated in a
completely fresh build:

ERROR: postgresql-9.4.8-r0.0 do_deploychef_install: Taskhash mismatch
834561f3f96987debe459a38ed29e3b5 versus
30bd6bedbae7ee7577cb2e6f9cd67d28 for
/home/rpjday/oe/dist/layers/meta-openembedded/meta-oe/recipes-support/postgresql/postgresql_9.4.8.bb.do_deploychef_install
ERROR: Taskhash mismatch 834561f3f96987debe459a38ed29e3b5 versus
30bd6bedbae7ee7577cb2e6f9cd67d28 for
/home/rpjday/oe/dist/layers/meta-openembedded/meta-oe/recipes-support/postgresql/postgresql_9.4.8.bb.do_deploychef_install
ERROR: postgresql-9.4.8-r0.0 do_package: Taskhash mismatch
dd7583ca4559829157cde56fe9a05763 versus
c875f1d5c39516c88f5063e4ba88a7cb for
/home/rpjday/oe/dist/layers/meta-openembedded/meta-oe/recipes-support/postgresql/postgresql_9.4.8.bb.do_package
ERROR: Taskhash mismatch dd7583ca4559829157cde56fe9a05763 versus
c875f1d5c39516c88f5063e4ba88a7cb for
/home/rpjday/oe/dist/layers/meta-openembedded/meta-oe/recipes-support/postgresql/postgresql_9.4.8.bb.do_package

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


