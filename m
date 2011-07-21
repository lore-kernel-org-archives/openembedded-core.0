Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qk1DE-0004I6-K6 for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 23:55:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6LLoWpb007706
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 22:50:32 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04336-09 for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 22:50:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6LLoNIr007700
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 22:50:23 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1311283402-28301-1-git-send-email-raj.khem@gmail.com>
References: <1311283402-28301-1-git-send-email-raj.khem@gmail.com>
Date: Thu, 21 Jul 2011 22:50:19 +0100
Message-ID: <1311285019.2344.95.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v2] libiconv: Fix build failure on 1.13.1
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
X-List-Received-Date: Thu, 21 Jul 2011 21:55:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-21 at 14:23 -0700, Khem Raj wrote:
> It needs a different patch for 1.13.1 for autoconf'ing
> Rename files to libiconv-1.11.1 and have a separate
> directory for libiconv-1.13.1
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../{files => libiconv-1.11.1}/autoconf.patch      |    0
>  .../shared_preloadable_libiconv_linux.patch        |    0
>  .../{files => libiconv-1.13.1}/autoconf.patch      |   32 ++++++++++----------
>  meta/recipes-support/libiconv/libiconv_1.13.1.bb   |    3 +-
>  4 files changed, 17 insertions(+), 18 deletions(-)
>  copy meta/recipes-support/libiconv/{files => libiconv-1.11.1}/autoconf.patch (100%)
>  rename meta/recipes-support/libiconv/{files => libiconv-1.11.1}/shared_preloadable_libiconv_linux.patch (100%)
>  rename meta/recipes-support/libiconv/{files => libiconv-1.13.1}/autoconf.patch (57%)

Merged to master, thanks.

Richard



