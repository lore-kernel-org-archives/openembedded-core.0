Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id B64FD7014A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 09:46:09 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id ur14so72957336pab.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 01:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=saWOb80foz5oiMGEkVixWWZ+k37yGwm7aJj4u64Eq0w=;
	b=rBvJxHWdHNSCza01EuGchZXXbdBqJghdGKk+9EqxumVE9XarpvQr31cYx8DAa02blm
	KYGV55uRitnkhcZKTEEGEQ7zZ1Yw0oF/6vAWHezQ044Ypcc8z0FC1pplwTC2tb8fKcV6
	DpHh0LW37UBoXZSxDuc09uAPyw3jWHht3NO5ljiPuUVjqDyf8iXtvT8SURjPju0TO3f6
	DH1RnJ1z3mUTSaqSGYoTGM23E9KI9aeH5Eg1Tgr71BOh88kocuZpZNTkddRXvD4wxNrR
	+g7wUb2u/LKogSpj/TcsuKmcu01k3d2PuijfmPNOhWk43hMDz0hGqS5022K2cuiQJsRx
	HK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=saWOb80foz5oiMGEkVixWWZ+k37yGwm7aJj4u64Eq0w=;
	b=TpIDgtaGisPEKuaCAQ1fb+gixiEFlnWzk1HANorDCJrh/974sezYv3nbGLRSzRjF8+
	ytDYFab3Y72PJqoAD/ngCvaaF4Sa39XOZEb8NxqxBoYbAq7JfP8rAvAifipn+a7ag2k2
	m28uK9H+Rbf6mGVrio1qVGYwdY+exHseHyGd0qcC/HsIhzw7cGC5BCd1FzSUkVk+43j1
	om7ZHcsHByeIoK+AWMnj4s+vsTpFlxICVXzehp/aTfGvFTH4h/0iClOEWChrDSq3RhRu
	mELp/di7itiqG3OpKJ6bLvN5nlw/FBloVWLzJQ5yTCnDGlVnfjzhFxppMDL9P5d3WEUR
	Razg==
X-Gm-Message-State: ALoCoQl62dnwy6XW0MtQ7A09yK4+8+6YwvhSF7sdA/V22BnFadv1VmRnshwe0hip5khyK2cgac1FRQfHsI/B0wD0srs8P30bxw==
X-Received: by 10.66.255.10 with SMTP id am10mr11886295pad.79.1450518370368;
	Sat, 19 Dec 2015 01:46:10 -0800 (PST)
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com.
	[209.85.192.170]) by smtp.gmail.com with ESMTPSA id
	kk5sm10909846pab.16.2015.12.19.01.46.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Dec 2015 01:46:08 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f170.google.com with SMTP id n128so44398740pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 01:46:08 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.98.80.8 with SMTP id e8mr11886816pfb.88.1450518368128; Sat,
	19 Dec 2015 01:46:08 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Sat, 19 Dec 2015 01:46:08 -0800 (PST)
In-Reply-To: <BLUPR03MB1411555504B87423056408ECE8E10@BLUPR03MB1411.namprd03.prod.outlook.com>
References: <1450389888-24760-1-git-send-email-tom.hochstein@freescale.com>
	<1450389888-24760-2-git-send-email-tom.hochstein@freescale.com>
	<CAP9ODKrdjBD=RXJ_hPgQCqO0C7hK3=dECXg_JKT11xVVYOEMwA@mail.gmail.com>
	<BLUPR03MB1411555504B87423056408ECE8E10@BLUPR03MB1411.namprd03.prod.outlook.com>
Date: Sat, 19 Dec 2015 07:46:08 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqBNoH0sitCfNbWu9Nx9UTKP9YD1B-U6Vp-=0Sq_vBVMw@mail.gmail.com>
Message-ID: <CAP9ODKqBNoH0sitCfNbWu9Nx9UTKP9YD1B-U6Vp-=0Sq_vBVMw@mail.gmail.com>
To: Tom Hochstein <Tom.Hochstein@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [<OE-core][PATCH v2 2/4] weston: Include weston-launch if Wayland is configured.
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
X-List-Received-Date: Sat, 19 Dec 2015 09:46:11 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 18, 2015 at 7:58 PM, Tom Hochstein
<Tom.Hochstein@freescale.com> wrote:
> Thanks, Otavio. Shall I simply quote the weston man page:
>
> When weston is started as the first windowing system (i.e. not under X
> nor under another Wayland server), it should be done with the command
> weston-launch to set up proper privileged access to devices.

Yes; you also need to check pam support is really required for it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

