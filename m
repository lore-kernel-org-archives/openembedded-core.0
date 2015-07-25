Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 517ED73CBD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jul 2015 23:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6PNOYNN027131; Sun, 26 Jul 2015 00:27:17 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Eu5vd0tviTL2; Sun, 26 Jul 2015 00:27:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6PNR2jd027233
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 26 Jul 2015 00:27:13 +0100
Message-ID: <1437866822.821.178.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>
Date: Sun, 26 Jul 2015 00:27:02 +0100
In-Reply-To: <55B31E95.2010906@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
	<1437723284.821.143.camel@linuxfoundation.org>
	<55B31E95.2010906@gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/25] Dizzy next for .3
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
X-List-Received-Date: Sat, 25 Jul 2015 23:27:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-07-24 at 22:28 -0700, akuster808 wrote:
> On 07/24/2015 12:34 AM, Richard Purdie wrote:
> > On Sat, 2015-07-18 at 08:16 -0700, Armin Kuster wrote:
> > We therefore need to decide whether to backport the gcc5 host fixes back
> > to 1.7.3 or whether we have to disable autobuilders in order to be able
> > to build it...
> 
> I found the answer on 
> https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance
> 
> "The primary focus for stable branches is bugfixing, security updates, 
> and making sure that builds on recently released Ubuntu, Fedora, and 
> OpenSUSE distros work"
> 
> so we should back port the gcc5 host fixes. Is that something I need to ?

If we choose to do it (the above says its within policy) then someone
needs to. It would certainly make life easier on the autobuilder.

I've attempted the low hanging fruit with the patches in:
http://git.yoctoproject.org/cgit.cgi/poky/log/?h=dizzy-next
which get ncurses-native, cross-localedef-native and binutils-native
working at least...

Cheers,

Richard



