Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QWR1d-0007BJ-3b for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 12:39:13 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QWQyM-00049G-6Q
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 12:35:50 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTimyQdXV9Fxp8EuAfEWfX2=eGt=O+Q@mail.gmail.com>
References: <1307985976-22648-1-git-send-email-anders@chargestorm.se>
	<BANLkTimkU94WYhGGac5P88GMUA6mk7NCKg@mail.gmail.com>
	<BANLkTikkaDK6122A-=H+TS01oTsAtfD2qg@mail.gmail.com>
	<BANLkTi=u8pJ=pkgmWLuPnqKNjRow18X70A@mail.gmail.com>
	<BANLkTimyQdXV9Fxp8EuAfEWfX2=eGt=O+Q@mail.gmail.com>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 14 Jun 2011 11:35:49 +0100
Message-ID: <1308047749.25285.248.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH] runqemu: take TMPDIR from bitbake
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
X-List-Received-Date: Tue, 14 Jun 2011 10:39:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-14 at 12:33 +0200, Anders Darander wrote:
> Sure, if we need multiple variables, we'll save time by only invoking
> bitbake (and parse all configs, etc) once. On the other hand, have we
> then gained anything, as compared to 'bitbake -e'? Sure, we'll reduce
> the output, by only outputing the requested variables... But in the
> original case: TMPDIR=`bitbake -e | grep TMPDIR=\" | cut -d '=' -f2 |
> cut -d '"' -f2`
> the only change we can do is to substitute 'bitbake -e' with 'bitbake
> -V TMDPDIR', which wouldn't be any improvement.

Well, that's not quite true.  If "bitbake -V" outputted the full
assignment then you could just write:

eval `bitbake -V TMPDIR`

which would be a considerable improvement.

p.




