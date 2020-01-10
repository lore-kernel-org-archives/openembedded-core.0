Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 9D6027FD08
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 16:53:08 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id d73so2743583wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2020 08:53:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QYnuIFOs63QOah9eDDzCLYGfOyfRhDktzDxRF1qrrJA=;
	b=uOo78yLy/+6z+x6ItNSjRmPIErykUyzJ6zDgUMLR3cDK78979H4xzErwMn0heflMgi
	Y/Y9cn13WA2z1jAaPjfRxKF65eVYrEEqE0fW0hToS6ZQkRxWXTIqhVM7Q4GR4M5mtlYt
	qdSiyl82wgibVfLYlEqAUMiMMgFYIaKABa1Gpige+vdyQvxY1HD/VJXwtTArFjhD/kTb
	+RyLV5+XRSWFAt1qlDbatGL82b2PQdzT2HhDfgtWGAi1hSmoHhH1UE4SPUUuXXvQxUb3
	R37MwtKv7D7oY2uj54Q40xPninQRZi3CXgPxgRaYZJ2MhXbMmKB6bmMLd63THm61vZ7o
	O33Q==
X-Gm-Message-State: APjAAAXJwVQXltaK2WSfdUOZ61jsz7GBpdmuJTHepDR5+ZBjVTchfIir
	bJX0QvmQYhyZ4IizMqmAMKybVLop
X-Google-Smtp-Source: APXvYqxVLD/Lns2i6bRtr7BsWhC1a+CdB5oYve/bPOl+yZAo7pWZCHn3/xA5eh+iiYOD0xMzvv8M3g==
X-Received: by 2002:a1c:7203:: with SMTP id n3mr5150436wmc.119.1578675189083; 
	Fri, 10 Jan 2020 08:53:09 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	c195sm3010137wmd.45.2020.01.10.08.53.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 10 Jan 2020 08:53:07 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2020 16:52:46 +0000
Message-Id: <20200110165302.27426-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [PATCH 00/16] site updates (autotools / coreutils)
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
X-List-Received-Date: Fri, 10 Jan 2020 16:53:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

For the following updates, I have run the autotools tests
(m4 macros) on the target on an up-to-date musl (32bit arm)
system, as well as taken the results from my host machine
for glibc (64bit, glibc 2.29)

These help to prevent coreutils from compiling lots of
useless wrappers, as many of the tests are testing long
fixed bugs that are not relevant anymore, since in most
cases the m4 macros assume the worst when cross-compiling.

Cheers,
André



