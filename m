Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
	by mail.openembedded.org (Postfix) with ESMTP id 93C5B606C9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 08:20:23 +0000 (UTC)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com
	([174.114.57.56]:58318 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
	(envelope-from <rpjday@crashcourse.ca>) id 1j3FA7-001ZCp-Rd
	for openembedded-core@lists.openembedded.org;
	Sun, 16 Feb 2020 03:20:24 -0500
Date: Sun, 16 Feb 2020 03:20:21 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.21.2002160313040.2009723@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id:
	rpjday+crashcourse.ca/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: value of individual (override) settings of COMPATIBLE_MACHINE?
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
X-List-Received-Date: Sun, 16 Feb 2020 08:20:23 -0000
Content-Type: text/plain; charset=US-ASCII


  i remember wondering about this a looooong time ago, then forgot
about it, but in some of the poky linux-yocto kernel .bbappend files,
there are sets of individual COMPATIBLE_MACHINE settings:

  COMPATIBLE_MACHINE_genericx86 = "genericx86"
  COMPATIBLE_MACHINE_genericx86-64 = "genericx86-64"
  COMPATIBLE_MACHINE_edgerouter = "edgerouter"
  COMPATIBLE_MACHINE_beaglebone-yocto = "beaglebone-yocto"
  COMPATIBLE_MACHINE_mpc8315e-rdb = "mpc8315e-rdb"

given that, in the above, the override matches *exactly* the machine
name being assigned, how is this functionally different from simply:

  COMPATIBLE_MACHINE = "genericx86|edgerouter|beaglebone-yocto|mpc8315e-rdb"

as i read it, an override of the form

  COMPATIBLE_MACHINE_genericx86 = "genericx86"

says simply, "if this machine is a genericx86, then i am compatible
with a genericx86".

  am i missing some subtlety here? is there an actual difference?

rday

p.s.  while on the subject of COMPATIBLE_MACHINE, i remember noting
some time back the two aesthetic forms of assignments in use:

...
linux-yocto-rt_5.2.bb:COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm|qemuarmv5|qemuarm64|qemuppc|qemumips)"
linux-yocto_5.2.bb:COMPATIBLE_MACHINE = "qemuarm|qemuarmv5|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64"
linux-yocto-dev.bb:COMPATIBLE_MACHINE = "(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv64)"
...

as in, some use parentheses, some not. just a coding style thing.


