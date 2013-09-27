Return-Path: <jason.wessel@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B99AB60EA7
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 16:33:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8RGXTK8028771
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 27 Sep 2013 09:33:29 -0700 (PDT)
Received: from [172.25.32.36] (172.25.32.36) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 27 Sep 2013 09:33:27 -0700
Message-ID: <5245B356.7030703@windriver.com>
Date: Fri, 27 Sep 2013 11:33:26 -0500
From: Jason Wessel <jason.wessel@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1377212667-5915-1-git-send-email-jason.wessel@windriver.com>
	<1377364531.6762.202.camel@ted>
	<CAAQYJAtn3RqJa4K=-UUjfxQemqwH5Te1wCvGRqeJxhii03h29A@mail.gmail.com>
	<1380272728.18603.414.camel@ted>
In-Reply-To: <1380272728.18603.414.camel@ted>
X-Enigmail-Version: 1.5.2
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [v2 PATCH] kernel.bbclass, image.bbclass: Implement kernel INITRAMFS dependency and bundling
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
X-List-Received-Date: Fri, 27 Sep 2013 16:33:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 09/27/2013 04:05 AM, Richard Purdie wrote:
> On Fri, 2013-09-27 at 10:07 +0200, Andrea Adami wrote:
>> On Sat, Aug 24, 2013 at 7:15 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> With 1.5 approaching I'd like to have the issue solved as soon as possible.
>> Richard, when is deadline for core-patches?
> 
> Basically ASAP. The next release build is the start of next week but any
> patches going into that need to have been run through an autobuilder
> cycle first.
> 
> This is the first I've heard of the problem, other than some comments
> about possible problems on irc. Can someone please open up a bug for
> this and clearly describe what used to work and now doesn't and what the
> possible fixes or workarounds are?
> 
> I don't think anyone likes regressions however if we don't have the open
> bug, its very hard to track.
> 
> You say you've talked to Bruce/Jason but why didn't the discussion
> happen on the mailing list? That way others may have been able to help
> and now I could read back the list and see for myself what the issue is.
> As it is, I simply don't know other than the need to set a new variable
> which is hinted at above...
> 


What was needed most was a defect detailing the configuration setup.  The reason I have not hit this problem nor any of the other autobuilders was that it required a very specific way to setup the recipes to depend on each other, but not circularly.

Andrea sent full details to Bruce, who sent them to me and I built it this morning.  It took very little time to isolate the problem but it was one of those oh so subtle issues (patch is sent to oe-core).  Perhaps in the future we can just get a Bugzilla opened right away.  I don't like regressions either. :-)

Andrea replied to me in IRC, "I'll test the new patch soon". 

Cheers,
Jason.


