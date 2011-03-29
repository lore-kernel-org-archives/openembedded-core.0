Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q4Z66-0005Vn-AG for openembedded-core@lists.openembedded.org;
	Tue, 29 Mar 2011 15:36:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2TDYeHk020529
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2011 14:34:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20242-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2011 14:34:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2TDYVp5020523
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2011 14:34:33 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <00f980d5a81d4cd6273ec10b67e4d288b8fd64de.1300730825.git.raj.khem@gmail.com>
References: <cover.1300730825.git.raj.khem@gmail.com>
	<00f980d5a81d4cd6273ec10b67e4d288b8fd64de.1300730825.git.raj.khem@gmail.com>
Date: Tue, 29 Mar 2011 14:34:26 +0100
Message-ID: <1301405666.24596.27.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/3] bitbake.conf: Prune global OPTIMIZATION flags
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
X-List-Received-Date: Tue, 29 Mar 2011 13:36:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-03-21 at 11:11 -0700, Khem Raj wrote:
> -fexpensive-optimizations is enabled by default at -O2
> 
> -fomit-frame-pointer is enabled at -O2 selectively by gcc depending upon
>   architecture if debug info is not hurt
> 
> -frename-registers - This might have some performance advantage on top
>  of O2 on architectures which have more registers and registers are left
>  after scheduling but it affects debuggability quite a bit so as a i
>  tradeoff we do not use it.
> 
> -feliminate-dwarf2-dups - We use this option to reduce the size of debug
>  information by removing duplicates this is only valid for dwarf2+ and we
>  use dwarf2 by default

I've disabled this flag for now as it was causing too many failures
across the board (various apps, prelinker). We can add it back when this
has been tested more extensively and its been confirmed to work with the
prelinker.

Cheers,

Richard



