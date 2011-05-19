Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QNC6g-0006Z7-6b for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 00:54:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JMpJQG014432
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 23:51:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14250-03 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 23:51:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4JMpCn9014426
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 23:51:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTikP2DEjqVfw36bjFAn7y6ordKTA6Q@mail.gmail.com>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
	<2b5ed98c067c8f517a669ba8b857ebe1c08e1bb3.1305035617.git.richard.purdie@linuxfoundation.org>
	<BANLkTikP2DEjqVfw36bjFAn7y6ordKTA6Q@mail.gmail.com>
Date: Thu, 19 May 2011 23:51:08 +0100
Message-ID: <1305845468.3424.568.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 5/6] conf/distro/include/default-distrovars.inc: Create set of default 'distro' variable values
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
X-List-Received-Date: Thu, 19 May 2011 22:54:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-05-15 at 13:48 -0700, Khem Raj wrote:
> > +++ b/meta/conf/distro/include/default-distrovars.inc
> > @@ -0,0 +1,43 @@

> > +DISTRO_EXTRA_RDEPENDS += "task-core-boot"
> > +DISTRO_EXTRA_RRECOMMENDS += "kernel-module-af-packet"
> > +
> 
> 
> others can be overridden but the above two are a problem. they are forcing
> distros to have these in RDEPENDS and RRECOMMENDS e.g. a distro
> which does not want kernel-module-af-packet will have to have some way
> to remove it. My opinion is do not add them to policy

Agreed, I merged your patch to remove these two things.

Cheers,

Richard



