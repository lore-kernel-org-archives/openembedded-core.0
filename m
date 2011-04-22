Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QDJeB-0003LJ-4o
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 18:55:59 +0200
Received: by eye27 with SMTP id 27so212744eye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2011 09:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=KLT54vsM+GNKRtlP4n2RmGB33qIKDr26KTGLkU/3Re4=;
	b=fhzJ9sU4+IlYGxjAL3vYZ9MEBjn00sOlD9pnyILsboBJ2pW258H0sYZVefbqpa1sw9
	pNZ5f0yBotNpyIrPzvqRsVfhKFh5FY68toQpe+xjCF5q1PKWaTbL58ij131CZ/tdHRJq
	ERBXWqVlP1Q4tIGcpH10yB9E5Ll8BcKGmat8o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=lazDrFaSgbgLSnz3py/BlXyFY87BG/dYyMGXUYMpY01nMdcQmBuR6Cn+HG1hRHxq7C
	HEQWqg2XrQ3iSal5CMw4c+nrkkGQAq51U4Fj49FygzpUvrY2K2k5QfXD0HudJDXq6TMC
	UrpzMLMJvxktyT9OjzNPbsObi/UXI09uShaHk=
Received: by 10.14.125.146 with SMTP id z18mr435264eeh.28.1303491210079; Fri,
	22 Apr 2011 09:53:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.119.196 with HTTP; Fri, 22 Apr 2011 09:53:00 -0700 (PDT)
In-Reply-To: <1a8652d5f06208f11f999288582c57e5d00f44d9.1303453279.git.sgw@linux.intel.com>
References: <cover.1303453279.git.sgw@linux.intel.com>
	<1a8652d5f06208f11f999288582c57e5d00f44d9.1303453279.git.sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Apr 2011 09:53:00 -0700
Message-ID: <BANLkTikwMv4WWPmmcOog4LRLbtuaNi4mHQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Fri, 22 Apr 2011 19:25:49 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 23/33] ofono: add bluze to DEPENDS list
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
X-List-Received-Date: Fri, 22 Apr 2011 16:55:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 22, 2011 at 12:24 AM, Saul Wold <sgw@linux.intel.com> wrote:
> From: Saul Wold <sgw@linux.intel.com>
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

there is a typo in commit message

> ---
> =C2=A0meta/recipes-connectivity/ofono/ofono.inc | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-con=
nectivity/ofono/ofono.inc
> index 9089670..ee3bc3e 100644
> --- a/meta/recipes-connectivity/ofono/ofono.inc
> +++ b/meta/recipes-connectivity/ofono/ofono.inc
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deb723b61539fee=
f013de476e68b5c50a \
>
> =C2=A0inherit autotools pkgconfig update-rc.d
>
> -DEPENDS =C2=A0=3D "dbus glib-2.0 udev"
> +DEPENDS =C2=A0=3D "dbus glib-2.0 udev bluez4"
>
> =C2=A0INITSCRIPT_NAME =3D "ofono"
> =C2=A0INITSCRIPT_PARAMS =3D "defaults 22"
> --
> 1.7.1
>
>


