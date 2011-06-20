Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QYeUy-0000fY-IF
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 15:26:41 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5KDN5qR027891
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2011 06:23:05 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 20 Jun 2011 06:23:05 -0700
Message-ID: <4DFF49B8.9050908@windriver.com>
Date: Mon, 20 Jun 2011 08:23:04 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <AE69955E-732E-4002-90F9-FF833BC78D8A@dominion.thruhere.net>
In-Reply-To: <AE69955E-732E-4002-90F9-FF833BC78D8A@dominion.thruhere.net>
Subject: Re: Architecture mismatch QA check not fatal?
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
X-List-Received-Date: Mon, 20 Jun 2011 13:26:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/20/11 2:41 AM, Koen Kooi wrote:
> Hi,
> 
> I was building qt this weekend and I noticed this one:
> 
> WARNING: QA Issue: Architecture did not match (40 to 62) on /work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.7.3-r26.1/packages-split/qt4-embedded-tools/usr/bin/moc
> WARNING: QA Issue: Architecture did not match (40 to 62) on /work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.7.3-r26.1/packages-split/qt4-embedded-tools/usr/bin/uic
> WARNING: QA Issue: Architecture did not match (40 to 62) on /work/armv7a-angstrom-linux-gnueabi/qt4-embedded-4.7.3-r26.1/packages-split/qt4-embedded-tools/usr/bin/rcc
> 
> Shouldn't that be a fatal error, shipping x86 binaries in arm packages?

There are a couple of very minor use cases where this may be necessary.  So I'm
wondering if we can put in an override mechanism that tells the system to make
the QA a warning instead of an error for select packages.  Otherwise, yes.. this
should be an error.

(The minor cases are primarily firmware loaded into off-board cards in PCI
chasis and such.. occasionally these firmware are ELF and of an architecture not
the same as the host..  it's rare, but I have seen it before.)

--Mark

> regards,
> 
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



