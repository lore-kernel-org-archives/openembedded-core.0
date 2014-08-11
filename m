Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7159770B36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 10:26:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7BAQfHV031761; Mon, 11 Aug 2014 11:26:41 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QrkZ54vNv5yW; Mon, 11 Aug 2014 11:26:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7BAQYiC031756
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 11 Aug 2014 11:26:36 +0100
Message-ID: <1407752794.22187.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marek Vasut <marex@denx.de>
Date: Mon, 11 Aug 2014 11:26:34 +0100
In-Reply-To: <201408081422.19749.marex@denx.de>
References: <1407438629-13369-1-git-send-email-marex@denx.de>
	<3FD4F336-0653-4641-899F-DDD2AF178A20@dominion.thruhere.net>
	<201408081422.19749.marex@denx.de>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Yocto: Install full set of python modules in Qt SDK toolchain
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Aug 2014 10:26:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-08-08 at 14:22 +0200, Marek Vasut wrote:
> On Friday, August 08, 2014 at 07:22:04 AM, Koen Kooi wrote:
> > Since 'yocto' is a project like freedesktop.org your commit message doesn't
> > make sense, it should be something like:
> > 
> > meta-toolchain-qt:  Install full set of python modules
> 
> Got it, Saul also told me so. I will wait a bit for some more feedback and 
> repost with corrections, OK ? Is this approach I took here even correct please ?

I'd really like to see a packagegroup defined somewhere with this list
of python modules which the various recipes can then reference...

Cheers,

Richard


