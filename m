Return-Path: <brad.mouring@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7BCF86612D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 04:24:33 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2P4OXWO004867; Thu, 24 Mar 2016 23:24:33 -0500
Received: from ni.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with SMTP id 2016032423243363-197433 ;
	Thu, 24 Mar 2016 23:24:33 -0500 
Received: by ni.com (sSMTP sendmail emulation); Thu, 24 Mar 2016 23:24:32 -0500
Date: Thu, 24 Mar 2016 23:24:32 -0500
From: Brad Mouring <brad.mouring@ni.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20160325042432.GA25837@zardoz.amer.corp.natinst.com>
References: <1458688681-31394-1-git-send-email-brad.mouring@ni.com>
	<1458688681-31394-3-git-send-email-brad.mouring@ni.com>
	<CAMKF1spi=cuJpMNXqAoEBL57L7q6rw1+fZ_=+sxhqB04z6YXYA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spi=cuJpMNXqAoEBL57L7q6rw1+fZ_=+sxhqB04z6YXYA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/24/2016 11:24:34 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/24/2016 11:24:34 PM,
	Serialize complete at 03/24/2016 11:24:34 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-25_01:, , signatures=0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] busybox_git: Fix SRC_URI
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
X-List-Received-Date: Fri, 25 Mar 2016 04:24:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 24, 2016 at 07:50:27PM -0700, Khem Raj wrote:
> On Tue, Mar 22, 2016 at 4:18 PM, Brad Mouring <brad.mouring@ni.com> wrote:
> > Since the commit called out in the recipe is off the master branch,
> > update the gitful SRC_URI to specify the branch to use for the
> > recipe.
> 
> no, we want master for the git recipe.

The commit, as called out in the recipe, is not on master, but is rather
a stability patch collection...

From busybox's history

master
|
| 1_23_stable
| |
V V
...
* 8074a6c udhcpd: account for script delay in lease
* b996507 Start 1.24.0 development cycle
| * be947c4 Apply post-1.23.1 patches, bump version to 1.23.2 <<< SRCREV
| * 1ecfe81 Apply post-1.23.0 patches, bump version to 1.23.1
|/  
* 6968e08 Bump version to 1.23.0
* ca9c465 libbb: add sanity check in bb_arg_max()
* 11775ed randomconfig fixes
...

I have no qualms picking a commit in master, but it's also not really
my call to make. I am open to suggestions

> >
> > Signed-off-by: Brad Mouring <brad.mouring@ni.com>
> > ---
> >  meta/recipes-core/busybox/busybox_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
> > index 529ed5b..47c1364 100644
> > --- a/meta/recipes-core/busybox/busybox_git.bb
> > +++ b/meta/recipes-core/busybox/busybox_git.bb
> > @@ -6,7 +6,7 @@ PV = "1.23.1+git${SRCPV}"
> >
> >  S = "${WORKDIR}/git"
> >
> > -SRC_URI = "git://busybox.net/busybox.git \
> > +SRC_URI = "git://busybox.net/busybox.git;branch=1_23_stable \
> >             file://get_header_tar.patch \
> >             file://busybox-appletlib-dependency.patch \
> >             file://busybox-udhcpc-no_deconfig.patch \
> > --
> > 2.7.3
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

