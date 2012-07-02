Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Sln5U-0001jt-Bg
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 22:19:12 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Slmur-0000hW-LK
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 22:08:13 +0200
Message-ID: <1341259602.2886.27.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 02 Jul 2012 21:06:42 +0100
In-Reply-To: <ce879400de83074f4c24961787ec36aad372fb80.1341257063.git.mark.hatle@windriver.com>
References: <cover.1341257063.git.mark.hatle@windriver.com>
	<ce879400de83074f4c24961787ec36aad372fb80.1341257063.git.mark.hatle@windriver.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] oprofile: Change /root to /home/root
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
X-List-Received-Date: Mon, 02 Jul 2012 20:19:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-02 at 14:25 -0500, Mark Hatle wrote:
> +diff -ur oprofile-0.9.7.orig/utils/opcontrol oprofile-0.9.7/utils/opcontrol
> +--- oprofile-0.9.7.orig/utils/opcontrol	2011-07-20 14:36:48.000000000 -0500
> ++++ oprofile-0.9.7/utils/opcontrol	2012-07-02 13:55:06.232872688 -0500
> +@@ -384,7 +384,7 @@
> + 	OPROFILED="$OPDIR/oprofiled"
> + 
> + 	# location for daemon setup information
> +-	SETUP_DIR="/root/.oprofile"
> ++	SETUP_DIR="/home/root/.oprofile"
> + 	SETUP_FILE="$SETUP_DIR/daemonrc"
> + 	SEC_SETUP_FILE="$SETUP_DIR/daemonrc_new"
> + 

Why is it putting "daemon setup information" in /root in the first
place?  Surely that should go in /etc or some such place.

Also, the choice of where root's home directory goes is a distro
decision and, in the general case, it is not correct to say that "OE
uses /home/root".  Changing the hardcoded value from one thing to
another is probably not that much of an improvement overall. 

p.




