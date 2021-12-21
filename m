Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <f325951fd82f373bbe505a574a10f91697e495cd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [yocto] [qa-build-notification] QA notification for completed autobuilder build (yocto-3.1.13.rc1)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Tue, 21 Dec 2021 15:50:37 +0000
In-Reply-To: <CANPvuRkxfQ60H_OUwru_a+Xhkx6WCJu2f-EgGkONLB8GSvL2vw@mail.gmail.com>
References: 
	<99e75b930d85e240c51074406b0cd896c93257cb.camel@linuxfoundation.org>
	 <DM5PR1101MB23482FA91A07CA4057E768D9BB7C9@DM5PR1101MB2348.namprd11.prod.outlook.com>
	 <CANPvuRkqyngQAqhqfou9ka7J3oufuSCubf9J7cgZ-ZU9KLTJjg@mail.gmail.com>
	 <97b16a070ca838dfe87ae579edf36c0e01d01175.camel@linuxfoundation.org>
	 <CANPvuRkxfQ60H_OUwru_a+Xhkx6WCJu2f-EgGkONLB8GSvL2vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: "<yocto@lists.yoctoproject.org>" <yocto@lists.yoctoproject.org>, OE-core <openembedded-core@lists.openembedded.org>

On Tue, 2021-12-21 at 15:12 +0000, Jose Quaresma wrote:
> 
> 
> Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia terça,
> 21/12/2021 à(s) 14:19:
> > On Tue, 2021-12-21 at 11:15 +0000, Jose Quaresma wrote:
> > > 
> > > 
> > > Teoh, Jay Shen <jay.shen.teoh@intel.com> escreveu no dia terça, 21/12/2021
> > > à(s) 07:46:
> > > > Hi all,
> > > > 
> > > > This is the full report for yocto-3.1.13.rc1:  
> > > > 
> > https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?h=intel-yocto-testresults
> > > > 
> > > > ======= Summary ========
> > > > No high milestone defects. 
> > > > 
> > > > new issue found 
> > > > 
> > > > Bug 14669 - [QA 3.1.13 RC1] failure in ptest :gstreamer1.0.gstreamer-
> > > > 1.0/pipelines_seek.test
> > > > 
> > > > 
> > > > ======= Bugs ========
> > > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14669
> > > > 
> > > 
> > > 
> > > This patch is a bug fix 14669
> > > https://lists.openembedded.org/g/openembedded-core/message/159911
> > >  
> > 
> > Great, thanks!
> > 
> > I assume we don't need that in the version on master as it is already
> > present?
> > 
> 
> 
> 
> https://git.yoctoproject.org/poky/commit/?id=7b90027aac9fa41b3dc98765151d761df8dabb97
> The first version of the patch on the master branch is this one and it fixes
> the [YOCTO #14194].
> I cherry-picked that with some adaptation for dunfell but the content is the
> same.
> 
> We need the patch on master as well and we will drop it with the gstreamer
> 1.20 update.

Thanks for the info, we're ok with master then and can backport this.

Cheers,

Richard

