Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id F31C5728E9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 10:28:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBJASEtf007419 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 10:28:14 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id i_irXASrQ5T2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 10:28:14 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBJARwkg007406
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 10:28:09 GMT
Message-ID: <1418984914.13316.6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Dec 2014 10:28:34 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: Merging problems
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
X-List-Received-Date: Fri, 19 Dec 2014 10:29:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I want to give people a headsup that we're having problems merging
changes at the moment. We've been doing our best but the number of
things building up which are causing issues is overwheling our ability
to fix and stablise the build. It wasn't helped that I took a long
weekend's vacation last weekend. There are changes being made or tested
to the autobuilder which also isn't helping.

The kernel series has several issues:

  * a random failure in do_kernel_configme [i]
  * bzImage not being built for some machines [ii]
  * non linux-yocto kernel failures [iii]
  * the headers upgrade breaks socat (fix pending, thanks Bruce)

There was a change merged to bitbake which broken cups on lsb and
powertop due to unset variable problems. I have two pending fixes for
those.

For the last test build, we have 195 failures to dig through:

http://errors.yoctoproject.org/Errors/Search/Args/?items=150&page=1&query=99e7d5b9c736eb08a3853818a73c51676e7aa7ac

and we've not managed to dive into many of them. I don't have fixes for
the three kernel issues above.

So I'd ask that people be patient and if you have some time to help with
any of these problems, I'd welcome it. Most people are off on vacation
now which is going to leave me with a challenge.

Cheers,

Richard

[i] https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-lsb/builds/129/steps/BuildImages/logs/stdio
[ii] https://autobuilder.yoctoproject.org/main/builders/minnow/builds/129/steps/BuildImages/logs/stdio
[iii] https://autobuilder.yoctoproject.org/main/builders/nightly-fsl-arm/builds/128/steps/BuildImages/logs/stdio
      (5 unknown build failures in this one!)
      https://autobuilder.yoctoproject.org/main/builders/nightly-fsl-ppc/builds/129/steps/BuildImages/logs/stdio
      (only 3 here)


