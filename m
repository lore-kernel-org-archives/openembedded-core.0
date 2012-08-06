Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SyQsr-0004ps-PW for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 19:14:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q76H2fXu030146
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Aug 2012 18:02:41 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29009-07 for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2012 18:02:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q76H2ZaL030139
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Aug 2012 18:02:36 +0100
Message-ID: <1344272557.9756.177.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 06 Aug 2012 18:02:37 +0100
In-Reply-To: <alpine.DEB.2.02.1208061158050.8873@oneiric>
References: <alpine.DEB.2.02.1208061158050.8873@oneiric>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: proper(?) way to *require* an earlier, unsupported version of a recipe file?
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
X-List-Received-Date: Mon, 06 Aug 2012 17:14:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-08-06 at 12:02 -0400, Robert P. J. Day wrote:
> what is the OE philosophy for preferring an earlier version of a
> recipe file that doesn't even exist anymore?  for example, the
> "watchdog" recipe was recently upgraded from 5.11 to 5.12.  in the
> process, the recipe file for 5.11 was removed; therefore, i interpret
> that as that OE-core no longer supports that version, which is fine.
> 
>   hypothetically, what if someone still *needed* that earlier version?
> would it be their responsibility to, say, create a new layer that
> re-introduced that older, now-unsupported version?  just curious.

Well, if there is some reason 5.11 is much better "we" as in OE-Core
would like to know about it to evaluate if we should be keeping it
around for some reason. If the reason you want that particular version
is specific to you then yes, your own layer would be the place to
maintain it (or a layer shared with other like minded users).

Cheers,

Richard



