Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RCBiP-0003Fp-BN for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 16:47:57 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p97EmhF8011601; Fri, 7 Oct 2011 15:48:43 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hKrLfXCiSC+A; Fri,  7 Oct 2011 15:48:43 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p97EmexC011586
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Fri, 7 Oct 2011 15:48:42 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 07 Oct 2011 15:42:01 +0100
In-Reply-To: <1317998259-4330-1-git-send-email-koen@dominion.thruhere.net>
References: <1317998259-4330-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317998530.8533.3.camel@ted>
Mime-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] gnutls: disable p11-kit
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
X-List-Received-Date: Fri, 07 Oct 2011 14:47:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-10-07 at 16:37 +0200, Koen Kooi wrote:
> | checking for P11_KIT... configure: error: Package requirements (p11-kit-1 >= 0.2) were not met:
> |
> | No package 'p11-kit-1' found
> |
> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> | installed software in a non-standard prefix.
> |
> | Alternatively, you may set the environment variables P11_KIT_CFLAGS
> | and P11_KIT_LIBS to avoid the need to call pkg-config.
> | See the pkg-config man page for more details.
> |
> | + bbfatal 'oe_runconf failed'
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/recipes-support/gnutls/gnutls.inc |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)

I had a similar patch pending too. I've just expedited the fix to
master...

Cheers,

Richard



