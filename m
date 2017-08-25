Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4C4777840E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 17:25:57 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id r9so3869877oie.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 10:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=YksW3a3TWu/3SvXsV9bVFSz61ncU2fWux+fzewL+3zc=;
	b=qJHnnbP9g1UvmNSJlmztI4anw8yKwCkQ0zxQj59WGIClBRwGeJyqY5Khifx01RH4kW
	gkHj/mKrATH0LzQ+p6JQmRsK0/PKgsn0JjVFrfdDIyDUA20fnRCw+/e4fX0TtOIiM3kp
	sjJwKeLY/92xsGZKDAy1D2B0yS82iLJ9eOD8fAsynj5zkVI8yZUtS7HbwXVUhK2RmU8r
	baTJ7iwgVzZzeXjQyOifIBhZDHp4rOwrkAJH4uoZyePHixBL9197gCg4cI9rpKiJTexI
	sav2aHCvml53t7haxvw3iJZSlFGD7bxveebon/dUQ2luRZdKKy/jOT303kwN115SD2bG
	r8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=YksW3a3TWu/3SvXsV9bVFSz61ncU2fWux+fzewL+3zc=;
	b=PnDHlC/+zw3/wy/+Q9apMbj36coFyReFQQxvCbgLcEkH1SjfvqjeE50usH4h69hgBx
	9VfTZWZxmlxIZaW/tBMSE3SGk/ssHzVPqnlm6w+9Z166DEs1/d1kLmTgDz0Mmxsdczq1
	e1rGGwR0aHCmbXKN9sNo9P8v8AXDMYlhG4RTrOQIXr7xYi2zO/jyWa3z+iME/gP6bSFS
	fJlChtpTzTlllWnl6B65s/UBGo420o09gvwKjtm5LHFm2D8pElRZHLseDeOhVZr9+8az
	T17Eu9YQZfFw/lrhtt7JQbXtIY9CZhSLmxIYIVq3Bdribj+DM49rK7SzZWLze2lCqj/z
	1Fhg==
X-Gm-Message-State: AHYfb5jAFbWcUynEzTddas4qA3qtjA9UseA1pnsgLjbW8IMZUBuSuOhP
	HWSSJlB00nevXI5h4GE=
X-Received: by 10.202.235.215 with SMTP id j206mr13171696oih.108.1503681958992;
	Fri, 25 Aug 2017 10:25:58 -0700 (PDT)
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com.
	[209.85.218.54]) by smtp.gmail.com with ESMTPSA id
	p188sm8583092oic.6.2017.08.25.10.25.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Aug 2017 10:25:58 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f54.google.com with SMTP id r203so413731oih.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 10:25:57 -0700 (PDT)
X-Received: by 10.202.225.5 with SMTP id y5mr13173719oig.32.1503681957417;
	Fri, 25 Aug 2017 10:25:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.1.183 with HTTP; Fri, 25 Aug 2017 10:25:56 -0700 (PDT)
In-Reply-To: <89c308096684417ff1da262afcfefb10cac67ef8.1503667857.git.ed.bartosh@linux.intel.com>
References: <cover.1503667857.git.ed.bartosh@linux.intel.com>
	<89c308096684417ff1da262afcfefb10cac67ef8.1503667857.git.ed.bartosh@linux.intel.com>
Date: Fri, 25 Aug 2017 14:25:56 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoULoJLZMMZB890W9gmFa-S6do+X5p=8+jp-Xzop0cEAw@mail.gmail.com>
Message-ID: <CAP9ODKoULoJLZMMZB890W9gmFa-S6do+X5p=8+jp-Xzop0cEAw@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/10] wic: setlftest: test expanding MBR image
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
X-List-Received-Date: Fri, 25 Aug 2017 17:25:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 25, 2017 at 10:41 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> Added test_expand_mbr_image test case to the wic oe-selftest suite.
> The test expands directrisk wic image to 1Gb target, checks if it's

directdisk

> expanded correctly and boots it in qemu to make sure the image
> is bootable, i.e. bootloader, kernel, boot and root partitions
> are still functional.




-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

