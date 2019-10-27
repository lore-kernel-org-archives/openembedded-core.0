Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id AD2827FA2B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 08:13:14 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id q130so6067234wme.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Oct 2019 01:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:openpgp:autocrypt:to:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=B5MM9CpW6zI+AxugdupYQK/g/ah7YyJD9MXqfI5sTac=;
	b=QqEUWIJkYplQvvfa2YaGiXEMnUaUDnJowEOMZ6gDUJ9Oc4Lb6DOGiE4Lo5Lj8xpifT
	FbnC+SpiJ/GQm7ai9cRbpgpi2f4cErN+lxnFVZytuZYq/hFOrcniPB5zQMpnOterUhoS
	jk5RwZjYv7VVeuYuP38nZ42eWA22cBDIqJrHiU9Pzaf4QW6/JaoIlclhpqwsKOFlOWSL
	4BEbvzTZsOSAr9Lt33VFrs9BJ1G2q7yiQisLIyAYHbZBan+rfbeWHMHvLoTJ0823EUzm
	q2HiLUpjSwcvRI7HLryJeq+sUaMtCDRNxjJG2JDOd0WPtES+AdIYbkSlZRt47GmAxQ/T
	psqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:openpgp:autocrypt:to:message-id
	:date:user-agent:mime-version:content-transfer-encoding
	:content-language;
	bh=B5MM9CpW6zI+AxugdupYQK/g/ah7YyJD9MXqfI5sTac=;
	b=mJOzUxcOJIHhGV69U/H3XiOQToMv9O2kmlRvtA0vQYGvbr9J4iP6i4FjDqikHzr1wW
	eubNWhrFUS6ptThT6uZKp4CynyteUjES3xs1dD+pXffaugIsax1IScxX5jW9G5etAfVR
	aKxUB9+10UeysLojqpdXBUUXP/ESS5g013EoQ43JTr6aCaIRYek44Qg45dtqjBUCjxhf
	4jEaeCzZVsUToc0fA55sR2bI31/kd0qDYEvtZ/5lsVIbmSZ8Z6HKnkS/OavtCXNd4frE
	hjipHpT1voBllx1z7YgnsHEl5isaiv7BtLZRZ5S4KF7ywOUlnNWirzV6aDoiX/y+xiHk
	6AEA==
X-Gm-Message-State: APjAAAXMjWDs5x8gpXNWoBilWDbczKp6awXg2vo8YaBKTIlXrpdk0lb5
	97jMscTH19N6ZmOapqKhCCzREYPHdh8=
X-Google-Smtp-Source: APXvYqwJ6bCGMaEREustO6+zo8R/Lo2IoDdshB9PH3Z4PNIGRT7/skimpbcmIkgagsMwDo6zQKVejw==
X-Received: by 2002:a1c:9a43:: with SMTP id c64mr10280812wme.20.1572163995022; 
	Sun, 27 Oct 2019 01:13:15 -0700 (PDT)
Received: from [10.192.11.162] ([178.18.58.186])
	by smtp.gmail.com with ESMTPSA id h17sm8073040wme.6.2019.10.27.01.13.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Oct 2019 01:13:14 -0700 (PDT)
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <ee102dfc-af38-5a75-0b64-0c6bb13bb106@gmail.com>
Date: Sun, 27 Oct 2019 01:13:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
Subject: State of stable warrior in Core/bitbake/YP layers
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
X-List-Received-Date: Sun, 27 Oct 2019 08:13:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hello,

Of the past month the warrior stable branch has been plagued with a
build failure on FedoraCore30 regarding qemu virgl tests. This has
caused the slip of the next dot release to occur after Thud's.

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13543

The error message was this:

runqemu - ERROR - Failed to run qemu: libEGL warning: MESA-LOADER:
failed to open swrast (search paths /usr/lib64/dri)
libEGL warning: MESA-LOADER: failed to open swrast (search paths
/usr/lib64/dri)

qemu-system-i386: egl: eglInitialize failed
qemu-system-i386: OpenGL is not supported by the display

What has fixed this error is updating libdrm to 2.4.99 from 2.4.97. What
I can not tell is what commit(s) in those updates fixed the above error

https://lists.freedesktop.org/archives/dri-devel/2019-July/225069.html
https://lists.x.org/archives/xorg-announce/2019-April/002992.html

Has anyone seen the above error and might have an idea what commits
would solve this issue?

Anyone familiar with the libdrm update policy? is the .99 a bugfix only,
it does not look like it from the commit messages.

The current Stable policy indicates newer hosts are supposed to be
supported and if not updating to the .99 release is an option, I foresee
it taking additional effort to figure which commits will fix the error.

Any clues or feedback is appreciated.

Regards,
Armin



