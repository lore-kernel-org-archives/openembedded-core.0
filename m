Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 391DD7886F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 18:10:32 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id c18so13085262oiy.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 11:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=4rxuTjdW3IPYOUB6dM++FXB4WonmIQwcgDwAG5OxRbw=;
	b=HLCsdJ673I8EMDNYK9vodSjs1CTogrmoIz8/NgoQ9iAecbNBr1VK0+PCLfa48VJw3d
	dMqi9dkRxTpFSLVfvjSp7U2lxB0GZXlgmQuKSToDaglPWqgcipVbo9J7DiHj2NcnPNUG
	p1HMmW+QZYfDUauxOYjAjS5sMkyAhmW3CTHb5zbaUHKys/qBr9cnzhX2igsiIx2M5w6h
	Pi7Sz2RqnKdbeJcq1PGIRlll0OTroWgD68HLnJTsd5oD9RCrWnCL1+FFv6Ci5MXlRbuH
	a1GTOEQPudP0MHpuPqjnHy7LIwVckcxYQzMKSQVF3WJtKwtGtWgUKzC5Uvub2vr0D+aV
	+KFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=4rxuTjdW3IPYOUB6dM++FXB4WonmIQwcgDwAG5OxRbw=;
	b=SkgXKFSnYru8hk1BtUxdTXua+fmqj2lKzCy6qptPffLmEKowgriDD9wZo+aq7bbMG1
	UpVFLcbngY+7yKgjFGD6rEYcqNeB/czvjYp3FKruXS6a4VdQW9BgTm59bu08TTAeiM6Q
	gFJRCJBDLun0Y8NHtgg2HAAC5HXX/95pejtZ2/VOeS1qZtV+U2evpAM12p5lCZU09TpQ
	SdfEKX56i5GX9RDYbdFubgslhkyUCjP/s/c47PzLLS/LINkklW7iBYBnRK1C9yTnqHA7
	eqwDeTS/4FuX7B91jmdzNAtELu8z2Nsi9PMIkH7xFaH20ozITrOXGYM8Uscv0inCXcIx
	RJRg==
X-Gm-Message-State: AElRT7FNkUFjk0NFai9/R5RVMR7OwPaRf4dXBArDNtGoI/cdTLa1prd7
	GZ0lSFuOa/jAusaJ8x7GpZyOxcVB
X-Google-Smtp-Source: AG47ELtALke8O6faj5tlHWr5jalgzFFPIvP4cq5By4mf/3xz3nNAPJf4wY/k+Xvw5znEJWVHr99jLg==
X-Received: by 10.202.28.14 with SMTP id c14mr5740352oic.60.1520878233712;
	Mon, 12 Mar 2018 11:10:33 -0700 (PDT)
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com.
	[209.85.218.54]) by smtp.gmail.com with ESMTPSA id
	g50sm4143869otd.22.2018.03.12.11.10.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Mar 2018 11:10:32 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f54.google.com with SMTP id a207so13083591oii.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2018 11:10:32 -0700 (PDT)
X-Received: by 10.202.188.70 with SMTP id m67mr2068049oif.80.1520878231953;
	Mon, 12 Mar 2018 11:10:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5081:0:0:0:0:0 with HTTP; Mon, 12 Mar 2018 11:10:31
	-0700 (PDT)
In-Reply-To: <20180312112901.9844-1-matt@madison.systems>
References: <20180312112901.9844-1-matt@madison.systems>
Date: Mon, 12 Mar 2018 15:10:31 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq+RNGHsRFUZjk0BJuBvxkuA51hon7sStkNZ1DXOK-rwQ@mail.gmail.com>
Message-ID: <CAP9ODKq+RNGHsRFUZjk0BJuBvxkuA51hon7sStkNZ1DXOK-rwQ@mail.gmail.com>
To: Matt Madison <matt@madison.systems>, akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][PATCH 0/1] backport go 1.9.4 update to rocko
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
X-List-Received-Date: Mon, 12 Mar 2018 18:10:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 12, 2018 at 8:29 AM, Matt Madison <matt@madison.systems> wrote:
> One of the changes included in this point release update
> fixes an issue with the construction of Go's shared runtim
> library, so it would be great to backport this to rocko
> to fix [YOCTO 12592].

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

