Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 90C0B60746
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 07:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4O7KGcn002517; Tue, 24 May 2016 08:20:16 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Xp37rOxQhpZH; Tue, 24 May 2016 08:20:16 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4O7KDma002514
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 24 May 2016 08:20:14 +0100
Message-ID: <1464074413.9570.32.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, Robert Yang
	<liezhi.yang@windriver.com>
Date: Tue, 24 May 2016 08:20:13 +0100
In-Reply-To: <1700462.EZHnc1sg49@peggleto-mobl.ger.corp.intel.com>
References: <cover.1464060246.git.liezhi.yang@windriver.com>
	<1551285.Qn0PiMd4j4@peggleto-mobl.ger.corp.intel.com>
	<5743CCB0.3030105@windriver.com>
	<1700462.EZHnc1sg49@peggleto-mobl.ger.corp.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] remove unneeded python2 recipes
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
X-List-Received-Date: Tue, 24 May 2016 07:20:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-05-24 at 15:53 +1200, Paul Eggleton wrote:
> I had missed that change; that puts us into a bit of an interesting
> situation. 
> buildtools-tarball is provided in order to support bitbake builds on
> hosts 
> that don't have the required tools, but the changes required to
> support python 
> 3 in the build system itself haven't been merged to master yet. So
> unless I'm 
> missing something at the moment have a version of buildtools that
> doesn't 
> actually support running the build system?

Its a chicken and egg problem in that we have autobuilders which don't
have python3 of the right version. Rather than build a special version
of the tarball from a branch, I merged this patch set on the basis that
anyone needing a python2 tarball could easily us the version from
before the patches merged and that we would be moving to python3 soon
everywhere.

Cheers,

Richard





