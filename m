Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62FC3C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 14:33:09 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.96100.1701095580552038668
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 06:33:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=c0Q1IQCM;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.47, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a02c48a0420so593200866b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 06:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701095579; x=1701700379; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xd0p3BIy9kRBlGzFdhQIg40EysD/LVPp5/3+A9s4kq8=;
        b=c0Q1IQCMkUeX6OhMYX3GEyUiUiVp9nQOwOx10yJ3XEtFTuyIfxi3x4CoaiDlnq3NKy
         gqTl9tz/LkLouuHuVyxPHKfU2GmRyEIQy2OU+eMqYFsxK0xMoEzrObOs0z82YmdTfGA2
         deNl0Nm9EVUOqCaQeL9Mo30ipZnZp3zJZsC4GmLcd89/kpAQS7i6NYdnaEkKgbm1UyRx
         fGND/0FmbNbFQD+G1btnQ00Ne67IzCBAo3qyHjTmsRvBCkG3L7C6fnfzCIwgPX6ZjkA2
         BBYDq1tf9x45y6hiypVFisetRClv+6xWf6u8sMuPYGijOAU/xsuiz+p9YIRJl5U35L/f
         egCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701095579; x=1701700379;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xd0p3BIy9kRBlGzFdhQIg40EysD/LVPp5/3+A9s4kq8=;
        b=AIKz3yGCvs3fMH15tZvuUkOnsh7eIiyuBCx3+oigDPF62f9vCln7GhVy+ME0xMrPa4
         k3IIWPFey+f/3JnFmnyksyn/0eBf0qUZ7w0ORqCPqNT+o8mqchdC9UzyRlsFN//HDfv2
         W++YRg/voRuHXEd1PAXs9O3G6QUqchivkOKkRB39uYtPTXLCISEnGdf2pqQ/p3XHZazE
         yWi8nxG/Sn9bIFpLOJLU0emOX+LC//EiJCdWfMv9mW2JwFZx+eJ+HVaCYmy47Y9Ymebr
         1coDQNtGVAW4uy5aFi1Tg5QiBx0p1cOZcW99sT0n/jYIEgJbtvlGzWur6ZBvqLQFjOQN
         r/HA==
X-Gm-Message-State: AOJu0YzIPKHrydJ7kWMvD5FZDX6/Wia53yvUli/mWawMfn73uVujLdwF
	I1ul6z2w/9wDJ3OndsSytdyLBxsVGCewdaHW0TEsm+kdqga2aRGLow5lCj9L
X-Google-Smtp-Source: AGHT+IGUw3xqE9RO77CuITT0o8WQamuXEEZWI5zgJqNtIr8AhYKy1LsZq7jOR9eZR1Ed/79eTVPJlEaaTnpJd4vEATo=
X-Received: by 2002:a17:906:179b:b0:9de:cfa1:f072 with SMTP id
 t27-20020a170906179b00b009decfa1f072mr7824340eje.25.1701095578622; Mon, 27
 Nov 2023 06:32:58 -0800 (PST)
MIME-Version: 1.0
References: <20231126170117.8DE1B1069B5@builder.sakoman.com>
In-Reply-To: <20231126170117.8DE1B1069B5@builder.sakoman.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 27 Nov 2023 04:32:47 -1000
Message-ID: <CAOSpxdawwimuCOSUj-nJ=BAbV3GLSYxk1LfoKQh6xkHRox7LbQ@mail.gmail.com>
Subject: Re: OE-core CVE metrics for nanbield on Sun 26 Nov 2023 05:00:01 AM HST
To: openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 14:33:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191304

You may have noticed that these reports weren't sent on the normal schedule=
.

This is due to repeated failures in updating the database:

WARNING: cve-update-nvd2-native-1.0-r0 do_fetch: CVE database update failed

I tried many times yesterday, but was largely unsuccessful. I was able
to get nanbield and master to complete, but in both cases it took
longer than two hours for the database to update! Every other attempt
also had extremely slow updates and then would fail an hour or so into
the process.

Is anyone else experiencing this issue?

Steve

On Sun, Nov 26, 2023 at 7:01=E2=80=AFAM <steve@sakoman.com> wrote:
>
> Branch: nanbield
>
> New this week: 8 CVEs
> CVE-2023-48231 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-48231 *
> CVE-2023-48232 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-48232 *
> CVE-2023-48233 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-48233 *
> CVE-2023-48234 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-48234 *
> CVE-2023-48235 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-48235 *
> CVE-2023-48236 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-48236 *
> CVE-2023-48237 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-48237 *
> CVE-2023-6176 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-6176 *
>
> Removed this week: 3 CVEs
> CVE-2022-33065 (CVSS3: 7.8 HIGH): libsndfile1 https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-33065 *
> CVE-2023-46246 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-46246 *
> CVE-2023-5363 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2023-5363 *
>
> Full list:  Found 63 unpatched CVEs
> CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2019-14899 *
> CVE-2021-3714 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2021-3714 *
> CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2021-3864 *
> CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2022-0400 *
> CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2022-1247 *
> CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2022-3219 *
> CVE-2022-36402 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2022-36402 *
> CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2022-38096 *
> CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2022-4543 *
> CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2022-46456 *
> CVE-2023-0687 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2023-0687 *
> CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native http=
s://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-1386 *
> CVE-2023-25584 (CVSS3: 7.1 HIGH): binutils:binutils-cross-testsuite:binut=
ils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?=
vulnId=3DCVE-2023-25584 *
> CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native ht=
tps://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-3019 *
> CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-3397 *
> CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-3640 *
> CVE-2023-38469 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2023-38469 *
> CVE-2023-38470 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2023-38470 *
> CVE-2023-38471 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2023-38471 *
> CVE-2023-38472 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2023-38472 *
> CVE-2023-38473 (CVSS3: 5.5 MEDIUM): avahi https://web.nvd.nist.gov/view/v=
uln/detail?vulnId=3DCVE-2023-38473 *
> CVE-2023-38559 (CVSS3: 5.5 MEDIUM): ghostscript https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2023-38559 *
> CVE-2023-39189 (CVSS3: 6.0 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2023-39189 *
> CVE-2023-39192 (CVSS3: 6.0 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2023-39192 *
> CVE-2023-39193 (CVSS3: 6.0 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2023-39193 *
> CVE-2023-39928 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view=
/vuln/detail?vulnId=3DCVE-2023-39928 *
> CVE-2023-40030 (CVSS3: 6.1 MEDIUM): rust:rust-native https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2023-40030 *
> CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-4010 *
> CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-s=
anitizers:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?v=
ulnId=3DCVE-2023-4039 *
> CVE-2023-42752 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2023-42752 *
> CVE-2023-42753 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2023-42753 *
> CVE-2023-42754 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2023-42754 *
> CVE-2023-42756 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2023-42756 *
> CVE-2023-45283 (CVSS3: 7.5 HIGH): go:go-binary-native:go-cross-core2-64:g=
o-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-45283=
 *
> CVE-2023-45284 (CVSS3: 5.3 MEDIUM): go:go-binary-native:go-cross-core2-64=
:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-452=
84 *
> CVE-2023-45803 (CVSS3: 4.2 MEDIUM): python3-urllib3 https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2023-45803 *
> CVE-2023-4623 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-4623 *
> CVE-2023-46407 (CVSS3: 5.5 MEDIUM): ffmpeg https://web.nvd.nist.gov/view/=
vuln/detail?vulnId=3DCVE-2023-46407 *
> CVE-2023-46813 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2023-46813 *
> CVE-2023-46862 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2023-46862 *
> CVE-2023-4692 (CVSS3: 7.8 HIGH): grub:grub-efi:grub-native https://web.nv=
d.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-4692 *
> CVE-2023-4693 (CVSS3: 4.6 MEDIUM): grub:grub-efi:grub-native https://web.=
nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-4693 *
> CVE-2023-47233 (CVSS3: 4.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2023-47233 *
> CVE-2023-48231 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-48231 *
> CVE-2023-48232 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-48232 *
> CVE-2023-48233 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-48233 *
> CVE-2023-48234 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-48234 *
> CVE-2023-48235 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-48235 *
> CVE-2023-48236 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-48236 *
> CVE-2023-48237 (CVSS3: 4.3 MEDIUM): vim https://web.nvd.nist.gov/view/vul=
n/detail?vulnId=3DCVE-2023-48237 *
> CVE-2023-4921 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-4921 *
> CVE-2023-5088 (CVSS3: 7.0 HIGH): qemu:qemu-native:qemu-system-native http=
s://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-5088 *
> CVE-2023-5156 (CVSS3: 7.5 HIGH): glibc https://web.nvd.nist.gov/view/vuln=
/detail?vulnId=3DCVE-2023-5156 *
> CVE-2023-5178 (CVSS3: 8.8 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-5178 *
> CVE-2023-5197 (CVSS3: 6.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2023-5197 *
> CVE-2023-5345 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-5345 *
> CVE-2023-5367 (CVSS3: 7.8 HIGH): xserver-xorg:xwayland https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2023-5367 *
> CVE-2023-5380 (CVSS3: 4.7 MEDIUM): xserver-xorg:xwayland https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2023-5380 *
> CVE-2023-5574 (CVSS3: 7.0 HIGH): xserver-xorg:xwayland https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2023-5574 *
> CVE-2023-5633 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-5633 *
> CVE-2023-5678 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd=
.nist.gov/view/vuln/detail?vulnId=3DCVE-2023-5678 *
> CVE-2023-5717 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-5717 *
> CVE-2023-6176 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/vie=
w/vuln/detail?vulnId=3DCVE-2023-6176 *
>
> For further information see: https://autobuilder.yocto.io/pub/non-release=
/patchmetrics/

