Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QIJms-0007k1-GP
	for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 14:05:38 +0200
Received: by wye20 with SMTP id 20so2635319wye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 May 2011 05:02:57 -0700 (PDT)
Received: by 10.227.196.209 with SMTP id eh17mr3836583wbb.5.1304683376650;
	Fri, 06 May 2011 05:02:56 -0700 (PDT)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	ca12sm1956301wbb.2.2011.05.06.05.02.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 May 2011 05:02:55 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1304681508.30391.84.camel@rex>
Date: Fri, 6 May 2011 14:02:52 +0200
Message-Id: <F447FD4D-6E02-43DB-BB49-CF53AE3EB76B@dominion.thruhere.net>
References: <cover.1302936483.git.sgw@linux.intel.com>
	<eee3fb921c3e9c6439df2540a552719c9327ebd4.1302936483.git.sgw@linux.intel.com>
	<1303102414.5518.30.camel@rex>
	<1865303E0DED764181A9D882DEF65FB6900D7D5708@shsmsx502.ccr.corp.intel.com>
	<1303109647.5518.54.camel@rex>
	<1865303E0DED764181A9D882DEF65FB69334F4BD75@shsmsx502.ccr.corp.intel.com>
	<1304634851.30391.54.camel@rex>
	<1865303E0DED764181A9D882DEF65FB69334F4BD82@shsmsx502.ccr.corp.intel.com>
	<1304681508.30391.84.camel@rex>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 37/58] gnu-config-native: add dependency on perl-native
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
X-List-Received-Date: Fri, 06 May 2011 12:05:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 mei 2011, om 13:31 heeft Richard Purdie het volgende geschreven:

> On Fri, 2011-05-06 at 16:52 +0800, Cui, Dexuan wrote:
>> Richard Purdie wrote:
>>>> 3) In gnu-config_20080123.bb's do_install, I don't understand this
>>>>    lines: here the "!=3D" should be "=3D"? if [ "${BUILD_ARCH}" !=3D
>>>>        "${TARGET_ARCH}" ]; then sed -i -e
>>>>    's,/usr/bin/env,${bindir}/env,g' ${D}${bindir}/gnu-configize fi
>>>=20
>>> This means it only applies for non-native packages. (native has
>>> BUILD_ARCH=3DTARGET_ARCH). The path to env is ${bindir} and this =
assists
>>> with things like the nativesdk packages where bindir !=3D =
"/usr/bin".
>> Thanks for the explanation!
>> My understanding about "non-native package" is target recipe (in this =
case bindir=3D/usr/bin)
>> and -nativesdk recipe.
>> gnu-config_20080123.bb doesn't have -nativesdk version(BBCLASSEXTEND =
doesn't
>> contain nativesdk), so looks the sed replacement is useless at =
present?
>=20
> Not useless but not heavily used directly in Poky at this time.
> DISTRO=3Dminimal in OE for example sets exec_prefix=3D"" so bindir
> becomes /bin.

Nitpick: that's DISTRO=3Dmicro=


