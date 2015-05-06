Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9AD4A73BB8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 21:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t46LX2uD031336; Wed, 6 May 2015 22:33:02 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eLvahiG0QfI0; Wed,  6 May 2015 22:33:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t46LWkxC031333
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 6 May 2015 22:32:58 +0100
Message-ID: <1430947966.8074.108.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Wed, 06 May 2015 22:32:46 +0100
In-Reply-To: <554A536C.5060608@windriver.com>
References: <cover.1430443583.git.bruce.ashfield@windriver.com>
	<1430521154.18360.28.camel@linuxfoundation.org>
	<55440C90.5060605@windriver.com> <20150502081346.GD2366@jama>
	<55458D0D.6070904@windriver.com> <20150506144241.GA2067@jama>
	<554A2C1C.5040304@windriver.com> <20150506153325.GB2067@jama>
	<1430927086.8074.65.camel@linuxfoundation.org>
	<20150506160708.GD2067@jama> <554A536C.5060608@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] linux-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 06 May 2015 21:33:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-05-06 at 13:46 -0400, Bruce Ashfield wrote:
> On 2015-05-06 12:07 PM, Martin Jansa wrote:
> > I've used master-next week or two ago (mostly to test bluez4 and python3
> > changes) and soon after that dropped all linux-yocto related changes
> > from it assuming that it's indeed cause for the issues I'm seeing, but
> > it's not and it's still failing with master as well (and my
> > jenkins/world builds are just small portion of my builds executed
> > elsewhere where I see similar issues).
> 
> Richard: How can we sort out the differences between the build
> environment that Martin uses versus what the autobuilder is showing?
> 
> There's nothing particularly complex happening during that build,
> it's a checkout and generation of a config.
> 
> I'm unable to reproduce any of the failures, and neither is the
> autobuilder.

This is a tough one and I'm struggling a little. We could try looking at
the tmp/stamps/qemux86-poky-linux/linux-yocto/* files (sigdata in
particular) as well as
tmp/work/qemux86-poky-linux/linux-yocto/*/temp/log.task_order

Martin, would you be able to share the above somewhere? I'm hoping this
would give us a clue as to what the difference is between the builds and
allow us to reproduce the problem.

Cheers,

Richard



