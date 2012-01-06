Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1RjAv4-0006rn-Jb
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 15:37:25 +0100
Received: by pbcc11 with SMTP id c11so816492pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jan 2012 06:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=ZYvLAazdLxhSWKvKF5jhrd69fcXcC7q6Sl9U4MTyJf4=;
	b=SDIIzOli5at9xhVS/KPt0pCthAVPURpVnCIfC+KQ8vSXvpTiOYK1c5i8a6uPrWf2yw
	wFgUHcpI7qqWadvLXKwev1vOaKlfDk/wrbGb5kMD3i0ebPk9O2Lkm8ux8bFVnwY2pLOs
	UuzBjv4SKD8Uxp0N1c7OInClb8Ov9fZMoKUNA=
MIME-Version: 1.0
Received: by 10.68.191.195 with SMTP id ha3mr15812506pbc.130.1325860197589;
	Fri, 06 Jan 2012 06:29:57 -0800 (PST)
Received: by 10.143.30.20 with HTTP; Fri, 6 Jan 2012 06:29:57 -0800 (PST)
In-Reply-To: <1325752666-28560-1-git-send-email-liming.wang@windriver.com>
References: <1325752666-28560-1-git-send-email-liming.wang@windriver.com>
Date: Fri, 6 Jan 2012 09:29:57 -0500
Message-ID: <CADkTA4PYbE4gw8Rmwn8Xg6Ns9zajCLKQWJHLWo7qxX8rNbvPsQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] qemuppc: replace emulation of qemuppc
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
X-List-Received-Date: Fri, 06 Jan 2012 14:37:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 5, 2012 at 3:37 AM, Liming Wang <liming.wang@windriver.com> wro=
te:
> Hi Richard,
>
> These patches are aimed to replace emulation of qemuppc from prep to mac9=
9.
> With this new emulation, qemuppc now supports framebuffer and the network
> works well.
>
> The kernel config also needs modification and I will let Bruce to review =
the
> patches.

I have the patches in my inbox now, I'm reviewing and merging them shortly.
I'll pull these changes in to do some boot and runtime testing as well.

Richard/Saul: if it works better for coordination purposes, I can do the ke=
rnel
part, take this into my tree as well and then send a single coordinated pul=
l
request when everything is known to work together.

Cheers,

Bruce

>
> The following changes since commit 0ff1d667dc23b0cc903c18f1b5e032c2b6630a=
ae:
>
> =A0distro: Add poky-tiny distro definition
>
> are available in the git repository at:
>
> =A0git://128.224.162.211/poky.git qemuppc-new
>
> Liming Wang (4):
> =A0 =A0 =A0qemuppc: replace emulation of qemuppc from prep to mac99
> =A0 =A0 =A0qemuppc: add pointercal file
> =A0 =A0 =A0qemuppc: add machconfig
> =A0 =A0 =A0tslib: enable big endian support for qemuppc
>
> =A0meta/conf/machine/qemuppc.conf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A02 +-
> =A0.../formfactor/files/qemuppc/machconfig =A0 =A0 =A0 =A0 =A0 =A0| =A0 1=
0 ++++++++++
> =A0.../pointercal/files/qemuppc/pointercal =A0 =A0 =A0 =A0 =A0 =A0| =A0Bi=
n 0 -> 36 bytes
> =A0meta/recipes-graphics/tslib/tslib_1.0.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
1 +
> =A0scripts/runqemu =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0| =A0 =A07 +------
> =A0scripts/runqemu-internal =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 16 ++++++++--------
> =A06 files changed, 21 insertions(+), 15 deletions(-)
> =A0create mode 100755 meta/recipes-bsp/formfactor/files/qemuppc/machconfi=
g
> =A0create mode 100644 meta/recipes-bsp/pointercal/files/qemuppc/pointerca=
l
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


