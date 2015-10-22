Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7978060124
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 18:10:08 +0000 (UTC)
Received: by igdg1 with SMTP id g1so113582igd.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 11:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=v66wduK6KrbHn4iU18putEP27C00Yd8AKqfsK1m70es=;
	b=fviVZ/ESswnyLlSUFr0AQbhzETwxQZ+utNX4kqzRXPH9gnQHrbd/YNRfbTPOW/FS2E
	Godr9FucqakXwrv0UpucQRRFRwMGkLs0QLO4Mra3Vb+Z6EMs+/HnVLw45WvvUyDldDYZ
	1qWnZ+hO71Fisj8xbNSlmysV5dqdOmbBaQd2XtgEkifx5h/LJkyuf3Vizo02TIWlzA+d
	B/2Yu+wvVsyGvhkY7c+qvkWb/CpPZkj4dXILzek1OKp2t6TSeCRdE4Qu+4I5aIw5vlRn
	kM/tylfkWd/tmo2D/Pt2jqpbbDVEPeQwienN+cTMxlHuSl6vv16E6lewkqHzHJZT1RHy
	eygA==
X-Gm-Message-State: ALoCoQmUP1c72ljPAfdZbNXaGRewnT8MXYSIBNaQF+tivgEfCkm8S6Lef52UYuGVygIhHBAs3oyH
X-Received: by 10.50.43.129 with SMTP id w1mr15301266igl.96.1445537408488;
	Thu, 22 Oct 2015 11:10:08 -0700 (PDT)
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com.
	[209.85.213.176]) by smtp.gmail.com with ESMTPSA id
	i134sm6496334ioi.11.2015.10.22.11.10.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Oct 2015 11:10:07 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igbhv6 with SMTP id hv6so193879igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 11:10:07 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.43.225 with SMTP id z1mr36717092igl.19.1445537407252;
	Thu, 22 Oct 2015 11:10:07 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 22 Oct 2015 11:10:07 -0700 (PDT)
In-Reply-To: <365E1805BC95084CBE82381A0B86999401095FB12A@EU-MBX-01.mgc.mentorg.com>
References: <365E1805BC95084CBE82381A0B86999401095F9A9A@EU-MBX-01.mgc.mentorg.com>
	<365E1805BC95084CBE82381A0B86999401095FA549@EU-MBX-01.mgc.mentorg.com>
	<365E1805BC95084CBE82381A0B86999401095FB12A@EU-MBX-01.mgc.mentorg.com>
Date: Thu, 22 Oct 2015 16:10:07 -0200
Message-ID: <CAP9ODKph1Zssvm=Mjyz1kTDG4J6dFP-8ntW2hgX+RM9r1OAhWA@mail.gmail.com>
To: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Krishnakar,
	Srikanth" <Srikanth_Krishnakar@mentor.com>, "Larson,
	Chris" <Chris_Larson@mentor.com>
Subject: Re: U-boot file is being removed when image-recipe is rebuild which uses wic.bz2
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
X-List-Received-Date: Thu, 22 Oct 2015 18:10:08 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 21, 2015 at 11:38 AM, Ahsan, Noor <Noor_Ahsan@mentor.com> wrote:
> Your help will be much appreciated. I am trying to locate the issue but no
> luck yet.

We reproduced this at O.S. Systems autobuilder today[1]. It seems very
close to what you see.

1. http://ci.ossystems.com.br/job/fsl-community-bsp-master-next_x11-imx6qsabresd/869/console

Can you take a look and confirm it is the same issue?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

