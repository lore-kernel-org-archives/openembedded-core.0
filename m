Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D5FCE6FF30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 22:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3CM3OnD007404; Tue, 12 Apr 2016 23:03:24 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HIgb_B4W-JwZ; Tue, 12 Apr 2016 23:03:24 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3CM3KWj007401
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 12 Apr 2016 23:03:21 +0100
Message-ID: <1460498600.9308.71.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>, Robert Yang
	<liezhi.yang@windriver.com>, openembedded-core@lists.openembedded.org
Date: Tue, 12 Apr 2016 23:03:20 +0100
In-Reply-To: <570CEB0D.7090701@windriver.com>
References: <cover.1460442964.git.liezhi.yang@windriver.com>
	<0877ab068513b9720c808aaeb0c8a90f9a45afc3.1460442964.git.liezhi.yang@windriver.com>
	<570CEB0D.7090701@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] linux-yocto-tiny: fix KBRANCH
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
X-List-Received-Date: Tue, 12 Apr 2016 22:03:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-04-12 at 08:33 -0400, Bruce Ashfield wrote:
> On 2016-04-12 2:36 AM, Robert Yang wrote:
> > Fixed:
> > WARNING: linux-yocto-tiny-4.4.3+gitAUTOINC+770996a263_73481a3abd-r0
> > do_patch: After meta data application, the kernel tree branch is
> > standard/tiny/common-pc. The
> > WARNING: linux-yocto-tiny-4.4.3+gitAUTOINC+770996a263_73481a3abd-r0
> > do_patch: SRC_URI specified branch standard/tiny/base. The branch
> > will be forced to standard/tiny/base,
> > WARNING: linux-yocto-tiny-4.4.3+gitAUTOINC+770996a263_73481a3abd-r0
> > do_patch: but this means the board meta data (.scc files) do not
> > match the SRC_URI specification.
> > WARNING: linux-yocto-tiny-4.4.3+gitAUTOINC+770996a263_73481a3abd-r0
> > do_patch: The meta data and branch standard/tiny/base should be
> > inspected to ensure the proper
> > WARNING: linux-yocto-tiny-4.4.3+gitAUTOINC+770996a263_73481a3abd-r0
> > do_patch: kernel is being built.
> > 
> > Use standard/tiny/common-pc which is pointed by the .scc to fix
> > problem.
> > Btw, standard/tiny/base and standard/tiny/common-pc points to the
> > same
> > commit id.
> 
> When tiny eventually supports more architectures/boards we'll have
> to change this again, but for the 2.1 release this is the change
> with the least impact.
> 
> Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> 
> I can pick this patch up and put it in my queue, speak now if someone
> else is going to grab it.

I took this into -next on the basis that its better if I can test
things sooner. The tiny build passed so I can merge this if
appropriate.

Cheers,

Richard

