Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Paul.Gortmaker@windriver.com>) id 1SmoZj-0001fj-2Z
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 18:06:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q65FtU1n029851
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 5 Jul 2012 08:55:30 -0700 (PDT)
Received: from yow-pgortmak-d1 (128.224.146.65) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 5 Jul 2012 08:55:30 -0700
Received: from paul by yow-pgortmak-d1 with local (Exim 4.74)	(envelope-from
	<paul.gortmaker@windriver.com>)	id 1SmoOt-0003hm-9K; Thu, 05 Jul 2012
	11:55:27 -0400
Date: Thu, 5 Jul 2012 11:55:27 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20120705155526.GF1817@windriver.com>
References: <20120625153328.B76A81033A@opal>
	<20120628192018.GB5532@localhost.jama.net>
	<20120704172715.GH15100@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120704172715.GH15100@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Paul Gortmaker : linux-firmware: update to main repo on kernel.org
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jul 2012 16:06:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

[Re: [oe-commits] Paul Gortmaker : linux-firmware: update to main repo on kernel.org] On 04/07/2012 (Wed 19:27) Martin Jansa wrote:

> On Thu, Jun 28, 2012 at 09:20:18PM +0200, Martin Jansa wrote:
> > On Mon, Jun 25, 2012 at 03:33:28PM +0000, git@git.openembedded.org wrote:
> > > Module: openembedded-core.git
> > > Branch: master
> > > Commit: b9d42ec94dfcbe92ce2a857045a0e3678c05c26c
> > > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=b9d42ec94dfcbe92ce2a857045a0e3678c05c26c
> > > 
> > > Author: Paul Gortmaker <paul.gortmaker@windriver.com>
> > > Date:   Fri Jun 22 10:15:07 2012 -0400
> > > 
> > > linux-firmware: update to main repo on kernel.org
> > > 
> > > This is now the authoratative repository, taking updates.
> > > The latest has a couple updated license files, vs. the previous
> > > srcrev that was used.
> > > 
> > > Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> > > 
> > > ---
> > > 
> > >  .../linux-firmware/linux-firmware_git.bb           |   10 +++++-----
> > >  1 files changed, 5 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > > index 3675978..8aacce4 100644
> > > --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > > +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> > > @@ -7,23 +7,23 @@ SECTION = "kernel"
> > >  
> > >  LICENSE = "Proprietary"
> > >  
> > > -LIC_FILES_CHKSUM = "file://LICENSE.radeon_rlc;md5=4c243f7854d2884b483abda991adef43 \
> > > +LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=e56b405656593a0c97e478513051ea0e \
> > >                      file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
> > >                      file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
> > >                      file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd \
> > >                      file://LICENCE.qla2xxx;md5=4005328a134054f0fa077bdc37aa64f2 \
> > > -                    file://LICENCE.iwlwifi_firmware;md5=311cc823df5b1be4f00fbf0f17d96a6b \
> > > +                    file://LICENCE.iwlwifi_firmware;md5=11545778abf78c43d7644d4f171ea1c7 \
> > >                      file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36 \
> > >                      file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
> > >                      file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
> > >                      file://LICENCE.rtlwifi_firmware.txt;md5=00d06cfd3eddd5a2698948ead2ad54a5 \
> > >                     "
> > >  
> > > -SRCREV = "15888a2eab052ac3d3f49334e4f6f05f347a516e"
> > > +SRCREV = "e98750f0d68d0037ce5a186f7f863a9c13bf773a"
> > >  PV = "0.0+git${SRCPV}"
> > > -PR = "r1"
> > > +PR = "r2"
> > >  
> > > -SRC_URI = "git://git.infradead.org/users/dwmw2/linux-firmware.git;protocol=git"
> > > +SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git;protocol=git"
> > 
> > changing git URL (or even just branch) in recipe with SRCPV in PV resets LOCALCOUNT to zero..
> > so breaks upgrade path.
> > 
> > Bump PE or PV to fix that!
> 
> Ping,

Since the mailing list conveniently mangles the Cc: list, I never saw
this original feedback.   I can submit a one line change for PV, but to
be honest, I've no idea how PV is used, nor what LOCALCOUNT is.  Since
it clearly matters to a particular workflow you use, and you understand
how it works, I'd suggest you send the one liner, since you'll be better
able to write a meaningful commit log than I could.

To me, it seems odd that a change in the PR thing doesn't immediately
cause a change in whatever state the test on the PV thing is checking.
That is probably because I've not a clear vision of how they are to be
used and why they have overlapping roles.

Thanks,
Paul.
--

> 
> > NOTE: package linux-firmware-0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2: task do_package: Started
> > ERROR: Package version for package linux-firmware-sd8686 went backwards which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
> > ERROR: Package version for package linux-firmware-rtl8192cu went backwards which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
> > ERROR: Package version for package linux-firmware-rtl8192ce went backwards which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
> > ERROR: Package version for package linux-firmware-rtl8192su went backwards which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
> > ERROR: Package version for package linux-firmware-wl12xx went backwards which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
> > ERROR: Package version for package linux-firmware-dbg went backwards which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
> > ERROR: Package version for package linux-firmware-staticdev went backwards which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
> > ERROR: Package version for package linux-firmware-dev went backwards which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
> > ERROR: Package version for package linux-firmware-doc went backwards which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
> > ERROR: Package version for package linux-firmware-locale went backwards which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
> > ERROR: Package version for package linux-firmware went backwards which would break package feeds from (0:0.0+git2+15888a2eab052ac3d3f49334e4f6f05f347a516e-r1 to 0:0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2)
> > NOTE: package linux-firmware-0.0+git1+e98750f0d68d0037ce5a186f7f863a9c13bf773a-r2: task do_package: Succeeded
> > 
> > Cheers,
> > 
> > >  
> > >  S = "${WORKDIR}/git"
> > >  
> > > 
> > > 
> > > _______________________________________________
> > > Openembedded-commits mailing list
> > > Openembedded-commits@lists.openembedded.org
> > > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
> > 
> > -- 
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> 
> 
> 
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com




