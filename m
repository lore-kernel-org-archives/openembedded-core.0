Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 20E52737EE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 09:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t389f9aD030642; Wed, 8 Apr 2015 10:41:09 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id l-AJwDuSyQKf; Wed,  8 Apr 2015 10:41:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t389erR7030625
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 8 Apr 2015 10:41:05 +0100
Message-ID: <1428486053.14020.497.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Wed, 08 Apr 2015 10:40:53 +0100
In-Reply-To: <90edd11cb3c867c6c677d97be6a22b9504132879.1428405830.git.liezhi.yang@windriver.com>
References: <cover.1428405830.git.liezhi.yang@windriver.com>
	<90edd11cb3c867c6c677d97be6a22b9504132879.1428405830.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 08/10] groff: 1.22.2 -> 1.22.3
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
X-List-Received-Date: Wed, 08 Apr 2015 09:41:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-04-07 at 04:24 -0700, Robert Yang wrote:
> * Updated groff-1.22.2-correct-man.local-install-path.patch
> * Add perl to RDEPENDS_groff since /usr/bin/perf is a perl script now.

perf -> perl

and this caused failures on some build machines due to /bin/perl rather
than /usr/bin/perl:

http://errors.yoctoproject.org/Errors/Search/?items=10&query=54290cf402fcf85d2b596316666b62045bf534f2

We'll need to ensure the header on the file is correct as we do in some
other recipes.

Cheers,

Richard


