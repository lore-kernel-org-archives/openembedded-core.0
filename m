Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RSxLa-0007nb-PN
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 21:53:42 +0100
Received: from STOEXMBXC01.domain01.net
	([fe80:0000:0000:0000:8caa:b43d:115.41.221.224]) by
	stoexhubfe02.domain01.net
	([10.12.10.7]) with mapi; Tue, 22 Nov 2011 21:47:11 +0100
From: Anders Darander <anders@chargestorm.se>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 22 Nov 2011 21:47:11 +0100
Thread-Topic: [OE-core] [PATCH v2 0/1] busybox: update to 1.19.3
Thread-Index: AcypV+gqWYH8522qSVCMopj4upMdvQ==
Message-ID: <20F3F438-0053-4FF4-9C98-05F3B8232BE9@chargestorm.se>
References: <cover.1321972428.git.anders@chargestorm.se>
	<4ECC07D8.2070104@linux.intel.com>
In-Reply-To: <4ECC07D8.2070104@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/1] busybox: update to 1.19.3
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
X-List-Received-Date: Tue, 22 Nov 2011 20:53:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 22 nov 2011, at 21:36, "Saul Wold" <sgw@linux.intel.com> wrote:
> On 11/22/2011 06:34 AM, Anders Darander wrote:
>> This updates busybox to the latest stable, 1.19.3.
>>=20
>> Among other things, there should be rudimentary support in syslogd for
>> systemd, by enabling CONFIG_FEATURE_SYSTEMD.
>>=20
> How much size does this add to busybox by having it enabled by default?
> Is it possible to conditional add a config fragment if systemd is=20
> enabled ad the DISTRO/IMAGE_FEATURE level?

I'd love that. Any suggestions for a distro/image feature? As far as I know=
, we don't have any for init system selection.

I let the rather small systemd feature be enabled as we already package sys=
temd unit files for a number of packages, and we also add --with-systemddir=
 during configure or a number of packages. If we add a distro/image feature=
, we should(?) conditionally ship SysV init files also, or package them sep=
arately. (Although that is for another discussion...)

> More info is required.
>=20
>> It has been tested and verified on qemux86 and on our local arm-based sy=
stem.
>>=20
>> However, the patch busybox-udhcpc-no_deconfig.patch has been modified to
>> apply, but hasn't really been tested. As we're currently mostly running =
static
>> configurations, we've only verified that udhcpc works to the extent that=
 we
>> get the network up and running, not how it behaves during dhcp renewal.
>> Thus I'm starting this as an RFC.
>>=20
>> Changes:
>> v2: * Checked the new defconfig (removed settings implying CFLAGS and
>>     ARCH). The new defconfig should be as close as possible to the old o=
ne,
>>     with the exception of some new utils/options.
> Can you clearly enumerate what new utils and options and what their size=
=20
> impact on the busybox image is.

Sure, I'll come bak with a list, primarily focusing on any new features act=
ivated (most is deactivated though), although it could take a little time. =
Too much other things to handle...

Cheers,
/Anders



