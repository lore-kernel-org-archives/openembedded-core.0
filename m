Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523D9C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 09:31:16 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.147352.1783330267190543833
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 02:31:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Tz7KtS4+;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so25226165e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 02:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783330265; x=1783935065; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M9KxFvi+NQFij+e8UeEkw0Y9CA5ffrjuH2XC67r/jM8=;
        b=Tz7KtS4+r8YLg8u2rS5cAvSRgf/7SorvF3M8LG9WFfNZ1iJ4l887VSHabx5giYWvy8
         8DvGa9q4I/Dw0qoxp+bl+UrawHFL53x5x9dlAt2h4VGGAwPJ2y5qgeySmWlGx6nbguze
         DxfKBDn+53xslbM6FglIxA2mWWJL7KSuXk/78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330265; x=1783935065;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M9KxFvi+NQFij+e8UeEkw0Y9CA5ffrjuH2XC67r/jM8=;
        b=hmGJ7zjAyAISOmKYGtgKrD8Z4ISH0d44dRSiy+pgwnX0ysN5qWXToGsxT1D4NXCJUG
         xdLmxjfsxwl6+faDPWkOEb95SSYuoiyMlkq0zlDDUBr9r+1SFRY31tbDEg5jlkN9qrgI
         CSwikFoY3Rn4oQNCIidn50gCeX7Fm5QMw935lJLWIQUgiRejNjlCYlbTezPkizDZpY2c
         UAJ7lty7uBxXTLNkMyfGYSt268UO+WIwHmY7SsXGGFMlGpcGPFKe/+cay+b2EkO+OiAr
         IrvhXpeu0choF2b2YmxkAzVR21FPSScaY30fmh2SpqVpJuLIVho2S2YBXHphAcSdOdy7
         mStg==
X-Forwarded-Encrypted: i=1; AHgh+Rp4kCJsrOfIyM6YnTk1j34Iyqn9Gz9jaxaN/mNGr8KifrIO70DUair6gxmeQMjXqHSUYB7gY08Bq86tC5tNIyerOA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwA+fKnpOI76zjbtZEXXewVKJtFYZ21RaH7zyxX4i5k6lirYtsW
	CjxYqCQgJnDG8AWGR1bt1YZJIpCJJjYvh+ZTOpT4gOFLUeawkN6Bg5SgQSAvUcI9qvdTXNjVbNa
	dXgQ1tpk=
X-Gm-Gg: AfdE7cnMGn2xgrW2iLpbaLFHZbJNRuxBXQjMgFbwIEoctAqwv1042i7nKXT9kiZb66e
	gw4XIe9ELkaSmnqmsJnILyKxeNZtwzmKz7L1YCkG8IrH+rioSqpSMrEVWLKNegg3kVQCil+dGEF
	kTh2FGRQ+zeDHVVFv+wsCuwh+9rpaNZRD87CPtomboVqRc6yuoSh5APwXYzaf6g5THoaY4fhahG
	dAZ10G5gmOdn2xLonshE6XLvZEseFVCnchROdnyOnaCpczMQvhiikxaiCLlIxqCN7PahRZMyRUb
	7UlVwX+oaMLPox2CpIY9aS4MR064xdVU5frDF767fyep2L5xvpbcVXl2KJJBBq9VFqFr0Mz2h1K
	cAkV4nvVGHHlh5RLm+RKNMN1LX5uW7esIDlMqQdwSjXyb61hvpisNEZ4aFpVO4BBAV5j8c63Y9I
	mwcCPpf8r4r4W1JM4=
X-Received: by 2002:a05:600c:4a21:b0:493:bed9:b53d with SMTP id 5b1f17b1804b1-493d11f7017mr68899505e9.31.1783330265202;
        Mon, 06 Jul 2026 02:31:05 -0700 (PDT)
Received: from localhost ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d6da9sm22715377f8f.12.2026.07.06.02.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:31:04 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 11:31:04 +0200
Message-Id: <DJRDTHK4PVP9.F3U7AFZTXTGU@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH v2] util-linux: backport pam_lastlog2
 libpam linking fix
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Chen Qi" <Qi.Chen@windriver.com>
To: "Siva Balasubramanian" <sivakumar.bs@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260625090231.2575081-1-sivakumar.bs@gmail.com>
 <20260706063055.1914103-1-sivakumar.bs@gmail.com>
In-Reply-To: <20260706063055.1914103-1-sivakumar.bs@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 09:31:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240231

On Mon Jul 6, 2026 at 8:30 AM CEST, Siva Balasubramanian wrote:
> pam_lastlog2.so uses pam_syslog() and other libpam symbols but the
> autotools build did not link the module against libpam. With the
> linker default of --as-needed, libpam was discarded and did not end
> up in the module's ELF NEEDED entries. The module then fails to load
> via dlopen() in processes that do not themselves link libpam (e.g.
> systemd on recent Fedora, or weston on journald-based systems without
> syslog):
>
>   PAM unable to dlopen(/usr/lib/security/pam_lastlog2.so): undefined symb=
ol: pam_syslog
>   PAM adding faulty module: /usr/lib/security/pam_lastlog2.so
>
> Backport the upstream fix (in 2.41.5) that moves -lpam into LIBADD so
> it is placed after the object files and retained as a NEEDED entry.
> Against 2.41.3 only the LIBADD line needs changing.

Hello,

I quickly looked at util-linux v2.41.5 and it look like we can upgrade
instead of backporting:
https://github.com/util-linux/util-linux/compare/v2.41.3...v2.41.5

Could you check and, if you think that the upgrade complies with the
stable policy, send the upgrade?

Thanks!

>
> [YOCTO #16320]
>
> Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
> ---
> v2:
>  - Preserve the upstream commit message verbatim in the backported
>    patch and only append the backport info (Upstream-Status, dropped
>    LDFLAGS hunk note), per review feedback from Yoann Congal.
>  - Point Upstream-Status at the util-linux master commit
>    5683ed6320e00205146cbb3d0c76462733530eca (PR #4358). It is also in
>    the v2.41 stable branch as c8d0af0421f6 (released in 2.41.5) and is
>    already present in 2.42.x, so this backport targets the wrynose
>    branch (still on util-linux 2.41.3).
>  - Retag the subject for the wrynose branch.
>
>  meta/recipes-core/util-linux/util-linux.inc   |  1 +
>  ...ix-libpam-linking-in-autotools-build.patch | 43 +++++++++++++++++++
>  2 files changed, 44 insertions(+)
>  create mode 100644 meta/recipes-core/util-linux/util-linux/0001-pam_last=
log2-fix-libpam-linking-in-autotools-build.patch
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-c=
ore/util-linux/util-linux.inc
> index 0235862666..3cdc1e2c0f 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -21,6 +21,7 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/util-linux=
/v${MAJOR_VERSION}/util-lin
>             file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-h=
ard.patch \
>             file://0001-tests-script-Disable-size-option-test.patch \
>             file://0001-loopdev-add-LOOPDEV_FL_NOFOLLOW-to-prevent-symlin=
k-a.patch \
> +           file://0001-pam_lastlog2-fix-libpam-linking-in-autotools-buil=
d.patch \
>             "
> =20
>  SRC_URI[sha256sum] =3D "3330d873f0fceb5560b89a7dc14e4f3288bbd880e96903ed=
9b50ec2b5799e58b"
> diff --git a/meta/recipes-core/util-linux/util-linux/0001-pam_lastlog2-fi=
x-libpam-linking-in-autotools-build.patch b/meta/recipes-core/util-linux/ut=
il-linux/0001-pam_lastlog2-fix-libpam-linking-in-autotools-build.patch
> new file mode 100644
> index 0000000000..90532dde7a
> --- /dev/null
> +++ b/meta/recipes-core/util-linux/util-linux/0001-pam_lastlog2-fix-libpa=
m-linking-in-autotools-build.patch
> @@ -0,0 +1,43 @@
> +From 5683ed6320e00205146cbb3d0c76462733530eca Mon Sep 17 00:00:00 2001
> +From: Karel Zak <kzak@redhat.com>
> +Date: Tue, 19 May 2026 10:54:57 +0200
> +Subject: [PATCH] pam_lastlog2: fix libpam linking in autotools build
> +
> +Move -lpam from LDFLAGS to LIBADD. When -lpam is in LDFLAGS it
> +appears on the linker command line before object files, so the
> +--as-needed linker flag (default on Fedora) discards it before
> +seeing any undefined PAM symbols. This results in pam_lastlog2.so
> +missing libpam.so in its ELF NEEDED entries.
> +
> +The module then fails to load with dlopen() if the calling process
> +does not itself link against libpam (e.g., systemd in Fedora 44+):
> +
> +  PAM unable to dlopen(pam_lastlog2.so): undefined symbol: pam_syslog
> +
> +Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D2453457
> +Signed-off-by: Karel Zak <kzak@redhat.com>
> +
> +Upstream-Status: Backport [https://github.com/util-linux/util-linux/comm=
it/5683ed6320e00205146cbb3d0c76462733530eca]
> +[Dropped the LDFLAGS hunk: the -lpam in LDFLAGS was introduced upstream
> + after 2.41.3 and is not present in this tree, so only the LIBADD hunk
> + applies here.]
> +Signed-off-by: Siva Balasubramanian <sivakumar.bs@gmail.com>
> +---
> + pam_lastlog2/src/Makemodule.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/pam_lastlog2/src/Makemodule.am b/pam_lastlog2/src/Makemodul=
e.am
> +index 40d597c58..876171e9f 100644
> +--- a/pam_lastlog2/src/Makemodule.am
> ++++ b/pam_lastlog2/src/Makemodule.am
> +@@ -11,7 +11,7 @@ pam_lastlog2_la_CFLAGS =3D \
> + 	 $(SOLIB_CFLAGS) \
> + 	 -I$(ul_liblastlog2_incdir)
> +
> +-pam_lastlog2_la_LIBADD =3D liblastlog2.la
> ++pam_lastlog2_la_LIBADD =3D liblastlog2.la -lpam
> +
> + pam_lastlog2_la_LDFLAGS =3D $(SOLIB_LDFLAGS) -module -avoid-version -sh=
ared
> + if HAVE_VSCRIPT
> +--
> +2.43.0


--=20
Yoann Congal
Smile ECS


