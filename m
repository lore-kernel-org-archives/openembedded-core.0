Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qr7wr-0007ur-IG for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 14:31:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ACRJq4021480
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 13:27:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20866-04 for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 13:27:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ACRDMc021474
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 13:27:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1312861931-5656-1-git-send-email-galak@kernel.crashing.org>
References: <1312861931-5656-1-git-send-email-galak@kernel.crashing.org>
Date: Wed, 10 Aug 2011 13:26:38 +0100
Message-ID: <1312979198.14274.362.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] eglibc: force GLIBC_EXTRA_OECONF to not be uset for nativesdk
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
X-List-Received-Date: Wed, 10 Aug 2011 12:31:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-08 at 22:52 -0500, Kumar Gala wrote:
> Don't use GLIBC_EXTRA_OECONF for the nativesdk builds.  Easiest solution
> is to just override it settings.  Otherwise we might pickup configure
> options ment for the target build.
> 
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> ---
>  meta/recipes-core/eglibc/eglibc.inc     |    1 +
>  meta/recipes-core/eglibc/eglibc_2.12.bb |    2 +-
>  meta/recipes-core/eglibc/eglibc_2.13.bb |    2 +-
>  3 files changed, 3 insertions(+), 2 deletions(-)

Merged to master, thanks.

Richard



