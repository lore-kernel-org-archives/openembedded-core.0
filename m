Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5DBB960745
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 02:56:03 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id m124so15413683wme.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 19:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TEw6h/yj9hsEcarK6bWq+e0mT+sGBhTQrUuKy/Phn68=;
	b=ghkPt0/6NKca/NP84Ixku64UG5nvdVXWUnxjYZh8IH9xjY24R746+5thbIaStZXkez
	ws2H8AYyV2iJ6WrB3Nsz2DEbeZV+Lm+Otbe6RQvCb341jBcWEIB4fbEIPlbaxFMqwkPA
	oQpb+7jtfKwHMthv/pThRj2KdqwNdPv3nu/WFRaiqDD3Me5ArPRy6+FBDu0pZfQRLKXw
	Tl3txULTNR7j0TzCePQqH6GFq05bjYDVIpXZovmjfkcEvlQV2uYt3C1HBA1vzHuMX0Kq
	P7Y1tPCEpotgakia9hN9L1GBWj728ofKz79FA7T4uYJAJqDN8V0T7q+Ez/d+3jHtusHH
	xtcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TEw6h/yj9hsEcarK6bWq+e0mT+sGBhTQrUuKy/Phn68=;
	b=I1VhR1eb+U7sIQGa//DLGHTtQA84a6482/C/NISHftPEmXYIuJznh6G8dr4G8y0DJ8
	yEQabcBrFpO6srXLeXy/nt9v+H1ta1kOKhiGJrwY0+8B2vNRhyFz+xSMBWC6WF2miBOD
	JFBQt1Rt6XdO5Nigk4Ec+wa23xnH3xVtOenRWLr2+fUIfcNMSRfaJJPyU8tCXtZ6uu4r
	73GLV92bBUrNEGVxpXC+DmdNAPKHG7MNec6+NxoEQtDbjSlLFleyo9cvBijNyE+m1FNI
	HmIwFM53Mj78fjb0ETOrRipqC+y5X3f5587y/u/iA2xIUhFqCfW3bqPBLmRaPMR2mzBd
	cd4w==
X-Gm-Message-State: ALyK8tKYFIYX25uL0g0jhm7TH3BZqX2WTeC9/FsjHOaFwpq0gKhTCF13HyxSu/TFxO8ajnr0j6cBCdkrqyBXPQ==
X-Received: by 10.28.223.215 with SMTP id w206mr17844760wmg.61.1466132163639; 
	Thu, 16 Jun 2016 19:56:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.6.165 with HTTP; Thu, 16 Jun 2016 19:56:03 -0700 (PDT)
In-Reply-To: <1466074764-14109-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1466074764-14109-1-git-send-email-alexander.kanavin@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 16 Jun 2016 19:56:03 -0700
Message-ID: <CAJ86T=UitAFS4sBsTNEbYMvmqHhBOhCX_T_mVeM1yhZiNEVrkA@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] security_flags.inc: add SECURITY_NO_PIE_CFLAGS to libgcc and gcc-sanitizers
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
X-List-Received-Date: Fri, 17 Jun 2016 02:56:04 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 16, 2016 at 3:59 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> These recipes no longer seem to need full exclusion from security hardening.

Did you also confirm that for gcc 4.9 and 5.3?

> The rest (glibc, gcc-runtime, valgrind, grub, grub-efi, uclibc) still do.
>
> [YOCTO #9489]
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  meta/conf/distro/include/security_flags.inc | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
> index ea1d4e5..cd2b964 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -43,7 +43,7 @@ SECURITY_CFLAGS_pn-flac = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-flex = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-gcc = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-gcc-runtime = ""
> -SECURITY_CFLAGS_pn-gcc-sanitizers = ""
> +SECURITY_CFLAGS_pn-gcc-sanitizers = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-gdb = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-gmp = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-gnutls = "${SECURITY_NO_PIE_CFLAGS}"
> @@ -62,7 +62,7 @@ SECURITY_CFLAGS_pn-kexec-tools = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-iptables = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-libaio = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-libcap = "${SECURITY_NO_PIE_CFLAGS}"
> -SECURITY_CFLAGS_pn-libgcc = ""
> +SECURITY_CFLAGS_pn-libgcc = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-libid3tag = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-libnewt = "${SECURITY_NO_PIE_CFLAGS}"
>  SECURITY_CFLAGS_pn-libglu = "${SECURITY_NO_PIE_CFLAGS}"
> @@ -109,10 +109,8 @@ TARGET_CFLAGS_append_class-target = " ${SECURITY_CFLAGS}"
>  TARGET_LDFLAGS_append_class-target = " ${SECURITY_LDFLAGS}"
>
>  SECURITY_LDFLAGS_remove_pn-gcc-runtime = "-fstack-protector-strong"
> -SECURITY_LDFLAGS_remove_pn-gcc-sanitizers = "-fstack-protector-strong"
>  SECURITY_LDFLAGS_remove_pn-glibc = "-fstack-protector-strong"
>  SECURITY_LDFLAGS_remove_pn-glibc-initial = "-fstack-protector-strong"
> -SECURITY_LDFLAGS_remove_pn-libgcc = "-fstack-protector-strong"
>  SECURITY_LDFLAGS_remove_pn-uclibc = "-fstack-protector-strong"
>  SECURITY_LDFLAGS_remove_pn-uclibc-initial = "-fstack-protector-strong"
>  SECURITY_LDFLAGS_pn-xf86-video-fbdev = "${SECURITY_X_LDFLAGS}"
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

