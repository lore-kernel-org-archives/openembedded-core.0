Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QzEOP-0003HC-6O
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Sep 2011 23:01:45 +0200
Received: (qmail invoked by alias); 01 Sep 2011 20:56:45 -0000
Received: from p4FDF1E49.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.30.73]
	by mail.gmx.net (mp002) with SMTP; 01 Sep 2011 22:56:45 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18W+AYokHwW+LvBt2zvXhODHilyl/lIt8LzA41CKs
	XxraBDNQeCiMon
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 1 Sep 2011 23:00:08 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-95.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <201109012227.49280.schnitzeltony@gmx.de>
In-Reply-To: <201109012227.49280.schnitzeltony@gmx.de>
MIME-Version: 1.0
Message-Id: <201109012300.08901.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: dropbear build build fails
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
X-List-Received-Date: Thu, 01 Sep 2011 21:01:45 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Thursday, September 01, 2011 10:27:49 PM Andreas M=FCller wrote:
> Hi
>=20
> build after fresh git pull & fresh tmpdir fails for dropbear:
>=20
> NOTE: package dropbear-0.52-r3: task do_fetch: Started
> ERROR: Function 'Fetcher failure for URL: 'file://dropbear-configuration-
> file.patch'. Unable to fetch URL file://dropbear-configuration-file.patch
> from any source.' failed
> ERROR: Logfile of failure stored in: /home/Superandy/tmp/oe-core-
> eglibc/work/armv7a-angstrom-linux-gnueabi/dropbear-0.52-
> r3/temp/log.do_fetch.12169
>=20
> Log data follows:
> | DEBUG: Trying PREMIRRORS
> | DEBUG: Trying Upstream
> | ERROR: Function 'Fetcher failure for URL: 'file://dropbear-configuratio=
n-
>=20
> file.patch'. Unable to fetch URL file://dropbear-configuration-file.patch
> from any source.' failed
> NOTE: package dropbear-0.52-r3: task do_fetch: Failed
>=20
> There was a change yesterday
>=20
> commit 48dcb8fc7b669b27160dde33079f40551853702b
> Author: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> Date:   Wed Aug 31 10:48:11 2011 +0800
>=20
>     dropbear: Change the path to find configuration file and add a
> configuration file for dropbear
> ...
>=20
> In folder dropbear-0.52 is a file configure.patch. Is that a typo or is it
> me?
>=20
It looks that file://dropbear-configuration-file.patch is simply missing. H=
ow about=20
an INC_PR to save from further quiet breaks?

Andreas


