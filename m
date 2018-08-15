Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id D659E79163
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 12:45:44 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id s198-v6so1646612oih.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2018 05:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uT2VRpEF+9Ebjx6vy7+Y/k9AOypwak06zKNRANvJ4DQ=;
	b=Q/bGatb17fzD5swW99j+g2nocs6NWDGTbQvZ8iv5pGuaiIV8ZTPUaLqAkR/UKBbHsz
	DMvm8OR+aynka8unk+Nodf/XhgmRxC7MpgIuCl9dVE2FfO01y0+P90HSfGcEaTqokfup
	go3HhgKcR5zxzViAcfw41E1uhRc6/g3WDMVr9B24APIISMUPIOqHYMFx9xSaDf98Hd71
	GcbmviIYjH7M4hrEpHpEo20LMzQl0uMPPULa2mIhjkQaCuSC6H6hEGlp8OzUAqz+rXng
	ZF6bQDGl9hqXcbLbAksaY8di3i/s1gmoIU1yE3wrI63QSKmAtvKJqVbo/X8Z5X2a0jMC
	UZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uT2VRpEF+9Ebjx6vy7+Y/k9AOypwak06zKNRANvJ4DQ=;
	b=dej5k24oSDdoMcDCB5hgQTMhouvCqEFwPARL6buMG2QZixtGEabiO3sTl3qcovh5T1
	1onxY7/i538J/Fltm1imU4Xvji6gczUgjyAhouubAvOIC97EZu7NfwLX7+8xcpftiEgu
	28cm+54xVPTKOyigREJoyzM6Occud6tLv74h/1fIgfQNZjiL3KMkGXucGSSixz581LAB
	4qRqIwTigjJUKdY5ElS1Afv9It6TAdVGT3Gizy3AQB51hhTj4ePtYFoSIqFB+n+BOu7e
	++SU3LV2Hy4hqERjFfwQa8jANhAu4QWp5+vZvuJzddxPXQWYY28VK7jK6KxAZUR/WCY6
	Saaw==
X-Gm-Message-State: AOUpUlEJrJY9hhZ9C4cSIJGXcZYgKl9d6ta5b7xgDdAh1DTYgKRxsQi4
	SxksSecKS14PBMUsgBg5v7/AUfTDgebNq4e0uvE=
X-Google-Smtp-Source: AA+uWPw9X4s4dQPVyqAeJ/KeMKZtr9+cGleOhYvleaOs5ajE07Lb8bwF12PpS+DQXa+xJu9vp6hMtBDXVEWAxi0ZVz4=
X-Received: by 2002:aca:4fcf:: with SMTP id
	d198-v6mr24136864oib.51.1534337145776; 
	Wed, 15 Aug 2018 05:45:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP; Wed, 15 Aug 2018 05:45:45
	-0700 (PDT)
In-Reply-To: <CAGCTLNSTZLXLKQRV7J1twF+a7Dm=WMNRC=0DRhrMWjYeiLO_Uw@mail.gmail.com>
References: <CAGCTLNSTZLXLKQRV7J1twF+a7Dm=WMNRC=0DRhrMWjYeiLO_Uw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Aug 2018 14:45:45 +0200
Message-ID: <CANNYZj9vjFvnbWVdP5yNaMb-caozvHGv1G-JAa9iSTzArKhJ5Q@mail.gmail.com>
To: Mohamed Dawod <mhm.dawod@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe][meta-qt5] : QT5 Packages
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
X-List-Received-Date: Wed, 15 Aug 2018 12:45:45 -0000
Content-Type: text/plain; charset="UTF-8"

2018-08-15 14:38 GMT+02:00 Mohamed Dawod <mhm.dawod@gmail.com>:
> I am trying to add Qt5 to my custom image.
> I edited bblayer.conf file and created.
> Now I want to know what is th packages which i need to append to
> IMAGE_INSTALL variable ?
> I found many many packages and modules. I can not add them all, because this
> will expand my image size.
> I need to know how to select the most important modules for my image ?

Presumably you need qt5 in order to run some application. Add that
application to IMAGE_INSTALL, and it will pull in all necessary qt5
dependencies automatically.

Alex

