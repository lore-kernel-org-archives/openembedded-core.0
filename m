Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qe2wi-0005cO-NJ for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 12:33:36 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p65ATmbE029771
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jul 2011 11:29:48 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29515-05 for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2011 11:29:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p65AThfX029765
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jul 2011 11:29:43 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1309860717.git.paul.eggleton@linux.intel.com>
References: <cover.1309860717.git.paul.eggleton@linux.intel.com>
Date: Tue, 05 Jul 2011 11:29:13 +0100
Message-ID: <1309861753.20015.684.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] Qt4 QA error fix
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
X-List-Received-Date: Tue, 05 Jul 2011 10:33:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-05 at 11:14 +0100, Paul Eggleton wrote:
> This patch fixes several "wrong architecture" QA errors when building
> qt4-x11-free and qt4-embedded. This is really a stopgap as far as Qt4
> packaging goes however, there is still more cleanup work to be done.
> 
> The following changes since commit 2b3bf5350861f62435e2fdf1c56c8a02f4b1b4ac:
> 
>   xauth: upgrade from 1.05 to 1.06 (2011-07-04 12:45:01 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib paule/qt4-qa-fix
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qt4-qa-fix
> 
> Paul Eggleton (1):
>   qt4: ensure target packages don't include host binaries

Merged to master, thanks.

Richard



