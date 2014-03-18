Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id D6D456EFA9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 13:09:59 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2ID9lvE026536; Tue, 18 Mar 2014 13:09:47 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id t_GpjoGPm2ZZ; Tue, 18 Mar 2014 13:09:47 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2ID9ePk026518
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 18 Mar 2014 13:09:42 GMT
Message-ID: <1395148175.3808.83.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Mar 2014 13:09:35 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: Status Update
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
X-List-Received-Date: Tue, 18 Mar 2014 13:10:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I was travelling in the last week which limited the time I could spend
on various issues.

The week has mostly been seeing patches being tested on the autobuilder
in MUT/master-next with a view to ironing out bugs before code merges.

Pending Patches
===============

I did manage to flush some queued patches into the various repositories
after testing on the autobuilder. The current pending list is now:

* archiver rework patches (not had a chance to review yet)
* 3.14 kernel (not released yet, we have patches being tested, ongoing 
  perf issues but close to resolution with any luck)
* updated meta-yocto-bsp bsps for BBB and edge router
* Enabling B != S - Can't decide whether to push this or not. Have got 
  several known issues fixed up in layers (thanks Otavio). Martin, any 
  thoughts on this?
* pusleaudio 5.0?
* systemd 112?
* bitbake fetcher extension code for automated "upgrade" detection

We have had a number of these through testing cycles on the autobuilder,
systemd in particular should be ready to go in and I'll probably merge
that.

I'm not happy about the changes coming in as late as they are, equally,
I think the changes are work getting in. It will be ready when it is
ready...

Bitbake Changes
===============

The sigchld handler is continue to cause issues. Some are fixed but we
were seeing locked up processes on the autobuilder which appeared to be
trapped in waitpid. I've pushed some further patches to stop the code
doing bad things, I'm not 100% sure why it was breaking but the latest
builds seem to be behaving.

I'd advice people to keep up to date with master and report any issues
they find. Bonus marks for good reproducers, it makes things much faster
to fix!

I do want to get -S fixed for the release so some changes are pending
for that.

1.4.3
=====

There were sstate issues on the autobuilder, Paul backported the patch
which was confirmed as fixing the issue. We tried for another build, I
messed up the branches though (sorry Paul/Saul/Beth). We'll spin another
build when the autobuilder is free.


Cheers,

Richard



