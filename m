Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SRmM7-0007DY-Ir for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 17:29:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q48FJmdu004308
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 May 2012 16:19:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03507-09 for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2012 16:19:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q48FJcB1004302
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 May 2012 16:19:39 +0100
Message-ID: <1336490382.30349.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 08 May 2012 16:19:42 +0100
In-Reply-To: <cover.1336417061.git.Martin.Jansa@gmail.com>
References: <cover.1336417061.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/6] cleanup old stuff
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
X-List-Received-Date: Tue, 08 May 2012 15:29:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-05-07 at 22:05 +0200, Martin Jansa wrote:
> I haven't tried to build world for all archs, but git grep shows 
> that this stuff wasn't used so it should be safe to remove it.
> 
> The following changes since commit 2929e7d590862d9649458c90804e79a1dce40423:
> 
>   glib-2.0: Fix issues with libelf dependency creeping in (2012-05-07 10:53:24 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib jansa/pull
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull
> 
> Martin Jansa (6):
>   dbus-glib: bump PR to rebuild after glib upgrade
>   evolution-data-server: delete unused patch parallelmake.patch
>   evolution-data-server: delete old 2.20.0 version
>   meta-demoapps: delete from oe-core
>   libgdbus: delete from oe-core
>   libsoup: delete from oe-core

Merged to master, thanks.

I did rework the meta-demoapps to rescue pong-clock and xeyes.

Richard



