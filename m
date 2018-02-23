Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f43.google.com (mail-oi0-f43.google.com
	[209.85.218.43])
	by mail.openembedded.org (Postfix) with ESMTP id A0E5978093
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 00:51:00 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id f186so5129897oig.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 16:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=CqlF2yGNpwqEkj1M1w85dBgYKOlFtjMCCs5BTIQmpYA=;
	b=OL/7R1n3f7dBe9274P2eZXeKljrF3HmyVksCFCAOOoGU6MXgZ/BYKrevu1FeF4NGv5
	Eenj/jF6FnlR1Mc0MXvubXmJ+KJ38h4xFCPWmPbuFEm3Y3Ni20JFqqepeL14H0JI2TuE
	Ft+w30P0JV5m8lcmzZridXU1xKxBoimuumJI3ZDFW8l8qgjaH14QDakdZIeIYv2T1vzI
	HMwjigz/qlHjlKu+Yhy+q6oB/6Z+cRRpMgr7fRJXC6X/UwBHhW/DEMarkIdt3wtwjOFn
	m2ztBHjX33Y3Ga5mImiHtzCFLgfHHPpdv5C4My7kjyMyA7wUsB24HrkC2Uap00rSuKlC
	GEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=CqlF2yGNpwqEkj1M1w85dBgYKOlFtjMCCs5BTIQmpYA=;
	b=rUQ8rVCP+R7Dx5qmNUjhwwCPPHNdydTqfhhQ3bQJ92uHVSlz0pVkrBeX9cFPYVBJeB
	jqrfc8V7nlj+iT0U2tqjSY1855A9B8dA++359gCk6SCW019H3MCsrCO1vK8DNclrz+R6
	UucmA4l63mEHqTuWutc/zfb5uDrxUatht+G7QI3/43E64hMd0byBG0KDdEJ2IsYLIkTz
	ZLxO6SPsh9GL/DySO+flq/o4z5VXFlVGLJMKnrelPB/lRXcYyAJVuSGYfGmj1uHQlhYu
	5QynvJTI72pPAXXYuFTUYXB2vpOuRLoKWnOJe/EVthHoETrXjCXqAlw1tUPGuoCvox8C
	ykPA==
X-Gm-Message-State: APf1xPA2dxajhbMTocyrahLeCmAsKuMfDgBwZICPdRHRDOqDhvY2wAO4
	pWeqKVAec59C7HQpwvPS/xsvikyX
X-Google-Smtp-Source: AH8x224v1x7zsbx4FtlIHzhTpQpli+mQ0BSDlx3K0tZXwlYuXZEVILPrviSHpobWEXepSEcKe4YwJA==
X-Received: by 10.202.76.83 with SMTP id z80mr5624866oia.338.1519347061039;
	Thu, 22 Feb 2018 16:51:01 -0800 (PST)
Received: from mail-ot0-f170.google.com (mail-ot0-f170.google.com.
	[74.125.82.170]) by smtp.gmail.com with ESMTPSA id
	n189sm615592oif.28.2018.02.22.16.50.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Feb 2018 16:50:59 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f170.google.com with SMTP id p8so6376782otf.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 16:50:59 -0800 (PST)
X-Received: by 10.157.49.84 with SMTP id v20mr6945430otd.103.1519347058852;
	Thu, 22 Feb 2018 16:50:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.80.129 with HTTP; Thu, 22 Feb 2018 16:50:58 -0800 (PST)
In-Reply-To: <20180222141537.229103-1-hongzhi.song@windriver.com>
References: <20180222141537.229103-1-hongzhi.song@windriver.com>
Date: Thu, 22 Feb 2018 21:50:58 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrAmVyqUa8Kw5JcLCZNP3wMQTKMxhFuPO36crWy=330dQ@mail.gmail.com>
Message-ID: <CAP9ODKrAmVyqUa8Kw5JcLCZNP3wMQTKMxhFuPO36crWy=330dQ@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] systemd: re-enable mount propagation for udevd
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
X-List-Received-Date: Fri, 23 Feb 2018 00:51:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 22, 2018 at 11:15 AM, Hongzhi.Song
<hongzhi.song@windriver.com> wrote:
> MountFlags's default value is shared in systemd-udevd.service. But upstream
> sets MountFlags with slave just for keeping mounts done by udev private to
> udevd, which causes block device mounted by udev unvisable but being busy for
> host. So we revert it to shared to be propagated to host.
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>

This is what the mountflag does. This does not explain WHY you need this change.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

