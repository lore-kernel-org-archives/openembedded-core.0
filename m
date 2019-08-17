Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
	[209.85.167.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9E0DB7F270
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 19:27:53 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id k22so7125594oiw.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 12:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:date:message-id:subject:to;
	bh=yK3/lCkJZavE9ueM3B6ffFnS7JaAUFQoR6taxRakrKo=;
	b=Uao5LdXH0CZtfeuBDuWfedKJblTZH9BJx6Yahzx0XIoEbnLqiFc+vqe/xuaaijHJjh
	uweJvKwbEyrtjjk1RQ1kZSzJwD5XBlUsSSaa4YT4sdZ7E1n1HAAf2bh65ibexxytW7ct
	JQdB3DQ/2crXzI4lOB8Z/e36/fx6O0TZCXknJrkiTwmfGO7wS7NkBs/afum8rzXu7QOY
	yG5Rzn2ITLW663xRnE757QXAF7HxDnjWuTpd8aC7HWMVEWkpD28909pqPESkPdcpkemm
	COOHPMnFl7Zq+LkNk9Np+bp4Qfbc8TIzwIiL9aSpcLgAK3MMJ3ooC/8SkFZg9VqD/syx
	6ZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:date:message-id:subject:to;
	bh=yK3/lCkJZavE9ueM3B6ffFnS7JaAUFQoR6taxRakrKo=;
	b=Lu4mjfoEKaMAdu8D3xmmejlowm7G3hNY6KGSUKQPQC2txjUEfPdCWt0bP+mYZ4XObX
	JneMBrBx6H7r4tUNIXOfzr1k82zUCksw4Do3e1ktjuEm4mywMWdQE2/Oe0N5C8ovAMuI
	aD7R6gQrHuqj6qHuH2a3wE0NlZfs7D8AH5UhfARD4rRIIfZFZbBacn7OQ6LgoVB6OKEk
	wGyIAGz7BPi1NNW329QGHdgOY4OyF4tEGdW+ig2Lv2U+FY2p9hAcII8qVTkQtK4LDinT
	gBFZdqsN4BOgW/tG80vLxp/ZPr5lRtMLpHUfk7YkZhDApfLTXVYbV9BCppArq+DWk8nu
	7LmQ==
X-Gm-Message-State: APjAAAUF1EExTL1KZx7NI7OOqxjz7VJ9uBNBiUAxTQKdQ0vhht+uwodo
	hLPY1qZOU9/ymfCcaJGQT3/nE1woWt8eFA==
X-Google-Smtp-Source: APXvYqxnYTQH1sgfKe4LS4Xjslm4gobzU3AjJannPJZ+UuxtLfz2cG0ONe/56pMum3vfJCIdvO1hGA==
X-Received: by 2002:aca:bc06:: with SMTP id m6mr8982339oif.114.1566070074105; 
	Sat, 17 Aug 2019 12:27:54 -0700 (PDT)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com.
	[209.85.167.171]) by smtp.gmail.com with ESMTPSA id
	w21sm3495419oti.52.2019.08.17.12.27.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 17 Aug 2019 12:27:53 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f171.google.com with SMTP id q10so3625842oij.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 12:27:53 -0700 (PDT)
X-Received: by 2002:aca:75c2:: with SMTP id q185mr5047864oic.134.1566070072666;
	Sat, 17 Aug 2019 12:27:52 -0700 (PDT)
MIME-Version: 1.0
Date: Sat, 17 Aug 2019 16:27:39 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqnJX-fLme5JUQF8XAHr2hDzJ31auZPQGOUQCehuTb4XA@mail.gmail.com>
Message-ID: <CAP9ODKqnJX-fLme5JUQF8XAHr2hDzJ31auZPQGOUQCehuTb4XA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Conflict of systemd and sysvinit
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
X-List-Received-Date: Sat, 17 Aug 2019 19:27:53 -0000
Content-Type: text/plain; charset="UTF-8"

Hello,

I found a build error at master.

Collected errors:
 * check_data_file_clashes: Package systemd wants to install file
.../rootfs/sbin/telinit
        But that file is already provided by package  * sysvinit

Can someone take a look?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

