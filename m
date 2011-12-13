Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RaSSL-0004Px-Jo
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 14:31:41 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RaSLg-0001Nd-Aj
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2011 14:24:48 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Dec 2011 13:24:47 +0000
In-Reply-To: <4EE750C0.8050703@bluegiga.com>
References: <1323328045-26145-1-git-send-email-lauri.hintsala@bluegiga.com>
	<1323759539-23945-1-git-send-email-lauri.hintsala@bluegiga.com>
	<1323779213.2731.63.camel@ted>	<1323779786.24417.140.camel@phil-desktop>
	<4EE74C03.6050407@bluegiga.com>
	<1323781625.24417.150.camel@phil-desktop>
	<4EE750C0.8050703@bluegiga.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1323782688.24417.153.camel@phil-desktop>
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 13 Dec 2011 13:31:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-12-13 at 15:18 +0200, Lauri Hintsala wrote:
> On 12/13/2011 03:07 PM, Phil Blundell wrote:
> > read RAWTIMESTAMP<  /etc/timestamp
> > TIMESTAMP=${RAWTIMESTAMP#????????}${RAWTIMESTAMP%????????}
>
> Yes I got your idea and it seems to work. Thanks for your tips!
> 
> Second try:
> 
> SYSTEMDATE=`date -u +%4Y%2m%2d`
> read TIMESTAMP < /etc/timestamp
> if [ ${TIMESTAMP:8:4}${TIMESTAMP:0:4} -gt $SYSTEMDATE ]; then
>      date -u $TIMESTAMP
>      /etc/init.d/hwclock.sh stop
> fi
> 
> Is this okay? Should I generate patch?

Is the "${var:X:Y}" substring notation part of POSIX?  I have a feeling
that it might be a GNU extension, and it didn't seem to work in dash
when I tried it just now.

p.




