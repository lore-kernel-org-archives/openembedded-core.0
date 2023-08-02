Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE38AC001DF
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 12:04:58 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.13127.1690977890839824045
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 05:04:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YF1uojxS;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4fe10f0f4d1so11258914e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 05:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690977889; x=1691582689;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9QUAfIsBJ0eR5TRUMXY0cfjSK+4G8iSo56wqar92OzI=;
        b=YF1uojxS6xZNL183y9hFFB3JWhU9YFIDfuRjYq6CGak4ZKJlWngvbm715yWEhYttiH
         /uqmWQfq8kkRgGbOkh0hKBNis3ypE5eW/wYQOQEDsHWhm18bvyaek5/7icD3V5hvC9P4
         9YrdSbvUhi8XqjMRiGEhJzB1d/imLs4XNagcjriUVkeJmE88UaIN8EufOoAThEn6Iuxn
         EH/hY7U4goIbCJWXuI1ItAM+2MHhW7hle8ZvavT2hpI1kGHyC8ofnL+Q4BFXyeW2/Y81
         CNwFOccBUxmc650C7ttdWSBPZFyZsrl8t2xkiHugMUVUQzL7VLy/e2kYOUEWsjFG1Hms
         1LkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690977889; x=1691582689;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9QUAfIsBJ0eR5TRUMXY0cfjSK+4G8iSo56wqar92OzI=;
        b=glVJHwh+SF3zdiNJ7ybOFES30kLQoPnnXLe36YPWh8PhVaY9zgJDkqcNqFG5vzpeF9
         lFLIzK0/6622ZBr35jBrEmKhuWEmRmvcPinkFuV5rs5Otzr6wM7MHV6bKyeCa/UVyQgn
         eNpoHhYflTkL37PSaEHtuAzCWKz/PkhXudNmYm9nj02VKnWayHM6/FoZMkel4TFn0S7t
         q38llQtSE05D0En0zuJusLYrw18dLfDet1zqHIWvDHjgV6uPARCDyJW/QbeCcfbIcKv4
         oVHmkxuPNwzGxU1CAVTLfLu3NR/oIqC24CNaL3AcMM/5Nydx1Xc9mBASZG4/W1vP92y5
         CS7g==
X-Gm-Message-State: ABy/qLaMfX9ZC4x0uS3ltL6iNFqQzCu+elCgPG+4cVHRJhZ5zzwejHzp
	WSYcP4r4yPjKrOsbbhrTLsT3dBKHstLy4rUCNvg=
X-Google-Smtp-Source: APBJJlFbhmn31BXjgOi35c08xcHTB4EmkPhjUhy0s/YbVFQ+vevRXRRkSvfcRLUy1VTOeiC8j71b7uawovkSEHD5IHA=
X-Received: by 2002:a2e:9183:0:b0:2b9:b27c:f727 with SMTP id
 f3-20020a2e9183000000b002b9b27cf727mr4958422ljg.8.1690977888256; Wed, 02 Aug
 2023 05:04:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687143192.git.steve@sakoman.com>
In-Reply-To: <cover.1687143192.git.steve@sakoman.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 2 Aug 2023 14:04:36 +0200
Message-ID: <CAApg2=Q0UMscOj_Ec_u-RQarZZ8B-j8RF32-pOUNJuro7DAG5w@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 00/18] Patch review
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005a49120601ef78c8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 12:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185387

--0000000000005a49120601ef78c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2023 at 4:55=E2=80=AFAM Steve Sakoman <steve@sakoman.com> w=
rote:

> Please review this set of changes for kirkstone and have comments back by
> end of day Tuesday.
>
> Passed a-full on autobuilder:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5481
>
> The following changes since commit
> 6e0d694ea1eb5d478dc7508d181c3a820098ee5f:
>
>   uninative: Upgrade to 4.0 to include latest gcc 13.1.1 (2023-06-09
> 06:04:24 -1000)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib
> stable/kirkstone-nut
>
> http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/ki=
rkstone-nut
>
> Andrew Jeffery (1):
>   Revert "ipk: Decode byte data to string in manifest handling"
>
> Bruce Ashfield (5):
>   linux-yocto/5.15: update to v5.15.109
>   linux-yocto/5.15: update to v5.15.110
>   linux-yocto/5.15: update to v5.15.111
>   linux-yocto/5.15: update to v5.15.112
>   linux-yocto/5.15: update to v5.15.113
>
> Chen Qi (1):
>   openssh: fix CVE-2023-28531
>
> Deepthi Hemraj (1):
>   glibc: stable 2.35 branch updates
>
> Ian Ray (1):
>   systemd-systemctl: support instance expansion in WantedBy
>
> Jan Vermaete (1):
>   cve-update-nvd2-native: added the missing http import
>
> Marta Rybczynska (1):
>   cve-update-nvd2-native: new CVE database fetcher
>
> Qiu Tingting (1):
>   e2fsprogs: fix ptest bug for second running
>
> Randy MacLeod (1):
>   vim: upgrade 9.0.1429 -> 9.0.1527
>
> Sanjay Chitroda (1):
>   cups: Fix CVE-2023-32324
>
> Yogita Urade (4):
>   webkitgtk: fix CVE-2022-46691
>   webkitgtk: fix CVE-2022-46699
>   webkitgtk: fix CVE-2022-42867
>   webkitgtk: fix CVE-2022-46700
>
>  meta/classes/cve-check.bbclass                |   4 +-
>  meta/lib/oe/package_manager/ipk/manifest.py   |   2 +-
>  ...-destination-constraints-for-smartca.patch |  35 ++
>  .../openssh/openssh_8.9p1.bb                  |   1 +
>  meta/recipes-core/glibc/glibc-version.inc     |   2 +-
>  .../glibc/glibc/CVE-2023-0687.patch           |  82 -----
>  meta/recipes-core/glibc/glibc_2.35.bb         |   1 -
>  .../meta/cve-update-nvd2-native.bb            | 334 ++++++++++++++++++
>  .../systemd/systemd-systemctl/systemctl       |   9 +-
>  .../e2fsprogs/e2fsprogs/run-ptest             |   1 +
>  .../e2fsprogs/e2fsprogs_1.46.5.bb             |   3 +
>  meta/recipes-extended/cups/cups.inc           |   1 +
>  .../cups/cups/CVE-2023-32324.patch            |  36 ++
>  .../linux/linux-yocto-rt_5.15.bb              |   6 +-
>  .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
>  meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
>  .../webkit/webkitgtk/CVE-2022-42867.patch     | 104 ++++++
>  .../webkit/webkitgtk/CVE-2022-46691.patch     |  43 +++
>  .../webkit/webkitgtk/CVE-2022-46699.patch     | 136 +++++++
>  .../webkit/webkitgtk/CVE-2022-46700.patch     |  67 ++++
>  meta/recipes-sato/webkit/webkitgtk_2.36.8.bb  |   4 +
>  meta/recipes-support/vim/vim.inc              |   4 +-
>  22 files changed, 792 insertions(+), 115 deletions(-)
>  create mode 100644
> meta/recipes-connectivity/openssh/openssh/0001-upstream-include-destinati=
on-constraints-for-smartca.patch
>  delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2023-0687.patch
>  create mode 100644 meta/recipes-core/meta/cve-update-nvd2-native.bb
>  create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-32324.patch
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-42867.pat=
ch
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-46691.pat=
ch
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-46699.pat=
ch
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-46700.pat=
ch
>
>
>
Tested for the CVE fetcher backport to kirkstone, no unexpected issues seen=
.

Kind regards,
Marta

--0000000000005a49120601ef78c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 19, 2023 at 4:55=E2=80=AF=
AM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Please review this set of changes for kirkstone and have comments back by<b=
r>
end of day Tuesday.<br>
<br>
Passed a-full on autobuilder:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/83/build=
s/5481" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproje=
ct.org/typhoon/#/builders/83/builds/5481</a><br>
<br>
The following changes since commit 6e0d694ea1eb5d478dc7508d181c3a820098ee5f=
:<br>
<br>
=C2=A0 uninative: Upgrade to 4.0 to include latest gcc 13.1.1 (2023-06-09 0=
6:04:24 -1000)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedd=
ed-core-contrib</a> stable/kirkstone-nut<br>
=C2=A0 <a href=3D"http://cgit.openembedded.org/openembedded-core-contrib/lo=
g/?h=3Dstable/kirkstone-nut" rel=3D"noreferrer" target=3D"_blank">http://cg=
it.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/kirkstone-nut=
</a><br>
<br>
Andrew Jeffery (1):<br>
=C2=A0 Revert &quot;ipk: Decode byte data to string in manifest handling&qu=
ot;<br>
<br>
Bruce Ashfield (5):<br>
=C2=A0 linux-yocto/5.15: update to v5.15.109<br>
=C2=A0 linux-yocto/5.15: update to v5.15.110<br>
=C2=A0 linux-yocto/5.15: update to v5.15.111<br>
=C2=A0 linux-yocto/5.15: update to v5.15.112<br>
=C2=A0 linux-yocto/5.15: update to v5.15.113<br>
<br>
Chen Qi (1):<br>
=C2=A0 openssh: fix CVE-2023-28531<br>
<br>
Deepthi Hemraj (1):<br>
=C2=A0 glibc: stable 2.35 branch updates<br>
<br>
Ian Ray (1):<br>
=C2=A0 systemd-systemctl: support instance expansion in WantedBy<br>
<br>
Jan Vermaete (1):<br>
=C2=A0 cve-update-nvd2-native: added the missing http import<br>
<br>
Marta Rybczynska (1):<br>
=C2=A0 cve-update-nvd2-native: new CVE database fetcher<br>
<br>
Qiu Tingting (1):<br>
=C2=A0 e2fsprogs: fix ptest bug for second running<br>
<br>
Randy MacLeod (1):<br>
=C2=A0 vim: upgrade 9.0.1429 -&gt; 9.0.1527<br>
<br>
Sanjay Chitroda (1):<br>
=C2=A0 cups: Fix CVE-2023-32324<br>
<br>
Yogita Urade (4):<br>
=C2=A0 webkitgtk: fix CVE-2022-46691<br>
=C2=A0 webkitgtk: fix CVE-2022-46699<br>
=C2=A0 webkitgtk: fix CVE-2022-42867<br>
=C2=A0 webkitgtk: fix CVE-2022-46700<br>
<br>
=C2=A0meta/classes/cve-check.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A0meta/lib/oe/package_manager/ipk/manifest.py=C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +-<br>
=C2=A0...-destination-constraints-for-smartca.patch |=C2=A0 35 ++<br>
=C2=A0.../openssh/<a href=3D"http://openssh_8.9p1.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">openssh_8.9p1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0meta/recipes-core/glibc/glibc-version.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A02 +-<br>
=C2=A0.../glibc/glibc/CVE-2023-0687.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 82 -----<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.35.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.35.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A01 -<br>
=C2=A0.../meta/<a href=3D"http://cve-update-nvd2-native.bb" rel=3D"noreferr=
er" target=3D"_blank">cve-update-nvd2-native.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 334 ++++++++++++++++++<br>
=C2=A0.../systemd/systemd-systemctl/systemctl=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A09 +-<br>
=C2=A0.../e2fsprogs/e2fsprogs/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../e2fsprogs/<a href=3D"http://e2fsprogs_1.46.5.bb" rel=3D"noreferre=
r" target=3D"_blank">e2fsprogs_1.46.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0meta/recipes-extended/cups/cups.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../cups/cups/CVE-2023-32324.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 36 ++<br>
=C2=A0.../linux/<a href=3D"http://linux-yocto-rt_5.15.bb" rel=3D"noreferrer=
" target=3D"_blank">linux-yocto-rt_5.15.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0.../linux/<a href=3D"http://linux-yocto-tiny_5.15.bb" rel=3D"noreferr=
er" target=3D"_blank">linux-yocto-tiny_5.15.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.15.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_5.15.bb</a> |=C2=A0 26 +-<br>
=C2=A0.../webkit/webkitgtk/CVE-2022-42867.patch=C2=A0 =C2=A0 =C2=A0| 104 ++=
++++<br>
=C2=A0.../webkit/webkitgtk/CVE-2022-46691.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
43 +++<br>
=C2=A0.../webkit/webkitgtk/CVE-2022-46699.patch=C2=A0 =C2=A0 =C2=A0| 136 ++=
+++++<br>
=C2=A0.../webkit/webkitgtk/CVE-2022-46700.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
67 ++++<br>
=C2=A0meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.36.8.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.36.8.bb</a>=C2=A0 |=C2=A0 =C2=
=A04 +<br>
=C2=A0meta/recipes-support/vim/vim.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A022 files changed, 792 insertions(+), 115 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-ups=
tream-include-destination-constraints-for-smartca.patch<br>
=C2=A0delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2023-0687.patch<=
br>
=C2=A0create mode 100644 meta/recipes-core/meta/<a href=3D"http://cve-updat=
e-nvd2-native.bb" rel=3D"noreferrer" target=3D"_blank">cve-update-nvd2-nati=
ve.bb</a><br>
=C2=A0create mode 100644 meta/recipes-extended/cups/cups/CVE-2023-32324.pat=
ch<br>
=C2=A0create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-42867.=
patch<br>
=C2=A0create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-46691.=
patch<br>
=C2=A0create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-46699.=
patch<br>
=C2=A0create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2022-46700.=
patch<br>
<br><br></blockquote><div><br></div><div>Tested for the CVE fetcher backpor=
t to kirkstone, no unexpected issues seen.</div><div><br></div><div>Kind re=
gards,</div><div>Marta <br></div></div></div>

--0000000000005a49120601ef78c8--

