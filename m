Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id D52487C700
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 11:25:57 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id y185so6431372wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 03:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ZFYW1D1rGfMlm51wlKBHZXsVb5aWslPokPivWo87O2g=;
	b=NlbgDfGHLGBRvD9jmquQJYeE1IQRl/MsiZPf+l30PX8f2d5g04aTnmOdblodZH5mAs
	JGaZqp3+A9m7MJDaKLvs15sWcaZdT/jIea6RlwvpbbszxYzc4rrtJhbDBBTo1DvXO6R+
	rjIAgEd3yT3n7HTjjcRh7mFHxGB5FKL8VpWJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ZFYW1D1rGfMlm51wlKBHZXsVb5aWslPokPivWo87O2g=;
	b=nKqrH65em2RhaM3rwf6JtZvogbtb0MPWBhHUdC/3UfmHRckQkiUYctY40yC8saOJTU
	dQtbkge0ERN1ud+VoJjlg0GX+Vp6ap+RUfWQE6CzYwrVxLopeDryIngbhKTieaAm/cjl
	SGtc22i4kItaFc1SkbNllDTwYCDkxN4Ezd7X1DIl8eZsRpnTRBRFxbnZYY6Dto8Vy6a8
	NQcK83tLsr/sM7Uv+CP1OaeaQtatX6KLAqxvfekBjW5rydX8Q4cFkCdaholsn3mhwVir
	mxeizbwnh1QpysuJP257CKF5Gu8/c2XvVfWC8SRJGHn/JvJ0TbtIGoQQtI/bI/7R7X51
	4LfA==
X-Gm-Message-State: AHQUAuaXwW/4tMMgY/t8BSbSMPpO/CWelWWIxkzCJahIKlcRLmscaDON
	T1K+yLh+ybLo5b5/Q+YbVDb/wCfaYVk=
X-Google-Smtp-Source: AHgI3IZJmVWpyz+g1VzVkaJmuzf+2/A7iXxtnNLo5GFaY30L5B3NVzs8+BgzJC0xdPXnJ0Zhtl1pvQ==
X-Received: by 2002:a1c:14:: with SMTP id 20mr5914160wma.91.1550229958166;
	Fri, 15 Feb 2019 03:25:58 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d15sm9337747wrw.36.2019.02.15.03.25.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 15 Feb 2019 03:25:57 -0800 (PST)
Message-ID: <5753a5096418e3f0800b7120ac4a6c5a75bac119.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 15 Feb 2019 11:25:54 +0000
In-Reply-To: <20190215082252.2726-1-andrej.valek@siemens.com>
References: <20190215082252.2726-1-andrej.valek@siemens.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH] busybox: 1.29.3 -> 1.30.1
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
X-List-Received-Date: Fri, 15 Feb 2019 11:25:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-02-15 at 09:22 +0100, Andrej Valek wrote:
> - update to last stable version 1.30.1
> - remove and refresh already merged patches
> 
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  ...inittab_1.29.3.bb => busybox-inittab_1.30.1.bb} |  0
>  ...te-check-CONFIG_DESKTOP-before-using-od-t.patch | 83 ------------
> ----------
>  ...-testsuite-check-uudecode-before-using-it.patch |  6 +-
>  .../{busybox_1.29.3.bb => busybox_1.30.1.bb}       |  5 +-
>  4 files changed, 5 insertions(+), 89 deletions(-)
>  rename meta/recipes-core/busybox/{busybox-inittab_1.29.3.bb =>
> busybox-inittab_1.30.1.bb} (100%)
>  delete mode 100644 meta/recipes-core/busybox/busybox/0001-testsuite-
> check-CONFIG_DESKTOP-before-using-od-t.patch
>  rename meta/recipes-core/busybox/{busybox_1.29.3.bb =>
> busybox_1.30.1.bb} (89%)

There seems to be something not quite right with this:

https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/284
https://autobuilder.yoctoproject.org/typhoon/#/builders/50/builds/283

Cheers,

Richard


