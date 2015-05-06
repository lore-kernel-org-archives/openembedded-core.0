Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 989F660138
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 15:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t46FiBjr006822; Wed, 6 May 2015 16:44:58 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id am1Rc-gTdEoi; Wed,  6 May 2015 16:44:58 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t46Filpp006856
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 6 May 2015 16:44:58 +0100
Message-ID: <1430927086.8074.65.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 06 May 2015 16:44:46 +0100
In-Reply-To: <20150506153325.GB2067@jama>
References: <cover.1430443583.git.bruce.ashfield@windriver.com>
	<1430521154.18360.28.camel@linuxfoundation.org>
	<55440C90.5060605@windriver.com> <20150502081346.GD2366@jama>
	<55458D0D.6070904@windriver.com> <20150506144241.GA2067@jama>
	<554A2C1C.5040304@windriver.com> <20150506153325.GB2067@jama>
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
X-List-Received-Date: Wed, 06 May 2015 15:45:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-05-06 at 17:33 +0200, Martin Jansa wrote:
> On Wed, May 06, 2015 at 10:58:36AM -0400, Bruce Ashfield wrote:
> > On 2015-05-06 10:42 AM, Martin Jansa wrote:
> > At this point, all I can say is file a bug. My builds of the same
> > board work, and the autobuilder show up green.
> > 
> > That screams race condition, so I'll look into it from that angle.
> 
> I'm considering providing simple old-style recipes for vanilla kernels
> and using them in my jenkins builds instead linux-yocto, because kernel
> shouldn't block testing other recipes from meta-oe and other layers as
> often as linux-yocto does.

I wasn't aware of linux-yocto breaking that often?

I am aware that:

* we have a race issue with shared_work which we're trying to resolve
  and its proving tricky to find a patch which doesn't break builds

* we have the newly reported issue in this thread. FWIW the builders 
  I've seen are all green

* there are some warnings in the build which need addressing

but on the most part I thought we'd caught the serious kernel failures
in advance of changes hitting master. Are you using master-next or
master? 

Its its -next, I can understand the problems more as that has been
unstable recently but then by its nature, it can be. We are rooting out
problems before master afaict though?

Cheers,

Richard
 



