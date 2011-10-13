Received: from smtp203.alice.it ([82.57.200.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1REJ1t-0003Ix-GV
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 13:00:49 +0200
Received: from trisquel.localnet (79.17.209.133) by smtp203.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4E6FEAFE009D7A08; Thu, 13 Oct 2011 12:49:56 +0200
From: "Denis 'GNUtoo' Carikli" <GNUtoo@no-log.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 12:49:55 +0200
User-Agent: KMail/1.13.6 (Linux/2.6.38-11-generic; KDE/4.6.2; x86_64; ; )
References: <49a800f40bd08aa23d227dccafd34b3e59a7ccb5.1318405370.git.Martin.Jansa@gmail.com>
	<9e0189cadfc1211c918dac076619f71ec3e4d19a.1318405370.git.Martin.Jansa@gmail.com>
	<1318454810.3052.9.camel@lenovo.internal.reciva.com>
In-Reply-To: <1318454810.3052.9.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
Message-Id: <201110131249.55190.GNUtoo@no-log.org>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [oe-core 3/4] conf: machine: includes: add armv6-novfp support
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
X-List-Received-Date: Thu, 13 Oct 2011 11:00:49 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

>This patch doesn't seem to do what it says in the subject line.  It
>doesn't add an "armv6-novfp" tune, instead it removes vfp from the
>existing armv6 and armv6t tunes.
yes that's what it does,but it also adds an armv6-vfp.
The commit message is wrong, sorry.

by the way is the content ok? or should I re-do the content too(if so I would 
need some indications of what the right way is)?

Denis.


