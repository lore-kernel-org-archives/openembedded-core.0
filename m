Received: from mail2.eads.net ([80.156.45.114] helo=mail.eads.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1RMG0h-00066H-1a; Fri, 04 Nov 2011 10:24:27 +0100
Received: from gsx3071-vs5.mxchg.m.corp ([53.147.176.148])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id pA49IGOE028331; 
	Fri, 4 Nov 2011 10:18:17 +0100
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3071-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 4 Nov 2011 10:18:14 +0100
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Fri, 4 Nov 2011 10:18:14 +0100
Message-ID: <0C757E680E33864AB113392C7E83F910BE522C@GSX300A.mxchg.m.corp>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Clean of qt4-embedded don't cleanup sysroot and deploy
Thread-Index: AcyP4ovn6EzPVhcDTmCKRTj3ZlV1+g==
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 04 Nov 2011 09:18:14.0581 (UTC)
	FILETIME=[AE597650:01CC9AD2]
Cc: openembedded-core@lists.openembedded.org
Subject: Clean of qt4-embedded don't cleanup sysroot and deploy
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
X-List-Received-Date: Fri, 04 Nov 2011 09:24:27 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I didn't get an answer, so I ask it again.

Hello,

if I do a bitbake -c clean for qt4-embedded or qt4-native all libraries
and binaries of QT are left in the sysroots and all created packages are
left in deploy. This is an result of splitting qt into several sub
packages and install them.

This behavior makes problems if I change the used QT Version of the
distro.
If qt recipe builds, it first searches for the libraries in sysroot
(standard library path of OE) and then it search in its working
directory. While the sysroots contain libraries of a different QT
version now, the build will fail.=20

Is there a way to clean all sub packages of qt if I clean the
qt4-embedded or qt4-native package ?

An other solution may be to switch the order of the library paths in the
linker command (-L) to search libraries in the package working path
first. But how to do this in a proper way?

Regards
Wolfgang Hauser


