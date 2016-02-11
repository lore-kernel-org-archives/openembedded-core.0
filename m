Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6244D731D8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 15:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1BFHU6X004906; Thu, 11 Feb 2016 15:17:30 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iGk221Lyta3N; Thu, 11 Feb 2016 15:17:30 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1BFHSxb004902
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 11 Feb 2016 15:17:29 GMT
Message-ID: <1455203848.16142.259.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>
Date: Thu, 11 Feb 2016 15:17:28 +0000
In-Reply-To: <20160211145934.GA10092@mcrowe.com>
References: <1455192761.16142.257.camel@linuxfoundation.org>
	<20160211145934.GA10092@mcrowe.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cdrtools-native: Explicitly set EXTRA_OEMAKE as required
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
X-List-Received-Date: Thu, 11 Feb 2016 15:17:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-02-11 at 14:59 +0000, Mike Crowe wrote:
> On Thursday 11 February 2016 at 12:12:41 +0000, Richard Purdie wrote:
> > This recipe currently relies on EXTRA_OEMAKE having been set to
> > "-e MAKEFLAGS=" in bitbake.conf to operate. It is necessary to make
> > this
> > explicit so that the default in bitbake.conf can be change
> 
> Minor typo at the end of the log message.
> 
> Good catch. It appears that such -native packages aren't included in
> world
> so my testing didn't find it. :(
> 
> I've not found anything more over the last few days of test builds.

Things looked pretty clean on the autobuilder other than this so its
looking pretty good!

Cheers,

Richard

