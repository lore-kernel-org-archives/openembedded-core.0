Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3CA1B6FF4E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 07:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2U7WuIG011046; Wed, 30 Mar 2016 08:32:56 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id a3vF1TwmIJ8f; Wed, 30 Mar 2016 08:32:56 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2U7WnfY011041
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 30 Mar 2016 08:32:51 +0100
Message-ID: <1459323169.21672.46.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bill Randle <william.c.randle@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 30 Mar 2016 08:32:49 +0100
In-Reply-To: <1459290421-9838-1-git-send-email-william.c.randle@intel.com>
References: <1459290421-9838-1-git-send-email-william.c.randle@intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCHv3] man: fix several annoying compile/build warnings
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
X-List-Received-Date: Wed, 30 Mar 2016 07:32:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-03-29 at 15:27 -0700, Bill Randle wrote:
> Fixed the build error when building man.config.5 (a remnant of a long
> ago previous patch). Optimized the manpages Makefile for parallel
> builds. Drop a FHS patch that is no longer needed, as the standard
> Makefile puts the man pages in the proper location. Also, fix compile
> warnings in a couple other files.
> 
> [YOCTO #9341]
> 
> Signed-off-by: Bill Randle <william.c.randle@intel.com>
> ---
> [Note: should be applied after previous man patch "fix src/Makefile
> to work with parallel make".]
> 
> v3: clean up patch submission for mailing list

These two were applied in the build yet we saw:

https://autobuilder.yoctoproject.org/main/builders/nightly-x86-lsb/buil
ds/718/steps/BuildImages/logs/stdio

Cheers,

Richard

