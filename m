Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfE5G-0003aF-Pv for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 18:39:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68GZR1R021918
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 17:35:27 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21561-07 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2011 17:35:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68GZKpb021912
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 17:35:20 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1310059749.git.paul.eggleton@linux.intel.com>
References: <cover.1310059749.git.paul.eggleton@linux.intel.com>
Date: Fri, 08 Jul 2011 17:34:41 +0100
Message-ID: <1310142881.20015.907.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] QA warning fixes
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
X-List-Received-Date: Fri, 08 Jul 2011 16:39:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-07 at 18:32 +0100, Paul Eggleton wrote:
> I found a couple of issues with the recent insane.bbclass changes. The
> following patches fix them as well as add a warning fix for something I
> noticed when building a kernel with LIRC support.
> 
> The following changes since commit f1fc6d084b079dea21ff1a30b815496452042490:
> 
>   pulseaudio: add 0.9.23 (2011-07-07 13:44:36 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib paule/qa-dev-deps
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qa-dev-deps
> 
> Paul Eggleton (3):
>   insane.bbclass: allow dev-deps to be skipped via INSANE_SKIP
>   insane.bbclass: fix error/warning status being inverted
>   kernel.bbclass: prevent QA warning about kernel-module-lirc-dev

I've taken the first two patches, thanks. In the third case, I think we
have bigger problems for both -dbg and -dev packages matching in kernel
module space. We should probably disable those two checks for all kernel
modules somehow...

Cheers,

Richard



