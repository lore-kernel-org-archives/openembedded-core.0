Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QNRKo-0000vT-IH
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 17:09:50 +0200
Received: by wwb17 with SMTP id 17so3409790wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 08:06:53 -0700 (PDT)
Received: by 10.227.198.10 with SMTP id em10mr4343576wbb.108.1305904013567;
	Fri, 20 May 2011 08:06:53 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id l24sm2346968wbc.47.2011.05.20.08.06.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 May 2011 08:06:52 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1305903707.2525.29.camel@phil-desktop>
Date: Fri, 20 May 2011 17:06:46 +0200
Message-Id: <978EA082-795F-4201-9D19-B46D7AC9A5EE@dominion.thruhere.net>
References: <cover.1305839225.git.raj.khem@gmail.com>
	<836208067c345a911ddb3a266ac398b435054798.1305839225.git.raj.khem@gmail.com>
	<1305873952.18415.249.camel@lenovo.internal.reciva.com>
	<1305903707.2525.29.camel@phil-desktop>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 2/2] opkg-utils: Allow uppercase lettlers in package names
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
X-List-Received-Date: Fri, 20 May 2011 15:09:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 mei 2011, om 17:01 heeft Phil Blundell het volgende geschreven:

> On Fri, 2011-05-20 at 07:45 +0100, Phil Blundell wrote:
>> On Thu, 2011-05-19 at 14:09 -0700, Khem Raj wrote:
>>> Some packages have uppercase letters in their names e.g.
>>> efikamx kernel. We allow uppercase character with
>>> uppercase-letters.patch
>>=20
>> This is not a good idea.  Uppercase characters have never been =
permitted
>> in .deb/.ipk.=20
>>=20
>> Isn't legitimize_package_name() crunching them to lower case for you?
>> If not then I think it should be made to do that.
>=20
> I just checked the code and it certainly looks like it should be doing
> that:
>=20
> 	# Remaining package name validity fixes
> 	return s.lower().replace('_', '-').replace('@', =
'+').replace(',', '+').replace('/', '-')
>=20
> So if that isn't working for you then I think it needs a bit of
> debugging.

Does that run on PV or PN? I think Khem has weird things in PV=


