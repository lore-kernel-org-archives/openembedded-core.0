Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QCzaT-00076O-37 for openembedded-core@lists.openembedded.org;
	Thu, 21 Apr 2011 21:30:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3LJSP27008625
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 20:28:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08587-01 for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 20:28:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3LJSKh4008619
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2011 20:28:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <9efd8eca294cb7e3206e47e3b9bea503f3c87ac8.1303412254.git.raj.khem@gmail.com>
References: <cover.1303412254.git.raj.khem@gmail.com>
	<9efd8eca294cb7e3206e47e3b9bea503f3c87ac8.1303412254.git.raj.khem@gmail.com>
Date: Thu, 21 Apr 2011 20:28:04 +0100
Message-ID: <1303414084.5518.363.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] pcmciautils: Upgrade 017 -> 018
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
X-List-Received-Date: Thu, 21 Apr 2011 19:30:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-04-21 at 11:59 -0700, Khem Raj wrote:
> version workaround is done in recipe itself
> by adding PV to CFLAGS
> 
> Since we define LIBC and pcmciutils use it too
> which hinders build when we define LIBC in
> environment. Its not used in the builds anyway
> so we get rid of depending on it

Why are you defining LIBC in the environment? That sounds like a
seriously bad idea. Our current environment handling should stop it
leaking into a build anyway shouldn't it?

Cheers,

Richard




