Received: from mail-pd0-f182.google.com ([209.85.192.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1Ud99e-0002AA-F9
	for Openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 03:08:26 +0200
Received: by mail-pd0-f182.google.com with SMTP id 3so2823278pdj.27
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2013 17:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:user-agent
	:in-reply-to:references:mime-version:content-transfer-encoding
	:content-type; bh=HgiCU9R8UI1dbYjWaQmf7fWWp3lgSRxTgRTahy+JVdc=;
	b=zfPIVFiFfUw05TS1B78RRNNlGpT+4eoz1K/Ni4GeiCJ4KZ/RxBL6Rj3qWR8YmyyuAg
	EIhRxj4G93I5GMxkobOJ40DJY0oFWyJuANYkeVPAGTMuda9TCG10NT2SnXOH5nIMGZ/J
	BHQp1qBMGIVRvO0Nd7kpKeS7OAZo1l1sM7pzO5I+y/RJ3NaES8qGfG3yBiaP9xrbuVyb
	bHHEJrBxRxltwZntsS0lu7elslatPaRBl6csx0tz5VKkitd1uzA6TbUGvCIm714CnlkB
	8OaB8FqSfqZhcCVN4S+oGcT94nyp+1Nf8Y5KheJsf1Sa7pk6jsal6ArAdyWFz7FAnJvg
	iwVw==
X-Received: by 10.68.213.162 with SMTP id nt2mr44895555pbc.179.1368751802880; 
	Thu, 16 May 2013 17:50:02 -0700 (PDT)
Received: from yiqingliang-pc.localnet ([121.237.163.165])
	by mx.google.com with ESMTPSA id dr6sm9653473pac.11.2013.05.16.17.50.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 16 May 2013 17:50:01 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Date: Fri, 17 May 2013 08:46:15 +0800
Message-ID: <1475581.xrrjhtfao2@yiqingliang-pc>
User-Agent: KMail/4.10.2 (Linux/3.8.11-1-ARCH; KDE/4.10.2; x86_64; ; )
In-Reply-To: <007BD92917A2324FA403BCF9A464CF8436FC944F@ALA-MBA.corp.ad.wrs.com>
References: <3388285.jCfN1Lj2u9@yiqingliang-pc>
	<007BD92917A2324FA403BCF9A464CF8436FC944F@ALA-MBA.corp.ad.wrs.com>
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: qt keyboard problem
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 May 2013 01:08:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday, May 16, 2013 04:51:04 PM Slater, Joseph wrote:
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core- bounces@lists.openembedded.org] On Behalf Of
> > Yi Qingliang
> > Sent: Tuesday, May 14, 2013 11:19 PM
> > To: openembedded-core@lists.openembedded.org oe-core layer
> > Subject: [OE-core] qt keyboard problem
> > 
> > Hello, all.
> > 
> > I'm running qt application on yocto's qt image. cpu is s3c2442, like
> > mini2440.
> > 
> > the problem is:
> > 
> > key event issued by pressing gpio-key eat by 'getty' (from busybox),
> > my application can't receive input event,
> > if I remove respawn 'getty' for tty1 in /etc/inittab, everything ok.
> 
> This could be the same thing I have seen in a slightly different context.
> If so, you can keep the getty's attached to VT's.  Just move the line in
> inittab that starts runlevel 5 to the very end of inittab.  As long as the
> getty's start first, you'll be okay.

you mean: move 'id:5:initdefault:' as the last line of the file, right?







# /etc/inittab: init(8) configuration.
# $Id: inittab,v 1.91 2002/01/25 13:35:21 miquels Exp $

# The default runlevel.
id:5:initdefault:

# Boot-time system configuration/initialization script.
# This is run first except when booting in emergency (-b) mode.
si::sysinit:/etc/init.d/rcS

# What to do in single-user mode.
~~:S:wait:/sbin/sulogin

# /etc/init.d executes the S and K scripts upon change
# of runlevel.
#
# Runlevel 0 is halt.
# Runlevel 1 is single-user.
# Runlevels 2-5 are multi-user.
# Runlevel 6 is reboot.

l0:0:wait:/etc/init.d/rc 0
l1:1:wait:/etc/init.d/rc 1
l2:2:wait:/etc/init.d/rc 2
l3:3:wait:/etc/init.d/rc 3
l4:4:wait:/etc/init.d/rc 4
l5:5:wait:/etc/init.d/rc 5
l6:6:wait:/etc/init.d/rc 6
# Normally not reached, but fallthrough in case of emergency.
z6:6:respawn:/sbin/sulogin
S:2345:respawn:/sbin/getty 115200 ttySAC0
# /sbin/getty invocations for the runlevels.
#
# The "id" field MUST be the same as the last
# characters of the device (after "tty").
#
# Format:
#  <id>:<runlevels>:<action>:<process>
#

1:2345:respawn:/sbin/getty 38400 tty1



> 
> Joe
> 
> > any idea?
> > 
> > 
> > --
> > Nanjing Jilong
> > Yi Qingliang
> > niqingliang2003@gmail.com
> > 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
-- 
Nanjing Jilong
Yi Qingliang
niqingliang2003@gmail.com


