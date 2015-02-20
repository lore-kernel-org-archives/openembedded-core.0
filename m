Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 161886B6B7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 12:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1KCu1X6014411; Fri, 20 Feb 2015 12:56:01 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rzUOayNTWc1L; Fri, 20 Feb 2015 12:56:01 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t1KCtjWM014408
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Feb 2015 12:55:56 GMT
Message-ID: <1424436945.11836.46.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Feb 2015 12:55:45 +0000
In-Reply-To: <f2524b85ea338525d78147b4bd90d2a1f3f3790d.1424405852.git.raj.khem@gmail.com>
References: <e879427a035a12a0b9040ff948fe3e22618412b8.1424405852.git.raj.khem@gmail.com>
	<f2524b85ea338525d78147b4bd90d2a1f3f3790d.1424405852.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] util-linux, util-linux-libs: Build and package util-linux libs separately
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
X-List-Received-Date: Fri, 20 Feb 2015 12:56:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-02-20 at 04:24 +0000, Khem Raj wrote:
> We have a catch-22 where systemd->libmount(util-linux) ->
> libssytemd(systemd)
> 
> This patch breaks the dependency loop by building and packaging libraries from
> util-linux package in a separate package.

Every time we're tried to split a piece of software into two like this
it has been a world  of pain. Are we sure there is no alternative to
this?

I'm *very* nervous about this :(

Cheers,

Richard


