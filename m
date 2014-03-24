Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 6B9366B8D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 16:00:58 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2OG0rim000859; Mon, 24 Mar 2014 16:00:53 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id LBPdDhvlRXk5; Mon, 24 Mar 2014 16:00:53 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2OG0nYf000855
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 24 Mar 2014 16:00:51 GMT
Message-ID: <1395676843.24890.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, yocto
	<yocto@yoctoproject.org>
Date: Mon, 24 Mar 2014 16:00:43 +0000
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: Features in Yocto Project 1.7
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
X-List-Received-Date: Mon, 24 Mar 2014 16:00:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

As development on 1.6 finishes up, its time to think about what we
should be doing in the 1.7 cycle.

I think from my perspective, in 1.7 I'd like to see us looking at
"Developer Workflow". Its a generic topic which I think covered multiple
areas (in no particular order):

* the ADT/SDK and how it intergrates into the rest of the system
* toaster
* python devshell
* exteralsrc.bbclass
* memory resident bitbake
* how a standalone app developer might build an image
* locked sstate

and probably more I'm forgetting.

If anyone does have things they plan to work on, or ideas for things
that should be worked on, please do file enhancement requests in the
bugzilla:

https://bugzilla.yoctoproject.org/

Cheers,

Richard




