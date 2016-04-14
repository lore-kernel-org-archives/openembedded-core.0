Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C6B8F6E682
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Apr 2016 10:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3EAewM9004085; Thu, 14 Apr 2016 11:40:58 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1N_ERd-bb9Gy; Thu, 14 Apr 2016 11:40:58 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3EAetmZ004072
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 14 Apr 2016 11:40:56 +0100
Message-ID: <1460630455.9308.168.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Otavio Salvador
	<otavio.salvador@ossystems.com.br>
Date: Thu, 14 Apr 2016 11:40:55 +0100
In-Reply-To: <1460564978.9308.95.camel@linuxfoundation.org>
References: <cover.1460467072.git.pkj@axis.com>
	<7251ce8da0aed3f9ad921daa66186a2c2fc6a932.1460467072.git.pkj@axis.com>
	<1460472857.9308.63.camel@linuxfoundation.org>
	<CAP9ODKobRBigE8Wur600MDdFgL+Z-3C7noAJyWfsjTE8d18vBA@mail.gmail.com>
	<4550e71bd1f24135a2f6978294e25f94@XBOX02.axis.com>
	<1460545515.9308.85.camel@linuxfoundation.org>
	<5715165f841f46d0a50fb951acfbf0ac@XBOX02.axis.com>
	<1460564978.9308.95.camel@linuxfoundation.org>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/1] Revert "useradd.bbclass: remove user/group created by the package in clean* task"
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
X-List-Received-Date: Thu, 14 Apr 2016 10:41:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-04-13 at 17:29 +0100, Richard Purdie wrote:
> There is a comparatively neat way we could use pkgdata to track the
> provider of a given user, specifically:
> 
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/w
> ip
> &id=5cd646ea185eaafaa341f26310f2eddc75766175
> 
> The above is a quick patch I've just put together which illustrates
> what could be done so that the user gets better warnings about
> conflicting users. It needs cleaning up but thought it worth sharing
> now as if might give some ideas.
> 
> This is in keeping with how bitbake detects multiple providers of the
> same thing.

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/wip
&id=a362e6da0eec1f7a7d4db19d47f16b1c729562ba

is an improved version.

> > Here I must show my lack of knowledge. How and where should I go
> > about 
> > adding a regression test that verifies the support for that
> > multiple 
> > recipes can add the same user/group? Since this does not test a 
> > specific recipe, but rather a part of the build framework, I do not
> > know if, e.g., ptest is applicable (of which I have no experience 
> > either).
> 
> oe-selftest would be the place to add something like this, see the
>  /meta/lib/oeqa/selftest directory. We could add some test useradd
> recipes to meta-selftest.

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=rpurdie/wip
&id=23134a7d837bc7985ba8e7069d405913c2055a04

is a really simplistic new selftest for useradd. It does however test
the bug the original patch fixes. There are clearly a much wider range
of things it could test, I just wanted to show this isn't hard.

Cheers,

Richard




