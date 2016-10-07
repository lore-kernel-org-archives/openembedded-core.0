Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0C221719B8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2016 15:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u97FqKsJ020661; Fri, 7 Oct 2016 16:52:20 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uPq8xgOifWnY; Fri,  7 Oct 2016 16:52:20 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u97FqIPq020657
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 7 Oct 2016 16:52:19 +0100
Message-ID: <1475855537.30475.636.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Maciej =?UTF-8?Q?Borz=C4=99cki?= <maciej.borzecki@rndity.com>, Fan Xin
	<fan.xin@jp.fujitsu.com>
Date: Fri, 07 Oct 2016 16:52:17 +0100
In-Reply-To: <CAD4b0_K4r+kUfUVAtcTSf--aJbUnbYttmRfvQdMGCiAikyo10w@mail.gmail.com>
References: <41bbea13-30ce-4d55-441c-ffdbb0f863f1@jp.fujitsu.com>
	<1475757767.3146.12.camel@linux.intel.com>
	<354af725-27e7-ba35-2a45-514151904c32@jp.fujitsu.com>
	<CAD4b0_K4r+kUfUVAtcTSf--aJbUnbYttmRfvQdMGCiAikyo10w@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: rpm: Recover RPM4 to OE-core
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
X-List-Received-Date: Fri, 07 Oct 2016 15:52:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-10-07 at 09:20 +0200, Maciej Borzęcki wrote:
> BTW. do you recall the rationale behind abandoning zypper in 1.4? I'm
> curious about the motivation for using smart given its Python
> dependency.

zypper didn't cross compile easily and had a fairly nasty dependency
chain if I remember rightly including things like boost. We had quite
an extensive patchset against it and libzypp which could never be
upstreamed:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=fcdc8d7f6d10b3abf9
f6a28cff55b1cc89b88bc9

zypper was also hostile to rpm5 if I remember rightly.

Switching to something python based was much lower overhead on the
system compared to C++ and boost.

Cheers,

Richard

