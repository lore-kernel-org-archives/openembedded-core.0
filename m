Return-Path: <rpjday@crashcourse.ca>
X-Greylist: delayed 410 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 16 Oct 2014 16:01:50 UTC
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 3F0C660DD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 16:01:50 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20141016155500624
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 15:55:00 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [128.107.239.235] (port=46916 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1XenOI-0003w8-J0 for openembedded-core@lists.openembedded.org;
	Thu, 16 Oct 2014 11:55:02 -0400
Date: Thu, 16 Oct 2014 08:54:50 -0700 (PDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1410160850380.6082@localhost>
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
Subject: isn't "do_install_append_pn-uclibc" partly redundant?
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
X-List-Received-Date: Thu, 16 Oct 2014 16:01:50 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  perusing recipes for my courseware and ran across this in the listed
file:

meta/recipes-core/uclibc/uclibc.inc:do_install_append_pn-uclibc () {

now, given that the above file is clearly the general include file for
the uclibc package, could the task append definition:

  do_install_append_pn-uclibc () {

not have been written more simply as:

  do_install_append () {

as in, given that this task append is clearly only for the uclibc
package, it seems unnecessary to add a package-specific override. most
other recipes use the second, shorter form, so i was wondering if
there was something subtle about the uclibc recipe that necessitated
the first form.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


