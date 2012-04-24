Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SMdP9-0000tT-MZ for openembedded-core@lists.openembedded.org;
	Tue, 24 Apr 2012 12:55:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3OAjw9e006247
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 11:45:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05670-07 for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 11:45:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3OAjoDu006241
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2012 11:45:51 +0100
Message-ID: <1335264349.12692.120.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 24 Apr 2012 11:45:49 +0100
In-Reply-To: <1335260575.27021.64.camel@phil-desktop>
References: <857BE142E5399E46B20FD45B9DB8A7BC0FD735E3@SHSMSX101.ccr.corp.intel.com>
	<1335260575.27021.64.camel@phil-desktop>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Tue, 24 Apr 2012 10:55:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-04-24 at 10:42 +0100, Phil Blundell wrote:
> On Tue, 2012-04-24 at 09:33 +0000, Lu, Lianhao wrote:
> > I found that in package.bbclass when generating the -locale packages, it sets RPROVIDES to provide the virtual packages <locale>-translation,
> >   d.setVar('RPROVIDES_' + pkg, '%s-locale %s-translation' % (pn, ln))
> > 
> > This would result different real packages provide the same <locale>-translation, i.e. eglibc-locale-ca and glib-2.0-locale-ca will both RPROVIDES ca-translation, even though they contain different messages.
> > 
> > Is it desirable or should we remove the <locale>-translation in RPROVIDES?
> 
> Yes, that is the intended behaviour.  This is necessary to support
> dynamically installed language packs.

What uses this out of interest?

Cheers,

Richard



