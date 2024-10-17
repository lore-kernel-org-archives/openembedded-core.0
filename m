Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FCA9D2126E
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 09:44:44 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.44652.1729158279497150099
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 02:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MSpIQytW;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb5fa911aaso11135611fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 02:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729158277; x=1729763077; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yjtU6d9gng8nYzTIw7zTChKF2hoTv09HHK382hUnEik=;
        b=MSpIQytWTLbc2ki+wDJp30c/eqfty6wd89sjcN4vV8Ydhy3HdmAGDr3+PSSEHKmuKW
         gY3M2Gd0O5xYjbF437X1B7ep0N1Ow7jIJ4ctp0bqanEWTh9kUSSMXGLXOvj87Mr7bulV
         wama8F4+3vNqJp/4poTI3OdStjE8KNIG8rbJ8Tv9zDoTR6fRX1Hy13BEZA1fBjjOkrlD
         ozBm5yYBvVeEtnYGqGEuEcNbgatKYpnAiEiIJob6VmRZBHnrTkunwagGyMtFqMsn9ZaS
         Il3EJ708j5x8W0R8+iWh3uBLiQJfILlLg1HZjwQ/OfrGw2aY6lqVQn9NMwNAvnACdvMP
         VCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729158277; x=1729763077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yjtU6d9gng8nYzTIw7zTChKF2hoTv09HHK382hUnEik=;
        b=SLCZz6D7zpCgIwxeZsTu9VYZ5vEAC+EvkDMxFddkiDPMZHQeLhFLL6QJmOa/NljGLB
         lioxIEoxgDTuUlDlf0+l4vSrvdKY4W1oPkcn2u1mk/Oa9lP6vlogvPLR4TXbhWlUOjl2
         DM1i82wiqjt6B98YolRC0HLtJrl9R+JKPaImYS0wSv+HCegYgl+fVyV7wCpaRmj1j1R1
         XTSvBg7L/6EK/FqBdmX+MweSGZj8vzTBrXaZqzZeufYQDKBwb7RTAfSIRCB1nB2J750d
         PRCcQGvqF/Gr9dG4cwWrJSs2YAK4OtTaFLiacZcOeoWTuMsUONbRIu5jJ7S5mZ7Jet+w
         3BIw==
X-Gm-Message-State: AOJu0Yz43u+pmGVflNmmhE9tuktC2VveXoxDJvXcsArmdceHKmS91Ih4
	UMcex78NKUCW4lkn2dAadXU6WofatuOMV4fXXwAImKjOtarIa2nfK3biyGE3lIXYb0lYY9Vli40
	8zr8yHu757LK5YZ1TGolKf79+qcE=
X-Google-Smtp-Source: AGHT+IHIcL3Gf7pVVm6hcJnzFgr8nmCCMvuemLn/u2DEbuqNylI0TebiujR4wuxKtXoASAW34L8RGWPNeKI+GhaGOD4=
X-Received: by 2002:a05:651c:1506:b0:2fb:62ad:89fa with SMTP id
 38308e7fff4ca-2fb62ad8e1dmr54141411fa.45.1729158277217; Thu, 17 Oct 2024
 02:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1728585736.git.steve@sakoman.com> <c4760d6a52011515b0f931d08f619c7e49e72158.1728585736.git.steve@sakoman.com>
In-Reply-To: <c4760d6a52011515b0f931d08f619c7e49e72158.1728585736.git.steve@sakoman.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 17 Oct 2024 11:44:25 +0200
Message-ID: <CANNYZj-SY0SOweCixQHMdu+RmSaP2bsctdxM9KconPD18x-Gyw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 2/2] selftest/runtime_test/virgl: Disable for
 all fedora
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 09:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206010

On Thu, 10 Oct 2024 at 20:44, Steve Sakoman via lists.openembedded.org
<steve=sakoman.com@lists.openembedded.org> wrote:
>
> We can't support vgem on RHEL derived distros so disable this test for
> all fedora hosts rather than specific versions.
>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/lib/oeqa/selftest/cases/runtime_test.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
> index 7dcdfd0ab2..93c6da1889 100644
> --- a/meta/lib/oeqa/selftest/cases/runtime_test.py
> +++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
> @@ -258,7 +258,7 @@ class TestImage(OESelftestTestCase):
>
>          distro = oe.lsb.distro_identifier()
>          if distro and (distro in ['debian-9', 'debian-10', 'centos-7', 'centos-8', 'ubuntu-16.04', 'ubuntu-18.04'] or
> -            distro.startswith('almalinux') or distro.startswith('rocky')):
> +            distro.startswith('almalinux') or distro.startswith('fedora') or distro.startswith('rocky')):

Wait, was fedora confused with centos maybe? Centos 9 is not on the
list, but perhaps should be.

Alex

