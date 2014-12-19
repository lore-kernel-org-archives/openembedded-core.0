Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2754072935
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 13:16:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBJDFPkM013586; Fri, 19 Dec 2014 13:15:25 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id j9bneTDSvhJk; Fri, 19 Dec 2014 13:15:25 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBJDFC4s013574
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 19 Dec 2014 13:15:24 GMT
Message-ID: <1418994949.13316.16.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Fri, 19 Dec 2014 13:15:49 +0000
In-Reply-To: <54942326.8080806@windriver.com>
References: <1418984914.13316.6.camel@linuxfoundation.org>
	<1418992908.13316.14.camel@linuxfoundation.org>
	<54942326.8080806@windriver.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Merging problems
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
X-List-Received-Date: Fri, 19 Dec 2014 13:16:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-12-19 at 08:07 -0500, Bruce Ashfield wrote:
> On 2014-12-19, 7:41 AM, Richard Purdie wrote:
> > On Fri, 2014-12-19 at 10:28 +0000, Richard Purdie wrote:
> >> I want to give people a headsup that we're having problems merging
> >> changes at the moment. We've been doing our best but the number of
> >> things building up which are causing issues is overwheling our ability
> >> to fix and stablise the build. It wasn't helped that I took a long
> >> weekend's vacation last weekend. There are changes being made or tested
> >> to the autobuilder which also isn't helping.
> >>
> >> The kernel series has several issues:
> >>
> >>    * a random failure in do_kernel_configme [i]
> >
> > I think I have a handle on this. If you look at the autobuilder failure
> > it says:
> 
> do you have a link to the actual failure ?

It was in a previous mail:

https://autobuilder.yoctoproject.org/main/builders/nightly-ppc-lsb/builds/129/steps/BuildImages/logs/stdio

> > The fix is therefore probably to not run the fetch/unpack/patch tasks in
> > kernelsrc.bbclass.
> 
> Very likely. I'll have a look. I noticed about 6 months ago that a patches
> directory was being created .. even when it was never going to be used.
> I took steps to remove it before the linux-yocto builds continued, but
> apparently it is sneaking back in through other means :)

kernelsrc.bbclass sets ${S} to point at the directory so other recipes
can create it.

Cheers,

Richard



