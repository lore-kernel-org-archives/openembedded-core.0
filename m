Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 49E4074242
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 20:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t81K4iOp011884; Tue, 1 Sep 2015 21:04:44 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id up4KC1YDsVle; Tue,  1 Sep 2015 21:04:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t81K4UGc011879
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 1 Sep 2015 21:04:41 +0100
Message-ID: <1441137870.24871.11.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 01 Sep 2015 21:04:30 +0100
In-Reply-To: <8B394616-9009-4FF4-828C-561A859D34B3@gmail.com>
References: <8B394616-9009-4FF4-828C-561A859D34B3@gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Patch merge process
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
X-List-Received-Date: Tue, 01 Sep 2015 20:04:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-09-01 at 10:40 -0700, Khem Raj wrote:
> I thought of bringing this up for discussions, I am seeing that, in
> some pull requests some patches get dropped and I understand
> that there might be a reason for that but that reason is not
> communicated in proposed patch mail often. I have experienced with
> some of the
> pull requests myself and seen it with some others. I think we are not
> responding to patches as it should be. Since we follow
> just mailing list as upstreaming process thats the only channel that
> developer is engaged w.r.t. patches and there should be a conclusion
> on the mailing list itself for a given patch. So I would request to
> whoever along with Richard is validating the patches and bringing them
> to OE-Core from mailing lists to respond to the patches especially the
> ones that are not applied with reasons why its not applied and
> similarly to the ones that are applied but has been rejected by some
> reviewers. It would also be good to document the commit criteria
> somewhere, so developer can do rework and ease the pressure on
> maintainers. Can we explore some tools that can help here ? May be
> failed errors.yp.org output can be sent to list of developers whose
> patches has been part of staging ?
>
> I think its extremely important to keep a developer informed and
> engaged about the upstreaming if we want to encourage more voluntary
> participation in the project.
>
> It would be good to identify where we have bottlenecks and how can we
> improve upon the situation, ideas are welcome.

The problem basically comes down to this. We have:

* two people who put patches together into blocks and try and test them
* a single autobuilder instance capable of running the tests we need to 
  verify a set of patches
* test runs that take around 10 hours (substantially increased recently 
  by more test automation)
* ever increasing expectations that OE-Core master doesn't break
* ever increasing problems of 'random' autobuilder failures which seem 
  related to autobuilder load

Put all this together and its turning into a nightmare to keep things
flowing. The increased QA automation is catching a lot more issues which
is good, but its also making the cycles longer. The increased load is
also shaking out all kinds of races and qemu issues.

There is a SWAT team who is meant to help try and take the load off
Ross/I for some of the process. The processes there are being changed to
try and better help Ross/I. I'd ask anyone reading this and frustrated
with the patch merge process, when did you last help with SWAT? When did
you last help with any of the random autobuilder failures we're seeing
or with general YP bug fixing (not just bugs you yourself run into)?

One problem is that we have to test the patches in a block due to the
long test cycle. If something fails, we can't know who broke it, that is
up to someone's best guess so it can't be automated. Yes, you could send
out block emails but those tend to confuse people. Heck, even getting
the autobuilder to send email at all at the moment is proving
problematic. I also literally spent two days last week trying to fix
basic issues ensuring the autobuilder actually builds the revision we
think its building!

We are trying to send out info where and when things break and we know
the cause. Equally, some things have been removed as "best guess" and we
sometimes forget to either add them back, or follow up with a reply
about a likely failure they introduced :(. It comes down to simply being
overworked. Equally, the work in doing this is to be quite honest pretty
thankless and some of the lack of basic testing sometimes seen doesn't
really help :(.

That all said, I will do my best to try and send more informative emails
about patches...

Cheers,

Richard



