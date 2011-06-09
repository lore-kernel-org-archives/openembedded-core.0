Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QUixz-0006Qk-Tq for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 19:24:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p59HL5rw015765
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jun 2011 18:21:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15458-05 for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2011 18:21:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p59HKuhg015759
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jun 2011 18:20:56 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1307639649.git.mark.hatle@windriver.com>
References: <cover.1307639649.git.mark.hatle@windriver.com>
Date: Thu, 09 Jun 2011 18:20:46 +0100
Message-ID: <1307640046.15712.171.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] Fix realpath issue in pseudo
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
X-List-Received-Date: Thu, 09 Jun 2011 17:24:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-09 at 12:15 -0500, Mark Hatle wrote:
> When pseudo is running in disabled mode (most of the time in oe-core), the
> realpath function can fail on system systems.  This was discovered by some
> problems found in Qt MOC and qmake.
> 
> The change is from upstream, and has been verified by the person who 
> originally found the issue.
> 
> The following changes since commit d3e105451413617cf6415ae1600dc063f3d8d452:
> 
>   scripts/bitbake: Only build tar-replacement-native when the build system tar version < 1.24 (2011-06-09 16:32:03 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib mhatle/pseudo
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/pseudo
> 
> Mark Hatle (1):
>   pseudo: Fix problem related to realpath

Merged to master, thanks.

Richard



