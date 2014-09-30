Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3B58E6FC68
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 08:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8U8pJ2x022098; Tue, 30 Sep 2014 09:51:19 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iYCbpXCefUoJ; Tue, 30 Sep 2014 09:51:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8U8pE5c022091
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 30 Sep 2014 09:51:16 +0100
Message-ID: <1412067107.6893.33.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 30 Sep 2014 09:51:47 +0100
In-Reply-To: <18401A03-E69C-43BB-9956-13955179B13A@dominion.thruhere.net>
References: <1411802545-17081-1-git-send-email-koen@dominion.thruhere.net>
	<1411802545-17081-2-git-send-email-koen@dominion.thruhere.net>
	<1412024343.2853314.173154429.5067015A@webmail.messagingengine.com>
	<18401A03-E69C-43BB-9956-13955179B13A@dominion.thruhere.net>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] systemd 216: add system user factory files to CONFFILES
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
X-List-Received-Date: Tue, 30 Sep 2014 08:51:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-09-30 at 09:39 +0200, Koen Kooi wrote:
> Op 29 sep. 2014, om 22:59 heeft Colin Walters <walters@verbum.org> het volgende geschreven:
> 
> > 
> > 
> > On Sat, Sep 27, 2014, at 03:22 AM, Koen Kooi wrote:
> > 
> >> +                ${libdir}/sysusers.d/systemd.conf \
> >> +                ${libdir}/sysusers.d/basic.conf \
> > 
> > Admins aren't expected to edit these - instead you override in /etc.  Or
> > change /etc/passwd after the user has been created, and your changes
> > will be respected.
> 
> The real question is: do we want to keep changes to these files on package upgrade or wipe them out?

or should we encourage users to edit the files that are supposed to be
edited? 

You could argue this for every file on the system, binaries and all :/.

Cheers,

Richard



