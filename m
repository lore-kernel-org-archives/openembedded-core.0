Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6022171467
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Sep 2014 16:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8HGBDsX007915; Wed, 17 Sep 2014 17:11:13 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id X4Ar8jyGqxF0; Wed, 17 Sep 2014 17:11:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8HGB87X007911
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 17 Sep 2014 17:11:09 +0100
Message-ID: <1410970270.14624.106.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, Steffen
	Sledz <sledz@dresearch-fe.de>
Date: Wed, 17 Sep 2014 17:11:10 +0100
In-Reply-To: <54197EDC.3070406@dresearch-fe.de>
References: <541034FD.4090900@dresearch-fe.de>
	<541684F7.8040708@dresearch-fe.de> <54197EDC.3070406@dresearch-fe.de>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: Lianhao Lu <lianhao.lu@intel.com>
Subject: Re: hash generation for PR Service?
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
X-List-Received-Date: Wed, 17 Sep 2014 16:11:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-09-17 at 14:30 +0200, Steffen Sledz wrote:
> Hi Guys,
> 
> On 15.09.2014 08:19, Steffen Sledz wrote:
> > On 10.09.2014 13:24, Steffen Sledz wrote:
> >> I'm not sure if this is the right mailing list for our problem. Please forgive me if not (and tell me the right one).
> >>
> >>
> >> We're investigating some problems related with package versions going backwards using a PR Service[1].
> >>
> >> Can someone give some hints where we can get information about
> generation of the hashes which are used to request values from the PR
> service? Especially which data/files/directories are involved..
> >>
> >>
> >> [1] <https://wiki.yoctoproject.org/wiki/PR_Service>
> > 
> > Ping! Who can provide related information?
> 
> there was no feedback in the ml. :(
> 
> Can you help us on this issue?

The hashes are the same hashes bitbake itself uses to decide whether to
reexecute tasks or not and are the same hashes encoded into the sstate
objects.

The manual gives information about this:

http://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#checksums

Please read and understand that, then if you have specific questions,
please ask them and you may get a more targeted answer. At the moment
the question is not specific enough to be easy to answer.

Cheers,

Richard




