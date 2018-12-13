Return-Path: <anders.roxell@linaro.org>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id ECBDF6C373
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 10:47:59 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id g75so631387ywb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 02:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=E4DnPLLDUW++cRLNUgxaKOoYpUTJo4dVf/vlTI4T6W4=;
	b=Di4PkGc9gXVi9NtrPYpO/QI9oOR1P31yMKrni0g15/37BBgcProA/avVW2yNTwRzki
	I3DbySVd6iUsebJuEO+7MVPFysJIirzjpvRv3AHIIkn8wsCXPh7LoKe+R0PRU0WwAux7
	b258zBizHSazbbGV9pkQVMyIAB+ZMLVOv6L1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=E4DnPLLDUW++cRLNUgxaKOoYpUTJo4dVf/vlTI4T6W4=;
	b=ssU5/010WvLFGN+Cc/7Dixy/dwRrPcibGA/xtZYmPVTroXaVQzQ+Ze3uyiw0ByQc+B
	u8wz6nJEBdAYdU7bNgpCvSn/lmSewcSj4dtvuiAeSxYgGlexHbKLHRXaBHCMHcO6Nrp4
	eSzJ17kSp3dykiLgnbBkwWPjgqgsS/7zof0kqGaU3TL6+cdDjHfegbg7h8whws8/kXrz
	/p4kjpU7FhkyhONmKRg6Nb2VpVzbuwENouA56OAbsFmi4QzGrbpeR4oKSTgi70wGdw0m
	E/65nzNvz/0ECzUgPCksHZ8gI6squLEOryhuzCLOSIBd3qbvp0mtPqjhtllQfeUH+hvU
	Mt6g==
X-Gm-Message-State: AA+aEWYJ4ZZ4xe34u9hjf+DCz0llbOXR5FNkck16zllshBVGJHkLMUkT
	x8WiBWXenmaGzY+L6zI0mnTNKdLH+lLyYXtfeb0wgw==
X-Google-Smtp-Source: AFSGD/UxtaPP9emIOQ0+GuICV9m6vl0iMZiP3NxRkVpjiX+UEcdWexeVFRXvKwKGNUb/3KPY8HgzmHqZ6A2Q3qRn44M=
X-Received: by 2002:a81:2bc2:: with SMTP id
	r185mr15866425ywr.425.1544698080733; 
	Thu, 13 Dec 2018 02:48:00 -0800 (PST)
MIME-Version: 1.0
References: <20181204134233.12495-1-anders.roxell@linaro.org>
	<CAJTo0La5UGW2OVTX_6mcLZL0PuZ4w4jLg3fse6hL-3HihtOGpQ@mail.gmail.com>
In-Reply-To: <CAJTo0La5UGW2OVTX_6mcLZL0PuZ4w4jLg3fse6hL-3HihtOGpQ@mail.gmail.com>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Thu, 13 Dec 2018 11:47:49 +0100
Message-ID: <CADYN=9LhpVfO=-r-NkLvuGus2WP7+MC600q=Qv=pYiof6GVkTw@mail.gmail.com>
To: ross.burton@intel.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: add coreutils-native to the DEPENDS list
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
X-List-Received-Date: Thu, 13 Dec 2018 10:48:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Dec 2018 at 15:24, Burton, Ross <ross.burton@intel.com> wrote:
>
> Can't we just add this to HOSTTOOLS instead?

That makes sense, I'll send out a patch shortly.

Cheers,
Anders

> On Tue, 4 Dec 2018 at 13:43, Anders Roxell <anders.roxell@linaro.org> wrote:
> >
> > In newer kernels fold gets used, see output from a build:
> >
> > .../kernel-source/scripts/atomic/atomic-tbl.sh:
> >    line 183: fold: command not found
> >
> > Rework so that coreutils-native is in the DEPENDS list.
> >
> > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > ---
> >  meta/classes/kernel.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index 880c5ef17283..8d83ca4843e3 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -4,7 +4,7 @@ KERNEL_PACKAGE_NAME ??= "kernel"
> >  KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
> >
> >  PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
> > -DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native bison-native"
> > +DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native bison-native coreutils-native"
> >  PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
> >
> >  do_deploy[depends] += "depmodwrapper-cross:do_populate_sysroot"
> > --
> > 2.19.2
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

