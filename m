Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QI1oF-0003uf-7f
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 18:53:51 +0200
Received: by eye27 with SMTP id 27so726935eye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2011 09:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=4PG4UtlXtSaX55B2uzYE1AkbYA7Yu7xWKOANj+ifOWM=;
	b=glsMUxHF/MGFj/i5U4rZ30A1e8wTtYJ7H4ZgwBA4BpCUZzKx2HKeziO9GCi4Ms6mrX
	j4ldBLUEAy5yziFGSSyc+URP/x8YksK1F9IDSqDfhPsmfZtHUEqJUX8LJV0A9slEugyL
	4x9Ga5BKuz5DaxLxs4mUVRUmdspT7NQPD+5G8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=mQgTM41C8tgHrbkCQPmJQpfsC6qxW1gui4e0n690DpvQAKHkT/5Y3mT50ubnr1ryzZ
	CFOlp20F2w777QV+C3xkj9A+3qA0VeBQIp+Bx3R5uZdy6r9qz66CbZeKLbJPlslZ9FrS
	Z77cDbhB636MZkz4ELVV3scPUQRpu4CxyVi8k=
Received: by 10.14.52.132 with SMTP id e4mr1389664eec.173.1304614271158; Thu,
	05 May 2011 09:51:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Thu, 5 May 2011 09:50:41 -0700 (PDT)
In-Reply-To: <4a158b6ef125b555225472eefbe1ea226dc47c2c.1304581769.git.sgw@linux.intel.com>
References: <cover.1304581769.git.sgw@linux.intel.com>
	<4a158b6ef125b555225472eefbe1ea226dc47c2c.1304581769.git.sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 May 2011 09:50:41 -0700
Message-ID: <BANLkTi=KUxO5zZFU2RRJQ0CouhspAJuKSw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Kyle McMartin <kyle@redhat.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@suse.de>,
	openembedded-core@lists.openembedded.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Kang Kai <kai.kang@windriver.com>, Thomas Meyer <thomas@m3y3r.de>
Subject: Re: [PATCH 03/26] util-linux.inc: remove virtual/libintl from DEPENDS
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
X-List-Received-Date: Thu, 05 May 2011 16:53:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 5, 2011 at 12:55 AM, Saul Wold <sgw@linux.intel.com> wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> inherit gettext should do it.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/recipes-core/util-linux/util-linux.inc | =C2=A0 =C2=A06 +++---
> =C2=A01 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
> index 913bb1b..447e5b7 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -13,10 +13,10 @@ LIC_FILES_CHKSUM =3D "file://README.licensing;md5=3D1=
530e36fe1304d4535513de90a290df9
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fil=
e://licenses/COPYING.UCB;md5=3D263860f8968d8bafa5392cab74285262 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fil=
e://getopt/COPYING;md5=3D8ca43cbc842c2336e835926c2166c28b"
>
> -DEPENDS =3D "zlib ncurses virtual/libintl"
> -DEPENDS_virtclass-native =3D "zlib-native ncurses-native lzo-native gett=
ext-native"
> -
> =C2=A0inherit autotools gettext
> +DEPENDS =3D "zlib ncurses"
> +DEPENDS_virtclass-native_append =3D " lzo-native"
> +
>

This patch is not needed with the applied gettext changes

> =C2=A0SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux-ng/v${MAJOR=
_VERSION}/util-linux-ng-${PV}.tar.bz2 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://MCONFIG \
> --
> 1.7.1.1
>
>


