Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id EE3AB71CA4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 09:47:10 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20161020094711155_0484
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2016 09:47:11 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=37159 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bx9wH-00050J-AJ for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2016 05:47:05 -0400
Date: Thu, 20 Oct 2016 05:46:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1610200542160.9999@ca624034.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: any plans to upgrade to rpm-5.4.17?
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
X-List-Received-Date: Thu, 20 Oct 2016 09:47:11 -0000
Content-Type: text/plain; charset=US-ASCII


  just noticed in recipe rpm_5.4.16.bb:

# There is no official 5.4.16 release yet, so start w/ 5.4.15 and patch it
# based on CVS
S = "${WORKDIR}/rpm-5.4.15"

SRC_URI =
"http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.15-0.20140824.src.rpm;name=srpm;extract=rpm-5.4.15.tar.gz \
... snip ...

but over at rpm5.org/files/rpm/rpm-5.4, one can see the most recent
src rpms:

... snip ...
rpm-5.4.15-0.20140824.src.rpm 	24-Aug-2014 18:30 	15M
rpm-5.4.16-0.20160420.src.rpm 	20-Apr-2016 14:21 	17M
rpm-5.4.17-0.20160512.src.rpm 	12-May-2016 22:03 	19M

so is there an ETA for just moving to 5.4.17?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



