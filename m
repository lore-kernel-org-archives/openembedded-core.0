Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QWkXz-00066U-Ih
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Jun 2011 09:29:55 +0200
Received: by pzk36 with SMTP id 36so48772pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2011 00:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=V2C49tgUBrQ/GOhAcZycEb8eDxG8McKJ1iCMyTSy/BQ=;
	b=iO8Yl4e2v/QX4BhLZpS3njJvFQZnT1Di27eXcEPp5QGXxo6uvmV51skNddWDiyvOdf
	C4HNIqf610r5pJkbGNMrVTnMYOIlWaR1R1cXvNgmpL9qkihJ6G0lPSmsKyHr2nYrK0U+
	bRSL3KCzxRNX5g98kRxh37gXDYnz4b1JzYiM0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=LYFaxeVaKGgmNj/xOSgdbd37fPEO3olSBqBADegWfBPlEEld8mM/IylU11ZHZP3iuI
	RyT0PEQJHlf8XCgyd98jd3QaI3Fdp3CPohMK7+cO1btA1yXOKcUB1qXDXzaAFooTddwy
	oJ8dEOzR37rvETQOxgspRS4R6mx9VH31VARJc=
MIME-Version: 1.0
Received: by 10.142.253.20 with SMTP id a20mr31111wfi.190.1308122786619; Wed,
	15 Jun 2011 00:26:26 -0700 (PDT)
Received: by 10.142.178.20 with HTTP; Wed, 15 Jun 2011 00:26:26 -0700 (PDT)
In-Reply-To: <cover.1308122189.git.dexuan.cui@intel.com>
References: <cover.1308122189.git.dexuan.cui@intel.com>
Date: Wed, 15 Jun 2011 09:26:26 +0200
Message-ID: <BANLkTi=z9NEzdU2=OCxGWVhdMBwsipXvgw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] fix the mesa-dri build failure after upgrading to newer glproto and dri2proto
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
X-List-Received-Date: Wed, 15 Jun 2011 07:29:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2011 at 9:19 AM, Dexuan Cui <dexuan.cui@intel.com> wrote:
> Please review them.

Acked-by: Martin.Jansa <Martin.Jansa@gmail.com>

with sort of deja vu :)
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dde74afec8a06=
7071d17365438d6c462664bc5054
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3Df02e320146c7=
01ad0f02f7daf52acac6389c71fd
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3Df2a73450a70d=
113d77fbf703772fbf0db81e8e61

>
> The following changes since commit 6719d1e245234767bb5409c30dd34388ab9355=
50:
>
> are available in the git repository at:
> =A0git://git.pokylinux.org/poky-contrib dcui/fix_mesa-dri
> =A0http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Ddcui/fix_mesa-=
dri
>
> Dexuan Cui (2):
> =A0glproto: Revert "glxproto: make GLX swap event struct match spec"
> =A0dri2proto: Revert "dri2proto: make DRI2 swap event match GLX spec"
>
> =A0.../restore_to_old_xDRI2BufferSwapComplete.patch =A0 | =A0 53 ++++++++=
++++++++++++
> =A0meta/recipes-graphics/xorg-proto/dri2proto_2.4.bb =A0| =A0 =A03 +-
> =A0.../restore_the_old_xGLXBufferSwapComplete.patch =A0 | =A0 53 ++++++++=
++++++++++++
> =A0meta/recipes-graphics/xorg-proto/glproto_1.4.13.bb | =A0 =A03 +-
> =A04 files changed, 110 insertions(+), 2 deletions(-)
> =A0create mode 100644 meta/recipes-graphics/xorg-proto/dri2proto/restore_=
to_old_xDRI2BufferSwapComplete.patch
> =A0create mode 100644 meta/recipes-graphics/xorg-proto/glproto/restore_th=
e_old_xGLXBufferSwapComplete.patch
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


