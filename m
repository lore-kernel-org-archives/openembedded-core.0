Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QosZ1-0005py-FT
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 09:41:55 +0200
Received: by wyg30 with SMTP id 30so1221699wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2011 00:37:32 -0700 (PDT)
Received: by 10.227.7.18 with SMTP id b18mr395651wbb.63.1312443452085;
	Thu, 04 Aug 2011 00:37:32 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id eo18sm1262796wbb.46.2011.08.04.00.37.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Aug 2011 00:37:30 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAD=GYpae2g43NMJnpD96cv9dpxoyJgB_CEoaUVEFpMsFKB24Kw@mail.gmail.com>
Date: Thu, 4 Aug 2011 09:37:28 +0200
Message-Id: <B80761F6-F016-4AF5-9BF4-21E64368DCBB@dominion.thruhere.net>
References: <CAD=GYpae2g43NMJnpD96cv9dpxoyJgB_CEoaUVEFpMsFKB24Kw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: "Kridner, Jason" <jdk@ti.com>,
	Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>, "Kooi, Koen" <k-kooi@ti.com>
Subject: Re: ti-codec-engine build error
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
X-List-Received-Date: Thu, 04 Aug 2011 07:41:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 aug. 2011, om 08:07 heeft Joel A Fernandes het volgende geschreven:

> I have been working on migrating the codec-engine recipe from OE
> classic to OE-core,
>=20
> As of now, do_compile stage fails as it expects "bin/ar" in the
> toolchain path. What would be a correct fix for this?
>=20
> My meta-texasinstruments git tree is at:
> https://github.com/joelagnel/meta-texasinstruments
>=20
> Here is a build log:
>=20
> [..]
>=20
> # clv5T viddec1_copy.c ...
> =
/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc=
/sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi/arm-angstrom-li=
nux-gnueabi-gcc
> -c -MD -MF package/lib/lib/release/viddec1_copy/viddec1_copy.ov5T.dep

So here it's picking up TOOLCHAIN_PATH correctly thru CGTOOLS_V5T

> make[1]: =
/home/joel/angstrom-oe/setup-scripts-core/build/tmp-angstrom_2010_x-eglibc=
/sysroots/i686-linux/usr/bin/armv7a-angstrom-linux-gnueabi/arm-angstrom-li=
nux-gnueabi/bin/ar:

But it seems to want to call ar differently. In other recipes we add the =
following to make:

AR=3D"${TOOLCHAIN_PATH}/${TARGET_PREFIX}ar" \
ARCHIVER=3D"${TOOLCHAIN_PATH}/${TARGET_PREFIX}ar" \

And a minor nit: please copy over only 1 version when moving things to =
meta-ti, the latest version is usually fine.

regards,

Koen=


