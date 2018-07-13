Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
	[209.85.208.50])
	by mail.openembedded.org (Postfix) with ESMTP id CFBC678568
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 18:16:03 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id b10-v6so25247927edi.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 11:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ElAPbDjJlXHHohVZqtpgKFiivVx73CGVzS8PJ1UTaec=;
	b=RIr3hM37AcvHIi62icwJByhsXELN56dcSK7Zl4YO3FR4hKG3Jgc1QiLbcMUjd9B03k
	lpNQDHNXkLvIoclMdpf4oFSIyxEmMTnz7Y+K6qnYXT/hN6hwEXiqo0hyJFEs6kMKMtQo
	JmuyP5npBVgrJLH6LRPEzY9NNE7uZXL8Gy/v0nzxjK4XFnQEn16XpuE3Fn0r7HsbYtef
	50CtA0aViVces/vvdwlQl9iwGPsV95v7qGxRK1FlR/3qQkOFxmghfn9LoF5uD6IHRPSc
	4eq5rrEWqaFu6PuJ/yYGrgeb1aqwcmqJef9V8vU70dfIoJOvhm4OpUHzwknsr7zWEZ03
	cqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ElAPbDjJlXHHohVZqtpgKFiivVx73CGVzS8PJ1UTaec=;
	b=qJ46KAJEnUMcMf4nafU2+u9rAGDX/EzSiTVKWhEiJfDyWplahEpzT/X16xcSSe7noy
	B9yegt1uY6Pq5R9P9q73aKdS/nOHau5iKYHs5BpfligJp5XF+KaCiNDyxmZKCKtHZAah
	NUXG8WySTGBlATWe6paPQ4ZB0ajlPTwD8tGTP0zN5KBaGcxcZk5MpUx8sZmD4tS2rNeN
	iE8H/pfuRYk8FDO4/lARRJj+YHOntqw701bUYWKee07sIXAxiGUTpKSh2ZuAjiej+qyW
	iP8Ez1zYGdrK1SVpoXwRuL0r1/SqAcRTmSYPg2fePlsfMjVOe4mPoZwyems9ccxns2Qy
	ATbA==
X-Gm-Message-State: AOUpUlHQ9YYJFKGaDE5H6FzcjZbgD3XH9nOSC8l3uBmUQF2NDow8k2lD
	DrTAy8PxaJ725nM7KVL1KCKmeg==
X-Google-Smtp-Source: AAOMgpdRDni9bNbcA4Bi729FGvA0OdRzjk+ei31h9f9bnwD3A1Ys+owfAj3O9WWvSz4OtpkJWFhAWg==
X-Received: by 2002:a50:af45:: with SMTP id
	g63-v6mr8467799edd.30.1531505764651; 
	Fri, 13 Jul 2018 11:16:04 -0700 (PDT)
Received: from [172.20.0.85] ([82.163.40.65]) by smtp.gmail.com with ESMTPSA id
	p18-v6sm7735356edc.5.2018.07.13.11.16.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Jul 2018 11:16:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.0 \(3445.100.15\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <bc25908059f4ae24437052aa39823a3ce7b8a5d9.1531389673.git.Qi.Chen@windriver.com>
Date: Fri, 13 Jul 2018 20:16:03 +0200
Message-Id: <15C2AD73-D572-401F-A7B7-9460C6524821@dominion.thruhere.net>
References: <cover.1531389673.git.Qi.Chen@windriver.com>
	<bc25908059f4ae24437052aa39823a3ce7b8a5d9.1531389673.git.Qi.Chen@windriver.com>
To: Chen Qi <Qi.Chen@windriver.com>
X-Mailer: Apple Mail (2.3445.100.15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] systemd: upgrade to 239
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
X-List-Received-Date: Fri, 13 Jul 2018 18:16:04 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> Op 12 jul. 2018, om 12:03 heeft Chen Qi <Qi.Chen@windriver.com> het =
volgende geschreven:
>=20
> Upgrade systemd to 239.

<snip>

When enabling importd I get:

WARNING: systemd-1_239-r0 do_package: QA Issue: systemd: =
Files/directories were installed but not shipped in any package:
  /usr/share/dbus-1/system.d/org.freedesktop.import1.conf

So you need something like this on top of your patchset:

@@ -379,6 +379,7 @@ FILES_${PN}-container =3D =
"${sysconfdir}/dbus-1/system.d/org.freedesktop.import1.c
                          ${libdir}/libnss_mymachines.so.2 \
                          =
${datadir}/dbus-1/system-services/org.freedesktop.import1.service \
                          =
${datadir}/dbus-1/system-services/org.freedesktop.machine1.service \
+                         =
${datadir}/dbus-1/system.d/org.freedesktop.import1.conf \
                          =
${datadir}/dbus-1/system.d/org.freedesktop.machine1.conf \
                          =
${datadir}/polkit-1/actions/org.freedesktop.import1.policy \
                          =
${datadir}/polkit-1/actions/org.freedesktop.machine1.policy \

regards,

Koen=

