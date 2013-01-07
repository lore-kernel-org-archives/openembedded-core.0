Received: from 19.mo4.mail-out.ovh.net ([87.98.179.66]
	helo=mo4.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TsKSE-0007b9-RM
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 22:42:06 +0100
Received: from mail423.ha.ovh.net (b6.ovh.net [213.186.33.56])
	by mo4.mail-out.ovh.net (Postfix) with SMTP id 1FADE104F61B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2013 21:58:02 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 7 Jan 2013 22:48:49 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO e6520eb)
	(eric%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 7 Jan 2013 22:48:47 +0200
Date: Mon, 7 Jan 2013 21:48:42 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Ovh-Mailout: 178.32.228.4 (mo4.mail-out.ovh.net)
Message-ID: <20130107214842.428342a9@e6520eb>
In-Reply-To: <CAP9ODKqOsQMrRDtw+uRgCb4Twr60wC+pbjB9m4_MrPrvF15eyg@mail.gmail.com>
References: <1357577024-7889-1-git-send-email-eric@eukrea.com>
	<CAP9ODKqOsQMrRDtw+uRgCb4Twr60wC+pbjB9m4_MrPrvF15eyg@mail.gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 3796253010994310524
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrfeekucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrfeekucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libnl: fix compilation on hosts without lex
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
X-List-Received-Date: Mon, 07 Jan 2013 21:42:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Otavio,

Le Mon, 7 Jan 2013 15:59:24 -0200,
Otavio Salvador <otavio@ossystems.com.br> a =C3=A9crit :

> On Mon, Jan 7, 2013 at 2:43 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> > * libnl's makefiles are calling $(LEX) but only define $(FLEX), thus
> > compilation on a host which doesn't have lex fails with :
> > | lex --header-file=3Droute/cls/ematch_grammar.h  -o route/cls/ematch_g=
rammar.c route/cls/ematch_grammar.l
> > | make[1]: lex: Command not found
> > | make[1]: *** [route/cls/ematch_grammar.c] Error 127
> >
> > * this patch fix this by setting LEX variable to flex tool
> >
> > Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
>=20
> I have prepared a patch for this issue but I did patch the Makefile.am
> to use $(FLEX) as this is the fix commited in upstream 3.2.17. If you
> do not object, I'd like to propose mine patch for review as it is more
> in line with upstream fix.
>=20
as the end result is the same, the maintainer now has the choice ;-)

Eric


