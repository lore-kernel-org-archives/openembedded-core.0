Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QcmHP-0008D5-Vj for openembedded-core@lists.openembedded.org;
	Sat, 02 Jul 2011 00:33:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p61MTwi9021719
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jul 2011 23:29:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21446-08 for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2011 23:29:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p61MTovd021713
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jul 2011 23:29:50 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
In-Reply-To: <cover.1309533254.git.richard.purdie@linuxfoundation.org>
References: <cover.1309533254.git.richard.purdie@linuxfoundation.org>
Date: Fri, 01 Jul 2011 23:29:28 +0100
Message-ID: <1309559368.20015.565.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/6] QA Warnings Cleanup
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
X-List-Received-Date: Fri, 01 Jul 2011 22:33:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-01 at 16:17 +0100, Richard Purdie wrote:
> The following changes since commit 40ecaf6a59ba61e72d29d7e677197ef37c998408:
> 
>   uclibc: Add default uClibc.machine files (2011-07-01 00:40:10 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib rpurdie/master
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rpurdie/master
> 
> and clean up a variety of different QA warning issues
> 
> Richard  Purdie (6):
>   cairo: Clean up packaging and fix warnings
>   kernel.bbclass: Ensure kernel/* internal sysroot working directory
>     don't get packaged
>   libpcre: Fix QA warnings
>   python: Ensure libpython.so ends up in the .dev package
>   beecrypt: Fix up packaging QA warnings
>   insane.bbclass: Start to rework this so specific checks can be easily
>     made warnings/errors

I've merged these to master since the work well with the other QA
cleanups we're merging.

The SOLIBS variable discussion can happen and be followed up on later.

Cheers,

Richard



