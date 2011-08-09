Received: from stoexhub01.domain01.net ([83.145.59.142])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QqftQ-0006k1-TK
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 08:34:25 +0200
Received: from localhost (193.235.91.228) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.137.0; Tue, 9 Aug 2011
	08:29:55 +0200
Date: Tue, 9 Aug 2011 08:30:03 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20110809063003.GB30949@chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <20110808113650.GA20162@chargestorm.se>
	<4E40078C.2060904@windriver.com>
MIME-Version: 1.0
In-Reply-To: <4E40078C.2060904@windriver.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Unrecognized option while building pseudo (target)
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
X-List-Received-Date: Tue, 09 Aug 2011 06:34:25 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Mark Hatle <mark.hatle@windriver.com> [110808 17:58]:
> pseudo currently only works on IA32 hosts.  It was never really intended =
to work
> on the target system, but should.

Thanks for the clarification. No, I don't really want it... But now I
know what to start looking for, i.e. what is trying to put pseudo on the
target.=20

Thanks!

Cheers,
Anders

> If you think you want pseudo on the target.. you'll have to verify that a=
ll of
> the calls are being trapped properly on ARM, as well as modify the build
> instructions to not worry about IA32 specific items.

> (Right now, if you change the compilation to not specify the -m32 on arm,=
 I'd
> give pseudo about a 75% chance of working properly on ARM.. but it's neve=
r been
> tested there.)


--=20
Anders Darander
ChargeStorm AB		Tel: +46 702 44 84 36
Laxholmstorget 3	Email: anders@chargestorm.se
602 21 Norrk=F6ping	Web: www.chargestorm.se


