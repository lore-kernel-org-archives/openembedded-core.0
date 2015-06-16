Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1D7A67413A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 14:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5GEWssY013718; Tue, 16 Jun 2015 15:32:54 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id F5N_YLRgAxPB; Tue, 16 Jun 2015 15:32:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5GEWffM013709
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 16 Jun 2015 15:32:53 +0100
Message-ID: <1434465161.19270.17.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Changhyeok Bae <changhyeok.bae@lge.com>
Date: Tue, 16 Jun 2015 15:32:41 +0100
In-Reply-To: <022401d0a7f5$f1102e60$d3308b20$@lge.com>
References: <1433826505-23893-1-git-send-email-changhyeok.bae@lge.com>
	<1434351291.28975.265.camel@linuxfoundation.org>
	<022401d0a7f5$f1102e60$d3308b20$@lge.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: =?UTF-8?Q?=EC=9D=B4=EB=AA=85=EA=B5=AC?= <myonggu.lee@lge.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] {python, python3}-native: fix TypeError
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
X-List-Received-Date: Tue, 16 Jun 2015 14:33:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-06-16 at 14:33 +0900, Changhyeok Bae wrote:
> Doesn't this mean BUILD_SYS or HOST_SYS weren't set in the environment?
> -> You're right. The default env value of BUILD_SYS and HOST_SYS is "" (empty).
> -> I wonder that the original patch (12-distutils-prefix-is-inside-staging-area.patch) to add  is required?
> 
> Wouldn't this patch just mean you get a value of something like "None"?
> -> My patch is to prevent errors in runtime.
> -> Do you have any other good idea?

My concern is that just having a value of "None" means the code trying
to use this variable will probably do the wrong thing. We should try and
fix the underlying problem of BUILD_SYS bot being set when it should be,
rather than just hide the runtime error.

How you do that depends on when the runtime error is occurring which I
know little about...

Cheers,

Richard




