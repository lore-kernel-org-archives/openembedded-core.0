Return-Path: <cazfi74@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id EF3E377202
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 14:42:20 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id j15so13345243oih.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 06:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OAyu3WRdB3qp9uCSzPpWPn6DqlniAiCRpKDi3852Rn0=;
	b=tpjSUMVe+NUIKHfxvAl8KaaDtPA4zdqSCSJNHYYeOs/SihRyeh3vlWOotDd4oEGA80
	v/YW/XlauTZyhpkauUVZuvjUlWRom+GK8vuzUr31nbcbJGVkzaJavg6hRVx4boLPguDL
	DNjpRuAYuDdiM7X4TWp/tofFWK+XX5Bq2UaKPQsyxYTt8c+pi7qaJQukn2Hv4AiW4ZeU
	zQjEVGxs+U7O/A13YXy/XrIj80jDZ1+2M1jc04pcGXpIAjIa5nVjqBbC5LBhuDsjJian
	5WUB+jJpt/U/0pJ37Gs8SR3RdMH+1Spdkkn5Q44O+QFME8EBPJ6UgWIHGNL/UoPU3XPC
	+EmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OAyu3WRdB3qp9uCSzPpWPn6DqlniAiCRpKDi3852Rn0=;
	b=kD9Fn6wzZsQ2vtyMZfyaczOlSabvi4Z/CeWi/rBLx8EYp70EBCsZclwFU6Ym03BzbJ
	taaIabVrIE/bQrh4MtdpzSfQrxEMtDPWu4icwG5u57Wv0qOYK4YEBKh0eFG7/bPnjQDp
	ovIe7Si5lie+TaPFMW04wUmX4WEE2Emq/R9PVmWrpbeSie1Y6qpO5UxtPWox5pYx+3Vz
	EVV1cKRtjDEkeTCrqt+7EGrwPBC6GPmIDWti3nzryq+6Pilf7wXoQ6pz3GLu9Wuv1wNf
	TNIeW+vIxnUc76zpmeECW6CoCc+UQlZjEU+15BJD6/MIzWmjuslQ2e69shCmQ64qkxhV
	o0JA==
X-Gm-Message-State: AIkVDXJpb2/qpPasdAI9GWnQoPI/3PkRIbnQMHwQh4/F6Gua8Y1Mxcy4jDvJZMSSijiSVB6iIPRoqTMr7h0Euw==
X-Received: by 10.202.244.19 with SMTP id s19mr17568440oih.24.1485268940799;
	Tue, 24 Jan 2017 06:42:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.11.151 with HTTP; Tue, 24 Jan 2017 06:42:20 -0800 (PST)
In-Reply-To: <LOXP123MB0117C97F4BE309CCAA9AFAF585750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
References: <LOXP123MB0117C97F4BE309CCAA9AFAF585750@LOXP123MB0117.GBRP123.PROD.OUTLOOK.COM>
From: Marko Lindqvist <cazfi74@gmail.com>
Date: Tue, 24 Jan 2017 16:42:20 +0200
Message-ID: <CAF6bG8cjeGXZfRvnr0BdS=P8hgC8zzfJmbwYJg1FXnOxgdKKDQ@mail.gmail.com>
To: Andrew Goodbody <andrew.goodbody@cambrionix.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: configure error for glibc 2.25.2
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
X-List-Received-Date: Tue, 24 Jan 2017 14:42:21 -0000
Content-Type: text/plain; charset=UTF-8

 Probably unrelated, but glibc people were hoping autoconf-2.70
release before they release glibc-2.25 as post-2.24 glibc configure
has some problem post-2.69 autoconf would resolve. I don't know if
they have managed to work around their issue some other way when
autoconf release has still failed to materialize (it was half-promised
by the end of year 2016)


 - ML


On 24 January 2017 at 16:07, Andrew Goodbody
<andrew.goodbody@cambrionix.com> wrote:
> I get the following configure error when trying to rebuild my tree today after doing a sync.
>
> Is this a core issue or something wrong in my tree?
>
> Thanks,
> Andrew
>
> | checking installed Linux kernel header files... missing or too old!
> | configure: error: GNU libc requires kernel header files from
> | Linux 3.2.0 or later to be installed before configuring.
> | The kernel header files are found usually in /usr/include/asm and
> | /usr/include/linux; make sure these directories use files from
> | Linux 3.2.0 or later.  This check uses <linux/version.h>, so
> | make sure that file was built correctly when installing the kernel header
> | files.  To use kernel headers not from /usr/include/linux, use the
> | configure option --with-headers.
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at /home/andrew/src/camol3/camol/build/tmp-camol-glibc/work/armv7ahf-neon-camol-linux-gnueabi/glibc-initial/2.25-r0/temp/log.do_configure.30873)
> ERROR: Task (/home/andrew/src/camol3/camol/layers/openembedded-core/meta/recipes-core/glibc/glibc-initial_2.25.bb:do_configure) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 779 tasks of which 0 didn't need to be rerun and 1 failed.
> NOTE: Writing buildhistory
>
> Summary: 1 task failed:
>   /home/andrew/src/camol3/camol/layers/openembedded-core/meta/recipes-core/glibc/glibc-initial_2.25.bb:do_configure
> Summary: There were 7 WARNING messages shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

