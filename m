Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 460D67869A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 20:31:36 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id a132so16904886oih.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 12:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=BCjC8+te6ZCHshZqOK+5czYUBeQ++omFJRLSJdri9yY=;
	b=iKK4efl57PtfAf+9UijQ+51JnU+VVvTJksAj9/N4l5w7Jt9xr9z+OXZsbMoe0676Ib
	J0334YfQkwaeOC/VTXLsRpqGxZreumjOcSPd/vcYsiGGOLXp+xLH/qxI031nOKso0XNU
	4WN5yAPw9HhyOHKIl1QBotjkR8mnQdNk3kFZN0W16G9qzn7k3QN051FJroKxpT3lvLwj
	N4t33S2rHI0YLHMLAS+cVj1vEUvDRx+SMywLMKXkC5TvCRwjQweAjdNSeikjgsLW5B7W
	mDPYv9W2zSGJOG5PkJkDEox7Lon+/BdWEBiN+JM1g6uh94wTWaDr6QM78HF87EQIptTW
	hExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=BCjC8+te6ZCHshZqOK+5czYUBeQ++omFJRLSJdri9yY=;
	b=NGLfdX3a+a71EQ2e+fDxpH44t4IFyhoop6cgh7cx5N2C4o2HpU9zQQcYolMCNGWNO6
	YjHO3cCrvT6Z8FV2ZM07iXpwkTdbXv8mA7/AWy/vdzfEVYkacLLWwpfkALZSo2fHCc72
	dfAeIlbgm3lDurk04zQO0ZLrjn3Hb8WUV1XRg4VWFo49SLjH48opp5WwuEBQ7TZ+0Keq
	SaBMaJamz/yR1JN6yv4z12ZiTWC/i/ixZPjRpyMaLpf9fBp88yXoM9b7bbZ9qjMj3P5v
	sCWZf45xMiJVxPLkH//1tbP0v3cMgMwYaUB6BWYTX2lINN1eHm6L/DTVQb96p1DilgCB
	4ojQ==
X-Gm-Message-State: AJaThX4Y6buTEdGq1rlCf40niMCgAt/GA9LUFCqXMrU4M2hz47fRL0Xo
	JaCzdPY1PZ5Si0ieL4QIKXULrmHU
X-Google-Smtp-Source: AGs4zMaNEyhf6vGt/xBLlZfa9mkPWyLFehfoKIU0btiMMeLz6+mNX0xYVKJ9Wl/zj5tAhSBADlCh1w==
X-Received: by 10.202.214.87 with SMTP id n84mr9680482oig.24.1510777898026;
	Wed, 15 Nov 2017 12:31:38 -0800 (PST)
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com.
	[209.85.218.49]) by smtp.gmail.com with ESMTPSA id
	q67sm9718971oif.11.2017.11.15.12.31.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Nov 2017 12:31:37 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f49.google.com with SMTP id r190so7876889oie.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 12:31:36 -0800 (PST)
X-Received: by 10.202.55.132 with SMTP id e126mr10425273oia.216.1510777896512; 
	Wed, 15 Nov 2017 12:31:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Wed, 15 Nov 2017 12:31:35 -0800 (PST)
In-Reply-To: <20171114212050.15881-3-california.l.sullivan@intel.com>
References: <20171114212050.15881-1-california.l.sullivan@intel.com>
	<20171114212050.15881-3-california.l.sullivan@intel.com>
Date: Wed, 15 Nov 2017 18:31:35 -0200
X-Gmail-Original-Message-ID: <CAP9ODKo8ETkWaHd1B8DbGp5uz-Ajzb66jTA5b=U4=1skNoxvbA@mail.gmail.com>
Message-ID: <CAP9ODKo8ETkWaHd1B8DbGp5uz-Ajzb66jTA5b=U4=1skNoxvbA@mail.gmail.com>
To: California Sullivan <california.l.sullivan@intel.com>
Cc: Saul Wold <saul.wold@intel.com>, "Bruce, Henry" <henry.bruce@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] initramfs-module-install-efi: update summary
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
X-List-Received-Date: Wed, 15 Nov 2017 20:31:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 14, 2017 at 7:20 PM, California Sullivan
<california.l.sullivan@intel.com> wrote:
> Note that this is an installation option for EFI systems.
>
> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>


Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Please also queue this for rocko backport. It seems a good fix.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

