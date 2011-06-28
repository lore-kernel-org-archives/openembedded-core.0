Received: from mail2.eads.net ([80.156.45.114] helo=mail.eads.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1Qbbsd-00048I-Dy for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 19:15:19 +0200
Received: from gsx3072-vs5.mxchg.m.corp ([53.147.176.149])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id p5SGwABB002058
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 18:58:11 +0200
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3072-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Tue, 28 Jun 2011 18:58:04 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Tue, 28 Jun 2011 18:58:05 +0200
Message-ID: <0C757E680E33864AB113392C7E83F910BE518E@GSX300A.mxchg.m.corp>
In-Reply-To: <4E09E8B7.1070901@windriver.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [OE-core] [Draft design][RFC] Running postinst at rootfs
	generation time
Thread-Index: Acw1odrxQHzg0B5iS2KnXHcujJUxywAEb9Ug
References: <1865303E0DED764181A9D882DEF65FB6A167F0C70B@shsmsx502.ccr.corp.intel.com>	<4E095480.3070001@windriver.com><1309266943.20015.290.camel@rex>
	<4E09E8B7.1070901@windriver.com>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
X-OriginalArrivalTime: 28 Jun 2011 16:58:05.0135 (UTC)
	FILETIME=[8C5025F0:01CC35B4]
Subject: Re: [Draft design][RFC] Running postinst at rootfs generation time
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
X-List-Received-Date: Tue, 28 Jun 2011 17:15:19 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Beside the discussed changes, the postinst scripts should be executed in
the dependency order.
At the time, the scripts are executed in alphabetic order, which breaks
the image generation if depended packages are not in alphabetic order.

e.g. busybox and busybox subpackages (busybox-mdev).

Regards
Wolfgang Hauser=20


