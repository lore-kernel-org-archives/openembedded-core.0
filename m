Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id F32A56BA0E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 09:16:26 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id f4so1529015ion.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 01:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=jADAWop+LIVIsmGBs90kdqAAvE63IrrlWh1OHvtLUL0=;
	b=nxzT4LwLmcY63GwnmOVb9UUCkzUIJg+yp98HPcKuV69vYS4rAkJMltvI0WoC3zazjo
	ZudFXzC9ULuzr1ByKLZP+EjG0hkcSi1GiljcMzk3mxX/3m+aZ8oY2jJsL9SofsHpHwQ2
	E+WAWBhxkqW+LkMt9deYYE+2LZqLCC30M5RWlPa2maLeuGZ9LOHH28S3I96drlrhWAqK
	QP00Zs4QIxrMc5R+vUF5cFkZQ/3LtHw1zZjCwfkLcMW6Rj2LcUhb9YHP2kVtpLbSUVEI
	RvbXt8zukixJALh7Ym5VZbvXeXBXTDAB9ZHkH9ktHKvVt8gxQSi3GRammN41mSMkLVas
	aM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jADAWop+LIVIsmGBs90kdqAAvE63IrrlWh1OHvtLUL0=;
	b=Qk6UlVIox24xOJErzT381feaHCQzfmEHwNejWnIJluDMiyRI5K/kFNFThTOX/dcanf
	YjnaczjQ51c5X4I+ljZVOYm5VwMwA+WtRJ/vP+4ohZ28gJJ4Wox2sDnVqrZO0PDSR6WC
	izVw41L5KfpNXHRQKP3wfSoU4hDI0bqUEwDpYUai8FuDCz+z4wgTfLYlgMzZZLPve7TM
	2inPT/oh3G8qolrWqvV746RONZVrWzLZRS9982eZbomKhuC7zLX1+LHzEm6m9fQhr7xq
	QdQ8mDvVvehpNOkkWIjhVwqLeTzzIa8hY3p2OrJmCepWjEQThlU/tOIqkzkkDeBZrcFx
	1LZg==
X-Gm-Message-State: AJcUukcPFjyY4Hnope1hetLj/bQdQdzM4KM5LNQW9+eAgYL2dRJrn39O
	U6pY9olStZEX3xTPvRIyz3LuFeDIAqKwaKcn85E2Xw==
X-Google-Smtp-Source: ALg8bN6NtHsDL0E0twgtifTzsK8xjtX3EyVvI14i1wQ+Wyet07myQEm4hkXE8uzw1bun4X7ZJSBH21zob7TktthxjVs=
X-Received: by 2002:a5e:820d:: with SMTP id l13mr1348371iom.201.1547543788020; 
	Tue, 15 Jan 2019 01:16:28 -0800 (PST)
MIME-Version: 1.0
References: <1547530093-50658-1-git-send-email-changqing.li@windriver.com>
	<1547530093-50658-2-git-send-email-changqing.li@windriver.com>
	<CAJTo0LZhSh1sWXRkXbQ1VEUbwFv4ihe1J2qgeUO_dDgu_fznhg@mail.gmail.com>
In-Reply-To: <CAJTo0LZhSh1sWXRkXbQ1VEUbwFv4ihe1J2qgeUO_dDgu_fznhg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 Jan 2019 09:16:17 +0000
Message-ID: <CAJTo0LbgT6CDdw9V=Q_gvm78RCbRJ2oCC24GmsADibxnB5Wzjw@mail.gmail.com>
To: changqing.li@windriver.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] waffle: supprt build waffle without x11
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
X-List-Received-Date: Tue, 15 Jan 2019 09:16:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Jan 2019 at 09:15, Burton, Ross <ross.burton@intel.com> wrote:
> Should this be:
>
> PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> 'glx', '', d)} gbm"
>
> ie always gbm, and glx if X11 is available?

Actually whist we're here, respect the wayland DISTRO_FEATURE too?
And enable egl out of the box?  Turn on as much as possible,
basically.

Ross

