Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RXU2v-0007Vo-JO for openembedded-core@lists.openembedded.org;
	Mon, 05 Dec 2011 09:37:09 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB58UMLR020706
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Dec 2011 08:30:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16218-10 for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2011 08:30:18 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB58UDqV020700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Dec 2011 08:30:14 GMT
Message-ID: <1323073824.25960.87.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 05 Dec 2011 08:30:24 +0000
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6E8EDFF05C0@shsmsx502.ccr.corp.intel.com>
References: <1865303E0DED764181A9D882DEF65FB6E8EDFF05C0@shsmsx502.ccr.corp.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: meta-toolchain-gmae can't build: Cannot create symlink from ./var/log to 'volatile/log': File exists
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
X-List-Received-Date: Mon, 05 Dec 2011 08:37:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-12-05 at 15:35 +0800, Cui, Dexuan wrote:
> Hi, recently, I found meta-toolchain-gmae failed to build on poky master if I use ipk packaging(I didn't try rpm/deb):
> 
> task do_populate_sdk: Failed
> 
> | Configuring avahi-dev.
> | Configuring task-core-standalone-gmae-sdk-target.
> | Configuring libtelepathy-dbg.
> | Configuring task-core-standalone-gmae-sdk-target-dbg.
> | Configuring util-linux-blkid.
> | Collected errors:
> |  * extract_archive: Cannot create symlink from ./var/log to 'volatile/log': File exists.
> ERROR: Function 'do_populate_sdk' failed 
> 
> Now I have no time to look into this issue at once. It would be great, if somebody can give some quick hint.

Is this with the latest master?

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=f340e3937fd5ac3963de6c6b29d56dd92d962864

was added to avoid an error very like this that was showing up with
rpm...

Cheers,

Richard



