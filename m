Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RPgcR-00071u-8h
	for openembedded-core@lists.openembedded.org;
	Sun, 13 Nov 2011 21:25:35 +0100
Received: from STOEXMBXC01.domain01.net
	([fe80:0000:0000:0000:8caa:b43d:115.41.221.224]) by
	stoexhubfe01.domain01.net
	([10.12.10.6]) with mapi; Sun, 13 Nov 2011 21:19:13 +0100
From: Anders Darander <anders@chargestorm.se>
To: Saul Wold <sgw@linux.intel.com>
Date: Sun, 13 Nov 2011 21:18:55 +0100
Thread-Topic: [OE-core] [RFC PATCH 1/1] busybox: update to 1.19.3
Thread-Index: AcyiQYIePrY7nihtQZuSe7/HunWr8A==
Message-ID: <8212CE07-CF99-4817-AF2B-7FF2E42CF809@chargestorm.se>
References: <cover.1320998007.git.anders@chargestorm.se>
	<cc21f9c195a7c79de19f0f59e41735cbbaa7f434.1320998007.git.anders@chargestorm.se>
	<4EBD5D2C.8060600@linux.intel.com>
In-Reply-To: <4EBD5D2C.8060600@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/1] busybox: update to 1.19.3
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
X-List-Received-Date: Sun, 13 Nov 2011 20:25:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


On 11 nov 2011, at 18:36, "Saul Wold" <sgw@linux.intel.com> wrote:

> On 11/11/2011 12:17 AM, Anders Darander wrote:
>> The updates to patch busybox-udhcpc-no_deconfig.patch is not fully verif=
ied.
>>=20
>> Signed-off-by: Anders Darander<anders@chargestorm.se>
>> ---
>>  .../B921600.patch                                  |    0
>>  .../busybox-appletlib-dependency.patch             |    0
>>  .../busybox-udhcpc-no_deconfig.patch               |   66 +++--
>>  .../{busybox-1.18.5 =3D>  busybox-1.19.3}/defconfig   |  271 ++++++++++=
+++-------
> What kind of changes did you make to the defconfig?


> Are thy just reflective of the updated version or did you make addition
> modifications to enable/disable various configurations?

There might be some new feature that's been enabled. I haven't actively ena=
bled/disabled any features; new features (not defined in the old defconfig)=
 have their default values.

So, yes, the changes are only reflecting the updated busybox version.

> I did notice this in particular which may be different in different confi=
gs:
>=20
> -CONFIG_CROSS_COMPILER_PREFIX=3D""
> -CONFIG_EXTRA_CFLAGS=3D""
> +CONFIG_CROSS_COMPILER_PREFIX=3D"i586-oe-linux-"
> +CONFIG_EXTRA_CFLAGS=3D" -O2 -pipe -g -feliminate-unused-debug-types"
>=20
> This might be different for a poky or other distro based build

Thanks for spotting this. The defconfig update was made just before submitt=
ing the RFC. Most of the testings has been performed using custom configs, =
or just running with the old defconfig.

I'll make sure to go over these before submitting the next revision.

Cheers,
Anders=


