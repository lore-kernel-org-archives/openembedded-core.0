Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R3WFH-00028K-CF for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 18:54:03 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8DGswpu030683 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2011 17:54:58 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id S9iTw1JTTJLS
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2011 17:54:58 +0100 (BST)
Received: from [192.168.1.36] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8DGssKv030680
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2011 17:54:56 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Sep 2011 17:48:43 +0100
In-Reply-To: <CAJRXtp_4uxndU6zxf5CnF6Hp-QnLcHBX=4UyDP2vc2CK7e5Nfw@mail.gmail.com>
References: <CAJRXtp_4uxndU6zxf5CnF6Hp-QnLcHBX=4UyDP2vc2CK7e5Nfw@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1315932531.13526.6.camel@ted>
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	p8DGswpu030683
Subject: Re: Missing http://www.yoctoproject.org/downloads/pseudo/pseudo-1.1.1.tar.bz2
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
X-List-Received-Date: Tue, 13 Sep 2011 16:54:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-09-13 at 13:43 +0200, Anders T=C3=B6rnqvist wrote:
> Just cloned a git version of oe core and tried to build with
>=20
> git clone git://git.openembedded.org/openembedded-core oe-core
> cd oe-core
> git clone git://git.openembedded.org/bitbake bitbake
> . ./oe-init-build-env
> bitbake core-image-minimal
>=20
> The build soon results in a missing
> http://www.yoctoproject.org/downloads/pseudo/pseudo-1.1.1.tar.bz2 :
>=20
> ERROR: Function 'Fetcher failure for URL:
> 'http://www.yoctoproject.org/downloads/pseudo/pseudo-1.1.1.tar.bz2'.
> Unable to fetch URL
> http://www.yoctoproject.org/downloads/pseudo/pseudo-1.1.1.tar.bz2 from
> any source.' failed
> NOTE: package pseudo-native-1.1.1-r2: task do_fetch: Failed

We've been having a few server/infrastructure issues but this is back
and working now.

Cheers,

Richard



