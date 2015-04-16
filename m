Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9E38573D0B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 19:10:31 +0000 (UTC)
Received: by wgin8 with SMTP id n8so91075552wgi.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 12:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=XE9ri22ji7IbuX+/mFMGqBpTEv8qXWsHhPA8ZVDeGzM=;
	b=s24nwBc75uGYxtCAkVouNtqBXEEenZ/z2qqWkCVmsTW2ni6EbCM4hUBV3AvfvdDktG
	NCCrmGjz7UhQSF8waAA+KhbtGGSAqx4hGxbv6ChrQ4y02/QHp1eah00wTD0AL8aWHIsO
	i1ti3CWORnXP8pnM8A1mY+A6CVgA1xU/MXcL7rD9NDJrkz4UzoasJF14nOTjwL1GHSsW
	uBY8b817G0Aq9WCavQLH7tzTI1HQsZsJJdG2UiE/2WCcTi7avtXPaawcvTWBOgo1mYVA
	j2M+sjHPpGzQZt83MYNq6p17P4ZsUSRpb6n1r37Rj0Wqnln1+u4seC61PwT5sZGP8X8g
	mgQQ==
X-Received: by 10.180.216.40 with SMTP id on8mr10780286wic.55.1429211432657;
	Thu, 16 Apr 2015 12:10:32 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	i13sm27212089wic.13.2015.04.16.12.10.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Apr 2015 12:10:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 16 Apr 2015 21:10:48 +0200
To: Bryan Evenson <bevenson@melinkcorp.com>
Message-ID: <20150416191048.GB2341@jama>
References: <BN3PR0501MB10906F787AE8EB17CD7558C6BBE60@BN3PR0501MB1090.namprd05.prod.outlook.com>
	<BN3PR0501MB1090F9B31066CC3E7AB72B5EBBE40@BN3PR0501MB1090.namprd05.prod.outlook.com>
	<3282189.xUS47EJLep@peggleto-mobl.ger.corp.intel.com>
	<BN3PR0501MB109029A875F2A8868C2A9CF0BBE40@BN3PR0501MB1090.namprd05.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <BN3PR0501MB109029A875F2A8868C2A9CF0BBE40@BN3PR0501MB1090.namprd05.prod.outlook.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: sysvinit upgrade woes
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
X-List-Received-Date: Thu, 16 Apr 2015 19:10:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2015 at 06:42:58PM +0000, Bryan Evenson wrote:
> Paul,
>=20
> > -----Original Message-----
> > From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]
> > Sent: Thursday, April 16, 2015 1:57 PM
> > To: Bryan Evenson
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] sysvinit upgrade woes
> >=20
> > Hi Bryan,
> >=20
> > On Thursday 16 April 2015 13:53:14 Bryan Evenson wrote:
> > > > -----Original Message-----
> > > > From: openembedded-core-bounces@lists.openembedded.org
> > > > [mailto:openembedded-core-bounces@lists.openembedded.org] On
> > Behalf
> > > > Of Bryan Evenson
> > > > Sent: Tuesday, April 14, 2015 11:26 AM
> > > > To: openembedded-core@lists.openembedded.org
> > > > Subject: [OE-core] sysvinit upgrade woes
> > > >
> > > > I am using opkg for package management and sysvinit for init.  I am
> > > > testing a large jump on an upgrade and I have been having a few iss=
ues.
> > > > One issue I have traced to sysvinit's upgrade, but I'm unsure how to
> > > > remedy the solution.
> > > >
> > > > At some point during the upgrade process, opkg records what the new
> > > > version is of all the packages getting installed.  However, when I
> > > > upgrade sysvinit causes sysvinit to restart before opkg has recorded
> > > > which packages were just installed.  So opkg thinks that it didn't
> > > > upgrade anything even though all packages were upgraded.  I verified
> > > > that if I call "opkg upgrade" for all packages that require upgrade
> > > > except for sysvinit that opkg correctly records which packages were
> > > > upgraded.  However, the end user doesn't have that kind of control,
> > > > so upgrading in this manner is not an option.
> > > >
> > > > Has anyone else seen a similar issue?  Any ideas on how to hold off
> > > > sysvinit from restarting until after opkg has finished recording its
> > > > information?
> > >
> > > I've found the problem but don't yet have a good solution.  At the end
> > > of the sysvinit-inittab pkg_postinst script is the line:
> > >
> > > 	kill -HUP 1
> > >
> > > This kills init before opkg has finished doing its job.  On my system,
> > > I've added a .bbappend with a pk_postinst script as follows for items
> > > that require a reboot after installation:
> > >
> > >     touch /var/run/reboot-required
> > >     echo "${PN}" >>/var/run/reboot-required.pkgs
> > >
> > > After my system performs firmware upgrade, it checks if
> > > /var/run/reboot-required exists and then reboots the system.  So on my
> > > system, I changed the pkg_postinst script for sysvinit-inittab to
> > > replace the "kill -HUP 1" with the reboot required notations.
> > >
> > > Is there some suitable solution that would be reasonable to change in
> > > the sysvinit-inittab recipe that would work for other people?
> >=20
> > SIGHUP is supposed to make sysvinit re-read inittab, not kill it. Can y=
ou tell
> > what is actually happening?
>=20
> Ah, I don't know for sure what is happening but now I have a different gu=
ess.  I have tried running the upgrade with "opkg -V4 upgrade" (insanely ve=
rbose debug output) and I can tell that is doing the postinst scripts when =
the upgrade stops and I get logged out.  I am doing my testing through the =
debug serial port on my system.  My best guess without further proof is tha=
t the SIGHUP restarts my terminal which in turn kills "opkg upgrade" which =
was commanded through my terminal.
>=20
> If that is what is happening, then the upgrade should continue normally i=
f I send it to the background ("opkg upgrade &"), correct?  Or it would run=
 just fine if a cron job started the upgrade?

You can also run it in GNU screen session to verify this. I remember
seeing this behavior couple years ago and I prefer screen since then
(also for using the same screen after you set the network over serial
cable and then want to continue in the same shell but over network).

> > Cheers,
> > Paul
> >=20
> > --
> >=20
> > Paul Eggleton
> > Intel Open Source Technology Centre
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

