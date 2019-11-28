Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7E43C7EC64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 04:04:54 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id c124so17176031qkg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 20:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=lTB8LFOWQ+F+RWK9hyef+9vt21XEULw7upPa3mQUbo8=;
	b=DziddtguJctnvH2jjOMCI77eo9oqHmKAbJBk5q5fFuDgfWz30VG9pAGbYE+OBAqx7M
	Q8DjdPf83ZIWUWULeg95rBx0zAOf6jR74RpDQZyjgCWBRtcgV+ImwoMhCgUIFbpwNees
	ctBdoITTfJ/O4cln64RBoloyUXbCeW4Agy0DGP674ZHjSBRicLU+iKtDNhuKR+I4AWBZ
	OtuuD7STAK7IPFKrlH+AlB0gW9jc+5DP8NtJLbd5evs7P6XtrBxS1s/d69T0ylJeQEPl
	t2OeFEdDEhMy/5WF6sRX+mfW+xCe4uwIC2jE3j21EeBsI0qnbixUo9z9b/ytdzFEzEZ0
	vWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=lTB8LFOWQ+F+RWK9hyef+9vt21XEULw7upPa3mQUbo8=;
	b=NFvi41XUtJN/fZKA0UmWHN3U/8EgIzNcpcrZRj/Nxc/aovrZVmGXxF699reodX+mWE
	0JC1lQHMRMd4DU8pTlsj7MEVB6e6ZVS/1/ojaFKgrIn49coCbbMT6M+ZDGJ70Uy1rEPY
	bQz0Itc2tGhuK3CTRaul7hoJyuL5q8yh/SsoJxDSXX+EZxR5Mw2dvA7KxVEttU6Wvi24
	SbxIE/HjadfDp1wjr/aS2aB6C5g3BR9SJDupVfR9b7v8h3dYI/RwuNnkNZ1uUzJTQ4sr
	ROXORooXqHUuoJsLH7L3di1YMEPi+TENMf4TuJmYLEhTAQHjRK1T6jAJzs7n84SXJUgO
	TdlA==
X-Gm-Message-State: APjAAAVmMiCTvePDQ0Q2EjuQrJnwh7fj4GAAR2Byq/30Y0d7I0/Tzaxd
	upYARm4vU+F/6P7OH739PrGaLRbUL9umv+QV02wTQAfI
X-Google-Smtp-Source: APXvYqwJXyxI5yTJYaCzflVeda0kagJ3TXXaAOyeoaiEu4GevzglUy4aXuYCZaUadVE/GoqCH6inkkUhLFmj6UWHAqE=
X-Received: by 2002:a37:a0cf:: with SMTP id j198mr8468388qke.9.1574913894752; 
	Wed, 27 Nov 2019 20:04:54 -0800 (PST)
MIME-Version: 1.0
References: <1574913618-8607-1-git-send-email-saloni.jain@kpit.com>
In-Reply-To: <1574913618-8607-1-git-send-email-saloni.jain@kpit.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Nov 2019 20:04:28 -0800
Message-ID: <CAMKF1sqScBK6VGihNwBvTvDt-vpQi9MN5iZVctTtNegVyLSt3A@mail.gmail.com>
To: Saloni Jain <Saloni.Jain@kpit.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>,
	"Aditya.Tayade" <Aditya.Tayade@partner.bmw.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][master][PATCH] Modified readlink command option in kbd-ptest
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
X-List-Received-Date: Thu, 28 Nov 2019 04:04:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2019 at 8:01 PM Saloni Jain <Saloni.Jain@kpit.com> wrote:
>
> From: "Aditya.Tayade" <Aditya.Tayade@partner.bmw.de>
>
> In embedded box, readlink might be provided by another
> providers like Busybox, which does not support '-e' option.
> Hence, use generic options whenever possible.
> Here used 'readlink -e' option is not necessary, hence removed
> it and used 'readlink -f' option which fixes the below tests:
> 1. alt-is-meta
> 2. dumpkeys-fulltable
>
> This fixes below error:
> readlink: invalid option -- 'e'
> BusyBox v1.27.2 (2019-10-22 14:56:17 UTC) multi-call binary.
>
> Upstream-Status: Pending
> Signed-off-by: saloni <saloni.jain@kpit.com>
> ---
>  .../0001-modify-readlink-command-option.patch      | 46 ++++++++++++++++=
++++++
>  recipes-core/kbd/kbd_%.bbappend                    |  5 +++
>  2 files changed, 51 insertions(+)
>  create mode 100644 recipes-core/kbd/files/0001-modify-readlink-command-o=
ption.patch
>  create mode 100644 recipes-core/kbd/kbd_%.bbappend
>
> diff --git a/recipes-core/kbd/files/0001-modify-readlink-command-option.p=
atch b/recipes-core/kbd/files/0001-modify-readlink-command-option.patch
> new file mode 100644
> index 0000000..df392de
> --- /dev/null
> +++ b/recipes-core/kbd/files/0001-modify-readlink-command-option.patch
> @@ -0,0 +1,46 @@
> +kbd-ptest: Modify readlink command option
> +
> +On target image, readlink binary is provided by Busybox which doesnot
> +support '-e' option. Hence, modified below failing tests to
> +use '-f' option instead of '-e':
> +1.alt-is-meta
> +2.dumpkeys-fulltable
> +
> +This fixes below error:
> +readlink: invalid option -- 'e'
> +BusyBox v1.27.2 (2019-10-22 14:56:17 UTC) multi-call binary.
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Vivek Chaudhari <Vivek.Chaudhari@kpit.com>
> +---
> + tests/alt-is-meta.in        | 2 +-
> + tests/dumpkeys-fulltable.in | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/tests/alt-is-meta.in b/tests/alt-is-meta.in
> +index ddd5ed8..0a76bd3 100755
> +--- a/tests/alt-is-meta.in
> ++++ b/tests/alt-is-meta.in
> +@@ -1,6 +1,6 @@
> + #!/bin/sh -efu
> +
> +-cwd=3D"$(readlink -ev "${0%/*}")"
> ++cwd=3D"$(readlink -fv "${0%/*}")"
> +
> + cd "$cwd"
> +
> +diff --git a/tests/dumpkeys-fulltable.in b/tests/dumpkeys-fulltable.in
> +index 86af9e2..ef0ef71 100755
> +--- a/tests/dumpkeys-fulltable.in
> ++++ b/tests/dumpkeys-fulltable.in
> +@@ -1,6 +1,6 @@
> + #!/bin/sh -efu
> +
> +-cwd=3D"$(readlink -ev "${0%/*}")"
> ++cwd=3D"$(readlink -fv "${0%/*}")"
> +
> + cd "$cwd"
> +
> +--
> +2.7.4
> +

the patch looks ok. Please submit it to upstream kbd as well.

> diff --git a/recipes-core/kbd/kbd_%.bbappend b/recipes-core/kbd/kbd_%.bba=
ppend
> new file mode 100644
> index 0000000..ee8ea98
> --- /dev/null
> +++ b/recipes-core/kbd/kbd_%.bbappend
> @@ -0,0 +1,5 @@
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"
> +
> +SRC_URI +=3D "\
> +    file://0001-modify-readlink-command-option.patch \
> +"

No need to have a bbappend, please stick the patch in main recipe.

> --
> 2.7.4
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.

