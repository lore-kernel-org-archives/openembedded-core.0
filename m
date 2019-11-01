Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF337F93B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2019 10:10:25 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id y7so7133415edo.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2019 03:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ov2MizpfNWvxPNdQUE1pbcY7SRUaVLL/wSbe7gO44+I=;
	b=RGE9vkPLChRbr4Z6oQaAWhKGKwh8khhENAns4qJfJfimasi3dx/wFAdrJgip4d3mwa
	keZ9x8sPKWlp7y26iXi8ou4EnN2D9JYhF+p92V65stiC6g/3XCNNu6Be1GEVJ7Jvg5cx
	YyR5S40fZ5keqUjFSNmEb47l8996uJ95SFyEgTPCnRDXVAYJlDa6mcXOtHNFL5L1z8pe
	1XFz3Md2yxMATziyOgQcETID+KtwmYJmBvoiQbOyzt0EjgR636+d4EL5oVG/thekYwIo
	dmsIyyUKX0TeXOdYTEdKcPNdkXPlmfpreTei02yjVYDeR68xSiAHmToA63mCpqogouxh
	ji4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ov2MizpfNWvxPNdQUE1pbcY7SRUaVLL/wSbe7gO44+I=;
	b=GqW2tEoz7CtbLM9jVs6fVz+SF8AVL3QtLdMCXN2BcDMNIi5Lzk/qiS5j7dvHyMR9Z6
	b6DRiqXuGSyX23hHv4wnBJMLmXgZS0299Dfbnh3M8y4fF/kUcczjlIjVq5qfI4OSUxzX
	6Ngn0Ka0mgDCZ+4w2c3hp8IeUkzX13qDsm7sXgJ4S3HyOrMOMnzXmDqsaY0z6zIpwmrO
	nFJk6qz9GWdudK5bGaQw8Ul5HRnY2JtQXoL8b3hEwmm26zXunaAZ1W8Z66Ve4Z7zyBKH
	rdjSWkfW9Ng3LJPmH4VPex0/txLd/TKaNyaqV8lB4P8U15+e1gq8ttaztuDLdn/WUKtf
	yrUA==
X-Gm-Message-State: APjAAAVZhuraFAF9603bskRW79DQDb2Llbj6XGMph9jzC2jefasUPKeH
	LZDRR66Tais7SwcdxqxjD0itJ4PJIHBLDfakeBwWJphpAas=
X-Google-Smtp-Source: APXvYqzAw+WGHhUoj7qOHoijDNcgu5Yjqxuibvh2yCuEvpvChXiAgNVwjzMy0BoO+yni+XEQ6NdRaTtFgazX6Pjp1lA=
X-Received: by 2002:a50:baa9:: with SMTP id x38mr7406553ede.106.1572603025644; 
	Fri, 01 Nov 2019 03:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <1572517219-382824-1-git-send-email-zhe.he@windriver.com>
	<CADkTA4OvFRd7wCFQRHZAv+BMki9nsX_g5_TuogsHUvSnmDGLxg@mail.gmail.com>
	<5e5f4937-0465-49c0-66aa-71b79628fdf2@windriver.com>
In-Reply-To: <5e5f4937-0465-49c0-66aa-71b79628fdf2@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 1 Nov 2019 06:10:16 -0400
Message-ID: <CADkTA4MwEww=QfbWW=7BUOq9SLCatJv-Lwo=WrvX=6Dq6E7yUg@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-dummy: Add package kernel
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
X-List-Received-Date: Fri, 01 Nov 2019 10:10:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 31, 2019 at 10:01 PM He Zhe <zhe.he@windriver.com> wrote:
>
>
>
> On 10/31/19 6:57 PM, Bruce Ashfield wrote:
> > On Thu, Oct 31, 2019 at 6:20 AM <zhe.he@windriver.com> wrote:
> >> From: He Zhe <zhe.he@windriver.com>
> >>
> >> Some package like packagegroup-core-boot may ask for package kernel. Let
> >> linux-dummy rprovide package kernel to fix the following build failure.
> >>
> >> ERROR: Nothing RPROVIDES 'kernel' (but
> >> .../meta/recipes-core/packagegroups/packagegroup-core-boot.bb RDEPENDS on or
> >> otherwise requires it)
> > Can you expand on what the higher level use case is that something is
> > using packagegroup-core-boot (or whatever), but also linux-dummy ?
> >
> > It seems like this is going to hide misconfigurations .. since you may
> > want something bootable, but yet are not properly configured.
> >
> > If there's part of that packagroup you need, why not split it up,
> > rather than masking the symptom seen here ?
>
> It's the "efi" in MACHINE_FEATURES who asks for "kernel".
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-core/packagegroups/packagegroup-core-boot.bb#n31
>

Right. But the question is, why is the image that is being built
trying to install packagegroup-core boot when it has linux-dummy as
the kernel ? It's basically a misconfiguration, and I'm trying to
understand the details.

If this was provided by linux-dummy, I'd think that we'd at least want
a bbwarning to let the user know that they've asked for something
bootable, but will not end up with something that can boot.

> I thought the user would take care of the kernel himself, so simply added it to
> linux-dummy. I'm not quite sure what you mean by "split it up".

Meaning, make that part of the packagegroup into a new/separate
packagegroup that could be conditionally included by a variable (and
that way the configuration you are talking about could still depend on
packagegroup-core-boot, and not get the kernel dependency ... hence no
need for linux-dummy to provide it at all). Or alternately, just have
that entry in the package group be a variable, that another layer can
bbappend and clear (and again, remove the dependency).

i.e. if this (packagroup-core-boot) is being pulled in by something
like a container image build, there are already variables that control
the kernel dependency and other ways to avoid it.

Bruce

>
> Regards,
> Zhe
>
> >
> > Bruce
> >
> >> Signed-off-by: He Zhe <zhe.he@windriver.com>
> >> ---
> >>  meta/recipes-kernel/linux/linux-dummy.bb | 7 +++++--
> >>  1 file changed, 5 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta/recipes-kernel/linux/linux-dummy.bb b/meta/recipes-kernel/linux/linux-dummy.bb
> >> index 62cf6f5ea6..20d7ed815d 100644
> >> --- a/meta/recipes-kernel/linux/linux-dummy.bb
> >> +++ b/meta/recipes-kernel/linux/linux-dummy.bb
> >> @@ -8,19 +8,22 @@ LICENSE = "GPLv2"
> >>  LIC_FILES_CHKSUM = "file://${WORKDIR}/COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
> >>
> >>  PROVIDES += "virtual/kernel"
> >> +RPROVIDES_${PN} += "kernel lib32-kernel"
> >>
> >>  PACKAGES_DYNAMIC += "^kernel-module-.*"
> >>  PACKAGES_DYNAMIC += "^kernel-image-.*"
> >>  PACKAGES_DYNAMIC += "^kernel-firmware-.*"
> >>
> >> -PACKAGES += "kernel-modules kernel-vmlinux"
> >> +PACKAGES += "kernel-modules kernel-vmlinux kernel"
> >>  FILES_kernel-modules = ""
> >>  ALLOW_EMPTY_kernel-modules = "1"
> >>  DESCRIPTION_kernel-modules = "Kernel modules meta package"
> >>  FILES_kernel-vmlinux = ""
> >>  ALLOW_EMPTY_kernel-vmlinux = "1"
> >>  DESCRIPTION_kernel-vmlinux = "Kernel vmlinux meta package"
> >> -
> >> +FILES_kernel = ""
> >> +ALLOW_EMPTY_kernel = "1"
> >> +DESCRIPTION_kernel = "Kernel meta package"
> >>
> >>  INHIBIT_DEFAULT_DEPS = "1"
> >>
> >> --
> >> 2.17.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> >
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

