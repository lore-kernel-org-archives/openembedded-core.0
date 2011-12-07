Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RYGvm-0001lW-3f for openembedded-core@lists.openembedded.org;
	Wed, 07 Dec 2011 13:49:02 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB7CgB7Q013011;
	Wed, 7 Dec 2011 12:42:11 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11271-08; Wed,  7 Dec 2011 12:42:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB7Cg12J013005
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 7 Dec 2011 12:42:01 GMT
Message-ID: <1323261732.30601.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 07 Dec 2011 12:42:12 +0000
In-Reply-To: <1323178995-12270-1-git-send-email-Martin.Jansa@gmail.com>
References: <20111206091601.GA5456@jama.jama.net>
	<1323178995-12270-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Klaus Kurzmann <mok@fluxnetz.de>
Subject: Re: [PATCH] subversion: update 1.7.0 to 1.7.2 and force libtool recreation
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
X-List-Received-Date: Wed, 07 Dec 2011 12:49:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-12-06 at 14:43 +0100, Martin Jansa wrote:
> From: Klaus Kurzmann <mok@fluxnetz.de>
> 
> * subversion-1.7.* had libtool-2.4, oe-core now has 2.4.2 and it was
>   failing:
>   x86_64-linux-libtool: Version mismatch error.  This is libtool 2.4.2, but the
>   x86_64-linux-libtool: definition of this LT_INIT comes from libtool 2.4.
>   x86_64-linux-libtool: You should recreate aclocal.m4 with macros from libtool 2.4.2
>   x86_64-linux-libtool: and run autoconf again.
> 
> Signed-off-by: Klaus Kurzmann <mok@fluxnetz.de>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../subversion/subversion-1.7.0/libtool2.patch     |   15 --------
>  .../subversion/subversion-1.7.2/libtool2.patch     |   15 ++++++++
>  .../subversion/subversion_1.7.0.bb                 |   37 -------------------
>  .../subversion/subversion_1.7.2.bb                 |   38 ++++++++++++++++++++
>  4 files changed, 53 insertions(+), 52 deletions(-)
>  delete mode 100644 meta/recipes-devtools/subversion/subversion-1.7.0/libtool2.patch
>  create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.2/libtool2.patch
>  delete mode 100644 meta/recipes-devtools/subversion/subversion_1.7.0.bb
>  create mode 100644 meta/recipes-devtools/subversion/subversion_1.7.2.bb

Merged to master, thanks.

Richard



