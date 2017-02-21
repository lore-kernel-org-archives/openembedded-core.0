Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2301B71D97
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 09:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 9AF0231E102B;
	Tue, 21 Feb 2017 10:53:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id S-u27CPlQFrY; Tue, 21 Feb 2017 10:53:49 +0100 (CET)
Received: from t510.zcs.saftware.de (p57A61904.dip0.t-ipconnect.de
	[87.166.25.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id CFBB531E0F80;
	Tue, 21 Feb 2017 10:53:48 +0100 (CET)
Date: Tue, 21 Feb 2017 10:53:47 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170221105347.7b9a23c6@t510.zcs.saftware.de>
In-Reply-To: <CAJTo0Lacj_34LppjT-qeE5UCmHyET1RyYDavRQ5xvQ=eOiS2JQ@mail.gmail.com>
References: <1487241290-6188-1-git-send-email-obi@opendreambox.org>
	<1487241290-6188-2-git-send-email-obi@opendreambox.org>
	<CAJTo0Lacj_34LppjT-qeE5UCmHyET1RyYDavRQ5xvQ=eOiS2JQ@mail.gmail.com>
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] ffmpeg: Fix the license description
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
X-List-Received-Date: Tue, 21 Feb 2017 09:53:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Feb 2017 01:21:35 +0000
"Burton, Ross" <ross.burton@intel.com> wrote:

> On 16 February 2017 at 10:34, Andreas Oberritter <obi@opendreambox.org>
> wrote:
>=20
> > +LICENSE =3D "BSD & GPLv2+ & LGPLv2.1+ & MIT"
> > +LICENSE_${PN} =3D "GPLv2+"
> > +LICENSE_libavcodec =3D "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> > 'GPLv2+', 'LGPLv2.1+', d)}"
> > +LICENSE_libavdevice =3D "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> > 'GPLv2+', 'LGPLv2.1+', d)}"
> > +LICENSE_libavfilter =3D "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> > 'GPLv2+', 'LGPLv2.1+', d)}"
> > +LICENSE_libavformat =3D "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> > 'GPLv2+', 'LGPLv2.1+', d)}"
> > +LICENSE_libavresample =3D "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> > 'GPLv2+', 'LGPLv2.1+', d)}"
> > +LICENSE_libavutil =3D "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> > 'GPLv2+', 'LGPLv2.1+', d)}"
> > +LICENSE_libpostproc =3D "GPLv2+"
> > +LICENSE_libswresample =3D "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> > 'GPLv2+', 'LGPLv2.1+', d)}"
> > +LICENSE_libswscale =3D "${@bb.utils.contains('PACKAGECONFIG', 'gpl',
> > 'GPLv2+', 'LGPLv2.1+', d)}"
> > =20
>=20
> Using a script to extract the pkgdata information, I see this license
> information in the runtime libraries.
>=20
> libswscale-dev: BSD & GPLv2+ & LGPLv2.1+ & MIT
> libswresample-dev: BSD & GPLv2+ & LGPLv2.1+ & MIT
> libpostproc-dev: BSD & GPLv2+ & LGPLv2.1+ & MIT
> libavutil-dev: BSD & GPLv2+ & LGPLv2.1+ & MIT
> libavformat-dev: BSD & GPLv2+ & LGPLv2.1+ & MIT
> libavfilter-dev: BSD & GPLv2+ & LGPLv2.1+ & MIT
> libavdevice-dev: BSD & GPLv2+ & LGPLv2.1+ & MIT
> libavcodec-dev: BSD & GPLv2+ & LGPLv2.1+ & MIT
> libswscale: GPLv2+
> libswresample: GPLv2+
> libpostproc: GPLv2+
> libavutil: GPLv2+
> libavformat: GPLv2+
> libavfilter: GPLv2+
> libavdevice: GPLv2+
> libavcodec: GPLv2+
> ffmpeg-dbg: BSD & GPLv2+ & LGPLv2.1+ & MIT
> ffmpeg-staticdev: BSD & GPLv2+ & LGPLv2.1+ & MIT
> ffmpeg-dev: BSD & GPLv2+ & LGPLv2.1+ & MIT
> ffmpeg-doc: BSD & GPLv2+ & LGPLv2.1+ & MIT
> ffmpeg-locale: BSD & GPLv2+ & LGPLv2.1+ & MIT
> ffmpeg: GPLv2+
>=20
> It looks like the BSD/LGPL/MIT license statements don't end up in any
> packages which actually contain binaries.  Is this correct?

Yes, because LICENSE describes the source licenses, whereas LICENSE_.* desc=
ribes
licenses of binary packages [1].

The binary packages contain combined work. Quoted from FFmpeg's docs (LICEN=
SE.md):

=E2=80=9EMost files in FFmpeg are under the GNU Lesser General Public Licen=
se version 2.1
or later (LGPL v2.1+). Read the file `COPYING.LGPLv2.1` for details. Some o=
ther
files have MIT/X11/BSD-style licenses. In combination the LGPL v2.1+ applie=
s to
FFmpeg.=E2=80=9C

If you disable the 'gpl' PACKAGECONFIG knob, the binary packages will get t=
he LGPLv2+
license tag (except for libpostproc), and slightly reduced functionality.

Regards,
Andreas

[1]: http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#va=
r-LICENSE

