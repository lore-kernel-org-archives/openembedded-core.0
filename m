Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QgtTw-00039b-2M
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 09:03:40 +0200
Received: by wyg30 with SMTP id 30so357862wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2011 23:59:42 -0700 (PDT)
Received: by 10.216.211.13 with SMTP id v13mr608882weo.98.1310540381791;
	Tue, 12 Jul 2011 23:59:41 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id n17sm6530187wed.16.2011.07.12.23.59.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jul 2011 23:59:40 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <B49A8790-9DF0-4DAA-A95A-EC2E9F854CCB@gmail.com>
Date: Wed, 13 Jul 2011 08:59:38 +0200
Message-Id: <C30E8605-35B6-48C5-B6DA-D4F7D1C64759@dominion.thruhere.net>
References: <af851424130d145cef560c4bfaf2ba88ea4c3da6.1310497097.git.nitin.a.kamble@intel.com>
	<bd724f86b719044e4e7958999893f8fbf3801f76.1310497097.git.nitin.a.kamble@intel.com>
	<B49A8790-9DF0-4DAA-A95A-EC2E9F854CCB@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 2/5] udev-172: add a newer version for newer kernel
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
X-List-Received-Date: Wed, 13 Jul 2011 07:03:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 jul 2011, om 08:22 heeft Khem Raj het volgende geschreven:

>=20
>=20
> On Jul 12, 2011, at 12:02 PM, nitin.a.kamble@intel.com wrote:
>=20
>> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>>=20
>> the 2.6.38 kernel has dropped v4lv1 support. and udev-168 fails to
>> compile because of that. So add a newer 172 version of udev to work =
with
>> 2.6.38 kernel.
>>=20
>> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
>> ---
>> meta/recipes-core/udev/udev-172/init              |   59 +++++++++
>> meta/recipes-core/udev/udev-172/local.rules       |   35 ++++++
>> meta/recipes-core/udev/udev-172/permissions.rules |  131 =
+++++++++++++++++++++
>> meta/recipes-core/udev/udev-172/run.rules         |   14 +++
>> meta/recipes-core/udev/udev-172/udev.rules        |  116 =
++++++++++++++++++
>> meta/recipes-core/udev/udev_172.bb                |    6 +
>> 6 files changed, 361 insertions(+), 0 deletions(-)
>> create mode 100644 meta/recipes-core/udev/udev-172/init
>> create mode 100644 meta/recipes-core/udev/udev-172/local.rules
>> create mode 100644 meta/recipes-core/udev/udev-172/permissions.rules
>> create mode 100644 meta/recipes-core/udev/udev-172/run.rules
>> create mode 100644 meta/recipes-core/udev/udev-172/udev.rules
>> create mode 100644 meta/recipes-core/udev/udev_172.bb
>=20
> Meta-oe ha 171 it would be nice if you could look inti it and =
incorporate any differences into 172
> Then we can retire 171 from meta-oe

Meta-oe has had 172 since yesterday :) The main difference between the =
oe-core and meta-oe version is that the meta-oe version has removed a =
lot of udev rules that weren't needed and made booting slow. Where udev =
trigger used to take >8 seconds I can now boot X in less than a second =
on a cortex A9.

regards,

Koen=


