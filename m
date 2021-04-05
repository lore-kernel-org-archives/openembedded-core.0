Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.4027.1617661469469500680
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 05 Apr 2021 15:24:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qJ2P8mP3;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.42, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f42.google.com with SMTP id c8so12140948wrq.11
        for <Openembedded-core@lists.openembedded.org>; Mon, 05 Apr 2021 15:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Dpi3snEqcfTaqBJ5KUpcbqCTM50RGi4QO08KzGwR1iQ=;
        b=qJ2P8mP3UPXbIA+C2QNQZxdgXlUib6b+UhfEIMMoEwLBbeUlTqmCl+u4paG1QzydN4
         wQGlmPjXrwfMVQ0kL0MaJ7LDwl299bBhZ20Q6hxZa9RzwTnStjAzC5bAan/G7Yu5CL67
         lKe2cqyPRrX6HfZp4025m5QAuCpP1RRW9XQpoJBKcAcXZQY42XnHFWTwlAL7vKxQkWVk
         yYdhAQA/hT51gKtm8Kyn2R1nbZBTPbVNs++vK7UR6v9Vy2pjm8MrU68hB0YL17WeSTau
         SMm3C0FfhmlJxFbP2xrPevqXgdX30ZCUm0DQkiK53skrwq1LBOPSrJO8tUkc0Z2xfeav
         iUQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Dpi3snEqcfTaqBJ5KUpcbqCTM50RGi4QO08KzGwR1iQ=;
        b=kpuGcjqucOh+pl/6fXcp8oCSSUKVVZ6i6Z2cTJnyNQbpDd8uMN2hcyYr7IOylIbd6E
         U1sneUhBNeF//0zs9hBCnqP0G2KE91mqtrgvHXUfrhDnxtv+6hASlsp1+ZlNrqDl0GFI
         Z+V2QHuaSb7DAeuzgQiDt8MYPd86cJqINjp4lZAMWph+4guGURRZIYm1TDXPH0fxetvz
         5E3TCUfJ0C/EbU5PqYhxGbG9H2QTYgOZi4Joi0TnGoZNoCrlUSVvr6MSbm6d6+KtTOyx
         svtCPYLYmlAeJtn2qYguTnM8VENoEoHMOE7gKMegipBuWKSBmG0h4r2cdWhRolZ1N+Fl
         CyFA==
X-Gm-Message-State: AOAM530YqK5e9fBzH/RVsLBFCIPdrUgXnYyaHCqlZW8/a/1e7Ju68iGh
	lFd7p4iESCpB62WEW1ZoC6J/QaZTn6AVC74eyi/RKA==
X-Google-Smtp-Source: ABdhPJwsQ0oa91o55v+FMrOwcsb0KokHdldq+JRtvWuVQ5SmN2RCaHAdLkgZPaHmh9K8wCEq6YXCQNxobdPNquU/0Gg=
X-Received: by 2002:adf:ff89:: with SMTP id j9mr18857138wrr.350.1617661467649;
 Mon, 05 Apr 2021 15:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210405054035.11312-1-Rahul.Taya@kpit.com>
In-Reply-To: <20210405054035.11312-1-Rahul.Taya@kpit.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Mon, 5 Apr 2021 12:24:16 -1000
Message-ID: <CAOSpxdaSos9cRBrWGYtAL5kaY=amvi6USSyazxv4=dUT6TLWNQ@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] qemu: Add fix for CVE-2020-13791
To: Rahul Taya <Rahul.Taya@kpit.com>
Cc: Patches and discussions about the oe-core layer <Openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>, Harpritkaur.Bhandari@kpit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, this patch does not apply:

Applying: qemu: Add fix for CVE-2020-13791
Using index info to reconstruct a base tree...
error: patch failed: meta/recipes-devtools/qemu/qemu.inc:54
error: meta/recipes-devtools/qemu/qemu.inc: patch does not apply
error: Did you hand edit your patch?
It does not apply to blobs recorded in its index.
Patch failed at 0001 qemu: Add fix for CVE-2020-13791

It appears that something in your patch submission process is
expanding tabs into spaces.

Perhaps you could try using git-send-email for patch submission.

Steve

On Sun, Apr 4, 2021 at 7:41 PM Rahul Taya <Rahul.Taya@kpit.com> wrote:
>
> Added below patch to fix CVE-2020-13791
>
> CVE-2020-13791.patch
>
> Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |  1 +
>  .../qemu/qemu/CVE-2020-13791.patch            | 52 +++++++++++++++++++
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools=
/qemu/qemu.inc
> index 5e8d3e09ff..7f8053cdd5 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -54,6 +54,7 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.ta=
r.xz \
>            file://CVE-2020-24352.patch \
>            file://CVE-2020-25723.patch \
>            file://CVE-2021-20203.patch \
> +          file://CVE-2020-13791.patch \
>            "
>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
> new file mode 100644
> index 0000000000..6582abce59
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13791.patch
> @@ -0,0 +1,52 @@
> +From f7d6a635fa3b7797f9d072e280f065bf3cfcd24d Mon Sep 17 00:00:00 2001
> +From: Prasad J Pandit <pjp@fedoraproject.org>
> +Date: Thu, 4 Jun 2020 17:05:25 +0530
> +Subject: [PATCH] pci: assert configuration access is within bounds
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +While accessing PCI configuration bytes, assert that
> +'address + len' is within PCI configuration space.
> +
> +Generally it is within bounds. This is more of a defensive
> +assert, in case a buggy device was to send 'address' which
> +may go out of bounds.
> +
> +Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> +Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> +Message-Id: <20200604113525.58898-1-ppandit@redhat.com>
> +Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> +Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> +
> +CVE: CVE-2020-13791
> +Upstream-Status: Backport[https://github.com/qemu/qemu/commit/f7d6a635f=
a3b7797f9d072e280f065bf3cfcd24d.patch]
> +Comment: No hunks refreshed and no warnings were seen while applying pa=
tch.
> +Affected version: >=3D4.2.0 but patch already present in Master and Gat=
esgarth branches.
> +Signed-off-by: Rahul Taya <Rahul.Taya@kpit.com>
> +---
> + hw/pci/pci.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> +index 70c66965f56..7bf2ae6d92a 100644
> +--- a/hw/pci/pci.c
> ++++ b/hw/pci/pci.c
> +@@ -1381,6 +1381,8 @@ uint32_t pci_default_read_config(PCIDevice *d,
> + {
> +     uint32_t val =3D 0;
> +
> ++    assert(address + len <=3D pci_config_size(d));
> ++
> +     if (pci_is_express_downstream_port(d) &&
> +         ranges_overlap(address, len, d->exp.exp_cap + PCI_EXP_LNKSTA, =
2)) {
> +         pcie_sync_bridge_lnk(d);
> +@@ -1394,6 +1396,8 @@ void pci_default_write_config(PCIDevice *d, uint3=
2_t addr, uint32_t val_in, int
> +     int i, was_irq_disabled =3D pci_irq_disabled(d);
> +     uint32_t val =3D val_in;
> +
> ++    assert(addr + l <=3D pci_config_size(d));
> ++
> +     for (i =3D 0; i < l; val >>=3D 8, ++i) {
> +         uint8_t wmask =3D d->wmask[addr + i];
> +         uint8_t w1cmask =3D d->w1cmask[addr + i];
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential=
 and is the property of the KPIT Technologies Ltd. It is intended only for =
the person to whom it is addressed. If you are not the intended recipient, =
you are not authorized to read, print, retain copy, disseminate, distribute=
, or use this message or any part thereof. If you receive this message in e=
rror, please notify the sender immediately and delete all copies of this me=
ssage. KPIT Technologies Ltd. does not accept any liability for virus infec=
ted mails.
>
>=20
>
