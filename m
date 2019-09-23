Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
	[209.85.222.181])
	by mail.openembedded.org (Postfix) with ESMTP id 497E36B50B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 22:40:27 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id u186so17243965qkc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2019 15:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=kJblVKdePYenzZ8dAStMp4iPrBxi8S5dSHBLR2p8lKc=;
	b=O2aRMwmyiWp8I6hFBpWPKJiLDu5uN20tsGOrqw185ed//cz5X4PLH84cW6mIpAh6WY
	CPtkz2+r04WBhmnPx5wEiLgv0IJAi0NOwWfeDUED+cRhFt3ZabxDMIaFjYxiB2EEzILF
	qmQfgFjP8qRionT4cfbGhv2z4Pk3HsBzcGgxQJkr4Whqu5z/4o+Z8xzpT5yGPD+oh+z3
	mML56PX5q3v7Ms4EhzCHt/2fv4tplyHh5vxUp+XqgErrsyikrFMq+iewWdFzjCb4cZtS
	0XVVruPELwtdzqYFZIdBYgd3sWpEKgXarZUByxJvZhAlHr6bPw6VOb9IV6uKIMA7+48V
	wcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=kJblVKdePYenzZ8dAStMp4iPrBxi8S5dSHBLR2p8lKc=;
	b=d4d7d3m56ie8y/ICXTZIcclmU0D4InflUXi8rAj57ss5XA8t5KsYL53NwkNwPvNaab
	X2Z2inU3b4vnWSagHfle9OGT3EMOIxTdDYfZvx2YDXxpQzzvlCUQF6VyUJsj3MoEhm5C
	c/UXW1IU2N1OOeltJ45IUi097yNI8UQTSrNHjiuSHbOENQtfJLbROVv5NQ2AY9aLizJ2
	MjKqJ7w3Lw10jjYVSFahsuAg7vdCtBoLdxil+q5iOV9NXykGIdjuPRF/JcXDRwGJAXN7
	k3NaWdzq3Oz1EaWYzw4eW6aTUdmfn2ihrJFJWnrC8dzuionngG024lOIkBAVRujDYz6v
	ut5A==
X-Gm-Message-State: APjAAAUjzaXyHUQObd25DQbfiRhYuCmWUdB7Al36V35ZDcBN7Z9yg+ub
	DM1n9EZ28/9BA7CrzA0I64ZAx5ANFeHBLYJnjaE=
X-Google-Smtp-Source: APXvYqwgXI8dDH4w30WzNNBvVXLoqpHt9ZWR42EEiQp0i4JD12A1r1cT7gJ/e40qnelw51Z5kWJMwrhMcAHhHLqGDtg=
X-Received: by 2002:a37:5cc1:: with SMTP id q184mr322523qkb.212.1569278427806; 
	Mon, 23 Sep 2019 15:40:27 -0700 (PDT)
MIME-Version: 1.0
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 Sep 2019 15:40:02 -0700
Message-ID: <CAMKF1sqanCn50yNrGcUDyGZQu9fOXsRZkccvk4o+GvD6F5nPRg@mail.gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: qemu 4.1 boot regression with riscv/musl
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
X-List-Received-Date: Mon, 23 Sep 2019 22:40:27 -0000
Content-Type: text/plain; charset="UTF-8"

Alistair,

OE-core qemu upgrade to 4.1 has ended up with regressing musl/riscv
port. I could pin point it to

https://git.openembedded.org/openembedded-core/commit/?id=50a7dec95618080962e56fd347f505e691b7ad6f

it works fine with 4.0, I havent looked further

To reproduce

build
MACHINE=qemuriscv64 TCLIBC=musl  bitbake core-image-minimal
TCLIBC=musl runqemu nographic

Thanks
-Khem

