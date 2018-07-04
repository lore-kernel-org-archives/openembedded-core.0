Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 648F978A1F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jul 2018 13:30:48 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id b77-v6so3096291vkb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2018 06:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zcO15OsOeap96Z5BA+Tf2e7CJHqrno5O0N5B1gUk8mA=;
	b=Q1QjhsLrFLvkfpd4vj8YHcOeRFQPWFZdsf4pDycPNneBJkAtKkbd6HS4Mi/9rm90Jd
	vzgUpAqdmv6fOpCYzhZ9UOlkYqOrb6qtAPQZ0bB1rdbQvupIOlSV1Itr67aAxtXYBD+d
	hzSv3WDkd4ofsoPWwMUc8L8MV5LLLsRdEVBPF6PBXYMDqwppzURy/Oy54BzOdeEhsVK6
	UBwjm+oqE45AoTl7H9H0lXg5duOJA6ZW1baFaA2uRU/wHwODaYaUmTyJooiTOEAoAW1F
	Ce7TwPDfpopgETEzYG7QQSwqpvtWPrrYXWcydsFZWyv+t3oj27we39MoGr9PnE5HpOYl
	5Flg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zcO15OsOeap96Z5BA+Tf2e7CJHqrno5O0N5B1gUk8mA=;
	b=goEhLkxzX80+Z3rXYS18dbtavVltpJKHLgVEiH6pxUha0rrAKlcDH8hKMgU2q6Obp5
	3AR9kG7/FGeC0Cz3r4gmWzwc82619sZ2Rb/nP96Cy0Ze9Qs7FVambVywbNrTdWBX020i
	OlBjilijWMSnhmOYIl5EQC2EtYlukGbO2QHt7oz4NPhGYhdSzkkk0718Ud0jCnkrjLiK
	CtZzZ7ssiFDjxdkSNVmWlpTUfseOEbfg5dDTR7fTamHoExHLYerMtmQ3TFl2bgGpGTiS
	/bNSViFadi99eM2oWi3VMjvfpzBhoUwh0NvC52GRQ+E3Zn7AV9RTjPKz29MahHK5xY4v
	bn/w==
X-Gm-Message-State: APt69E0TjXcwp7nW94KGrFU1xjXbj+HnSLHQVmKuh1XHwMa6j45xUtDA
	Jmql0tyM9tQFYKh9947PeYWlFyIPzgW6DV4+fnM=
X-Google-Smtp-Source: AAOMgpdcH4LTxLIgkPJKkJKLNcDvWkCD6fs23jeceh/CAdC4+mipi4EyRSikqZaraf9lVqFD4xgQKSfPEvFtyIGvIH0=
X-Received: by 2002:a1f:20d4:: with SMTP id
	g203-v6mr1103957vkg.176.1530711049002; 
	Wed, 04 Jul 2018 06:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20180704065654.21039-1-zhe.he@windriver.com>
In-Reply-To: <20180704065654.21039-1-zhe.he@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 4 Jul 2018 06:29:40 -0700
Message-ID: <CAMKF1sr-+FgZYWSD-LEVxZ5uAf7TE8qTPJ7=NYs=ixOPc9cwHA@mail.gmail.com>
To: zhe.he@windriver.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] scripts/runqemu: qemumips support up to 2GiB RAM
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
X-List-Received-Date: Wed, 04 Jul 2018 13:30:48 -0000
Content-Type: text/plain; charset="UTF-8"

i think you can squash both patches into one. Additionally we should
be able to cover mipsel case as well
On Tue, Jul 3, 2018 at 11:57 PM He Zhe <zhe.he@windriver.com> wrote:
>
> OE uses qemumips to simulate a Malta board by default.
>
> As upstream qemu introduced:
> https://git.qemu.org/?p=qemu.git;a=commit;h=94c2b6aff43cdfcfdfb552773a6b6b973a72ef0b
>
> The Malta board can support up to 2GiB of RAM which should
> be able to boot a Linux kernel built with CONFIG_HIGHMEM
> enabled and passing "-m 2048" to QEMU and appending the
> following kernel parameters:
> ...
> mem=256M@0x0 mem=256M@0x90000000 mem=1536M@0x20000000
> ...
>
> But the following commit in kernel broke above mem=X@Y setting
> which added the memory as reserved memory area.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=73fbc1eba7ffa3bf0ad12486232a8a1edb4e4411
> ...
> commit 73fbc1eba7ffa3bf0ad12486232a8a1edb4e4411
> Author: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
> Date:   Wed Nov 23 14:43:49 2016 +0100
>
>     MIPS: fix mem=X@Y commandline processing
> ...
>
> So remove `mem=*' to disable user-defined physical RAM map
> which let kernel itself caculates memory ranges.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  scripts/runqemu | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index de42d0f323..597e7e9a79 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -668,7 +668,10 @@ class BaseConfig(object):
>              logger.info('QB_MEM is not set, use 512M by default')
>              self.set('QB_MEM', '-m 512')
>
> -        self.kernel_cmdline_script += ' mem=%s' % self.get('QB_MEM').replace('-m','').strip() + 'M'
> +        mach = self.get('MACHINE')
> +        if mach != 'qemumips':
> +            self.kernel_cmdline_script += ' mem=%s' % self.get('QB_MEM').replace('-m','').strip() + 'M'
> +
>          self.qemu_opt_script += ' %s' % self.get('QB_MEM')
>
>      def check_tcpserial(self):
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

