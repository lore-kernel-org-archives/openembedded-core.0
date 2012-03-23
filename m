Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SB9Z2-0005M9-Qx
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 19:50:16 +0100
Received: by wibhm17 with SMTP id hm17so1993015wib.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 11:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=ghfNkzaa5c8dOgmrsEoMQUCu0kHxW7+SWvn5NRkTFOQ=;
	b=udY0l3axp9+dTw6COcQp34PQKflgQixXETB6KL9nAerDnL8ycinFn5mW4QEv0qCRQS
	bn4qkwhiNUqSt9YS0cxuJzUD+492aXjA4raL6cpqXvqqdsn4mMuKlswlpkB4H8iHQ+f6
	qE8OeYFh9VFxKihuY3D6x57UE3e2GpoYqkMba/lECFYiae/49fTWLVjhsXUAcDlWnTHD
	sRHu2iD9kJxWynyRFf2BTqIBtmloOB2b/bHlwLV/LtFGPzee+/960d1f6IFakEfYJB5t
	5MlaPy8BF6LonFce5f7Yo95cOOSsrJdKrz0I9hysgizHiCLOhgeena9BHaoIsileFp/8
	zNzw==
MIME-Version: 1.0
Received: by 10.216.132.18 with SMTP id n18mr7544976wei.81.1332528080481; Fri,
	23 Mar 2012 11:41:20 -0700 (PDT)
Received: by 10.216.38.135 with HTTP; Fri, 23 Mar 2012 11:41:20 -0700 (PDT)
In-Reply-To: <cover.1332522200.git.bruce.ashfield@windriver.com>
References: <cover.1332522200.git.bruce.ashfield@windriver.com>
Date: Fri, 23 Mar 2012 14:41:20 -0400
Message-ID: <CADkTA4PCRHJRRWDyXg+6--_ve+L87-R=Civbx5CsGtNUYH64XQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] linux-libc-headers: 3.2 and linux-libc-headers-yocto movement
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
X-List-Received-Date: Fri, 23 Mar 2012 18:50:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 1:07 PM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> Richard/Saul,
>
> As discussed on the mailing list here is a libc-headers series. I've kept=
 it in
> three parts so you can pick what you want (except for the minor detail of
> needing to split patch 1/1 to keep 3.1 around if you don't want 2/3).

I just pushed a follow up patch to zedd/libc-headers-oe to fix the
iptables build
issue:

commit 1683eb3fb5d23a7d0e4f33ad9229b8a67c58ad15
Author: Bruce Ashfield <bruce.ashfield@windriver.com>
Date:   Fri Mar 23 14:36:04 2012 -0400

    iptables: fix build error against 3.2+ kernel headers

    The iptables local linux/types.h overrides the kernel/sysroot
    types.h. As such, we need to provide some defines that are required
    to build against 3.2+ kernel headers.

    ifndef protection is provided for the defines to ensure that
    configuration that already have these defines are still buildable.

    This commit is temporary until a new version of iptables can be
    used that contains the defines.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>

:000000 100644 0000000... 09c7989... A
meta/recipes-extended/iptables/iptables/types.h-add-defines-that-are-requir=
ed-for-if_packet.patch
:100644 100644 2d3d311... 663ddad... M
meta/recipes-extended/iptables/iptables_1.4.12.2.bb

If you'd rather have me resend the series, just shout.

Cheers,

Bruce

>
> I've built and booted this on all the emulated targets, and have some oth=
er
> builds running against larger numbers of packages as well.
>
> Cheers,
>
> Bruce
>
> The following changes since commit bb1d7fad7ff8515939f2b5f0b540b9b09604be=
3c:
> =A0Richard Purdie (1):
> =A0 =A0 =A0 =A0Revert "bitbake.conf/sstate.bbclass: Change PATH when inst=
alling sstate files to avoid issues"
>
> are available in the git repository at:
>
> =A0git://git.pokylinux.org/poky-contrib zedd/libc-headers-oe
> =A0http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dzedd/libc-head=
ers-oe
>
> Bruce Ashfield (3):
> =A0linux-libc-headers: add 3.2 headers and remove 3.1
> =A0linux-libc-headers: set default LINUXLIBCVERSION to 3.2
> =A0linux-libc-headers-yocto: remove from oe-core
>
> =A0meta/conf/distro/include/tcmode-default.inc =A0 =A0 =A0 =A0| =A0 =A02 =
+-
> =A0.../linux-libc-headers-yocto_git.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 64 --------------------
> =A0.../linux-libc-headers/linux-libc-headers_3.1.bb =A0 | =A0 =A07 --
> =A0.../linux-libc-headers/linux-libc-headers_3.2.bb =A0 | =A0 =A06 ++
> =A04 files changed, 7 insertions(+), 72 deletions(-)
> =A0delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-h=
eaders-yocto_git.bb
> =A0delete mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-h=
eaders_3.1.bb
> =A0create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-h=
eaders_3.2.bb
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


