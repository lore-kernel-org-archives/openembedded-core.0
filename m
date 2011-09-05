Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R0V0x-0007Sd-FF for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 10:58:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p858rgMo028005;
	Mon, 5 Sep 2011 09:53:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24902-05; Mon,  5 Sep 2011 09:53:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p858rZ9d027999
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 5 Sep 2011 09:53:36 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CALT56yOh6E9=51CWv9r-6Qz62wycn7MC4sn5pCKPEQziE07-QA@mail.gmail.com>
References: <1315074165-20137-1-git-send-email-dbaryshkov@gmail.com>
	<DE9759A0-C638-4B4A-A6BC-6B61139D866A@dominion.thruhere.net>
	<CALT56yOh6E9=51CWv9r-6Qz62wycn7MC4sn5pCKPEQziE07-QA@mail.gmail.com>
Date: Mon, 05 Sep 2011 09:53:29 +0100
Message-ID: <1315212810.14490.25.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/3] zaurusd: enable support for collie
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
X-List-Received-Date: Mon, 05 Sep 2011 08:58:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-09-03 at 23:04 +0400, Dmitry Eremin-Solenikov wrote:
> On 9/3/11, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > shouldn't this move to meta-zaurus now that oe-core is qemu only?
> 
> Maybe. IIUC, currently the plan is to push meta-zaurus into meta-hh as published
> by Paul Eggleton. On the other hand we didn't start this move (yet).
> So please ignore
> this patch for now.
> 
> BTW: Probably this patch and fix-makefile.patch should just be applied
> into main git?

We should apply these patches straight into git, yes.

I'm also wondering if there is still a use case for renaming zaurusd and
turning it into something less machine specific (which was always its
intent).

One place it can really help is where you have several revisions of a
board and need a slightly different audio config for each as it allows
doing this with one OE 'machine' entry.

Cheers,

Richard








