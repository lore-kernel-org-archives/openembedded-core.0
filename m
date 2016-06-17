Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B94FE75CF1
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 19:04:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u5HJ4I0Z025633
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 17 Jun 2016 12:04:18 -0700 (PDT)
Received: from tal.localnet (128.224.21.250) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 17 Jun 2016 12:04:17 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 17 Jun 2016 15:04:15 -0400
Message-ID: <2141737.McPocSlDfg@tal>
Organization: Wind River 
User-Agent: KMail/4.13.3 (Linux/3.13.0-85-generic; KDE/4.13.3; x86_64; ; )
In-Reply-To: <CAHiDW_FDRgonk9F8w55YryDn5uS44iQTassWFKMMchUOj_P0_A@mail.gmail.com>
References: <1466099108-25355-1-git-send-email-mark.asselstine@windriver.com>
	<10638163.jDLm51fopt@tal>
	<CAHiDW_FDRgonk9F8w55YryDn5uS44iQTassWFKMMchUOj_P0_A@mail.gmail.com>
MIME-Version: 1.0
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] vte: bring back old version to support xfce4-terminal
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
X-List-Received-Date: Fri, 17 Jun 2016 19:04:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On June 17, 2016 20:43:06 Jussi Kukkonen wrote:
> On 17 June 2016 at 16:33, Mark Asselstine <mark.asselstine@windriver.com>
> 
> wrote:
> > On June 16, 2016 18:10:09 Andre McCurdy wrote:
> > > On Thu, Jun 16, 2016 at 2:47 PM, Burton, Ross <ross.burton@intel.com>
> > 
> > wrote:
> > > > On 16 June 2016 at 21:49, Mark Asselstine <
> > 
> > mark.asselstine@windriver.com>
> > 
> > > > wrote:
> > > >> While waiting to hear back about my inquiry I did take some
> > > >> time to put together this patch that allows things that
> > > >> require the older vte to continue to build. Since xfce4-terminal
> > > >> lives in meta-openembedded this might make more sense to carry
> > > >> over there. I am sure folks will have an opinion so sending this
> > > >> out as an RFC.
> > > > 
> > > > That's certainly a good argument for putting the old vte in meta-oe.
> > > 
> > > The meta-oe layers generally have a higher priority than oe-core, so
> > > having an older version in meta-oe and a newer version in oe-core can
> > > lead to unexpected results.
> > 
> > This should not be an issue. My change has the old recipe renamed with the
> > API
> > version so the old version becomes referenced by 'vte-0.0' (per the commit
> > log
> > the 0.0 is consistent with the API versioning upstream). So recipes which
> > require the old version, like xfce4-terminal, have to have their DEPENDS
> > adjusted accordingly. There should be no surprises.
> > 
> > I will have a closer look today to ensure nothing in oe-core is requiring
> > the
> > old version and if not I will prepare a patch for meta-oe since that seems
> > to
> > be the general agreement for a home for this. I need to do some further
> > checks
> > and runtime tests but I will get this out shortly. In the meantime anyone
> > else
> > running in to the build failure can exploit the RFC patch.
> 
> Thanks Mark. I can confirm that nothing in oe-core needs the old vte.
> 
> As a sidenote in case you're looking at the vte users in oe-core: I notice
> I didn't include a  patch for qemu yet. The situation there is that our
> qemu version works fine with the new vte but might still need a small
> configure.ac patch in addition to updated PACKAGECONFIG line. I'll include
> this in my next patchset.

Since I work quite a bit with meta-virtualization and thus QEMU that will be 
nice to avoid any potential issues in that area.

Thanks for the heads up regarding other vte users in oe-core. This will allow 
me to focus on some runtime testing in meta-oe prior to me sending a patch 
that way.

This should wrap up the discussions around vte for oe-core at least for now.

Mark

> 
> - Jussi
> 
> 
> Mark
> 
> > > > Ross
> > > > 
> > > > --
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > 
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core


