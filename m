Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 79EE760107
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 13:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2RDfYmg009826; 
	Mon, 27 Mar 2017 14:41:34 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pX4Z4yf-Hw2Z; Mon, 27 Mar 2017 14:41:34 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2RDfWIo009822
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 27 Mar 2017 14:41:33 +0100
Message-ID: <1490622092.13980.266.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 27 Mar 2017 14:41:32 +0100
In-Reply-To: <5eab5be9-580f-d869-f7c0-b32d3e30daf3@linux.intel.com>
References: <20170324210816.13530-1-alexander.kanavin@linux.intel.com>
	<1490464615.13980.250.camel@linuxfoundation.org>
	<5eab5be9-580f-d869-f7c0-b32d3e30daf3@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCHv2] dnf: move the entire dnf/rpm4 stack to Python 3
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
X-List-Received-Date: Mon, 27 Mar 2017 13:41:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-03-27 at 15:19 +0300, Alexander Kanavin wrote:
> On 03/25/2017 07:56 PM, Richard Purdie wrote:
> > 
> > > 
> > > [YOCTO #11180]
> > So close but:
> > 
> > https://autobuilder.yocto.io/builders/nightly-multilib/builds/226
> > https://autobuilder.yocto.io/builders/nightly-x32/builds/206
> This is actually a bug in our target Python 3 installation. No idea
> how 
> it went unnoticed - does no one use Python 3 on target with multilib
> or 
> x32 at all?
> 
> 
> Python 3.5.2 (default, Mar 27 2017, 11:43:41)
> [GCC 6.3.0] on linux
> Type "help", "copyright", "credits" or "license" for more
> information.
>  >>> import site
>  >>> site.getsitepackages()
> ['/usr/lib/python3.5/site-packages']
>         ^^^ !!!

Highlights we need better testing, thanks for fixing it!

Cheers,

Richard

