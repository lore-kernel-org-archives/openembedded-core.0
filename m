Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DC7A865D5F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 10:04:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7BA3qIY030753; Mon, 11 Aug 2014 11:04:54 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id v8L7wBLE-jnO; Mon, 11 Aug 2014 11:04:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7BA4mT1030776
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 11 Aug 2014 11:04:49 +0100
Message-ID: <1407751488.22187.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 11 Aug 2014 11:04:48 +0100
In-Reply-To: <1407575476-15945-1-git-send-email-koen@dominion.thruhere.net>
References: <1407575476-15945-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dora][backport][PATCH] kernel: don't copy .so.dbg files into kernel source install
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
X-List-Received-Date: Mon, 11 Aug 2014 10:04:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2014-08-09 at 11:11 +0200, Koen Kooi wrote:
> From: Bruce Ashfield <bruce.ashfield@windriver.com>
> 
> In 3.16+ x86-64 kernel builds produce a vdso64.so.dbg file. If this file is
> copied into the kernel source install multiple QA failures are triggered.
> Specifically, this file triggers a debug package split that results in
> files installed but not shipped, and invalid .debug file errors.
> 
> By ensuring that .so files are not copied, we avoid this incorrect split
> with no impact on future build phases.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/classes/kernel.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Was this mean for daisy, not dora? It doesn't apply to dora but did for
daisy...

Cheers,

Richard


