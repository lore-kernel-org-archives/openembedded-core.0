Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6CB4876F8C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Apr 2016 21:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u33Lkht6001108; Sun, 3 Apr 2016 22:46:43 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GN7sm221meqi; Sun,  3 Apr 2016 22:46:43 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u33LkdFT001102
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 3 Apr 2016 22:46:40 +0100
Message-ID: <1459719999.7348.142.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Robert Yang
	<liezhi.yang@windriver.com>
Date: Sun, 03 Apr 2016 22:46:39 +0100
In-Reply-To: <CADkTA4NVbCvZwHt62hZzrV+NLpq0qytN_duRv8EigM12mUJs7g@mail.gmail.com>
References: <cover.1459677330.git.liezhi.yang@windriver.com>
	<637f6783157bb0e9449d153133485401bcf2dbb1.1459677330.git.liezhi.yang@windriver.com>
	<CADkTA4NVbCvZwHt62hZzrV+NLpq0qytN_duRv8EigM12mUJs7g@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-yocto 4.4: enable overlayfs by default
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
X-List-Received-Date: Sun, 03 Apr 2016 21:46:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2016-04-03 at 06:11 -0400, Bruce Ashfield wrote:
> 
> 
> On Sun, Apr 3, 2016 at 5:58 AM, Robert Yang <
> liezhi.yang@windriver.com> wrote:
> > So that iso can work well, otherwise the iso is readonly and there
> > would
> > be errors. The other way is aufs, but overlayfs is more pupolar and
> > had
> > been merged by kernel mainline, we need make iso work well by
> > default.
> Nope. As I mentioned before, this can't be a always on default. It
> will conflict
> with other unionFS use cases.
> 
> If you want overlayfs enabled, it needs to be triggered from a
> specific image
> or distro feature.

We can't change the kernel config from an image so it would have to be
a distro setting. Is there a problem with enabling both as modules btw?
I assume they can coexist?

Cheers,

Richard

