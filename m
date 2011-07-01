Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QcmVA-0008T0-Fs for openembedded-core@lists.openembedded.org;
	Sat, 02 Jul 2011 00:47:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p61MA9k2021431
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jul 2011 23:10:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20843-06 for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2011 23:10:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p61MA3Pc021416
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jul 2011 23:10:03 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309542363-29316-1-git-send-email-raj.khem@gmail.com>
References: <1309542363-29316-1-git-send-email-raj.khem@gmail.com>
Date: Fri, 01 Jul 2011 23:09:41 +0100
Message-ID: <1309558181.20015.561.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] consolekit: Add glib-2.0 to DEPENDS
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
X-List-Received-Date: Fri, 01 Jul 2011 22:47:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-01 at 10:46 -0700, Khem Raj wrote:
> Otherwise it ends up with this error
> | configure: error: Package requirements (dbus-glib-1 >= 0.82
> |   gobject-2.0 >= 2.14
> |   gthread-2.0 >= 2.14
> | ) were not met:
> |
> | No package 'gobject-2.0' found
> | No package 'gthread-2.0' found
> |
> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> | installed software in a non-standard prefix.
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-support/consolekit/consolekit_0.4.5.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Merged to master, thanks.

Richard



