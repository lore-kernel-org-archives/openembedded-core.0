Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 211A271DE2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 10:36:03 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20161213103603960_0684
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 10:36:03 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=52944 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cGkRA-0006HI-9i for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2016 05:35:56 -0500
Date: Tue, 13 Dec 2016 05:34:37 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1612130530170.7395@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: why does OE's systemd have a hard dependency on qemu-native?
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
X-List-Received-Date: Tue, 13 Dec 2016 10:36:09 -0000
Content-Type: text/plain; charset=US-ASCII


  currently messing with systemd-coredump and, in systemd_232.bb, i
see:

DEPENDS = "kmod intltool-native gperf-native acl readline libcap
   libcgroup qemu-native util-linux"
             ^^^^^^^^^^^ ?

now, i *am* building for qemuppc for testing, but the above is an
unconditional dependency on qemu-native. what does systemd need
qemu-native for?

  right below, we read:

    inherit ... qemu ...

so, again, qemu. yet a bit further down:

SRC_URI_append_qemuall = "
 file://0001-core-device.c-Change-the-default-device-timeout-to-2.patch"

so now SRC_URI is modified *conditionally* based on qemuall.

  can someone clarify what relationship systemd has with qemu?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


