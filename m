Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D8D8960745
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 17:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0IHHJRn030216; Mon, 18 Jan 2016 17:17:19 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gVJXKHXu4RjT; Mon, 18 Jan 2016 17:17:19 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0IHHH9E030211
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 18 Jan 2016 17:17:18 GMT
Message-ID: <1453137437.27999.72.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexander.kanavin@linux.intel.com
Date: Mon, 18 Jan 2016 17:17:17 +0000
In-Reply-To: <57332.10.252.12.252.1453140051.squirrel@linux.intel.com>
References: <cover.1450364672.git.alexander.kanavin@linux.intel.com>
	<e51f04160f355bc12130d556a49f6f525ac12913.1450364672.git.alexander.kanavin@linux.intel.com>
	<CAJTo0LaCS-MeOUOUiBPNbhuBry3b5fo-5eR-JtREigUyav_39g@mail.gmail.com>
	<5682ACB5.4060005@linux.intel.com>
	<57332.10.252.12.252.1453140051.squirrel@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/17] nss: update to 3.21
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
X-List-Received-Date: Mon, 18 Jan 2016 17:17:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-01-18 at 20:00 +0200, alexander.kanavin@linux.intel.com
wrote:
> > The third failure is probably a gcc 4.8 issue on opensuse 13.1. I
> > can't
> > reproduce it here. Would you be able to develop a fix? Or we can
> > try
> > again when upstream makes a new release.
> 
> Oh, I just noticed that opensuse 13.1 has been removed from
> SANITY_TESTED_DISTROS in March 2015, so why is it still used to test
> the
> builds? Should I still try to fix the build failure?

We have one autobuilder which is opensuse 13.1:

https://autobuilder.yoctoproject.org/main/buildslaves

so it does need to work. When they builders are due for upgrades I
don't know.

Cheers,

Richard

