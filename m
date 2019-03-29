Return-Path: <twoerner@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0E0857D247;
	Fri, 29 Mar 2019 14:14:27 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id v10so1833785iom.8;
	Fri, 29 Mar 2019 07:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=60IMR+L8a12c4NeezibfltlRxP+sM6ITGHO3VuEskNY=;
	b=VI4pqeC0/AxpuF4b5ZA3KZqZJi4zEvd7s5XUKRekL5rQrRZGxnTWXOzMmRq9ZaiLxN
	N7eKwuwilZX/22jv9bzRciYh1R9IoTBRGt7Q/I+LD3Sfvib5xqUplUR30nCsLQGmTIzs
	gzwoob03iGBXHn5G0bOLWNIZ+wvfXbgq+f1TmcbPc6lzmbbxXgsnnaHhRnXxL+R/z4ES
	OeakvZVhlVtmCWHQvBjbb40vpinVfrQvkv+Cpwz83xql4piqf8hbl2kIZ0dAWk/AAMQF
	2Qei02RyB9dNdP2H6ShAQ5RwYKc6q8kgEW8QkyC9srPxgnU5vqB9q+idcgQNd9aaCIdN
	nMag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=60IMR+L8a12c4NeezibfltlRxP+sM6ITGHO3VuEskNY=;
	b=VCVW8O9or4nFeiEUybquGCUJylevSbUo8sxIr5jLh5CpAAM6oFSWGeei2IcoszilZJ
	Qsk83jaSV6g3fG+hnDb+VcHa6jmkvbNPpohiwRNKXrI4JQ0leTtUfdYltKm+X728aJcI
	9dGN8Ep0nBAkq0TVRYDCDwi3ytyczCXD4yyr+D42jrh7UQvzxD3i7rhj2fd22COF46AO
	D7eZxXGmQgMJ+dDK6zM52MBeXz0F7wSncM814VA8WiKCKbokMRUIz/uA1zIzpKpmwfWT
	TdMdNjiO2LtnUkxLipCdh3V35FvWSbHfMwjj6P11B4vIeK9dT/87BPMM87w/BdVxi+TT
	EINQ==
X-Gm-Message-State: APjAAAW7Nxo6Ykawz9rQBUGKvB183Ja3yPByh3zEWuaBXUQexwnhBjpc
	Xw9pm92X6aQdPaxcQVVOvUk=
X-Google-Smtp-Source: APXvYqyhyOzCatmwzbc1BuwN/ahmnc5vuEB/Inmrof1j9GIGxdmiN4GiVDBJuprdOcJ9Z3HlhsvBLQ==
X-Received: by 2002:a6b:641a:: with SMTP id t26mr13448336iog.41.1553868868905; 
	Fri, 29 Mar 2019 07:14:28 -0700 (PDT)
Received: from linux-uys3 ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id l20sm823241ioj.57.2019.03.29.07.14.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Mar 2019 07:14:27 -0700 (PDT)
Date: Fri, 29 Mar 2019 10:14:25 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20190329141425.GA6015@linux-uys3>
References: <CAMKF1so7w4i4Kw-ymWayPx1Z_mmetRKcNeyb9pADFZwDY=jqmw@mail.gmail.com>
	<20190327161754.GD1598@jama> <20190327163507.GE1598@jama>
	<20190327203907.GF1598@jama> <20190327223257.GG1598@jama>
	<CAMKF1sqyPnVgbDt6yp8w5fAkjj-5S8WudbarJDwpAFXzdtwAog@mail.gmail.com>
	<20190328144033.GA1601@jama> <20190329113734.GA31182@linux-uys3>
MIME-Version: 1.0
In-Reply-To: <20190329113734.GA31182@linux-uys3>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: glibc broken when linked with gold Was: [oe] State of OE World, 2019-03-16
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
X-List-Received-Date: Fri, 29 Mar 2019 14:14:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

An image built with gold fails on the hardware.

I was able to build core-image-minimal with gold enabled:

configuration:
	Build Configuration:
	BB_VERSION           = "1.40.0"
	BUILD_SYS            = "x86_64-linux"
	NATIVELSBSTRING      = "opensuseleap-15.0"
	TARGET_SYS           = "arm-oe-linux-gnueabi"
	MACHINE              = "imx233-olinuxino-maxi"
	DISTRO               = "nodistro"
	DISTRO_VERSION       = "nodistro.0"
	TUNE_FEATURES        = "arm armv5 thumb dsp"
	TARGET_FPU           = "soft"
	meta-fsl-arm-extra   = "master:b4d2c8462220e7038adffc0a151767ef8da07c5d"
	meta-freescale       = "master:08173f472244817b85fe4af8ab2add7a0090b122"
	meta                 = "master:aeaca9bb1b1c8bf44818945dc4b2cbd6d4b5cef2"

conf/local.conf addition:
	DISTRO_FEATURES_append = " ld-is-gold"

When run, the kernel is unable to run init, and panics:

	[    4.050000] Freeing unused kernel memory: 308K
	[    4.050000] This architecture does not have kernel memory protection.
	[    4.060000] Run /sbin/init as init process
	[    4.120000] hub 1-1:1.0: USB hub found
	[    4.130000] hub 1-1:1.0: 3 ports detected
	[    4.140000] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
	[    4.140000] CPU: 0 PID: 1 Comm: init Not tainted 5.0.3-fslc+g20d8efe36350 #1
	[    4.140000] Hardware name: Freescale MXS (Device Tree)
	[    4.140000] [<c0010df8>] (unwind_backtrace) from [<c000e730>] (show_stack+0x10/0x14)
	[    4.140000] [<c000e730>] (show_stack) from [<c001a9bc>] (panic+0xec/0x2d8)
	[    4.140000] [<c001a9bc>] (panic) from [<c001d3b0>] (do_exit+0xa44/0xaa4)
	[    4.140000] [<c001d3b0>] (do_exit) from [<c001e65c>] (do_group_exit+0x38/0xbc)
	[    4.140000] [<c001e65c>] (do_group_exit) from [<c002a1c0>] (get_signal+0x110/0x98c)
	[    4.140000] [<c002a1c0>] (get_signal) from [<c000dd6c>] (do_work_pending+0x120/0x5fc)
	[    4.140000] [<c000dd6c>] (do_work_pending) from [<c0009034>] (slow_work_pending+0xc/0x20)
	[    4.140000] Exception stack(0xc343dfb0 to 0xc343dff8)
	[    4.140000] dfa0:                                     bebd7f10 484113c4 00000000 48431fd0
	[    4.140000] dfc0: 00000934 00000000 00000000 00000000 00000000 00000000 00021504 bebd7f0c
	[    4.140000] dfe0: 48431fd0 bebd7ed0 48410a40 484113f4 00000010 ffffffff
	[    4.140000] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

