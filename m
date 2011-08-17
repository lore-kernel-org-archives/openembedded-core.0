Received: from mail2.eads.net ([80.156.45.114] helo=mail.eads.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wolfgang.Hauser.external@cassidian.com>)
	id 1Qtcpn-0004L1-E0 for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 11:54:51 +0200
Received: from gsx3072-vs5.mxchg.m.corp ([53.147.176.149])
	by mail.eads.net (8.13.8/8.13.8/Debian-2) with ESMTP id p7H9oIkw005386
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2011 11:50:19 +0200
Received: from gsx300a.mxchg.m.corp ([10.43.212.131]) by
	gsx3072-vs5.mxchg.m.corp with Microsoft SMTPSVC(6.0.3790.4675); 
	Wed, 17 Aug 2011 11:50:14 +0200
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 17 Aug 2011 11:50:14 +0200
Message-ID: <0C757E680E33864AB113392C7E83F910BE51D9@GSX300A.mxchg.m.corp>
In-Reply-To: <F5106DA0-C6FF-46B2-8940-C47C6073F0E3@dominion.thruhere.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [OE-core] Problems with generating and installing localepackages
	of eglibc/glibc
Thread-Index: AcxcwebdScE9kTk7ScOcDK/+lMkFuwAAC1Ug
References: <0C757E680E33864AB113392C7E83F910BE51D8@GSX300A.mxchg.m.corp>
	<F5106DA0-C6FF-46B2-8940-C47C6073F0E3@dominion.thruhere.net>
From: "Hauser, Wolfgang (external)" <Wolfgang.Hauser.external@cassidian.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
X-OriginalArrivalTime: 17 Aug 2011 09:50:14.0258 (UTC)
	FILETIME=[0FEEAD20:01CC5CC3]
Subject: Re: Problems with generating and installing localepackages of eglibc/glibc
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
X-List-Received-Date: Wed, 17 Aug 2011 09:54:51 -0000
Content-class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>> Our questions now:
>>=20
>> What was the intention of the changes in the function
>> "output_locale_binary_rdepends"?
>> Is there a problem using the old function for our local installation
?
>> What language definition patterns (in GLIBC_GENERATE_LOCALES) should
be
>> covered by the new function ?
>> Is this a bug ?

>That looks like the same bug as described in
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-August/00740
7.html

>Nitin said he'd look into it after getting back from vacation:

This is right, this is the solution I would suggest too, I changed it in
my environment and it works for me.=20

But there is the questionable rprovides handling in
"output_locale_binary_rdepends" of libc-packages.bbclass in oe-core and
oe.dev
which have to be examined too.

Thanks for pointing me to that solution.

Regards
Wolfgang Hauser=20


