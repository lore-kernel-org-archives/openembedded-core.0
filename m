Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RaRdX-0001ta-4u for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 13:39:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBDCWGQE008845
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 12:32:16 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07989-09 for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 12:32:11 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pBDCW7lS008839
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 12:32:08 GMT
Message-ID: <1323779527.2731.68.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Dec 2011 12:32:07 +0000
In-Reply-To: <cda94110e16a2fb5d760fd728435b7cbb4142392.1323715541.git.paul.eggleton@linux.intel.com>
References: <cover.1323715541.git.paul.eggleton@linux.intel.com>
	<cda94110e16a2fb5d760fd728435b7cbb4142392.1323715541.git.paul.eggleton@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] qt4.inc : Add uic, moc, rcc, and lrelease to tools package.
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
X-List-Received-Date: Tue, 13 Dec 2011 12:39:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-12-12 at 18:48 +0000, Paul Eggleton wrote:
> From: Philip Balister <philip@balister.org>
> 
> These binaries are needed in the target tools package so we can build
> qt apps on the target. You also need to install qmake from meta-oe.
> 
> Tested by building gnuradio on the USRP e100 with qt support.
> 
> (This effectively reverses OE-core rev
> 69eeb3d2276e5b10d084b47d308ecfc8daf8b467, however test builds for
> qemux86 and qemumips produced no packaging warnings such as those
> described in that commit, and the architecture of the executables is
> correct.)
> 
> Signed-off-by: Philip Balister <philip@balister.org>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
>  meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
>  meta/recipes-qt/qt4/qt4.inc          |    9 ++-------
>  3 files changed, 4 insertions(+), 9 deletions(-)

Merged to master, thanks.

Richard



