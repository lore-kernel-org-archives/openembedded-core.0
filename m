Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 93E216FEE0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 10:13:03 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20161208101303886_0684
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2016 10:13:03 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=33715 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cEvhB-0001oO-Pm for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2016 05:12:57 -0500
Date: Thu, 8 Dec 2016 05:11:41 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1612080508460.13529@ca624034.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: what exactly does the "meta-systemd" layer do?
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
X-List-Received-Date: Thu, 08 Dec 2016 10:13:04 -0000
Content-Type: text/plain; charset=US-ASCII


  almost certainly a dumb question, but what is the purpose of the
meta-openembedded/meta-systemd layer? i can see that the general
structure of that layer is a pile of bbappend files of the form:

  RPROVIDES_${PN} += "${PN}-systemd"
  RREPLACES_${PN} += "${PN}-systemd"
  RCONFLICTS_${PN} += "${PN}-systemd"

so, in the case of, say, dropbear (which, from oe-core, is already a
systemd-controlled activity), i see a simple renaming of the package
produced. so instead of "dropbear", i'll get "dropbear-systemd".

  what am i missing? what is the purpose of that layer?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


