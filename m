Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qr84e-0008Jm-Jb for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 14:39:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ACZKlo021542;
	Wed, 10 Aug 2011 13:35:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20864-06; Wed, 10 Aug 2011 13:35:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ACZBbk021535
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 10 Aug 2011 13:35:12 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1312574177-20210-1-git-send-email-raj.khem@gmail.com>
References: <1312574177-20210-1-git-send-email-raj.khem@gmail.com>
Date: Wed, 10 Aug 2011 13:34:37 +0100
Message-ID: <1312979677.14274.367.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Daniel Lazzari <dlazzari@leapfrog.com>
Subject: Re: [PATCH V2] defaultsetup: Use .= to add TCLIBCAPPEND to TMPDIR
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
X-List-Received-Date: Wed, 10 Aug 2011 12:39:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-05 at 12:56 -0700, Khem Raj wrote:
> From: Daniel Lazzari <dlazzari@leapfrog.com>
> 
> Lazily appending causes a bug where wrong cache is
> cleared when BB_SRCREV_POLICY = "clear".
> 
> Tested with qemuarm on uclibc/eglibc in same build dir
> 
> Signed-off-by: Daniel Lazzari Jr <dlazzari@leapfrog.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/distro/defaultsetup.conf |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Merged to master, thanks.

Richard



