Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q8BdP-0003iQ-VM for openembedded-core@lists.openembedded.org;
	Fri, 08 Apr 2011 15:22:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p38DJp5S007173
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Apr 2011 14:19:51 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06730-10 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2011 14:19:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p38DJeD6007167
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Apr 2011 14:19:42 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <e92e40acfc599c9ecbce8df402337c6e38a1ea83.1302137428.git.tom_rini@mentor.com>
References: <cover.1302137428.git.tom_rini@mentor.com>
	<e92e40acfc599c9ecbce8df402337c6e38a1ea83.1302137428.git.tom_rini@mentor.com>
Date: Fri, 08 Apr 2011 06:19:38 -0700
Message-ID: <1302268778.22904.123.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] ncurses: Update to 5.9
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
X-List-Received-Date: Fri, 08 Apr 2011 13:22:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-04-06 at 17:50 -0700, Tom Rini wrote:
> The previous 5.7 release was relatively close to 5.8 due to it bringing
> in a patch to sync with upstream work-in-progress.  We skip over the
> 5.8 release and move to 5.9.  Also, we move most of the contents of the
> main recipe into the previously unused ncurses.inc file.
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>

Merged to master although in future if you're going to move large chunks
of the files around, I think it would look better as two commits as its
hard to tell what changed and what just moved.

Cheers,

Richard



