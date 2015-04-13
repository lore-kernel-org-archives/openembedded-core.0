Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1C27D73D3C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 16:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3DGYUNH016432; Mon, 13 Apr 2015 17:34:30 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3pRC6Rv-bvCJ; Mon, 13 Apr 2015 17:34:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3DGYG43016425
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 13 Apr 2015 17:34:27 +0100
Message-ID: <1428942856.6976.81.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Lock <joshua.lock@collabora.co.uk>
Date: Mon, 13 Apr 2015 17:34:16 +0100
In-Reply-To: <1428939002-21170-1-git-send-email-joshua.lock@collabora.co.uk>
References: <1428939002-21170-1-git-send-email-joshua.lock@collabora.co.uk>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] oe-init-build-env: fix for build dirs that have spaces in their path
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
X-List-Received-Date: Mon, 13 Apr 2015 16:34:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-04-13 at 16:30 +0100, Joshua Lock wrote:
> Enclose expansions of BUILDDIR in quotes in order to correctly handle paths
> which include spaces.
> 
> Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>

Autotools cannot handle things with spaces so whilst this will fix the
environment setup part, I think you'll see sanity check warnings in
short order?

I did once start fixing this until I found it meant fixing auto* at
which point I gave up.

Cheers,

Richard


