Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1RMGej-0007fj-E0
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 11:05:49 +0100
Received: from WX-ExchMB.insigma.com.cn (10.0.1.203) by WX-Edge.insigma.com.cn
	(10.0.1.205) with Microsoft SMTP Server (TLS) id 8.1.436.0;
	Fri, 4 Nov 2011 17:59:22 +0800
Received: from [192.168.0.98] (122.224.76.38) by WX-ExchMB.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.240.5; Fri, 4 Nov 2011
	17:59:21 +0800
Message-ID: <1320400712.1504.29.camel@localhost.localdomain>
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 4 Nov 2011 17:58:32 +0800
In-Reply-To: <1320375012.1504.22.camel@localhost.localdomain>
References: <1320375012.1504.22.camel@localhost.localdomain>
Organization: Insigma
X-Mailer: Evolution 3.2.1 
MIME-Version: 1.0
Subject: Re: about the qemu net interface name
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: niqingliang@insigma.com.cn,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Fri, 04 Nov 2011 10:05:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have checked the version of ifconfig, it blongs to package
"net-tools".

only the latest version 1.60.20110819cvs-1 have the ":" after Interface
name. In this version, the output format of ifconfig has changed.

On Fri, 2011-11-04 at 10:50 +0800, =E5=80=AA=E5=BA=86=E4=BA=AE wrote:
> file: scripts/runqemu-internal
> line153: POSSIBLE=3D`$IFCONFIG -a|grep '^tap' | awk `{print $1}'`
>=20
> on archlinux, I got that:
> tap0:
> tap1:
>=20
> maybe it should be:
> tap0
> tap1
>=20
> Is it right?
>=20
> so I change it to
> POSSIBLE=3D`$IFCONFIG -a|grep '^tap' | awk `{print $1}' | sed 's/:$//'`
>=20
> --
> Yi Qingliang
> niqingliang@insigma.com.cn
> https://niqingliang2003.wordpress.com
>=20

--=20
Yi Qingliang
niqingliang@insigma.com.cn
https://niqingliang2003.wordpress.com



