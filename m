Return-Path: <rpjday@crashcourse.ca>
Received: from smtp486.redcondor.net (smtp486.redcondor.net [208.80.204.86])
	by mail.openembedded.org (Postfix) with ESMTP id C9D5360144
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 10:57:41 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp486.redcondor.net ({6695537a-536a-45f9-a249-877c85428649})
	via TCP (outbound) with ESMTPS id 20140805105741202
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Aug 2014 10:57:41 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [99.240.204.5] (port=43813 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1XEcQy-0007ff-HJ for openembedded-core@lists.openembedded.org;
	Tue, 05 Aug 2014 06:57:36 -0400
Date: Tue, 5 Aug 2014 06:57:33 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1408050651560.10340@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: still some remnants of allegedly removed "do_package_write" task
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
X-List-Received-Date: Tue, 05 Aug 2014 10:57:43 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  yocto ref manual, 5.5.13 (Tasks), claims:

"The do_package_write task has been removed. The task is no longer
needed."

but there still appear to be a few lingering references to it in
oe-core:

$ grep -rw do_package_write meta
meta/classes/rm_work.bbclass:            *do_package_write*)
meta/recipes-core/meta/meta-ide-support.bb:do_populate_ide_support[recrdeptask]
= "do_package_write"
meta/recipes-core/meta/package-index.bb:do_package_write[noexec] = "1"
meta/recipes-devtools/installer/adt-installer_1.0.bb:do_package_write[noexec]
= "1"
meta/conf/documentation.conf:do_package_write[doc] = "Creates the
actual packages and places them in the Package Feed area"
$

  assuming all packaging is now handled by the packaging-specific
tasks like do_package_write_{ipk,rpm,deb}, can those last few
references be deleted? (not the one in rm_work.bbclass, though, given
that it's a wildcard.)

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


