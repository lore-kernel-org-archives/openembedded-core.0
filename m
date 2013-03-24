Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UJmh0-0001Zr-84
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Mar 2013 16:18:44 +0100
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 5D55D4B020E;
	Sun, 24 Mar 2013 16:01:40 +0100 (CET)
Date: Sun, 24 Mar 2013 16:01:39 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20130324160139.12fbb4d7@e6520eb>
In-Reply-To: <1364070660-13157-2-git-send-email-otavio@ossystems.com.br>
References: <1364070660-13157-1-git-send-email-otavio@ossystems.com.br>
	<1364070660-13157-2-git-send-email-otavio@ossystems.com.br>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] linux-firmware: Do not deploy license files in packages
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
X-List-Received-Date: Sun, 24 Mar 2013 15:18:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Otavio,

Le Sat, 23 Mar 2013 17:30:58 -0300,
Otavio Salvador <otavio@ossystems.com.br> a =C3=A9crit :
> We don't ship license files with packages and firmware packages are no
> different; drop them.
>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

there may be a good reason to distribute the license files together with
the firmware's binairies : it's often requested by the firmware's
license.

For example in bcm43xx
2.	Restrictions. Licensee shall distribute Software with a copy
of this Agreement.=20

Best regards,
Eric


