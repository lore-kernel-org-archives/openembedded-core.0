Return-Path: <brad.mouring@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 6A2CD731EC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 04:28:53 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2P4SrmT014746; Thu, 24 Mar 2016 23:28:53 -0500
Received: from ni.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with SMTP id 2016032423285345-199092 ;
	Thu, 24 Mar 2016 23:28:53 -0500 
Received: by ni.com (sSMTP sendmail emulation); Thu, 24 Mar 2016 23:28:52 -0500
Date: Thu, 24 Mar 2016 23:28:52 -0500
From: Brad Mouring <brad.mouring@ni.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20160325042852.GB25837@zardoz.amer.corp.natinst.com>
References: <1458688681-31394-1-git-send-email-brad.mouring@ni.com>
	<1458688681-31394-4-git-send-email-brad.mouring@ni.com>
	<CAMKF1soesfy2EcTF0thf9DeVandbn7aFtmd+vXqNf02QQ5Neng@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soesfy2EcTF0thf9DeVandbn7aFtmd+vXqNf02QQ5Neng@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/24/2016 11:28:54 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/24/2016 11:28:54 PM,
	Serialize complete at 03/24/2016 11:28:54 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-25_01:, , signatures=0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] busybox-git: Backport patch to fix zcip false-conflict
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
X-List-Received-Date: Fri, 25 Mar 2016 04:28:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 24, 2016 at 07:49:19PM -0700, Khem Raj wrote:
> On Tue, Mar 22, 2016 at 4:18 PM, Brad Mouring <brad.mouring@ni.com> wrote:
> > Busybox upstream fixed the issue where an incorrect comparison of
> > addresses led to bogus renegotiation of a new ll ip in 1.24. Backport
> > this change to the -git recipe.
> >
> > Signed-off-by: Brad Mouring <brad.mouring@ni.com>
> > ---
> >  meta/recipes-core/busybox/busybox_git.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/recipes-core/busybox/busybox_git.bb b/meta/recipes-core/busybox/busybox_git.bb
> > index 47c1364..11c390e 100644
> > --- a/meta/recipes-core/busybox/busybox_git.bb
> > +++ b/meta/recipes-core/busybox/busybox_git.bb
> > @@ -34,6 +34,7 @@ SRC_URI = "git://busybox.net/busybox.git;branch=1_23_stable \
> >             file://inetd.conf \
> >             file://inetd \
> >             file://login-utilities.cfg \
> > +           file://0001-zcip-fix-wrong-comparison-of-source-IP-with-our-IP.patch \
> >  "
> 
> just bump up the SRCREV past that commit.

For some reason, I didn't really digest this email until I'd already
read and responded to the other. It makes much more sense now, both
emails. I'll adjust and send a v2.

> >
> >  EXTRA_OEMAKE += "V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y"
> > --
> > 2.7.3
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core


