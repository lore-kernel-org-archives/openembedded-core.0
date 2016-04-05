Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D7935770D8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 13:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u35DtAC1031074; Tue, 5 Apr 2016 14:55:10 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id n3gfd76oCIfr; Tue,  5 Apr 2016 14:55:09 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u35Dt8uU031071
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 5 Apr 2016 14:55:09 +0100
Message-ID: <1459864507.7348.164.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <saul.wold@intel.com>, Bill Randle <william.c.randle@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 05 Apr 2016 14:55:07 +0100
In-Reply-To: <1459820004.18406.230.camel@intel.com>
References: <1459786689-13082-1-git-send-email-william.c.randle@intel.com>
	<1459820004.18406.230.camel@intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] bdwgc: use github repo for source location
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
X-List-Received-Date: Tue, 05 Apr 2016 13:55:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-04-04 at 18:33 -0700, Saul Wold wrote:
> On Mon, 2016-04-04 at 09:18 -0700, Bill Randle wrote:
> > The Yocto Autobuilder has been unable to fetch the release package
> > from the developer's website at www.hboehm.info, so change recipe
> > to fetch from the developer's github repo instead.
> > 
> > Signed-off-by: Bill Randle <william.c.randle@intel.com>
> > ---
> >  meta/recipes-support/bdwgc/bdwgc_7.4.2.bb | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
> > b/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
> > index 95e358f..7a4110d 100644
> > --- a/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
> > +++ b/meta/recipes-support/bdwgc/bdwgc_7.4.2.bb
> > @@ -21,12 +21,10 @@ SECTION = "devel"
> >  LICENSE = "MIT"
> >  LIC_FILES_CHKSUM =
> > "file://README.QUICK;md5=55f5088f90a982fed7af9a4897047ef7"
> >  
> > -SRC_URI = "http://www.hboehm.info/gc/gc_source/gc-${PV}.tar.gz \
> > +SRCREV = "e31cdc288ffbee5bf25f948e19deb5a7ce846971"
> > +SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-7_4 \
> >             file://0001-fix-build-with-musl.patch \
> >            "
> 
> It appears that when you updated to the git location the source base
> might have changed and the MUSL patch is no longer applyng correctly.
> 
> Please verify that the patch correctly applies.
> 
> See the failure in master-next with your patch:
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-no-x11/bui
> ld
> s/76/steps/BuildImages/logs/stdio
> 
> This might cause more failures in the Autobuilder, this is the first
> that I saw.

The patch is ok, but ${S} wasn't set correctly. I've tweaked in the
version I merged into master.

Cheers,

Richard

