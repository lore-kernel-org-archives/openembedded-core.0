Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UeMpQ-0001WZ-10 for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 11:56:29 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UeMXi-0005nX-8W; Mon, 20 May 2013 11:38:10 +0200
Message-ID: <1369042689.6920.188.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Jonathan Liu <net147@gmail.com>
Date: Mon, 20 May 2013 10:38:09 +0100
In-Reply-To: <5199EB97.50900@gmail.com>
References: <1369013370-21391-1-git-send-email-net147@gmail.com>
	<1369041556.6920.182.camel@phil-desktop.brightsign>
	<5199EB97.50900@gmail.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] populate-volatile.sh: normalize repeated leading slashes in TNAME
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
X-List-Received-Date: Mon, 20 May 2013 09:56:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-05-20 at 19:23 +1000, Jonathan Liu wrote:
> On 20/05/2013 7:19 PM, Phil Blundell wrote:
> > On Mon, 2013-05-20 at 11:29 +1000, Jonathan Liu wrote:
> >> -		TNAME=${ROOT_DIR}/${TNAME}
> >> +		TNAME=`echo ${ROOT_DIR}/${TNAME} | sed -e 's@^//*@/@'`
> > Why is this a good thing?  Your commit message is rather terse.
> >
> > p.
> It reduces the size of /etc/volatile.cache.
> Otherwise for example if you have ROOT_DIR=/, TNAME=/var/log, TNAME 
> becomes ///var/log.
>
> Also if you have verbose mode enabled it actually prints out the extra 
> unnecessary leading slashes.

How many bytes does it actually save on a typical system?  Is this worth
the overhead of forking an extra 2 processes for every line in the
file?  

Would it not be better fixed by requiring TNAME to start with a slash
(which it probably does already), ROOT_DIR to not end with a slash, and
just dropping the intermediate separator?

p.




