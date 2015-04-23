Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9A471605D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 18:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3NIlNQC005205; Thu, 23 Apr 2015 19:47:23 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sMt5psJ6PBHO; Thu, 23 Apr 2015 19:47:23 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3NIl7SJ005186
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 23 Apr 2015 19:47:19 +0100
Message-ID: <1429814827.26983.119.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 23 Apr 2015 19:47:07 +0100
In-Reply-To: <1828695.sPIXEUjWsd@peggleto-mobl.ger.corp.intel.com>
References: <1429771148-1545-1-git-send-email-cristian.iorga@intel.com>
	<2822728.eQSAVmuFvh@peggleto-mobl.ger.corp.intel.com>
	<CAJTo0LZd_CSOVW9j07d19fARwvkFuj3LgaizQO7Dr3xg_mpd-A@mail.gmail.com>
	<1828695.sPIXEUjWsd@peggleto-mobl.ger.corp.intel.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] testimage: regenerate rootfs before testing
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
X-List-Received-Date: Thu, 23 Apr 2015 18:47:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-04-23 at 14:25 +0100, Paul Eggleton wrote:
> On Thursday 23 April 2015 16:02:45 Burton, Ross wrote:
> > On 23 April 2015 at 12:20, Paul Eggleton <paul.eggleton@linux.intel.com>
> > wrote:
> > > I can't remember for certain, but I suspect the lack of this dependency
> > > was intentional, so that you could e.g. copy in an image built elsewhere
> > > and run tests on it. Maybe we can take the decision we don't need that,
> > > but it should be a conscious decision.
> > 
> > My guess was that the missing dependency was from when rootfs always
> > regenerated an image, so if you were iterating the test suite it would
> > always rebuild the image.  This isn't the case now.
> 
> I don't believe so since that change was made prior to testimage's existence 
> (although it was only a month or so before).
> 
> > Someone should speak with QA and see if they actually use the ability to
> > copy in images.  Cristian, I'm looking at you. :)
> 
> I'm assuming our QA team aren't the only people that use testimage ;)

This was discussed long ago and there are two different tasks as a
compromise. testimage_auto runs automatically after a rootfs is built
and has the correct dependencies. "testimage" is triggered manually. The
autobuilder actually uses testimage so it can be explicit about which
images get tested.

Cheers,

Richard


