Received: from mail2.eads.net ([80.156.45.114] helo=mail.eads.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1QguOU-0004xe-JH for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 10:02:06 +0200
Received: from gsx3071-vs5.mxchg.m.corp ([53.147.176.148])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id p6D7w9aY030300
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2011 09:58:11 +0200
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3071-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 13 Jul 2011 09:58:06 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 13 Jul 2011 09:58:06 +0200
Message-ID: <0C757E680E33864AB113392C7E83F910BE51A1@GSX300A.mxchg.m.corp>
In-Reply-To: <4E1C7F36.1080501@windriver.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [OE-core] [Draft design][RFC] Running postinst at
	rootfs	generation time
Thread-Index: AcxAtiNYnihR9sH9S3alTg3R59laxgAex5aw
References: <1865303E0DED764181A9D882DEF65FB6A167F0C70B@shsmsx502.ccr.corp.intel.com><4E095480.3070001@windriver.com><1309266943.20015.290.camel@rex><4E09E8B7.1070901@windriver.com><0C757E680E33864AB113392C7E83F910BE518E@GSX300A.mxchg.m.corp><1865303E0DED764181A9D882DEF65FB6A200B1C937@shsmsx502.ccr.corp.intel.com>	<CACzvQmYM-Tn0xWL9Hc3hyn8EEUeZjbkfTDOYskETJrq7=TB77A@mail.gmail.com><0C757E680E33864AB113392C7E83F910BE5196@GSX300A.mxchg.m.corp>
	<4E1C7F36.1080501@windriver.com>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
X-OriginalArrivalTime: 13 Jul 2011 07:58:06.0210 (UTC)
	FILETIME=[993EC620:01CC4132]
Subject: Re: [Draft design][RFC] Running postinst at rootfs	generation time
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jul 2011 08:02:06 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>> The problem with the alphabetic order of the postinst scripts we
managed by renaming some of the packages to fit the needed order. An
ugly solution, but in case of missing python skills, the easiest.

>Ya, this one bothers me slightly... and I'm not really sure how to
solve it...

>--Mark

The packages are installed by opkg in their dependency order and are
echoed into the log file, as I know the common package managers (rpm,
dpkg, ...) provide an output of the dependency order of packages or have
a verbose installing output. It may possible to recycle this output as a
control list for the postinst loop instead of using the directory
listing (using tee to get an intermediate listing).

Regards
Wolfgang Hauser


