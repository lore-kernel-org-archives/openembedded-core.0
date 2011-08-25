Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QwbUa-0004sL-Bi for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 17:05:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7PF0TAE031144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 16:00:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30441-04 for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 16:00:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7PF0LDw031138
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2011 16:00:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1314257326.1332.45.camel@localhost.localdomain>
References: <cover.1314246387.git.bruce.ashfield@windriver.com>
	<1314257326.1332.45.camel@localhost.localdomain>
Date: Thu, 25 Aug 2011 08:00:18 -0700
Message-ID: <1314284418.5939.197.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: does it support mercurial?
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
X-List-Received-Date: Thu, 25 Aug 2011 15:05:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-25 at 15:28 +0800, Ni Qingliang wrote:
> It looks like the bitbake support 'hg' fetcher, but when building custom
> package, it said need "mercurial-native", but there is no "mercurial"
> package in recipes-devtools, of cause, I installed mercurial on host pc.
> 
> Does anyone can confirm this problem???

You can add:

ASSUME_PROVIDED += "mercurial-native"

to local.conf to show you have installed mercurial and that bitbake
should use it.

Cheers,

Richard



