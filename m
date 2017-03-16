Return-Path: <rpjday@crashcourse.ca>
Received: from smtp684.redcondor.net (smtp684.redcondor.net [208.80.206.84])
	by mail.openembedded.org (Postfix) with ESMTP id 492C5730F0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 11:23:47 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp684.redcondor.net ({700db0a8-6fb7-4c8b-9b2a-6812225182d8})
	via TCP (outbound) with ESMTPS id 20170316112346513_0684
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 11:23:46 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=19985 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1coTVM-00061P-MZ for openembedded-core@lists.openembedded.org;
	Thu, 16 Mar 2017 07:23:40 -0400
Date: Thu, 16 Mar 2017 07:23:38 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1703160713080.22627@uk63952.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: any necessity for MACHINEOVERRIDES in mpc8315e-rdb.conf?
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
X-List-Received-Date: Thu, 16 Mar 2017 11:23:48 -0000
Content-Type: text/plain; charset=US-ASCII


  (yet more pedantry, but when i try to explain stuff like this to
students, it's nice to know what i'm talking about.)

  i notice the following excerpts from YP's mpc8315e-rdb.conf:

  KERNEL_IMAGETYPE = "uImage"
  UBOOT_MACHINE_mpc8315e-rdb = "MPC8315ERDB_config"
  KERNEL_DEVICETREE = "mpc8315erdb.dtb"

what is the purpose (if any) for the "mpc8315e-rdb" override in the
line:

  UBOOT_MACHINE_mpc8315e-rdb = "MPC8315ERDB_config"
               ^^^^^^^^^^^^^

given that this is a machine config file for a specific target,
"mpc8315e-rdb", wouldn't this suffice?

  UBOOT_MACHINE = "MPC8315ERDB_config"

of course, having that MACHINEOVERRIDES wouldn't hurt, but it seems
superfluous, and it's also inconsistent with other variable settings
in that file that don't use it, which is *exactly* what confuses the
heck out of beginners.

  thoughts? am i missing something? other machine config files don't
seem to need it:

  UBOOT_MACHINE = "am335x_boneblack_config"

rday

p.s. i apologize for being such an annoying pedant all the time, but
little inconsistencies like this are exactly what some of my students
notice, and ask about, and i end up looking at it, going, "i haven't
the foggiest idea what the heck that's all about." hence my obsession
with consistency.

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


