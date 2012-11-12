Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>)
	id 1TXzQt-0003kX-VN; Mon, 12 Nov 2012 20:12:32 +0100
Received: from host-92-24-38-206.ppp.as43234.net ([92.24.38.206]
	helo=novatech.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16) (Exim 4.69 #1)
	id 1TXyiE-0004OQ-4W by authid <stefan@sostec.de> with srv_auth_cram_md5;
	Mon, 12 Nov 2012 19:26:24 +0100
Received: from stefan by novatech.datenfreihafen.org with local (Exim 4.80)
	(envelope-from <stefan@novatech.datenfreihafen.org>)
	id 1TXyi8-0001mZ-Re; Mon, 12 Nov 2012 18:26:16 +0000
Date: Mon, 12 Nov 2012 18:26:16 +0000
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20121112182616.GB22235@novatech.datenfreihafen.org>
References: <12301427.Yf0uchSh3U@helios>
MIME-Version: 1.0
In-Reply-To: <12301427.Yf0uchSh3U@helios>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.2.5
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: OE-Classic recipe migration status
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
X-List-Received-Date: Mon, 12 Nov 2012 19:12:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Sun, 2012-11-11 at 19:11, Paul Eggleton wrote:
> 
>    1484 other
>     218 BSP
>     211 BugLabs

I now longer work for BugLabs but  during my last months there I split
up our bunch of recipes according to what we think was sane at that
time. Think end of last year here.

The BSP layer can be found here:
https://github.com/buglabs/meta-bug

And BugLabs specific recipes here:
https://github.com/buglabs/meta-buglabs

All OpenJDK related stuff was going directly into upstream through
Tarent anyway. This should cover all stuff that was worth bringing
over.

>      11 EFL

I think everything worth working with is in meta-efl in meta-oe.
Martin is doing a great job catching up with everything we do
upstream. If something is really missing it might now longer work or
is just not worth bringing over.

regards
Stefan Schmidt


