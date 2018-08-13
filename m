Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id E8901745F2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 04:42:19 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id j205-v6so25127868oib.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Aug 2018 21:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=O/55q9JJOlbqa5MKfPnW8nO058aLgOHVUFu2YOFnkFI=;
	b=E2GsviU6LI2znr++RITRWuSHicGo8K9iE951ilFNT955RCicgC7TgjA77YqmB6xz7p
	iKwlV/Tv+Ye8zKFSscreQ6K7gBrEKSHuAA/4rXHGjGXjGMp9bKXsTKLFeFeg4Ql0Qxz9
	7YOMNlAMRZj5q7GRrXvYmAqlEKlxKSVjaEOVIxnbSiR9aaJqyYw+rNruc5CTZo/NgJF/
	q0isN3SQfsfbO1+iNoYBlrcHMQTFK4cMy/BolECpDp1QfzULQaArXIMwmiKQw4raO917
	SaE7NuVmvYAiLGQfAIOKhAqM3xF5icyaPlGeu4JL4hcosK4lXTPcDbhzlxYCJECJeWOs
	XRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=O/55q9JJOlbqa5MKfPnW8nO058aLgOHVUFu2YOFnkFI=;
	b=enorsDFgBISGoOtl7GvKn8UHQK+2wzDaaDG71lZ8aOQ+ZLW1tQ00wxO45eZPRoe4bW
	ZkyIK6TuR5OrMe3rDJfTTGBsXcaWc27BcyFke7GirmAVzSLyo3xmxVuaYoNm+jPMLZHa
	e83HT5crcNsmpQkxJVE+cbaP+M0yMynbBjesIeLVT5m1xZzAlc6Drxpt9o5qngk1R7Fv
	OzLXBnvDALO7NyJPjI44lw4afZtGjl3aHLS1qQ3jzqKuAdZXlObB71+zZkCyoy14Rpu7
	FswF9yw0Qh8jWq0PnWLQuejdAjJelul6m1ipRDiNN0NtWYU65KGDaGqnYMtvzVkn0XOt
	5aeg==
X-Gm-Message-State: AOUpUlGYBg1LzQFVkSzz2PZEmuxXclifBkRx0/IIyKQTifnCj7gC2mJJ
	I0jYe/yw3Ga0G+Ay6aPVRQKAnpdJHafSJ12ORpMzDqR12qM=
X-Google-Smtp-Source: AA+uWPwPPa6GPvIAGGVsNv8jC5nRMPvQ30/UMeHtPCpBIuSUwwiZQKx06ohmz43bCiEQrBlpQiBn0jn4QRHjjrL/Z3Y=
X-Received: by 2002:aca:ba57:: with SMTP id
	k84-v6mr15034680oif.10.1534135340621; 
	Sun, 12 Aug 2018 21:42:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6455:0:0:0:0:0 with HTTP; Sun, 12 Aug 2018 21:42:20
	-0700 (PDT)
In-Reply-To: <1533831811-5738-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1533831811-5738-1-git-send-email-jkrishnanjanappa@mvista.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Date: Mon, 13 Aug 2018 10:12:20 +0530
Message-ID: <CAD3vsf59gZEVm+L8c4DJOLL45bc1P3k4b1HY4y1GaMH7DLT1tA@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] runqemu: exit gracefully with an error message if qemu system is not evaluated
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
X-List-Received-Date: Mon, 13 Aug 2018 04:42:20 -0000
Content-Type: text/plain; charset="UTF-8"

Ping. I do not see this patch in August archive
http://lists.openembedded.org/pipermail/openembedded-core/2018-August/thread.html.
Do I need to re-send?

Regards,
Jagadeesh

On Thu, Aug 9, 2018 at 9:53 PM, Jagadeesh Krishnanjanappa
<jkrishnanjanappa@mvista.com> wrote:
> It solves below error:
> -- snip --
> return 'qemu-system-%s' % qbsys
> UnboundLocalError: local variable 'qbsys' referenced before assignment
> -- snip --
>
> [Yocto 12846]
>
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>  scripts/runqemu | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index f52b9a8..409d17c 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -1118,6 +1118,11 @@ class BaseConfig(object):
>              qbsys = 'riscv64'
>          elif mach == 'qemuriscv32':
>              qbsys = 'riscv32'
> +        else:
> +            logger.error("Unable to determine QEMU PC System emulator for %s machine." % mach)
> +            logger.error("As %s is not among valid QEMU machines such as," % mach)
> +            logger.error("qemux86-64, qemux86, qemuarm64, qemuarm, qemumips64, qemumips64el, qemumipsel, qemumips, qemuppc")
> +            raise RunQemuError("Set qb_system_name with suitable QEMU PC System emulator in .*qemuboot.conf.")
>
>          return 'qemu-system-%s' % qbsys
>
> --
> 1.8.3.1
>

