Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QcPaq-0003hG-3x for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 00:20:16 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5UMGTmB027636;
	Thu, 30 Jun 2011 23:16:29 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25755-08; Thu, 30 Jun 2011 23:16:25 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5UMGNfd027618
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 30 Jun 2011 23:16:23 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1309431042-14267-1-git-send-email-koen@dominion.thruhere.net>
References: <1309431042-14267-1-git-send-email-koen@dominion.thruhere.net>
Date: Thu, 30 Jun 2011 23:16:04 +0100
Message-ID: <1309472164.20015.467.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@www.linuxtogo.org, Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] eglibc: make eglibc-utils list explicit to avoid dragging localedef
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
X-List-Received-Date: Thu, 30 Jun 2011 22:20:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-30 at 12:50 +0200, Koen Kooi wrote:
> This fixes the following regression:
> 
>  * check_data_file_clashes: Package eglibc-utils wants to install file /usr/bin/localedef
>         But that file is already provided by package  * localedef
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>

This patch was a bit ugly and I've merged something simpler which didn't
need the hardcoded list :)

Cheers,

Richard



