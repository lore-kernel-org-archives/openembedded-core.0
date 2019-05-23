Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 703957E0A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 12:24:31 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id h20so9286727itk.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 05:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OwYuUT6GOzpfmEI2S0xra2cqDfxJOtrV8FLfHKv6DUI=;
	b=f+6YZie9VytvO/oFw3aZ1rzTt+LrBDMZRNhKWAJMfDoE4F65cGwdfR0qQVgpIYaEUP
	JzIdczGsh3ix8s7LJY+uiDm4/V0NqQDS4XbQXCzZti53eJo40sjyW3RhxbUvhuADEIfR
	go0F18M//yAs1EybGKyRdpqs79ryvD3WiihSZ4R43AimLaeOm40aEteMYsMYeCa4LTVA
	JOv3HxXRQ+16op31YXF+82YitLDgWplSj3EFCLdxmyf5GHDcoWxnLNhe8qFAuemTI8XU
	emHX2E1VUaSJ6nVaHmzfzTOc21780uhhqIKrakhaeE6M7cakjzVZte6kiZ41NPT8F6rP
	odQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OwYuUT6GOzpfmEI2S0xra2cqDfxJOtrV8FLfHKv6DUI=;
	b=hozDxyrsJflt/VUmqOyD7+htSI0qAKYg0Mo4K64A3SZ3w1VS6uPQqQHZHir+/22RLF
	iyGUT2DML9XDuIq2+9qAkxeeLBO5Glw0k4F+RJjdhGSg/BkyH7xjRX54CBrxMTZx8WDH
	XT4GuD1FJqXYaTF143iJIdpAdeBHJMU/pXJj/w2s0NR/t1ENNTDBfK7gvynJipRi6pyO
	VsvWT5CrDUNMhXBy63ZRzp4kLej2+mBhNMGeNF1HBZKZFQjajcZKqveJHC18R+IvUrli
	YvYsrGrwk9qRLaO/V/s+iRbrQR5PAEgmKIVvfrKzBtXx1nGt9LpUsv+Qh5A7OV3+kfyE
	HDbg==
X-Gm-Message-State: APjAAAW+fU/mq6mVYNyLvEL+nf+6DZYhkeTnTiOILaVClf8KXB0+v7xa
	9gqeXU9A0ee63OgFGTGGxOLAr0b3LpO4AuA8h/ZBre75O40=
X-Google-Smtp-Source: APXvYqyXuodEBuDjF4N6v9ygy+clTNTFYCvT6giqzvXtA6F1JyIT5lV6LWHk/zTLg4dey8VRXRAqdHnaciCOazyAPo0=
X-Received: by 2002:a24:c204:: with SMTP id i4mr12871608itg.83.1558614272696; 
	Thu, 23 May 2019 05:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190523062953.10582-1-jiping.ma2@windriver.com>
	<20190523062953.10582-2-jiping.ma2@windriver.com>
In-Reply-To: <20190523062953.10582-2-jiping.ma2@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 May 2019 13:24:21 +0100
Message-ID: <CAJTo0LZ2m5gTvac6VTOXDAzPsEvGAkAhzmKiP7C+h+VMeFWhRg@mail.gmail.com>
To: Jiping Ma <jiping.ma2@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu: IRQ Stats not shown with virsh command
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
X-List-Received-Date: Thu, 23 May 2019 12:24:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 23 May 2019 at 07:48, Jiping Ma <jiping.ma2@windriver.com> wrote:
> Issue: LIN10-5872
>
> Add IRQ statistic code in kvm/i8259.c.
>
> (LOCAL REV: NOT UPSTREAM) -- oe-core already included it.

Can you remove all these Wind River-specific lines and replace them
with a better commit message?

Ross

