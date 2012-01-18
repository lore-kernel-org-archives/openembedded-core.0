Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RnWVp-0004DV-2c
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 15:29:17 +0100
Received: by werb12 with SMTP id b12so1055469wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2012 06:21:36 -0800 (PST)
Received: by 10.216.139.205 with SMTP id c55mr9233458wej.31.1326896495982;
	Wed, 18 Jan 2012 06:21:35 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id bj10sm22708897wib.9.2012.01.18.06.21.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jan 2012 06:21:35 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120118134322.GB5443@deadlock.dhs.org>
Date: Wed, 18 Jan 2012 15:21:28 +0100
Message-Id: <F2C23BA4-EF14-44A5-A4B3-B50848CD0844@dominion.thruhere.net>
References: <4F16C61C.4020304@ts.fujitsu.com>
	<20120118134322.GB5443@deadlock.dhs.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: How do I get rid of systemd
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
X-List-Received-Date: Wed, 18 Jan 2012 14:29:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 18 jan. 2012, om 14:43 heeft Sergey 'Jin' Bostandzhyan het volgende =
geschreven:

> Hi Rainer,
>=20
> On Wed, Jan 18, 2012 at 02:16:12PM +0100, Rainer Koenig wrote:
>> built my first basic customized console image (based on angstrom's
>> console-image.bb) and managed to get SystemV init pulled in by =
deleting
>> the systemd entry for the init manager.
>>=20
>> But systemd is still pulled in via connman, dhcp, rsyslog and ntp. =
How
>> can I get totally rid of systemd so that I don't need a kernel with =
CGROUPS?
>=20
> I also did not want systemd in my image, I had to create a layer and =
patch
> out systemd from each package that was pulling it in, one by one.
>=20
> Surely not the nicest solution, but I did not find any other ways to =
solve this.

It's really easy, create your own image, no patching needed. The systemd =
dependencies are all in ${PN}-systemd, so just don't include those in =
your image. I you do include ${PN}-systemd in your image you shouldn't =
be surprised that systemd ends up in it.=


