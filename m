Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 779A2607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 11:34:22 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20160729113419573_0685
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 04:34:19 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=49476 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1bT65J-0004bN-H9 for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2016 07:36:09 -0400
Date: Fri, 29 Jul 2016 07:34:11 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1607290725440.23675@localhost.localdomain>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: want to verify proper use of run-postinsts, if i may
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
X-List-Received-Date: Fri, 29 Jul 2016 11:34:24 -0000
Content-Type: text/plain; charset=US-ASCII


  looks pretty straightforward, just want to make sure i'm not missing
anything. on a systemd-based image, rpm packaging, AFAICT, i need to
do only the following:

1) add run-postinsts recipe to the image
2) create a run-postinsts bbappend recipe that adds /etc/rpm-postinsts
   directory with all my post-install scripts to be run
3) optionally, add a /etc/default/postinst file with settings to be
   sourced before running the scripts (i can see "POSTINST_LOGGING"
   as a useful environment setting

am i missing anything?  i'm assuming i'd use a .bbappend recipe to add
the script names to SRC_URI, then define "do_install_append()" to
manually copy them over, or is there a proper way to do that i'm not
seeing?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


