Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QZQYx-0006Tc-Vv for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 18:46:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5MGgPVI006060
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 17:42:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05998-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 17:42:21 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5MGgI4r006054
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 17:42:18 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1308423290.git.paul.eggleton@linux.intel.com>
References: <cover.1308423290.git.paul.eggleton@linux.intel.com>
Date: Wed, 22 Jun 2011 17:42:01 +0100
Message-ID: <1308760921.20015.88.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] qt4-tools-nativesdk fixes
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
X-List-Received-Date: Wed, 22 Jun 2011 16:46:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-06-18 at 19:56 +0100, Paul Eggleton wrote:
> Several fixes for qt4-tools-nativesdk.
> 
> The following changes since commit 835d817f1ba7b99167743fdb86ba80f3a07bd82d:
> 
>   systemtap: remove non-core COMPATIBLE_MACHINES (2011-06-16 22:12:40 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib paule/qt4-nativesdk-fix
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qt4-nativesdk-fix
> 
> Paul Eggleton (3):
>   qt4-tools-nativesdk: fix unpack failure due to missing g++.conf
>   qt4-tools-nativesdk: drop freetype include as we build with
>     -no-freetype
>   qt4-tools-nativesdk: fix compile failure in src/dbus
> 

Merged to master, thanks.

Richard



