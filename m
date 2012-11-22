Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <bjst@sestofb10.enea.se>) id 1TbW74-0003uQ-Sr
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 13:42:38 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Thu, 22 Nov 2012 13:28:32 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 5B007291437;
	Thu, 22 Nov 2012 13:28:32 +0100 (CET)
Date: Thu, 22 Nov 2012 13:28:32 +0100
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20121122122832.GD11155@sestofb10.enea.se>
References: <1353511391-60570-1-git-send-email-bjst@enea.com>
	<20121122120442.GB11155@sestofb10.enea.se>
	<CAP9ODKrMYinP351hyVNbkW9jZqVj7UNy1GkokXtG-V0rsqAZ4g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKrMYinP351hyVNbkW9jZqVj7UNy1GkokXtG-V0rsqAZ4g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 22 Nov 2012 12:42:39 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Otavio Salvador wrote:
> > What do I have to do to take them from "unpacked" to "installed"?
> Your package postinst needs to be able to be run offline.

But they don't have any postinst. There are no .postinst files installed fo=
r these packages in /var/lib/opkg/info. run-postinst.awk goes through the m=
otions and prints "Configuring:" for these packages only because the packag=
e status says "unpacked" instead of "installed". Nothing is ever ran.

--=20
Bj=F6rn


