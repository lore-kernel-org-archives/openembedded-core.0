Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RVKBu-0004os-Ew for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 10:41:31 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAT9YqT1011265
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 09:34:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10747-06 for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 09:34:48 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAT9YgCv011257
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 09:34:43 GMT
Message-ID: <1322559291.2140.2.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 29 Nov 2011 09:34:51 +0000
In-Reply-To: <4ED4A49D.7040806@eukrea.com>
References: <4ED4A49D.7040806@eukrea.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	pAT9YqT1011265
Subject: Re: base-passwd problem : No such file or directory
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
X-List-Received-Date: Tue, 29 Nov 2011 09:41:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-11-29 at 10:23 +0100, Eric B=C3=A9nard wrote:
> Hi,
>=20
> while building an image (.bb attached), I new get the following problem=
=20
> (reproduced on 3 different hosts) :
>=20
> ERROR: Error executing a python function in=20
> /home/ebenard/WORK/PROJECT/setup-scripts/sources/openembedded-core/meta=
/recipes-core/base-passwd/base-passwd_3.5.22.bb:
> IOError: [Errno 2] No such file or directory:=20
> '/home/ebenard/WORK/PROJECT/setup-scripts/build/tmp-angstrom_2010_x-egl=
ibc/sysroots/PROJECT-board/usr/share/base-passwd/passwd.master'
>=20
> Log is attached.

A way to reproduce this easily is:

bitbake base-passwd -c clean
bitbake base-passwd -c package

since it looks like a race between the populate_sysroot and package
tasks of this specific recipe...

Cheers,

Richard



