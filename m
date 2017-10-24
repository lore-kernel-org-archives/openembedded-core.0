Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 21D2760765
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Oct 2017 21:29:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v9OLT5OC000331
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Oct 2017 14:29:06 -0700 (PDT)
Received: from yow-masselst-lx1.localnet (128.224.24.78) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Tue, 24 Oct 2017 14:29:05 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 24 Oct 2017 17:29:04 -0400
Message-ID: <13241926.U60Tp1Mvip@yow-masselst-lx1>
Organization: Wind River
User-Agent: KMail/5.2.3 (Linux/4.10.0-37-generic; KDE/5.31.0; x86_64; ; )
In-Reply-To: <CADkTA4NE9C6mv=pcsHQ78wSEf2ewDyyC3Yr9G2P2Fd+YNMZCfA@mail.gmail.com>
References: <1508879860-7170-1-git-send-email-mark.asselstine@windriver.com>
	<CADkTA4NE9C6mv=pcsHQ78wSEf2ewDyyC3Yr9G2P2Fd+YNMZCfA@mail.gmail.com>
MIME-Version: 1.0
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [IGNORE][PATCH] linux-yocto_4.12.bb: Use AUTOREV for qemu* BSPs
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
X-List-Received-Date: Tue, 24 Oct 2017 21:29:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, October 24, 2017 5:21:35 PM EDT Bruce Ashfield wrote:
> On Tue, Oct 24, 2017 at 5:17 PM, Mark Asselstine
> 
> <mark.asselstine@windriver.com> wrote:
> > The kernel we ship as part of product may have newer commits beyond
> > any SRCREV captured in this recipe. Since the assignment operator used
> > here is an early assiignment it could be argued that we could simply
> > overwrite these in a bbappend, however, between layer order and
> > priority and our desire to allow folks to set their own assignment it
> > is most prudent to change these to AUTOREV here.
> > 
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ---
> > 
> > Richard, Bruce,
> > 
> > This is being sent only to conform with YP compliance and I don't
> > expect or want this applied. No need to respond in any form.
> 
> .. but I can't help myself.
> 
> I find that patch, really, really odd. Compliance or not.

Its been a long day. There is an internal mail on the subject if you want to 
discuss details. I don't think we need to bore Richard and others with the 
details. I am sure there exists alternatives but given all the fun that today 
was this is what we came up with.

Mark

> 
> Bruce
> 
> > Mark
> > 
> >  meta/recipes-kernel/linux/linux-yocto_4.12.bb | 9 +--------
> >  1 file changed, 1 insertion(+), 8 deletions(-)
> > 
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
> > b/meta/recipes-kernel/linux/linux-yocto_4.12.bb index a262409..919bf31
> > 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
> > @@ -11,14 +11,7 @@ KBRANCH_qemux86  ?= "standard/base"
> > 
> >  KBRANCH_qemux86-64 ?= "standard/base"
> >  KBRANCH_qemumips64 ?= "standard/mti-malta64"
> > 
> > -SRCREV_machine_qemuarm ?= "67b62d8d7bd9f19f0f4fad044787d947ebc4ec25"
> > -SRCREV_machine_qemuarm64 ?= "16de0149674ed12d983b77a453852ac2e64584b4"
> > -SRCREV_machine_qemumips ?= "371926551d44c140a0fb869cec34762b40bdf1a6"
> > -SRCREV_machine_qemuppc ?= "16de0149674ed12d983b77a453852ac2e64584b4"
> > -SRCREV_machine_qemux86 ?= "16de0149674ed12d983b77a453852ac2e64584b4"
> > -SRCREV_machine_qemux86-64 ?= "16de0149674ed12d983b77a453852ac2e64584b4"
> > -SRCREV_machine_qemumips64 ?= "9d63d9c11c44ceabd452d7ee49cf55a88c39383f"
> > -SRCREV_machine ?= "16de0149674ed12d983b77a453852ac2e64584b4"
> > +SRCREV_machine ?= "${AUTOREV}"
> > 
> >  SRCREV_meta ?= "eda4d18ce4b259c84ccd5c249c3dc5958c16928c"
> >  
> >  SRC_URI =
> >  "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${K
> >  BRANCH}; \> 
> > --
> > 2.7.4
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core



