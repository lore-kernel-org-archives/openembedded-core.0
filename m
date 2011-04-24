Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QE7Uv-0000dX-Eu for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 00:09:45 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3OM79kA001436;
	Sun, 24 Apr 2011 23:07:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01370-02; Sun, 24 Apr 2011 23:07:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p3OM6pKH001392
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 24 Apr 2011 23:06:52 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <bdf35c8101712ffcfa7f10d8adf4663f543fbaca.1303539961.git.sgw@linux.intel.com>
References: <cover.1303539961.git.sgw@linux.intel.com>
	<bdf35c8101712ffcfa7f10d8adf4663f543fbaca.1303539961.git.sgw@linux.intel.com>
Date: Sun, 24 Apr 2011 22:45:19 +0100
Message-ID: <1303681519.5518.373.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>, Kang Kai <kai.kang@windriver.com>
Subject: Re: [PATCH 33/37] gconf-dbus: add SRCREV to recipe
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
X-List-Received-Date: Sun, 24 Apr 2011 22:09:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-04-22 at 23:29 -0700, Saul Wold wrote:
> From: Martin Jansa <Martin.Jansa@gmail.com>
> 
> * taken from meta/conf/distro/include/poky-default-revisions.inc for
>   those who want gconf-dbus and are not using poky
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

I've like to hold off this SRCREV change and the other one for just a
little longer. Yu Ke is doing some investigation to confirm that global
include file is no longer required and assuming we find it isn't, we'll
move everything to the recipes in one go. I'd rather not do this
piecemeal and risk confusion so I'd appreciate patience for another few
days on this one.

Cheers,

Richard



