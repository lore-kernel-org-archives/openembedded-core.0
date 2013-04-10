Received: from devils.ext.ti.com ([198.47.26.153])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1UPx2C-0001hT-66
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 17:34:12 +0200
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3AFGf26024877
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2013 10:16:41 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r3AFGf0L021934
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2013 10:16:41 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 10 Apr 2013 10:16:40 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Wed, 10 Apr 2013 10:16:41 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCHv2 1/2][for-danny] linux-dtb: Add simple DTB symlinks
	for devicetree
Thread-Index: AQHOMTf07NtieyGeLEqohYKImIYnvJjMN8QAgANiI7CAAABKIA==
Date: Wed, 10 Apr 2013 15:16:40 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594D8E8A@DLEE11.ent.ti.com>
References: <1365081955-19381-1-git-send-email-Chase.Maupin@ti.com>
	<7D46E86EC0A8354091174257B2FED101594CB39E@DLEE11.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED101594D8E0F@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED101594D8E0F@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCHv2 1/2][for-danny] linux-dtb: Add simple DTB symlinks for devicetree
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Apr 2013 15:34:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: Maupin, Chase
> Sent: Wednesday, April 10, 2013 10:15 AM
> To: Maupin, Chase; openembedded-core@lists.openembedded.org
> Subject: RE: [PATCHv2 1/2][for-danny] linux-dtb: Add simple DTB
> symlinks for devicetree
>=20
> Probably would have helped if I submitted it to the right list.
> Please ignore

OK, now I know I'm not thinking straight, this is the right list.

In that case ping on this.

>=20
> > From: Maupin, Chase
> > Sent: Monday, April 08, 2013 6:35 AM
> > To: Maupin, Chase; openembedded-core@lists.openembedded.org
> > Subject: RE: [PATCHv2 1/2][for-danny] linux-dtb: Add simple DTB
> > symlinks for devicetree
> >
> > Ping on this set
> >
> >
> > > -----Original Message-----
> > > From: Maupin, Chase
> > > Sent: Thursday, April 04, 2013 8:26 AM
> > > To: openembedded-core@lists.openembedded.org
> > > Cc: Maupin, Chase
> > > Subject: [PATCHv2 1/2][for-danny] linux-dtb: Add simple DTB
> > > symlinks for devicetree
> > >
> > > * This is similar to the symlinks provided for the kernel
> image
> > >   in the /boot directory of a file system.  The goal is to
> have
> > >   simply named symlinks in /boot that mirror the device tree
> > >   name in the kernel sources.  This is so that programs like
> > >   U-Boot can easily find the default device tree binary in
> the
> > >   /boot directory and use that when booting the kernel.
> > > * Use update-alternatives to handle proper creation and
> removal
> > >   of the symlinks.
> > > * This patch has already been accepted into the master branch
> > >   http://cgit.openembedded.org/openembedded-
> > > core/commit/?id=3D750a9554e1b85d9bd23d18e0630723c3c193c604
> > >
> > > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > > ---
> > > * Updated in version 2
> > >     * Changed the variable names to use variables that match
> > the
> > >       do_install and do_deploy more closely for consistency.
> > > i.e.
> > >       using DTB_SYMLINK_NAME instead of DTB_NAME.
> > >     * The above changes were based on input from:
> > >         * Darren Hart <dvhart@linux.intel.com>
> > >         * Bruce Ashfield <bruce.ashfield@windriver.com>
> > > ---
> > >  meta/recipes-kernel/linux/linux-dtb.inc |   20
> > > ++++++++++++++++++++
> > >  1 files changed, 20 insertions(+), 0 deletions(-)
> > >
> > > diff --git a/meta/recipes-kernel/linux/linux-dtb.inc
> > > b/meta/recipes-kernel/linux/linux-dtb.inc
> > > index d39f49d..36852b5 100644
> > > --- a/meta/recipes-kernel/linux/linux-dtb.inc
> > > +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> > > @@ -45,3 +45,23 @@ do_deploy_append() {
> > >          done
> > >      fi
> > >  }
> > > +
> > > +pkg_postinst_kernel-devicetree () {
> > > +    cd /${KERNEL_IMAGEDEST}
> > > +    for DTS_FILE in ${KERNEL_DEVICETREE}
> > > +    do
> > > +        DTS_BASE_NAME=3D`basename ${DTS_FILE} | awk -F "."
> > '{print
> > > $1}'`
> > > +        DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_NAME}
> |
> > > sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> > > +        update-alternatives --install
> > > /${KERNEL_IMAGEDEST}/${DTS_BASE_NAME}.dtb
> ${DTS_BASE_NAME}.dtb
> > > devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
> > > +    done
> > > +}
> > > +
> > > +pkg_postrm_kernel-devicetree () {
> > > +    cd /${KERNEL_IMAGEDEST}
> > > +    for DTS_FILE in ${KERNEL_DEVICETREE}
> > > +    do
> > > +        DTS_BASE_NAME=3D`basename ${DTS_FILE} | awk -F "."
> > '{print
> > > $1}'`
> > > +        DTB_SYMLINK_NAME=3D`echo ${KERNEL_IMAGE_SYMLINK_NAME}
> |
> > > sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> > > +        update-alternatives --remove ${DTS_BASE_NAME}.dtb
> > > devicetree-${DTB_SYMLINK_NAME}.dtb ${KERNEL_PRIORITY} || true
> > > +    done
> > > +}
> > > --
> > > 1.7.0.4



