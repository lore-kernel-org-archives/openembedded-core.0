Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1URiS3-0005jr-IA for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 14:24:04 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3FC6mDr007889; Mon, 15 Apr 2013 13:06:48 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 2EAme698NFkE; Mon, 15 Apr 2013 13:06:48 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3FC6hu0007852
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 15 Apr 2013 13:06:45 +0100
Message-ID: <1366027581.8670.33.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 15 Apr 2013 13:06:21 +0100
In-Reply-To: <20130415114312.GP2475@jama>
References: <1366024028-24911-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1366024028-24911-2-git-send-email-richard.purdie@linuxfoundation.org>
	<20130415114312.GP2475@jama>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] recipes: Fix ALLOW_EMPTY with no package specified
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2013 12:24:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-04-15 at 13:43 +0200, Martin Jansa wrote:
> On Mon, Apr 15, 2013 at 12:07:02PM +0100, Richard Purdie wrote:
> > There are various usages of ALLOW_EMPTY with no packages specified. This
> > is not recommended syntax, nor is it likely to be supported in the future.
> > This patch improves the references in OE-Core, either removing them if they're
> > pointless (e.g. when PACKAGES="") or specifying which package it applies to.
> 
> Was this one sent by accident?
> 
> http://git.openembedded.org/openembedded-core/commit/?id=fe81bd4f600877e63433184cfc2e22c33bb77db6

Yes, sent by accident, sorry about the noise.

Cheers,

Richard



