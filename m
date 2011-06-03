Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QSQFY-0003mC-HV
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Jun 2011 11:01:00 +0200
Received: by wwb17 with SMTP id 17so1221896wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jun 2011 01:57:47 -0700 (PDT)
Received: by 10.216.59.81 with SMTP id r59mr1626512wec.40.1307091467850;
	Fri, 03 Jun 2011 01:57:47 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id f60sm708580wef.37.2011.06.03.01.57.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 03 Jun 2011 01:57:46 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1307089346.27470.624.camel@rex>
Date: Fri, 3 Jun 2011 10:57:44 +0200
Message-Id: <EEAC1D96-7E8D-4496-9FA1-E41860CA131E@dominion.thruhere.net>
References: <cover.1307083232.git.kai.kang@windriver.com>
	<adfc33032da197d9e5438a42e2b5df4681cdbb35.1307083232.git.kai.kang@windriver.com>
	<1307089346.27470.624.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 1/1] eglibc: migrate configurability from oe
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
X-List-Received-Date: Fri, 03 Jun 2011 09:01:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 jun 2011, om 10:22 heeft Richard Purdie het volgende geschreven:

> On Fri, 2011-06-03 at 14:47 +0800, Kang Kai wrote:
>> From: Kang Kai <kai.kang@windriver.com>
>>=20
>> Migrate configurability from oe, try to shrink minimal image size
>>=20
>> The switch is in local.conf.sample, uncomment the line
>> DISTRO_FEATURES_EGLIBC =3D ""
>> and write what options you want to enable.
>>=20
>> If want to disable locale-code charsets or locales, you have to =
uncomment
>> PACKAGE_NO_GCONV =3D 1
>> Because without this, it fails on package_do_split_gconvs in =
libc-package.bbclass
>=20
> I have some comments:
>=20
> a) I think these should become flags in DISTRO_FEATURES with an
> "eglibc-" prefix so something like "spawn" would become "eglibc-spawn"

Taking a step back here, uclibc has the same configurability, so =
wouldn't it make sense to align both (where possible) and just have =
'libc-spawn' in DISTRO_FEATURES?

regards,

Koen=


