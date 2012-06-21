Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>)
	id 1ShqZT-0001PA-1K; Fri, 22 Jun 2012 01:13:51 +0200
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009))
	with ESMTPA id <0M5Z00HKRPBSB75C@vms173001.mailsrvcs.net>; Thu,
	21 Jun 2012 18:02:31 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 545AF20564; Thu,
	21 Jun 2012 19:02:16 -0400 (EDT)
Date: Thu, 21 Jun 2012 19:02:16 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <CALbNGRQCVUeZFX_xxVe=3ixZMm7MRt3WWB5VxemNs0Bi+qCHcQ@mail.gmail.com>
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-id: <20120621230216.GD30753@denix.org>
MIME-version: 1.0
References: <CALbNGRQCVUeZFX_xxVe=3ixZMm7MRt3WWB5VxemNs0Bi+qCHcQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [meta-ti] massive fallout after updates / was (no subject)
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
X-List-Received-Date: Thu, 21 Jun 2012 23:13:51 -0000
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: QUOTED-PRINTABLE
Content-disposition: inline

On Fri, Jun 22, 2012 at 12:11:46AM +0200, Andreas M=FCller wrote:
> On Thu, Jun 21, 2012 at 11:36 PM, Andreas M=FCller
> <schnitzeltony@googlemail.com> wrote:
> > after updating all my repos (angstrom+few extra layers) I get
>=20
> The error seems to be caused by meta-ti. When removed, parsing work=
s
> as expected. By re-including I get now:
>=20
> ERROR: ExpansionError during parsing
> /home/Superandy/data/oe-core/sources/meta-ti/recipes-ti/gstreamer-t=
i/gstreamer-ti_svn.bb:
> Failure expanding variable FILESPATH, expression was
> ${@base_set_filespath([
> "/home/Superandy/data/oe-core/sources/meta-ti/recipes-ti/gstreamer-=
ti/gstreamer-ti-svnr962-r85+${MACHINE_KERNEL_PR}",

Could be caused by MACHINE_KERNEL_PR being undefined... What machine =
you are=20
building for?

--=20
Denys


> "/home/Superandy/data/oe-core/sources/meta-ti/recipes-ti/gstreamer-=
ti/gstreamer-ti-svnr962",
> "/home/Superandy/data/oe-core/sources/meta-ti/recipes-ti/gstreamer-=
ti/gstreamer-ti",
> "/home/Superandy/data/oe-core/sources/meta-ti/recipes-ti/gstreamer-=
ti/gstreamer-ti-svnr962",
> "/home/Superandy/data/oe-core/sources/meta-ti/recipes-ti/gstreamer-=
ti/gstreamer-ti",
> "/home/Superandy/data/oe-core/sources/meta-ti/recipes-ti/gstreamer-=
ti/files",
> "/home/Superandy/data/oe-core/sources/meta-ti/recipes-ti/gstreamer-=
ti"
> ], d)} which triggered exception SyntaxError: EOL while scanning
> string literal (FILESPATH, line 1)
> ERROR: No recipes available for:
>   /home/Superandy/data/oe-core/sources/meta-intel/meta-sugarbay/rec=
ipes-kernel/linux/linux-yocto_3.2.bbappend
>   /home/Superandy/data/oe-core/sources/meta-intel/meta-crownbay/rec=
ipes-kernel/linux/linux-yocto_3.2.bbappend
>   /home/Superandy/data/oe-core/sources/meta-intel/meta-emenlow/reci=
pes-kernel/linux/linux-yocto_3.2.bbappend
>   /home/Superandy/data/oe-core/sources/meta-intel/meta-fishriver/re=
cipes-kernel/linux/linux-yocto_3.2.bbappend
>   /home/Superandy/data/oe-core/sources/meta-intel/meta-fri2/recipes=
-kernel/linux/linux-yocto_3.2.bbappend
>   /home/Superandy/data/oe-core/sources/meta-intel/meta-jasperforest=
/recipes-kernel/linux/linux-yocto_3.2.bbappend
>   ......
>=20
> Andreas
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>=20



