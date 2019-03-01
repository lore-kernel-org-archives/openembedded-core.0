Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id 346527CDCD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 19:42:53 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id g80so21454715ljg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2019 11:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4Fwi+8IF8HD0lxoNHC3Pp8Qvec5sQOuxQgFZ0ItysR4=;
	b=Vj0ebQ2tjafEPNHitsAJQoHz2w9U0kuzxqKjL3qoVEhVTav+EAD+2362oxbTWPNIGe
	dOREFqGrG9FBlh7Jj64W35PDwfBoH8WpmOB6ThPvvb+fjFm5HzV7AkuI7ufKA9XDfPfI
	jydkLspMIGK6Lo/YhHR5OH5mb2r5CvFUP7eL/E/Za+MhAVTZ4XxjHofvsPJllO02W7JQ
	JyEJ8eEqd0bKulWiaD7kP23xw1tI9ccjVQ92dad4LkmPAC4ol4lkypJ8xCfNlwJGwW6J
	5StDGBd8eWVzyxXMS6u4GyxR5GrTuLInB/p4yASbnRUKxRuH+23a2sQ2Wi1NfWw+4/5C
	jbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4Fwi+8IF8HD0lxoNHC3Pp8Qvec5sQOuxQgFZ0ItysR4=;
	b=BY95g6JksJMArGwFdbf2/8oHP0umuF36AOStFOMFXistxAV7ZVLkUZc8Dadr6KIeTv
	RC8ja+4cok1GSFvLKRKHV1Zie/3sm0BG4VI8BzumItsiZ4G8lrdRXG9IziFsY+QrveYR
	XUmhCmCfaTKFCs2D5CbDaPDE+eJ31XW9oao45Q7eeAyLk2yQC3+J3N5t1qOA3iB0HDGk
	3+fYIeBcJaentjBSbqZ+CdhGK1rl1s0ZMLRhXvwlMsqX+5ZNUl+Td5Hv/SS/UEEiqbLB
	uuBuv3V65Mo1xNR6JnKQK0ZAAXpO2dcZZhnhn5avKCRisFlqqqVdh6DwrQnsZzf11jPe
	BPAA==
X-Gm-Message-State: APjAAAXA305uzDd475lJr6IMLGCgwcSwVkD6VOmJvotPYmgv6xtSb0KJ
	Ko2M89XrZsR0gkE9PeZRgMQpI50pvHRV8ZiO5bg=
X-Google-Smtp-Source: APXvYqwsUYfrMWSYFym+V9zafgM1tbHYqKCgVNnVvQGVmhLrogrCzzvLv+pvieA6hFS/eFllk0SaRqreFqAQTjy5mtI=
X-Received: by 2002:a2e:3018:: with SMTP id w24mr3673591ljw.7.1551469373627;
	Fri, 01 Mar 2019 11:42:53 -0800 (PST)
MIME-Version: 1.0
References: <20190301193156.25878-1-alistair.francis@wdc.com>
In-Reply-To: <20190301193156.25878-1-alistair.francis@wdc.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 1 Mar 2019 11:41:54 -0800
Message-ID: <CAKmqyKPKW_dm7NOU-wRJmy2krb1LzqTw1=T1df5phbGmHZ2VHA@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] license: Add the CMU-Tex license
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
X-List-Received-Date: Fri, 01 Mar 2019 19:42:53 -0000
Content-Type: text/plain; charset="UTF-8"

Never mind, drop these. I will move this into the meta-multimedia layer.

Alistair

On Fri, Mar 1, 2019 at 11:32 AM Alistair Francis
<Alistair.Francis@wdc.com> wrote:
>
> This is based on the license here:
> https://github.com/MycroftAI/mimic/blob/development/COPYING#L840
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  meta/files/common-licenses/CMU-Tex | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta/files/common-licenses/CMU-Tex
>
> diff --git a/meta/files/common-licenses/CMU-Tex b/meta/files/common-licenses/CMU-Tex
> new file mode 100644
> index 0000000000..f512228523
> --- /dev/null
> +++ b/meta/files/common-licenses/CMU-Tex
> @@ -0,0 +1,20 @@
> +Copyright (C) 2001-2014 Carnegie Mellon University
> +
> +Permission is granted to make and distribute verbatim copies of
> +this manual provided the copyright notice and this permission notice
> +are preserved on all copies.
> +
> +Permission is granted to process this file through TeX, or otherwise and
> +print the results, provided the printed document carries copying
> +permission notice identical to this one except for the removal of this
> +paragraph (this paragraph not being relevant to the printed manual).
> +
> +Permission is granted to copy and distribute modified versions of this
> +manual under the conditions for verbatim copying, provided that the entire
> +resulting derived work is distributed under the terms of a permission
> +notice identical to this one.
> +
> +Permission is granted to copy and distribute translations of this manual
> +into another language, under the above conditions for modified versions,
> +except that this permission notice may be stated in a translation approved
> +by the authors.
> --
> 2.20.1
>

