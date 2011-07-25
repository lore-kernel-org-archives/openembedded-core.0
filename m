Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QlSv1-0004mb-Gr
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 23:42:31 +0200
Received: (qmail invoked by alias); 25 Jul 2011 21:38:19 -0000
Received: from p5B0A39BD.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.57.189]
	by mail.gmx.net (mp067) with SMTP; 25 Jul 2011 23:38:19 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19DFuFX5jpDnqC6SCi8WmaP3QU7k2wSjaP4ep3HnT
	n1W5FiZPwXgGov
From: Andreas Mueller <schnitzeltony@gmx.de>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2011 23:40:41 +0200
User-Agent: KMail/1.13.7 (Linux/2.6.35.13-92.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <201107242234.51777.schnitzeltony@gmx.de>
	<8ECC4D84-6F3F-4E53-81BC-1266D3E168DA@dominion.thruhere.net>
In-Reply-To: <8ECC4D84-6F3F-4E53-81BC-1266D3E168DA@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201107252340.41609.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [meta-ti]Pandaboard issues
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
X-List-Received-Date: Mon, 25 Jul 2011 21:42:31 -0000
X-Groupsio-MsgNum: 6656
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_ZLeLO8oUGdBVdzQ"

--Boundary-00=_ZLeLO8oUGdBVdzQ
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday, July 25, 2011 08:16:03 AM Koen Kooi wrote:
> Op 24 jul. 2011, om 22:34 heeft Andreas Mueller het volgende geschreven:
> > Hi,
> > 
> > while working on xfce48 recipes for meta-oe I wanted to do some run
> > tests. My only hardware currently supported in oe-core environment is
> > pandaboard. Herewith I face the following issues:
> > 
> > - Starting X stops / log attached
> 
> sed -i -e s:omapfb:fbdev:g /etc/X11/xorg.org
This leads a step further: X starts but the windows displayed are not really 
recognizable - all is grey / black. Attached is a log of the xfce session.
To be sure and make it mor reproducable for others I cross checked with efl-nodm-
image found in meta-angstrom. This is only a bit better: Mousepointer is visible 
but in the center of the screen is only a black box...

Any further suggestions?

Andreas

--Boundary-00=_ZLeLO8oUGdBVdzQ
Content-Type: application/zip;
  charset="UTF-8";
  name="Xorg.0.log.zip"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="Xorg.0.log.zip"

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
AAAAAAEAAQBBAAAANA4AAAAA

--Boundary-00=_ZLeLO8oUGdBVdzQ--
