Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QMKzi-0005vc-M6 for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 16:11:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HE8b21017129
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 15:08:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16971-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 15:08:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4HE8TA1017123
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 May 2011 15:08:29 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1305626195.2429.176.camel@phil-desktop>
References: <1305626195.2429.176.camel@phil-desktop>
Date: Tue, 17 May 2011 15:08:29 +0100
Message-ID: <1305641309.3424.241.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [patch] backport USE_LDCONFIG and PACKAGE_SNAP_LIB_SYMLINKS from oe master
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
X-List-Received-Date: Tue, 17 May 2011 14:11:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-05-17 at 10:56 +0100, Phil Blundell wrote:
> This is a backport of the corresponding package.bbclass functionality
> (which is needed by micro) from the openembedded tree. 
> 
> p.
> 
> From 01e01d38d57d7c766cc1e9a547c73abd4065e1c1 Mon Sep 17 00:00:00 2001
> From: Phil Blundell <philb@gnu.org>
> Date: Fri, 13 May 2011 14:07:26 +0100
> Subject: [PATCH] package.bbclass: backport USE_LDCONFIG and PACKAGE_SNAP_SYMLINKS from oe master
> 
> ---
>  meta/classes/package.bbclass |   34 +++++++++++++++++++++++++++-------
>  1 files changed, 27 insertions(+), 7 deletions(-)

I merged this but please add a Signed-off-by line in future (I added
mine this time since I already had it applied to the tree bebfore I
realised and I'm happy about the code origin).

Cheers,

Richard



