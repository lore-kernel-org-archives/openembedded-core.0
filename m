Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4E27279C0A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 10:24:54 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id o21so29195543otb.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 03:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bAsgG3ZUypoDjWD2O12lowVn4RdF4Ln7otNMf40L1RU=;
	b=kq60wg4rTyMVu9IaJiph3VjJRZFdLYnk1+QSMOeecQTGAlOt7+VREWzJYRJJjhJRbV
	FygOg7IG4nk3qOOfu4cas+LSL3rk3bVbBaFL1Hwr7E1vDVEPUqRkwQkabWxDzLIi2DTQ
	VHmn8zsblvRRMXRCbkkHHPzyEK3hQMb4GnmhrJTI/UBdZkD1PeqlihKMLAHtiJ8ZRgWd
	ybUB0rjSoLcKUlMrUnldXJUue0gG1yo8xZJqlxCsXRXt23BYtFn4iCyRdH62sdJ8KY1/
	sG2J2frg3fytnfUr7SYOW43pOx9Cf5mt2gOw+3jH09Fx1XID+s+rIQFDHF7LY+NewSrF
	CqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bAsgG3ZUypoDjWD2O12lowVn4RdF4Ln7otNMf40L1RU=;
	b=lcDxBS7bFEqGzgrmJs5gW0h4Uxv3iVikREVtbq4e12jXK1EEMVzgaACpNqYfnL8ePR
	Uk7tctFZzsRkjzzLvGh09YGo7eB7Ef7OSmkigcwZz1rjxRq+s95aPZ7DTRgY6UMK7Fqu
	K8sxd/axpiGs0UoM61rG6ObEBTG4IVi0yWzhuZm5ry6NTjKsyYjSLgfj3Q1L3yhYMQfq
	TBj2t9gMPou60sQtmS+sRXQ4qgt9OKesACrfc8XxPUTEAt+uYLvKh2HPSeljMYjmBbs2
	xykfLg1GW6lsbCfy7U8GU+5LjsOkwI3VWzoBHGVdiXDf46PL+t1qW9V7f6oSqHk9WFBm
	ILQg==
X-Gm-Message-State: ABuFfojfzC8Ts6fqp5YkGNDfK7eWgPkUjPp3oe8w45Q1e2L+hYvgmg5o
	4gmVqO6z7cZdcCA/SdkCOJMDB8BfyqtaZoIh/yCu28J1
X-Google-Smtp-Source: ACcGV61REcMnT86etMHJSbFNPH1Bs+Dgl2DcMkSt1+wIEd/X+gh++tfNFXZfdj8ItkY4eZkCYeGsAzgKVV9g33mSlyQ=
X-Received: by 2002:a9d:3d44:: with SMTP id a62mr16726089otc.133.1539858295257;
	Thu, 18 Oct 2018 03:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20181017164326.67111-1-mark.hatle@windriver.com>
	<20181017164326.67111-4-mark.hatle@windriver.com>
In-Reply-To: <20181017164326.67111-4-mark.hatle@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Oct 2018 11:24:44 +0100
Message-ID: <CAJTo0LY3gqvFDMzg48s0q4kZZ=WPpdj8u+jb-7gXFGmA-MBbPw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] weston: Remove machine specific append
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
X-List-Received-Date: Thu, 18 Oct 2018 10:24:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Oct 2018 at 17:44, Mark Hatle <mark.hatle@windriver.com> wrote:
> -EXTRA_OECONF_append_qemux86 = "\
> +EXTRA_OECONF_append_x86 = "\
>                 WESTON_NATIVE_BACKEND=fbdev-backend.so \
>                 "

This forces all x86 Westons that are not running inside X11 to use
fbdev instead of drm.

Two questions:
1) does qemu still need fbdev or does virtio/drm work now?  (iirc, we
still have a crippled qemu here)
2) Can this be overridden in a config file instead

Ross

