Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <732ad1690ed9616981f1ab5821d38fe192911f1b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [yocto] QA notification for completed autobuilder build (yocto-4.0.rc1)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Tue, 12 Apr 2022 17:55:41 +0100
In-Reply-To: <DM5PR1101MB234872284B26AF1D53F311F0BBED9@DM5PR1101MB2348.namprd11.prod.outlook.com>
References: 
	<0101017ffded4843-210c9da1-5b3f-4ed6-bcbc-1f63610acf6e-000000@us-west-2.amazonses.com>
	 <DM5PR1101MB234872284B26AF1D53F311F0BBED9@DM5PR1101MB2348.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>, Pokybuild User <pokybuild@yoctoproject.org>, "yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, OE-core <openembedded-core@lists.openembedded.org>
Cc: "qa-build-notification@lists.yoctoproject.org" <qa-build-notification@lists.yoctoproject.org>

On Tue, 2022-04-12 at 16:20 +0000, Teoh, Jay Shen wrote:
> Hi all,
> 
> This is the full report for yocto-4.0.rc1:  
> https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/?h=intel-yocto-testresults
> 
> ======= Summary ========
> No high milestone defects.
> 
> new issue found 
> 
> Bug 14779 - [4.0rc1] Edgerouter can not boot up 
> Bug 14782 - [QA 4.0.rc1] - Icons not loaded properly
> Bug 14783 - [QA 4.0.rc1] - Abnormal responsive time for File Manager PCManFM application
>    
> ======= Bugs ========
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14779
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14782
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=14783

Thanks! 

14779 means we'll need an rc2. Do you have any information on whether
14782/14783 also occur in qemu images or are they just on the nuc hardware? Do
you know if anyone is looking into them or has any leads on the cause of them? I
presume those things were tested in M3 so something regressed somewhere
recently?

Cheers,

Richard

