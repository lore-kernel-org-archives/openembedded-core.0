Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1UP7uo-00046u-9H
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 10:59:03 +0200
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1; Mon, 8 Apr 2013
	10:41:43 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 692F22837E9;
	Mon,  8 Apr 2013 10:41:43 +0200 (CEST)
Date: Mon, 8 Apr 2013 10:41:43 +0200
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130408084143.GC24646@sestofb10.enea.se>
References: <20130322141213.GC46421@sestofb10.enea.se>
	<1364222065-62444-1-git-send-email-bjst@enea.com>
	<1364228284.3097.58.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1364228284.3097.58.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] ptest bugfix: Make all ptest files go into -ptest package
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
X-List-Received-Date: Mon, 08 Apr 2013 08:59:03 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote:
> Why are we putting all the debug files into the -ptest package now? Does
> that make sense?

(Sorry, I missed this comment.)

My reasoning is that we want all ptest data to be contained in -ptest packa=
ges and not "leak" into other packages.=20

If we keep debug data in the normal -dbg packages, you will always get ptes=
t debug data installed in your image when defining distro-feature "ptest", =
even if it doesn't include any -ptest packages. That feels wrong to me.

--=20
Bj=F6rn


