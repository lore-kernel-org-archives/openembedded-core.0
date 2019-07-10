Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by mail.openembedded.org (Postfix) with ESMTP id DA3CF7ED8E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2019 01:39:40 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id 16so341184ljv.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2019 18:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=SwZ2/Qd7y/Bfidc23/i8zDJfi09xyKvK6R0+Q7+hIfg=;
	b=hC80JZZtFfBxihKZhUwpC2NDda4N7HKT1FCfccpn2I+mKEb0LJI0InnlWSRYBMRV9+
	oy/UV7Q2tfJpU2a7ONNMhei/zy1nn0DffQtj8+eXEfRzG6bjO/rR3LGduO8M7morw0CH
	Z30vnOmrn1vj+maakxf0wv5HLV8ll1IQkn2uJH8/fwmyW8ICHE6qNJ9ritGfQoNQ8ZN9
	eh5K006CPwBNs7m4xkSh5UbFaUpaoQMj/7AQrI621fRk/hLSWxmo1jfBTZHBWxeVjzU/
	eX7JubsYv2BchGzoC7leCo42t49vt/HgQSpu0foYU1wr43wd6hK3TdzcwomvQNu9htJs
	g8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=SwZ2/Qd7y/Bfidc23/i8zDJfi09xyKvK6R0+Q7+hIfg=;
	b=AcOwLfMyn5FszSohVVOZMfhgG2tqNcaWjLjT2erMs4Ac0+KHzWkigTjtAiJiLLje4P
	ZcKa/aAhe5WLACIs2T+bjDDX28RZOzh/dT2bFCeTioLaw4Je1VgOTj7teUFNuU52YI84
	n8BWGj0imuLsLYzUAq1bbJWjTnJro/cDhI3YG/eFfJ7ceoaVG2Kh4pPQ/wR5PyWgVCtO
	7QnIw9H2ZrAk4K9D93fC31hfv/MQ9zqTHMR4dRfqhjZQCvBrc+WU4ZD81tFLGTA78o8i
	yrjj9e206ir4ntGllzbmeKQgFPJYXRWS2gpsRjqHRTbdRy6Og/blIU0EMlxWv6rDMFCU
	Pn5g==
X-Gm-Message-State: APjAAAXyzcvKdIbRP8aBY51KLMppZwxjIa39DmbWFB0y/IEPkprd5d3n
	dhZZl80J+maZ+kTfVdLK9U6H5vWvRNicl+r7fn8X0O95
X-Google-Smtp-Source: APXvYqziCfILGSr7pQLQAjfv8InnAKvyQXPkKCRedLw2i9lIiOeWOeoUFwKLiLBWkt9MucPxUwRh9EcAqTPfrEnjPUw=
X-Received: by 2002:a2e:a171:: with SMTP id u17mr15787237ljl.209.1562722781204;
	Tue, 09 Jul 2019 18:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <CADySD0HgOebmE=uUJ718CBhsXv3bW7WoeXa4dp06LL=vcLd_qg@mail.gmail.com>
	<CAJTo0Lbm1DVcwKFjYBaXWsgzTGLbRRH2aFEzgTi0MAGQXQ4T_w@mail.gmail.com>
	<CADySD0E7mwou1DeeTWfjdXh3QjqM9oMDvLsVbkXMrFZCfcgdug@mail.gmail.com>
	<CY4PR12MB165398EE661D4CA2995CD0558BF60@CY4PR12MB1653.namprd12.prod.outlook.com>
	<CADySD0HHhJHacwP0HXR52dpw1SEjg60y9-RRvuNgDHJFTw46Aw@mail.gmail.com>
	<CADySD0Hz1mmT29kZF6=0=kw3Af+8+OAaKMxUvfXXPpcM+2LASw@mail.gmail.com>
	<CY4PR12MB1653A8BABBBED9BEDD00DAC38BF10@CY4PR12MB1653.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR12MB1653A8BABBBED9BEDD00DAC38BF10@CY4PR12MB1653.namprd12.prod.outlook.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 10 Jul 2019 13:39:55 +1200
Message-ID: <CADySD0EHCuxKuauvLxW7OE0_O1Fz--qBH+c0uqCfkjEo3EDeXw@mail.gmail.com>
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Problems with sstate-cache in Artifactory
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
X-List-Received-Date: Wed, 10 Jul 2019 01:39:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2019 at 2:28 AM chris.laplante@agilent.com
<chris.laplante@agilent.com> wrote:
>
> > DEBUG: For url file://5c/sstate:u-boot-ti-staging:wsl-linux-
> > gnueabi:2019.01+gitAUTOINC+06e0b5babe:r17:wsl:3:5cdf9380b9b3f8c94a70634=
4cf19554a_packagedata.tgz
> > returning https://artifactory.local.gallagher.io/artifactory/rnd-yocto-=
packages/sstate-cache/wsl-thud/5c/sstate%3Au-boot-ti-
> > staging%3Awsl-linux-
> > gnueabi%3A2019.01%2BgitAUTOINC%2B06e0b5babe%3Ar17%3Awsl%3A3%3A5cdf9380b=
9b3f8c94a706344cf19554a_packagedata.tgz;
> > downloadfilename=3D5c/sstate:u-boot-ti-staging:wsl-linux-
> > gnueabi:2019.01+gitAUTOINC+06e0b5babe:r17:wsl:3:5cdf9380b9b3f8c94a70634=
4cf19554a_packagedata.tgz
> > DEBUG: checkstatus: trying again
> > DEBUG: checkstatus: trying again
> > DEBUG: checkstatus: trying again
> > DEBUG: checkstatus: trying again
> > DEBUG: checkstatus() urlopen failed: HTTP Error 404: Not Found
>
> Is this mapping correct? Does using curl to download https://artifactory.=
local.gallagher.io/artifactory/rnd-yocto-packages/sstate-cache/wsl-thud/5c/=
sstate%3Au-boot-ti-staging%3Awsl-linux-gnueabi%3A2019.01%2BgitAUTOINC%2B06e=
0b5babe%3Ar17%3Awsl%3A3%3A5cdf9380b9b3f8c94a706344cf19554a_packagedata.tgz;=
downloadfilename=3D5c/sstate:u-boot-ti-staging:wsl-linux-gnueabi:2019.01+gi=
tAUTOINC+06e0b5babe:r17:wsl:3:5cdf9380b9b3f8c94a706344cf19554a_packagedata.=
tgz work?
>

Yes, curl/wget can download it. What wrong do you suspect here?

Thanks
Ankur

> Chris

