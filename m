Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1RaSZy-0004Zr-R0
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 14:39:34 +0100
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1RaSTJ-0008Oo-BB>; Tue, 13 Dec 2011 14:32:41 +0100
Received: from hydra.imp.fu-berlin.de ([160.45.117.149]
	helo=mail.imp.fu-berlin.de) by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1RaSTJ-0004k7-95>; Tue, 13 Dec 2011 14:32:41 +0100
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by mail.imp.fu-berlin.de with esmtps (Exim 4.72) id 1RaSSh-0006M2-ND
	(envelope-from <heinold@mi.fu-berlin.de>)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 14:32:15 +0100
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1RaSSc-0008SR-Jn
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2011 14:31:58 +0100
Date: Tue, 13 Dec 2011 14:31:58 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111213133158.GA15014@mi.fu-berlin.de>
References: <1323328045-26145-1-git-send-email-lauri.hintsala@bluegiga.com>
	<1323759539-23945-1-git-send-email-lauri.hintsala@bluegiga.com>
	<1323779213.2731.63.camel@ted>
	<1323779786.24417.140.camel@phil-desktop>
	<4EE74C03.6050407@bluegiga.com>
	<1323781625.24417.150.camel@phil-desktop>
	<4EE750C0.8050703@bluegiga.com>
	<1323782688.24417.153.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1323782688.24417.153.camel@phil-desktop>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Henning Heinold <heinold@mi.fu-berlin.de>
X-Remote-IP: 160.45.42.84
X-Spam_Score: -5.2
X-exim-Spam_Score_Int: -51
X-exim-Spam_Bar: -----
X-Spam_Report: * -1.0 ALL_TRUSTED Nachricht wurde nur über vertrauenswürdige Rechner
 *      weitergeleitet
 * -2.3 RP_MATCHES_RCVD Envelope sender domain matches handover relay domain
 * -1.9 BAYES_00 BODY: Spamwahrscheinlichkeit nach Bayes-Test: 0-1%
 *      [score: 0.0000]
X-Originating-IP: 160.45.117.149
Subject: Re: [PATCH v2] initscripts: fix timestamp check at bootmisc.sh
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
X-List-Received-Date: Tue, 13 Dec 2011 13:39:34 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 13, 2011 at 01:24:47PM +0000, Phil Blundell wrote:
> On Tue, 2011-12-13 at 15:18 +0200, Lauri Hintsala wrote:
> > On 12/13/2011 03:07 PM, Phil Blundell wrote:
> > > read RAWTIMESTAMP<  /etc/timestamp
> > > TIMESTAMP=${RAWTIMESTAMP#????????}${RAWTIMESTAMP%????????}
> >
> > Yes I got your idea and it seems to work. Thanks for your tips!
> > 
> > Second try:
> > 
> > SYSTEMDATE=`date -u +%4Y%2m%2d`
> > read TIMESTAMP < /etc/timestamp
> > if [ ${TIMESTAMP:8:4}${TIMESTAMP:0:4} -gt $SYSTEMDATE ]; then
> >      date -u $TIMESTAMP
> >      /etc/init.d/hwclock.sh stop
> > fi
> > 
> > Is this okay? Should I generate patch?
> 
> Is the "${var:X:Y}" substring notation part of POSIX?  I have a feeling
> that it might be a GNU extension, and it didn't seem to work in dash
> when I tried it just now.
> 
> p.

Substring using ${var:X:Y} is bash syntax as far as I know.

Bye Henning


