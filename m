Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
	[209.85.210.53])
	by mail.openembedded.org (Postfix) with ESMTP id B6E157C45F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 11:20:17 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id e12so14292706otl.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 03:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wjgA+VwcIT6Ok1OL7ga6sXRLaHLd71pMpCNPtoQpbEI=;
	b=C9I2LszXbZ2/GHn8tGBYYOKjeT0YLYc6AjVXooDd/DaSBK3xQ1mosc7e2F36fmLPH/
	sVQtGGKuHpXZdDQat2OhNE+egTa6bN+d9Y/fLxmqIHazx2qPpiCNhY7T+VVGvaemGEY7
	WzENVk3EKshhkEjrggHGMEJUccAG/TAA3r/ai95S2oOHVTWdUPrST6xze7O9RZi64sFg
	tur+HDJROjASmvSDlbI7O7j3VnNQcL2LdKkH50A01YY/ac/if0TuIe7/I/XwzZuTQjzc
	N3NJfI8JgKf+EvixHAx3N0m9TGo8MdHeJtcJcT6soSiKCNM5P6P1Ym2JWemUjpERlqrX
	N6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wjgA+VwcIT6Ok1OL7ga6sXRLaHLd71pMpCNPtoQpbEI=;
	b=sj6HynHy7RgMrNiXfvK+xnYt0OdZ1zU5aDnyqPWRMYkVi/8kFhvp3xy8j1jmu3urKV
	LVQ27NFwmYnlRjJlOGOgqcq3mS50k/+/Tk4iUXrH/n4VbZAL8TI3hQ9wGAZaXc32Hcgk
	3lia3l74+PZsY0+73koR2arfVHLKl9eBM6Dp4vviRo/l6MrAADoa+rgOJmyzGzXa4LnN
	eWQVuG0Hb1VsFU20iHNRfZcuHU5cwCPkUDEQ4PpO+8XM4InRXPKIxeRZWJsWhx1dTEtC
	q97MUzYuXQL8fQAwZL11cQjLs0c8d2cOOYfcIuZPXQBJUz6WiI3OcPmm7X17YHzzDOBH
	jEqA==
X-Gm-Message-State: AJcUukfWwR2THqZxUanSM1vBgSjoeMtF9wj3i2G7GWtpRfJ2oiYws4mT
	zGPEGnBKgNAz9TftxUUt0dPXHrU2BIoETYtYtgTC0Q==
X-Google-Smtp-Source: ALg8bN5ah4+L4ysF9P3OiM110pevyNW52k7P5JBEmKBD5kYjAaapxrGKrVycvCHl+Jl37bZDe9n3lYqgTNSgvVI/KK4=
X-Received: by 2002:a9d:5cc2:: with SMTP id r2mr16129508oti.367.1548674418704; 
	Mon, 28 Jan 2019 03:20:18 -0800 (PST)
MIME-Version: 1.0
References: <20190128111732.16387-1-marcusc@axis.com>
In-Reply-To: <20190128111732.16387-1-marcusc@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Jan 2019 12:20:07 +0100
Message-ID: <CANNYZj-Ppan8+qjppbBasLG-D73Gh3qLNBmDOhpNPKgyxmn7Bw@mail.gmail.com>
To: Marcus Cooper <marcus.cooper@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/3] systemd: Fixes Security fix CVE-2018-16864 - CVE-2018-16866
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
X-List-Received-Date: Mon, 28 Jan 2019 11:20:18 -0000
Content-Type: text/plain; charset="UTF-8"

Maybe it's better to update systemd to latest upstream release?

Alex

On Mon, 28 Jan 2019 at 12:17, Marcus Cooper <marcus.cooper@axis.com> wrote:
>
> Changed in v2:
>  - Added CVE tag, Upstream-Status tag and Sign-off-by tags.
>  - removed the verification of the entry length in the header
>  - squashed CVE-2018-16865 patches into one
>  - CVE-2018-16866 patch now taken from systemd-stable and includes
>    an additional heap buffer overflow fix.
>
> Marcus Cooper (3):
>   systemd: Security fix CVE-2018-16864
>   systemd: Security fix CVE-2018-16865
>   systemd: Security fix CVE-2018-16866
>
>  ...-not-store-the-iovec-entry-for-process-co.patch | 208 +++++++++++++++++++++
>  ...rnald-set-a-limit-on-the-number-of-fields.patch | 139 ++++++++++++++
>  ...nal-fix-out-of-bounds-read-CVE-2018-16866.patch |  49 +++++
>  meta/recipes-core/systemd/systemd_239.bb           |   3 +
>  4 files changed, 399 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0024-journald-do-not-store-the-iovec-entry-for-process-co.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0025-journald-set-a-limit-on-the-number-of-fields.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0026-journal-fix-out-of-bounds-read-CVE-2018-16866.patch
>
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

