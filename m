Return-Path: <oecore.mailinglist@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 25B057EBC7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2019 17:11:27 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id p74so6856140wme.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jul 2019 10:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=a0VLWJ6gHT/3MlDkbch4LVB5ZCe+OolMQGeTeb9QgRk=;
	b=VZxG4oIvBMJhwvwGWHjj1FiAbZ7H4mxTvnOAF/pQsa93RtESXiMI8uU/SKMTY14q2A
	p4XEB9iyYsyuudvG3m3jxEWCs++9mkOAJ10zAlfZhqnk7WFTFNm2/Ve5tPaMA8VtVpz8
	9TYw5nH3XOflXz7oHFI3XKxURI3FzFYre9MxeSn7mZQVW56xAJJ7vZmvzMxp9YaAEZuO
	J+p3dsTZi5G3W6t+9di4TqmbbPz6KurdiwY+kyoregII1FYmxvWhA2Ov0RC0AnxajsYj
	e8ivn46E93Wx3S8Ru8T4laQUJ3AptHSwxuE1hUSxxgN+6YVJETOIrCXkNAhiskERc77P
	mqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=a0VLWJ6gHT/3MlDkbch4LVB5ZCe+OolMQGeTeb9QgRk=;
	b=SNb7wcR5tChGQBnkDW5Zbp/zd7HuYqurwTdCxRMTwJ6sNuMC8xc37LC0A6Kd6UaHxS
	/STz1DFUEbGc4Bqr244OoF15OEGpCucOiQaNHuQR8yt2QTbMXfwMuhWDlfzWnoolK4Kh
	zS+WtQ+7+3jLI8qKzjEgLhM4OiCdL2QRGHTDuC15O18Ac8Mknymqdhk0vbXsrEtxb+AL
	46UHf5ZDqZkhVFmJKyclY8X3WF3BsiaRl+zNG6XWfzZ4tAWNokng33b9S0B7f/BkPHdv
	3HVy1bMfdO8GxcdBeCYM3Vo7Hy1QUunp9okBB/s8PuMPfeNHdV3G/fsVmY/uKPf/bMqz
	ObSw==
X-Gm-Message-State: APjAAAXJ70w0zMXzOuwFY4PVLWuM6nN8M/l63MPv+NZ8Se9tXlyCo6Ob
	ANU8lO7b6pvTb/C2DfL1TJ8=
X-Google-Smtp-Source: APXvYqxpP6gFDLXtpmn07YXhZlYXmHJCm+oCgRhUkLzHHLx7BMMV95LK1aNN20/kVLle5+jzFaTsdQ==
X-Received: by 2002:a1c:6504:: with SMTP id z4mr4111442wmb.172.1562346687922; 
	Fri, 05 Jul 2019 10:11:27 -0700 (PDT)
Received: from [192.168.42.50] (ppp-2-86-135-63.home.otenet.gr. [2.86.135.63])
	by smtp.gmail.com with ESMTPSA id
	v5sm9026456wre.50.2019.07.05.10.11.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Jul 2019 10:11:27 -0700 (PDT)
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1562236183-6069-1-git-send-email-zhangzl2013@126.com>
	<CADkTA4P-jyrFNf+vKQwDuyxD8sW=20MO+2Tus3AvaoKPjbJFvQ@mail.gmail.com>
	<7c29c0bde1bae4de4cac852d98571dd28070f4c5.camel@linuxfoundation.org>
	<CADkTA4NQr2LkB3k32Djxn-zX0m2jSCLz_yEjN7pPPzdNoJMaYA@mail.gmail.com>
	<64ce05dd1d970dc5b0390d57b4c9b75c44f405f4.camel@linuxfoundation.org>
	<CADkTA4PbeVuGHVc2oofZeavPvMsQ7DPT4dWm0RRKK2U-8OfxWg@mail.gmail.com>
From: Robert Berger <oecore.mailinglist@gmail.com>
Message-ID: <8b813c50-fe05-e079-564d-684f8c935768@gmail.com>
Date: Fri, 5 Jul 2019 20:11:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CADkTA4PbeVuGHVc2oofZeavPvMsQ7DPT4dWm0RRKK2U-8OfxWg@mail.gmail.com>
Cc: Robert Berger <robert.berger@reliableembeddedsystems.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto: checksum indirect cfg and scc files
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
X-List-Received-Date: Fri, 05 Jul 2019 17:11:27 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi everybody,

Let me throw in my 2 cents ;)

We have 2 cases (and combinations)

1) .scc, .cfg, .patch files just lying around not being used

2) .scc, .cfg, .patch files actually somehow being included in the 
kernel recipe and hence being used

Say, the kernel recipe includes something like this:

SRC_URI += "file://imx6q-phytec-mira-rdk-nand-bsp.scc \
             file://imx6q-phytec-mira-rdk-nand-bsp.cfg \
             file://imx6q-phytec-mira-rdk-nand-bsp-user-config.cfg \
             file://imx6q-phytec-mira-rdk-nand-bsp-user-patches.scc \
             file://imx6q-phytec-mira-rdk-nand-bsp-user-features.scc \
            "

The various files contain this:

== imx6q-phytec-mira-rdk-nand-bsp.scc ==

kconf hardware imx6q-phytec-mira-rdk-nand-bsp.cfg

== imx6q-phytec-mira-rdk-nand-bsp-user-config.cfg ==

CONFIG_MODULES=y

== imx6q-phytec-mira-rdk-nand-bsp-user-patches.scc ==

patch 0001-revert-patch-e7e73b10d690c5352cb11b1941a09e4f3dc4c8c.patch

== imx6q-phytec-mira-rdk-nand-bsp-user-features.scc ==
include <from somewhere>/linux-yocto-custom/cfg/ikconfig.scc
include <from somewhere>/linux-yocto-custom/features/hello-in-tree.scc

and so on...

So yes .scc .patch and .cfg files are being included, directly, or 
indirectly.

My question is:"What is different from including a .patch file here 
compared to including in from any other recipe?"

I guess the same behavior should apply to .patch, .scc and .cfg files.

Regards,

Robert

