Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qlibe-0005fF-EE for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 16:27:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6QENLei022174
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 15:23:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21143-10 for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 15:23:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6QENDV8022168
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 15:23:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1311656953-30417-1-git-send-email-raj.khem@gmail.com>
References: <1311656953-30417-1-git-send-email-raj.khem@gmail.com>
Date: Tue, 26 Jul 2011 15:23:05 +0100
Message-ID: <1311690185.2344.248.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] meta: Rename SITEINFO_ENDIANESS to SITEINFO_ENDIANNESS
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
X-List-Received-Date: Tue, 26 Jul 2011 14:27:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-25 at 22:09 -0700, Khem Raj wrote:
> There is this discrepency in spelling. Lets fix it in
> core. There are lot of layers using SITEINFO_ENDIANNESS
> This was shielded since meta-oe had its own copy of
> siteinfo class. But that class has now been deleted in
> favor of oe-core
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/siteinfo.bbclass                      |    4 ++--
>  meta/conf/machine/include/tune-xscale.inc          |    4 ++--
>  meta/recipes-connectivity/openssl/openssl.inc      |    2 +-
>  .../recipes-connectivity/openssl/openssl_0.9.8r.bb |    2 +-
>  meta/recipes-devtools/perl/perl_5.12.3.bb          |    4 ++--
>  meta/recipes-qt/qt4/qt4-embedded.inc               |    2 +-
>  meta/recipes-qt/qt4/qt4-x11-free.inc               |    2 +-
>  meta/recipes-qt/qt4/qt4_arch.inc                   |    4 ++--
>  8 files changed, 12 insertions(+), 12 deletions(-)

Merged to master, thanks.

Richard



