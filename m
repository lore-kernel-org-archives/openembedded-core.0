Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QQwpv-0000er-Hl for openembedded-core@lists.openembedded.org;
	Mon, 30 May 2011 09:24:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4U7L5fg031042;
	Mon, 30 May 2011 08:21:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30738-06; Mon, 30 May 2011 08:21:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4U7KvqA031036
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 30 May 2011 08:20:57 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yu Ke <ke.yu@intel.com>
In-Reply-To: <cover.1306737527.git.ke.yu@intel.com>
References: <cover.1306737527.git.ke.yu@intel.com>
Date: Mon, 30 May 2011 08:20:45 +0100
Message-ID: <1306740045.27470.326.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] Fix powerpc xserver dlopen issue
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
X-List-Received-Date: Mon, 30 May 2011 07:24:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-05-30 at 14:40 +0800, Yu Ke wrote:
> Fix Yocto bug 736, 737
> 
> The following changes since commit c412674cf818e77e35857fb93353e392e7ac9e53:
>   Khem Raj (1):
>         package.bbclass,prserv.bbclass: Compare USE_PR_SERV with "1" or "0"
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib kyu3/dl-issue
>   http://git.pokylinux.org/cgit.cgi//log/?h=kyu3/dl-issue
> 
> Yu Ke (1):
>   site/powerpc-common: remove the incorrect dlopen default setting

Merged to master, thanks.

Richard



