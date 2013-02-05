Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1U2jRo-00073o-Jk
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 15:24:39 +0100
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 1C7384B0134
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2013 15:08:40 +0100 (CET)
Date: Tue, 5 Feb 2013 15:08:39 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130205150839.3bbb6695@e6520eb>
In-Reply-To: <1360073052-15273-1-git-send-email-eric@eukrea.com>
References: <1360073052-15273-1-git-send-email-eric@eukrea.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: [PATCH] qt4: fix CVE-2013-0254
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
X-List-Received-Date: Tue, 05 Feb 2013 14:24:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

Le Tue,  5 Feb 2013 15:04:12 +0100,
Eric B=C3=A9nard <eric@eukrea.com> a =C3=A9crit :

> fix "POSIX shared memory segments created world-writeable"
>=20
> more details :
> http://lists.qt-project.org/pipermail/announce/2013-February/000023.html
>=20
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>

more details :
- compile tested on qt4-x11-free for an armv7 target
- I had to remove a part of the patch which correspond to a test
program which seems to not be distributed in the qt release (and is only
in the git tree).

Eric


