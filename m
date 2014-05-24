Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f176.google.com (unknown [209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 898E165FC8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 May 2014 02:32:44 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id hl10so1362770igb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 19:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=U0rONTB+pWeNY/PwNi5QiRJv/QbAP235kKBJgI8aTaE=;
	b=yqho0mt0Jd+I2nGaXOy8t0qTvNskfXHvupgqO2irJR+RntkPCDlhHBCll4M09a9SGx
	zOdxkaAY2T9hcly6zXuKjLnKu7+62SaUXL0FuqLFWJ9v9H3mAUJ70GgdhYadsVqTvSH7
	NoHnlze7LJ2YuKKe4GVupM2MnvpRHS9LnVlPUwXnc0oi0sP0DsXjYu5d2XYMHNA5AcKF
	/l+5Dp2/qocMY3UVX8HeO+BBMl9uLzRYeNcNg0OPHAs1fTbL4XKOYjwprpCW8hXIWNoO
	sx5L17sJAdeUm4g98S6aUlXm42ohxUlIfUahVbL1U3iOdaz5LANHgv4DBbcZhT1zwlxC
	EsCA==
X-Received: by 10.50.78.201 with SMTP id d9mr8891910igx.17.1400898765970; Fri,
	23 May 2014 19:32:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.33 with HTTP; Fri, 23 May 2014 19:32:15 -0700 (PDT)
In-Reply-To: <1400878671-14795-1-git-send-email-sgw@linux.intel.com>
References: <1400878671-14795-1-git-send-email-sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 May 2014 19:32:15 -0700
Message-ID: <CAMKF1srO=Yt8_+0nc-P5ZTbOhTRWnTx-RO2BT6vsB=iEAL_+bg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] poky-tiny: set poky and poky-tiny in distro overrides
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
X-List-Received-Date: Sat, 24 May 2014 02:32:49 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 23, 2014 at 1:57 PM, Saul Wold <sgw@linux.intel.com> wrote:
> Since meta-yocto uses a generic poky override for FILESEXTRAPATH in busybox,
> we really should be setting the DISTROOVERRIDES to both poky and poky-tiny.

I would rather think override in busybox is not needed. since
defconfig is inside ${BPN}/poky-tiny
if you did not have _prepend qualifier in FILESEXTRAPATHS_prepend_poky
:= "${THISDIR}/${P}:"
it would work as expected.

