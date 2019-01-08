Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5C08B7BDF5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jan 2019 20:44:44 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id k19-v6so4558952lji.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2019 12:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=wVliM4ZiPWN8r6Imh3khcmBu3Vv1Kuz6e1kkXYX/VKQ=;
	b=bPa7FZ7UH5LljNjsCtqzln4ATX6DTzO06EcxHOCl7eWFQlm4DN4tc0iD69ONNjwG4T
	DJ+tccVlb+uiOlIRCz+yxo1V9VIV8P/YIhNtFXvvBTQxGA7O0vLSSByIwX8hD+uoRRJ4
	vEdNcPC/pM3pkIcq2Nc7DWtmqB7G0FG4D4tAWf7YGZ+xx6RLCvcQZTGz25N1PDISulbg
	zig4q3+vBKOUspWGH7XpY29i0S82sT+HMJesD/BpHEp3siBEeU99MNwfcLPYiMP0rWul
	FjKztf3a3D63c+vOpj0UEDYsHEBkIvO/+Ym202aMBGeFCanXR/graLV7QAhIG/VuG/gv
	2uIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=wVliM4ZiPWN8r6Imh3khcmBu3Vv1Kuz6e1kkXYX/VKQ=;
	b=kX6DklgbcSAB2TDel+E+rM1s+hBmrVt8NbcM2AZ87I7bjUPsYuSrQbG+DQ1BHoMiXd
	rSPbILn6vurG1or/dWh4pg+C4FV01jIDCD3uAY+6eO62SurAqxneLTw/P6nDU0yMRK9b
	ZSupZySbXk543BA+ftPu40q0cMxE5pOgyN/wn9EJ+8JBDwsDxiKjATGkMF8Yk0Kh86w2
	qtC9E2lM+ZRJJCo/wwdxBiFbJNso/Q/CoFkIaaCDPuT7w3zMgRVnVz42yHHZQWXHbyJ2
	XHbGVdI/rysyInO1DallTgmBYQPYgMKXxtPIdINiWciJxEOMVZ9nUscps+mYedlV2rme
	hqCA==
X-Gm-Message-State: AJcUukeIUymJIRV22G/wYWuYWoXB6eAge5dJYJo7VH81P/Eh9aMj1Mkl
	pF4rcpxVTqWjSCFZVcrlbMm0ed2fbORa/DjWH6tKVrxW
X-Google-Smtp-Source: ALg8bN7vDB2uR4I0/YUyxIXKuCPMzjYnRkLpsqM05C8NKV0e9gX5GxrSuXY+VFqAWwxiUyK8QTYzLYBCepVxY4vjqTM=
X-Received: by 2002:a2e:98c9:: with SMTP id
	s9-v6mr1630878ljj.166.1546980284712; 
	Tue, 08 Jan 2019 12:44:44 -0800 (PST)
MIME-Version: 1.0
References: <20190108204249.8087-1-raj.khem@gmail.com>
	<20190108204249.8087-3-raj.khem@gmail.com>
In-Reply-To: <20190108204249.8087-3-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 8 Jan 2019 15:44:33 -0500
Message-ID: <CADkTA4MirKUSf1w0dYet-iQvPKK0yazipw267MSZLHyvDQYC=A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] linux-libc-headers_4.19.bb: Backport patch to fix clockid_t in UAPI
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
X-List-Received-Date: Tue, 08 Jan 2019 20:44:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks good to me.

Bruce

On Tue, Jan 8, 2019 at 3:43 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  ...kernel_clockid_t-in-uapi-net_stamp.h.patch | 49 +++++++++++++++++++
>  .../linux-libc-headers_4.19.bb                |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-hea=
ders/0001-net-Use-__kernel_clockid_t-in-uapi-net_stamp.h.patch
>
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/00=
01-net-Use-__kernel_clockid_t-in-uapi-net_stamp.h.patch b/meta/recipes-kern=
el/linux-libc-headers/linux-libc-headers/0001-net-Use-__kernel_clockid_t-in=
-uapi-net_stamp.h.patch
> new file mode 100644
> index 0000000000..3684cc21bf
> --- /dev/null
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-net-=
Use-__kernel_clockid_t-in-uapi-net_stamp.h.patch
> @@ -0,0 +1,49 @@
> +From e2c4cf7f98a519eb4d95532bfa06bcaf3562fed5 Mon Sep 17 00:00:00 2001
> +From: Davide Caratti <dcaratti@redhat.com>
> +Date: Mon, 17 Dec 2018 11:26:38 +0100
> +Subject: [PATCH] net: Use __kernel_clockid_t in uapi net_stamp.h
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Herton reports the following error when building a userspace program tha=
t
> +includes net_stamp.h:
> +
> + In file included from foo.c:2:
> + /usr/include/linux/net_tstamp.h:158:2: error: unknown type name
> + =E2=80=98clockid_t=E2=80=99
> +   clockid_t clockid; /* reference clockid */
> +   ^~~~~~~~~
> +
> +Fix it by using __kernel_clockid_t in place of clockid_t.
> +
> +Fixes: 80b14dee2bea ("net: Add a new socket option for a future transmit=
 time.")
> +Cc: Timothy Redaelli <tredaelli@redhat.com>
> +Reported-by: Herton R. Krzesinski <herton@redhat.com>
> +Signed-off-by: Davide Caratti <dcaratti@redhat.com>
> +Tested-by: Paolo Abeni <pabeni@redhat.com>
> +Signed-off-by: David S. Miller <davem@davemloft.net>
> +---
> +Upstream-Status: Backport [https://github.com/torvalds/linux/commit/e2c4=
cf7f98a519eb4d95532bfa06bcaf3562fed5]
> +
> + include/uapi/linux/net_tstamp.h | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/include/uapi/linux/net_tstamp.h b/include/uapi/linux/net_ts=
tamp.h
> +index 97ff3c17ec4d..e5b39721c6e4 100644
> +--- a/include/uapi/linux/net_tstamp.h
> ++++ b/include/uapi/linux/net_tstamp.h
> +@@ -155,8 +155,8 @@ enum txtime_flags {
> + };
> +
> + struct sock_txtime {
> +-      clockid_t       clockid;        /* reference clockid */
> +-      __u32           flags;          /* as defined by enum txtime_flag=
s */
> ++      __kernel_clockid_t      clockid;/* reference clockid */
> ++      __u32                   flags;  /* as defined by enum txtime_flag=
s */
> + };
> +
> + #endif /* _NET_TIMESTAMPING_H */
> +--
> +2.20.1
> +
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.=
19.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.19.bb
> index 8fd427efef..48f25ebc1a 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.19.bb
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.19.bb
> @@ -10,6 +10,7 @@ SRC_URI_append_libc-musl =3D "\
>     "
>
>  SRC_URI_append =3D "\
> +    file://0001-net-Use-__kernel_clockid_t-in-uapi-net_stamp.h.patch \
>      file://0001-scripts-Use-fixed-input-and-output-files-instead-of-.pat=
ch \
>      file://0001-kbuild-install_headers.sh-Strip-_UAPI-from-if-define.pat=
ch \
>      file://0002-arm64-sve-ptrace-Fix-SVE_PT_REGS_OFFSET-definition.patch=
 \
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

