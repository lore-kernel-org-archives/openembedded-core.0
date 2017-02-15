Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7E0286059F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 22:18:45 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id r141so659696ita.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 14:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=FW9Ols5CagsQbBEX6Wlyg3h4jo5aIgGhOgbNRrivlio=;
	b=PAwfYpin31HSTw7VQJL/d17aYvB0vULA6EmtaPenU4tRxB2OxzIul9yTt1MQ6GQe+q
	oF1R1fcfgG1GJyg3cp2cRlpz7WdhZLb6eM698jrmwXHiQnIaa2H/fAkIC9ZAsfxdtLiT
	2fZme3yTepzSGPcuNj1sUvOZBEG5eB2XBraEZDnalsduXgxlZavFsExkkdtqTpH2PSKV
	GuV50tYKEpXPqsYmnQkPyApWJy6wD52cm9zDpborT/6fqJBY1UEg7JSFQc9hQEEE5nHA
	7lJnqw+3dB109ui4nVtuBPsgG8yDZfhR9fX0RyrxxynxfhNTpuCDZV3IW+IKLt1lzg5U
	VRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=FW9Ols5CagsQbBEX6Wlyg3h4jo5aIgGhOgbNRrivlio=;
	b=N4GJgWBqTx/x+m+JR1psKrQgX49Hb4I7zQ8ozsQqsAEKS9AMciOH1We8HLVetmqTdO
	1Av35kaildVnrYUdl7ZRqWgFgIvSlhU8Z3MzKLYzOTcLuzSLFDteE1PKRa4Pa/PuFVAD
	96bdBwoP6OISM04o0/9gL7x09xd+GxtV/07O9z8QUtjwSl61FG+x4EyErtOrDdNKAJBq
	PLEsx3TUj+SvjoAY+kmYRScFQFsZHbEGFYFtVLtCOUuZvVz9CdALlhOOTAABTVYgH4np
	XIjXYnaNZtZhK/IPT0Fz0HNZr3twJ8i5LKO8vEE6kP5nicmc4JwBNBqnBmTjyntTu9S8
	FDrw==
X-Gm-Message-State: AMke39lwXuVck7INGSFdwpMXHrVfzIYWBejFEtz1iJRA12evgcmr9b7Cmlwt++Z6dXoHfw==
X-Received: by 10.107.8.194 with SMTP id h63mr38064080ioi.70.1487197126205;
	Wed, 15 Feb 2017 14:18:46 -0800 (PST)
Received: from CACSVMO-14452.local (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	x67sm2348952iod.22.2017.02.15.14.18.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Feb 2017 14:18:45 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <DM5PR05MB2954FBA66842C0F05C5108C6BB5B0@DM5PR05MB2954.namprd05.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <9c23fade-7e4c-ec14-f0c1-dd43ae71c5ff@gmail.com>
Date: Wed, 15 Feb 2017 14:17:29 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <DM5PR05MB2954FBA66842C0F05C5108C6BB5B0@DM5PR05MB2954.namprd05.prod.outlook.com>
Subject: Re: Suggested RREPLACES/RCONFLICTS for easier kernel-image upgrades
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
X-List-Received-Date: Wed, 15 Feb 2017 22:18:47 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 2/15/17 1:54 PM, Bryan Evenson wrote:
> For one project I'm using an Atmel AT91SAM9G25 processor, and I started when support for the chip wasn't fully integrated into the mainline kernel.  As a result, I was using Atmel's Linux fork.  Support has been in the mainline kernel for a while now, so in the middle of doing other updates I plan on switching to using one of the mainline LTS releases.  I'm using the kernel recipe in the meta-sunxi layer as an example (located here: https://github.com/linux-sunxi/meta-sunxi/blob/master/recipes-kernel/linux/linux_4.4.40.bb). I also plan on keeping more up to date on releases.  However, due to the package naming for the kernel images, the RREPLACES/RCONFLICTS statements for firmware upgrade for this recipe is getting ridiculous.  I'm currently building for kernel version 4.1.38, and here's what I have so far to handle all previous cases:
> 
> RREPLACES_kernel-image = "kernel-image (<= 4.1) kernel-image-3.6.9-yocto-standard kernel-image-3.10.0-yocto-standard kernel-image-3.10.0-at91"
> RCONFLICTS_kernel-image = "kernel-image (<= 4.1) kernel-image-3.6.9-yocto-standard kernel-image-3.10.0-yocto-standard kernel-image-3.10.0-at91"
> 
> If it makes a difference, I'm using opkg for a package manager.  Since the kernel version is in the package name, I'm assuming that if I do keep going forward and relatively up to date with LTS release, I'll have to start adding "kernel-image-4.1.38 kernel-image-4.1.39 kernel-image 4.1.40 ...." to the RREPLACES/RCONFLICTS so opkg will upgrade the kernel.
> 
> Is there a better way to do this?  I've tried using some wildcards in the package names without any success.
> 

you can increment PE

> Thanks,
> Bryan
> 

