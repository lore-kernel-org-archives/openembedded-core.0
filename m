Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RZ73Z-0000nV-FJ
	for openembedded-core@openembedded.org; Fri, 09 Dec 2011 21:28:33 +0100
Received: by lahd3 with SMTP id d3so1262230lah.6
	for <openembedded-core@openembedded.org>;
	Fri, 09 Dec 2011 12:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=G4AWCF0ecNNtieYh6KXL3w9Kvdko65pF5cg07y/CifM=;
	b=k68b9gkW7rv/1ODWevaSJNBvHTAgZgpMPZ5k884yuPzpmtw/AaAab9yjSTFeBu1aLs
	UdyJdSu2s16PUOs0rWR/kcIOV680H2Rp3YQRlxZzVp+Gc9i/5EktKUT2HQ7SHtYEVhIz
	FS3pMg0DZu6zYv7JZ/PA8VpMgmGP0nVqtsiCU=
Received: by 10.152.106.115 with SMTP id gt19mr5880344lab.27.1323462102331;
	Fri, 09 Dec 2011 12:21:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Fri, 9 Dec 2011 12:21:11 -0800 (PST)
In-Reply-To: <94eb40ea45e45387d28fc04e3929f1044188b589.1323333676.git.sgw@linux.intel.com>
References: <cover.1323333676.git.sgw@linux.intel.com>
	<94eb40ea45e45387d28fc04e3929f1044188b589.1323333676.git.sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 9 Dec 2011 12:21:11 -0800
Message-ID: <CAMKF1sru2cSoejrGD6OEDxvYeoD7XzrrkzhApZJqWWjukjL6fA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-core@openembedded.org
Subject: Re: [CONSOLIDATED PULL 15/17] wget: enable https and openssl
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
X-List-Received-Date: Fri, 09 Dec 2011 20:28:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 8, 2011 at 12:44 AM, Saul Wold <sgw@linux.intel.com> wrote:
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> =C2=A0meta/recipes-extended/wget/wget.inc | =C2=A0 =C2=A06 +++---
> =C2=A01 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/=
wget/wget.inc
> index 91400cc..7083569 100644
> --- a/meta/recipes-extended/wget/wget.inc
> +++ b/meta/recipes-extended/wget/wget.inc
> @@ -2,13 +2,13 @@ DESCRIPTION =3D "A console URL download utility featuri=
ng HTTP, FTP, and more."
> =C2=A0SECTION =3D "console/network"
> =C2=A0LICENSE =3D "GPL"
> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d=
47fae504"
> +DEPENDS =3D "openssl"
>
> -INC_PR =3D "r11"
> +INC_PR =3D "r12"
>
> =C2=A0inherit autotools gettext update-alternatives
>
> -# Disable checking for SSL since that searches the system paths
> -EXTRA_OECONF =3D "--with-libc --enable-ipv6 --without-ssl"
> +EXTRA_OECONF =3D "--with-libc --enable-ipv6 --with-ssl=3Dopenssl"

this deserves to be a configurable thing IMO


