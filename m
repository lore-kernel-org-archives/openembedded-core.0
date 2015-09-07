Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C4A6260017
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 21:15:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t87LFdm6010785; Mon, 7 Sep 2015 22:15:39 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MFQFHUMQIjyr; Mon,  7 Sep 2015 22:15:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t87LFOMQ010776
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 7 Sep 2015 22:15:35 +0100
Message-ID: <1441660524.24871.269.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 07 Sep 2015 22:15:24 +0100
In-Reply-To: <E437DE0B-65F0-42B4-B061-BC30F27A24B8@gmail.com>
References: <cover.1441552859.git.raj.khem@gmail.com>
	<1441654013.24871.259.camel@linuxfoundation.org>
	<4A72FD2B-1B79-4827-B02E-E3B23A966AE7@gmail.com>
	<1441659401.24871.261.camel@linuxfoundation.org>
	<956735BC-7AA6-4513-AA09-3FBFD3250428@gmail.com>
	<1441660176.24871.268.camel@linuxfoundation.org>
	<E437DE0B-65F0-42B4-B061-BC30F27A24B8@gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Systemd Upgrade
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
X-List-Received-Date: Mon, 07 Sep 2015 21:15:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2015-09-07 at 14:12 -0700, Khem Raj wrote:
> > On Sep 7, 2015, at 2:09 PM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Mon, 2015-09-07 at 14:00 -0700, Khem Raj wrote:
> >>> On Sep 7, 2015, at 1:56 PM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> >>> 
> >>> A "bitbake core-image-sato -c testimage" replicated it here FWIW, have
> >>> you tried testimage to see if that somehow makes a difference? Shoudn't
> >>> be hard to test with that and for sato, it should run pretty quickly.
> >>> 
> >>> It all works with 219, its only the upgrade patches that seem to break
> >>> things :(
> >> 
> >> yeah my machine is w/o X and moreover I don’t have sudo on it test image seems to need X
> >> I will try to build core-image-sato and try to reproduce it locally. in order to analyze
> >> systemd defect it needs to be reproducible outside testimage infra anyway.
> > 
> > I believe the tests will run with the nographic options to qemu which
> > then won't need X, Ross had a patch around for that recently. To be
> > honest when looking at this kind of issue, I usually debug it using
> > testimage now, its actually easier in many cases…
> 
> in this case it will be faster. Care to point to Ross’s patch ?

http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=ross/mut&id=e67ab458ab2d67908d80f9aa1954dee05cb21fc1

Cheers,

Richard


