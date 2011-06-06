Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QTf5S-0006E5-Dv for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 21:03:42 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p56J0P60008464
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jun 2011 20:00:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08257-03 for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2011 20:00:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p56J0K1k008452
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jun 2011 20:00:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTi=5YeR0kkX+9TwkaJXe=azKdwxxwA@mail.gmail.com>
References: <cover.1307342214.git.sgw@linux.intel.com>
	<3eba2df4c6f2371db24ab2420d037b992725cb84.1307342214.git.sgw@linux.intel.com>
	<1307343323.3131.1.camel@lenovo.internal.reciva.com>
	<1307357430.7672.7.camel@rex> <4DED055A.8010200@linux.intel.com>
	<BANLkTi=5YeR0kkX+9TwkaJXe=azKdwxxwA@mail.gmail.com>
Date: Mon, 06 Jun 2011 20:00:18 +0100
Message-ID: <1307386818.7672.31.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 01/20] bitbake.conf: Create staticlibs pacakge for static libraries
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
X-List-Received-Date: Mon, 06 Jun 2011 19:03:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-06-06 at 17:31 +0000, Otavio Salvador wrote:
> On Mon, Jun 6, 2011 at 16:50, Saul Wold <sgw@linux.intel.com> wrote:
> ...
> > As was pointed out earlier Fedora packages static libraries in a "-static"
> > package, but this had other implications for OE due to -static already being
> > in use (for busybox and mplayer), I am not sure that this is not a problem
> > for OE-Core, I would need to investigate.  Meego also seems to use the
> > Fedora standard with "-static".
> ...
> 
> I personally prefer -static. -staticlib seems redundant for me since
> we can end with libfoo-staticlib

-static doesn't really work well given we already have -static packages
meaning something else (e.g. the busybox case).

Cheers,

Richard



