Received: from smtp23.4emm.com ([69.18.222.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1S4jId-00031r-LG
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 02:34:47 +0100
Received: from MBX20.4emm.local ([fe80::382d:f6d3:f4de:a97f]) by
	HUB23.4emm.local ([::1]) with mapi id 14.01.0289.001; Mon, 5 Mar 2012
	20:26:13 -0500
From: James Limbouris <james@digitalmatter.com.au>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] mtd-utils: clean up old files
Thread-Index: AQHM9eHtlEiR9+VRN0ii21wp31SAypZclISA///uKqA=
Date: Tue, 6 Mar 2012 01:26:12 +0000
Message-ID: <840A81C1B782724A8EB52725BD519EFF338055C6@MBX20.4emm.local>
References: <1330410346-14477-1-git-send-email-james@digitalmatter.com.au>
	<4F552EDB.9070408@linux.intel.com>
In-Reply-To: <4F552EDB.9070408@linux.intel.com>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [203.59.132.158]
MIME-Version: 1.0
Subject: Re: [PATCH] mtd-utils: clean up old files
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
X-List-Received-Date: Tue, 06 Mar 2012 01:34:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Tuesday, 6 March 2012 5:24 AM
> To: Patches and discussions about the oe-core layer
> Cc: James Limbouris
> Subject: Re: [OE-core] [PATCH] mtd-utils: clean up old files
>=20
> On 02/27/2012 10:25 PM, James Limbouris wrote:
> > Signed-off-by: James Limbouris<james@digitalmatter.com.au>
> > ---
> >   .../add-exclusion-to-mkfs-jffs2-git-2.patch        |  103 -----------=
----
> >   .../add-exclusion-to-mkfs-jffs2-git.patch          |  136 -----------=
---------
> >   .../mtd/mtd-utils/fix-ignoreerrors-git.patch       |   28 ----
> >   .../mtd/mtd-utils/remove-ubi.patch                 |   35 -----
> >   meta/recipes-devtools/mtd/mtd-utils_1.1.0+git.bb   |   28 ----
> >   5 files changed, 0 insertions(+), 330 deletions(-)
> >   delete mode 100644 meta/recipes-devtools/mtd/mtd-utils-1.4.9/mtd-
> utils-1.4.1/add-exclusion-to-mkfs-jffs2-git-2.patch
> >   delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/add-
> exclusion-to-mkfs-jffs2-git.patch
> >   delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/fix-
> ignoreerrors-git.patch
> >   delete mode 100644 meta/recipes-devtools/mtd/mtd-utils/remove-
> ubi.patch
> >   delete mode 100644 meta/recipes-devtools/mtd/mtd-utils_1.1.0+git.bb
> >
>=20
> Sorry for the delay on this one, not sure why you are removing the git
> version of the recipe?  If anything you could move it forward to the
> latetest git version and clean up the patches as needed.
>=20
> Thanks
> 	Sau!

Hi Saul,

It seems they are both git recipes, only the 1.4.1 recipe is missing depend=
encies, has no LIC_FILES_CHKSUM, and has a different license tag.
It looks to me like it hasn't built for some time... There is also a bogus =
folder full of 1.4.1 patches in the 1.4.9 patches folder.
I think things got mixed up during the recipe reorganisation, a parallel ve=
rsion of mtd-utils was subsequently added, and the original has rotted.

Regards,
James



