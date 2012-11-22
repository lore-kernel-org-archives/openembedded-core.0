Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <bjst@sestofb10.enea.se>) id 1TbVl4-0003T1-Ev
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 13:19:54 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1;
	Thu, 22 Nov 2012 13:04:42 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id C77FF291437;
	Thu, 22 Nov 2012 13:04:42 +0100 (CET)
Date: Thu, 22 Nov 2012 13:04:42 +0100
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20121122120442.GB11155@sestofb10.enea.se>
References: <1353511391-60570-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
In-Reply-To: <1353511391-60570-1-git-send-email-bjst@enea.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: Re: [PATCH 0/4] RFC: ptest for danny
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
X-List-Received-Date: Thu, 22 Nov 2012 12:19:55 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I have a few specific issues I would like help and/or feedback on:

- The -ptest .ipk packages get installed with "Status: install user unpacke=
d" rather than "install user installed", causing them to be processed by po=
stinst. What do I have to do to take them from "unpacked" to "installed"?

- I have to add a lot of paths to the FILES-dbg to avoid QA warnings. It fe=
els a bit kludgy, is there a cleaner way to handle this?

- What should we do with packages that don't have an upstream test suite? M=
y first thought was to just ignore them, but one could also argue that a "S=
KIP: no package test" message would be more informative than no message at =
all, since it separate the package from yet-to-be-processed ones. Opinions?

- We have modified our buildbot to parse and collect the ptest output. Wher=
e would be a suitable place to discuss these modifications?

--=20
Bj=F6rn


