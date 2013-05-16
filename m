Received: from mx1.sonologic.nl ([82.94.245.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gmc@sonologic.nl>) id 1Ud0k6-0008NG-Lv
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 18:09:31 +0200
Received: from monk.sonologic.nl ([188.91.163.66]) (authenticated bits=0)
	by mx1.sonologic.nl (8.14.5/8.14.5) with ESMTP id r4GFPL8u094467;
	Thu, 16 May 2013 15:25:22 GMT (envelope-from gmc@sonologic.nl)
Date: Thu, 16 May 2013 17:25:21 +0200
From: Koen Martens <gmc@sonologic.nl>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130516152515.GB25740@monk.dh.sono>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Helo-Milter-Authen: gmc@mx1.sonologic.nl, gmc@sonologic.nl, mx1
Received-SPF: pass (mx1.sonologic.nl: 188.91.163.66 is authenticated by a
	trusted mechanism)
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.2.6
	(mx1.sonologic.nl [82.94.245.21]);
	Thu, 16 May 2013 15:25:23 +0000 (UTC)
Cc: dvhart@linux.intel.com
Subject: adding kernel headers to sysroot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2013 16:09:39 -0000
Content-Type: text/plain; charset=us-ascii; x-action=pgp-signed

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi all,

I was asking this question on the irc channel earlier today, and bluelightning
suggested I pose this question to this mailing list (with certain key people
in cc).

I have added a kernel header file to the linux kernel for my project, that
exposes a public API for new kernel functionality I have implemented. This
header file is needed to compile certain user-space programs. I have been
trying to get this include file in the sysroot used to compile the user-
space programs (as well as in the SDK i build for the project).

However, I haven't managed to find out how to accomplish this. I tried
creating a custom tarball from my own branch of the linux kernel, and use
that in libc-kernel-headers, but alas that was not the trick.

Can anyone point me in the right direction of how to accomplish this??

Thanks in advance,

Koen Martens

- -- 
https://ohm2013.org/            - outdoor hacker conference, August 2013, NL
http://www.sonologic.nl/        - hosting and DBA
http://koenmartens.nl/          - curriculum vitae
https://www.revspace.nl/        - hackerspace in Den Haag, NL
http://signal.hackerspaces.org/ - hackerspace radio
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlGU+lsACgkQktDgRrkFPpYH7QCfZROAcMkUVN+BiesoUtxBBzbt
5OQAoJBjIWbjmNf+wVvASyGwpcYeI6UH
=HHSa
-----END PGP SIGNATURE-----


