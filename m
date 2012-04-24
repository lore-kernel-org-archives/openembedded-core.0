Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SMcQ8-0006ao-5m
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 11:52:28 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SMcGt-0000o0-W4
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 11:42:56 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 24 Apr 2012 10:42:54 +0100
In-Reply-To: <857BE142E5399E46B20FD45B9DB8A7BC0FD735E3@SHSMSX101.ccr.corp.intel.com>
References: <857BE142E5399E46B20FD45B9DB8A7BC0FD735E3@SHSMSX101.ccr.corp.intel.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1335260575.27021.64.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: is the virtual package <locale>-tanslation correct?
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
X-List-Received-Date: Tue, 24 Apr 2012 09:52:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-04-24 at 09:33 +0000, Lu, Lianhao wrote:
> I found that in package.bbclass when generating the -locale packages, it sets RPROVIDES to provide the virtual packages <locale>-translation,
>   d.setVar('RPROVIDES_' + pkg, '%s-locale %s-translation' % (pn, ln))
> 
> This would result different real packages provide the same <locale>-translation, i.e. eglibc-locale-ca and glib-2.0-locale-ca will both RPROVIDES ca-translation, even though they contain different messages.
> 
> Is it desirable or should we remove the <locale>-translation in RPROVIDES?

Yes, that is the intended behaviour.  This is necessary to support
dynamically installed language packs.

p.




