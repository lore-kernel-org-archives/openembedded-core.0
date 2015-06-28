Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9045F607BB
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jun 2015 12:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5SCJcXI026071; Sun, 28 Jun 2015 13:19:38 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Tr4Bl5zupJ1P; Sun, 28 Jun 2015 13:19:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t5SCJOxV026065
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 28 Jun 2015 13:19:35 +0100
Message-ID: <1435493964.7287.1.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jack Mitchell <ml@communistcode.co.uk>
Date: Sun, 28 Jun 2015 13:19:24 +0100
In-Reply-To: <55818E59.5040807@communistcode.co.uk>
References: <55818E59.5040807@communistcode.co.uk>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: subversion configure failure
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
X-List-Received-Date: Sun, 28 Jun 2015 12:19:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-06-17 at 16:12 +0100, Jack Mitchell wrote:
> Seems to be some sort of python script failure? Is anyone else seeing 
> this? I've dug around a little but can't see anything obvious.

This turns out to be due to:

configure: error: failed to recognize APR_INT64_T_FMT on this platform

which is due to gcc5 and the lack of -P in CPPFLAGS. I've just pushed a
change for this to master and fido.

The python issue is something else and not fatal.

Cheers,

Richard


