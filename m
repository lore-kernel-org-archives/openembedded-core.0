Return-Path: <dbaryshkov@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 017327E601
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 12:07:06 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id n190so15172666pgn.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 05:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=F6pmTU3xJT0dFl3hYq5mxNEdEJ/yLgBe/MgGgebniZI=;
	b=RhQwroWkLGOTyYgL5YkXQGVI72Ltp1/c99SMtJNzLYVe06rEgJIMOF3nfAAT+IrScn
	YlUyuPMZYFbaAlORenqpHlwlLkj9+ToPm0PC0VBIsdRSe3ukJ5kLZw6nsIQ+gk+b1EKL
	jvoam3I6p/YZd0W0bSJtNd/7Jcct3P2j7JuqhIzZWcLeZlPOk80Yz4nlXOPpfIisLEcz
	Lv0vyvdvlwL6AULJUpZzDbyZRuxy/YdkHSSaQmayA/cZik9Bd+1yCCNrg6bLMGM6+exW
	Upq7fc5seQT7rlcCkABIdDHYMwL/78xpPWOkSIjj/485/nZWmnOoW5CsKzVwfH5cLErO
	ecXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=F6pmTU3xJT0dFl3hYq5mxNEdEJ/yLgBe/MgGgebniZI=;
	b=fY2WhqR1pMJgnvsXNyEgHRq9szFPdZE+c3r0lTVMDbSJhE3uy+C9ViKdI4PlI6iNWo
	jnBkuIdDD6x0vb0Kryxm/0qcb40SFVEwZZmk4L+fPK1iO0WO508xJqcxVQa/mX7X1XtJ
	50gsY2ZCYEZ9UNNAukZHSHsrYB952P6yIHlTc5foqfMo0LpS+7Gb2ueoXGvYTLTYW0h5
	eSzh1Ka9fpYMzww51fGHlCLKsPzQeBSDyHS7+O5jjX6HB6zmX5iqGlxrcSgiQrEkwmVW
	nk4X+tMgSbgtL9w5BT6WWi/2PSrDU628fEX8yeG+Kl75neW++vtjVmATe1HjNKFMFPCK
	DJ2Q==
X-Gm-Message-State: APjAAAVnpCFLurLI3IuX99IstLtymBqSSOkNqk7NxYsRa+Jo3IvOvIwM
	SQQ+o70WkhNo0NGbwamAFn4i6y7RR6AzYCah3QI=
X-Google-Smtp-Source: APXvYqyXE2a1VJWpkeqwsrus61zt9wYtSff+g8fmVYIH+FHNZAYkxr9TD5uvgZYb3K2/8UM9J+MrEcq8aJ+qT4s255Y=
X-Received: by 2002:a63:534d:: with SMTP id t13mr43347196pgl.313.1568376427959;
	Fri, 13 Sep 2019 05:07:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190911093001.7849-1-dbaryshkov@gmail.com>
	<DM6PR11MB343694FD68FA565D1B1C6628A3B30@DM6PR11MB3436.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB343694FD68FA565D1B1C6628A3B30@DM6PR11MB3436.namprd11.prod.outlook.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Date: Fri, 13 Sep 2019 15:06:55 +0300
Message-ID: <CALT56yN-K+iZOfu+mOoeY7p-2FH0vcXJMUcpiAAEz1hAnhr81A@mail.gmail.com>
To: "Ang, Chin Huat" <chin.huat.ang@intel.com>
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/9] uefi.bbclass: add bbclass holding configuration for UEFI applications
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
X-List-Received-Date: Fri, 13 Sep 2019 12:07:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 13 =D1=81=D0=B5=D0=BD=D1=82. 2019 =D0=B3. =D0=B2 05:14, Ang, =
Chin Huat <chin.huat.ang@intel.com>:
>
> > +        image =3D "bootUNKNOWN.efi"
>
> It might be better to raise an error here.

Fine, I can change in v2.

>
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-bounces@lists.openembedded.org> On Behalf Of dbaryshkov@gmail.com
> Sent: Wednesday, September 11, 2019 5:30 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
> Subject: [OE-core] [PATCH 1/9] uefi.bbclass: add bbclass holding configur=
ation for UEFI applications
>
> From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
>
> Create new bbclass defining common variables for all UEFI-related package=
s (bootloaders, test applications, etc).
>
> Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.co=
m>
> ---
>  meta/classes/uefi.bbclass | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 meta/classes/uefi.bbclass
>
> diff --git a/meta/classes/uefi.bbclass b/meta/classes/uefi.bbclass new fi=
le mode 100644 index 000000000000..d3fc4b686676
> --- /dev/null
> +++ b/meta/classes/uefi.bbclass
> @@ -0,0 +1,26 @@
> +# Location of EFI files inside EFI System Partition EFIDIR ?=3D
> +"/EFI/BOOT"
> +
> +# Prefix where ESP is mounted inside rootfs. Set to empty if package is
> +going # to be installed to ESP directly EFI_PREFIX ?=3D "/boot"
> +
> +# Location inside rootfs.
> +EFI_FILES_PATH =3D "${EFI_PREFIX}${EFIDIR}"
> +
> +# Determine name of bootloader image
> +python __anonymous () {
> +    import re
> +    target =3D d.getVar('TARGET_ARCH')
> +    if target =3D=3D "x86_64":
> +        image =3D "bootx64.efi"
> +    elif re.match('i.86', target):
> +        image =3D "bootia32.efi"
> +    elif re.match('aarch64', target):
> +        image =3D "bootaa64.efi"
> +    elif re.match('arm', target):
> +        image =3D "bootarm.efi"
> +    else:
> +        image =3D "bootUNKNOWN.efi"
> +    d.setVar("EFI_BOOT_IMAGE", image)
> +}
> --
> 2.23.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--=20
With best wishes
Dmitry

