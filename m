Received: from stoexhub03.domain01.net ([83.145.59.144])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1RiAkK-0003OO-6Z
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 21:14:08 +0100
Received: from STOEXMBXC01.domain01.net
	([fe80:0000:0000:0000:8caa:b43d:115.41.221.224]) by
	stoexhub03.domain01.net
	([10.12.10.3]) with mapi; Tue, 3 Jan 2012 21:06:43 +0100
From: Anders Darander <anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 3 Jan 2012 21:06:47 +0100
Thread-Topic: [OE-core] [PATCH] busybox: rename syslog.conf to
	syslog-startup.conf
Thread-Index: AczKUzaWLsqORqfRQsqfCPK2Gs+i3w==
Message-ID: <94352630-4FE3-472F-BFC8-2959AB572AC8@chargestorm.se>
References: <1325541032-29837-1-git-send-email-josh@linux.intel.com>
In-Reply-To: <1325541032-29837-1-git-send-email-josh@linux.intel.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, sv-SE
MIME-Version: 1.0
Subject: Re: [PATCH] busybox: rename syslog.conf to syslog-startup.conf
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
X-List-Received-Date: Tue, 03 Jan 2012 20:14:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



On 2 jan 2012, at 22:51, "Joshua Lock" <josh@linux.intel.com> wrote:

> Busybox 1.19 introduced basic support for an rsyslog inspired syslog.conf
> whereas we've been shipping syslog.conf as a file to be sourced by the
> syslog init script in order to configure which options busybox's syslog i=
s
> started with.
>=20
> Busybox 1.19 in syslog mode chokes on our syslog.conf and doesn't start.
>=20
> This patch renames the syslog.conf we ship to syslog-startup.conf in orde=
r
> to prevent busybox trying to parse the file as an rsyslog style syslog.co=
nf
>=20
> Fixes [YOCTO #1848]
>=20
> Signed-off-by: Joshua Lock <josh@linux.intel.com>

Acked-by: Anders Darander <anders@chargestorm.se>

My not comment is that it would have been nice to have had the patch genera=
ted with rename detection enabled in git.

Cheers,
Anders

> ---
> meta/recipes-core/busybox/busybox.inc              |   10 +++++-----
> meta/recipes-core/busybox/busybox_1.19.3.bb        |    4 ++--
> meta/recipes-core/busybox/files/syslog             |    4 ++--
> .../recipes-core/busybox/files/syslog-startup.conf |   12 ++++++++++++
> meta/recipes-core/busybox/files/syslog.conf        |    9 ---------
> 5 files changed, 21 insertions(+), 18 deletions(-)
> create mode 100644 meta/recipes-core/busybox/files/syslog-startup.conf
> delete mode 100644 meta/recipes-core/busybox/files/syslog.conf
>=20


