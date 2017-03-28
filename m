Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C23F377AA9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 23:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2SN2foU016158; 
	Wed, 29 Mar 2017 00:02:41 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rCVWyBbmu_bW; Wed, 29 Mar 2017 00:02:41 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2SN2cEk016155
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 29 Mar 2017 00:02:40 +0100
Message-ID: <1490742158.13980.296.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Bergin <peter@berginkonsult.se>,
	openembedded-core@lists.openembedded.org
Date: Wed, 29 Mar 2017 00:02:38 +0100
In-Reply-To: <1490731726-14536-1-git-send-email-peter@berginkonsult.se>
References: <1490731726-14536-1-git-send-email-peter@berginkonsult.se>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] busybox: move default config fragments to defconfig
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
X-List-Received-Date: Tue, 28 Mar 2017 23:02:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-03-28 at 22:08 +0200, Peter Bergin wrote:
> Move config fragments that are unconditionally and always applied
> to the configuration to the default defconfig file. This will
> make it easier to provide your own defconfig file for your target.
> 
> The problem this commit will solve is that if you provide your own
> defconfig file for your target it will be tampered with by the
> configuration fragments in SRC_URI. If you not want those
> configurations in your own setup you have to modify SRC_URI
> variable in your setup. As those confguration fragment was always
> applied it is a better solution to have them in the default
> defconfig file instead.

This basically removes any standard feature grouping from being used in
the base busybox recipe. I don't think this is something we want to
encourage, I'd actually like to see more feature group usage.

So we need to find some other way of solving your issue.

Cheers,

Richard

