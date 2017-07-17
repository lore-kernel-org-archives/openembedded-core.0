Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8420360670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 18:45:38 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id w4so1804048wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 11:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=NRRqLGccRwFDj1BEzTbIIXLCJpTn8ILf+J/aqyE9sp8=;
	b=IX/vUMzNUY63vVo5dyD2ND3AeZqXa5Gb/cGkICmxzL3NSsCTu+PR0nS7t806dVeh+9
	u5sgyOcaeXcaejz0lM5ns8GreS1Tfsc2nIQj+HoNCouL3ilMSHdLgtvfjMdStXb6l9LU
	P+e9TeNSJrHyGRBOdZVhUH7e3SLvdEqT2dJGbBHIJrY7wfVQ/D2dP5ItCFxTtZoe11Ie
	zqcDFWm7UzDmuHsvWF215bnbaOljPG1yFvanjD+3hcA+KPlV8luGxOgqKnPziRPyv3Ik
	7rLAC8ux+/KddQHEt8hAhJnaMJOaq4UIdAqwjBvK7Azsn/VYBn6FFABulQEnC71PiXPP
	UvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=NRRqLGccRwFDj1BEzTbIIXLCJpTn8ILf+J/aqyE9sp8=;
	b=RSaPRbHINOm6uPnoGouE3J/SeRELYadopZD+CYzV7LrXDMZgaMys5KVsxnjG0rtDH8
	bqhsFJys6dJOH4jWVRO9tD4xlpxnrurak/P88vouyY4/LXQP95DG7vuc1Pfx7/yyQUYZ
	xw0dvKdgPctdPxyMjWWFJw22r6Y8nT3UyIzzmvCnAYjkXddgj6+5+a8glwM2gbrjf/ti
	zFFuA9TQFtorAmVICu8aJ5X/MAPc/19q/CSM76R4bIjHVYAaaDlxOBY7xpuVm2+2SaxY
	i4sRmNEkM5XAQwZlAVdg+VI293Wt4s0eIiLQZIPItvfJFyRbcbIhYAk6X04b8kE2hnZV
	wltQ==
X-Gm-Message-State: AIVw1123R1deeZoUunhcAsD/WvmLlFduDCHfPb8x0ygDQYhb1VYvrGfm
	6l/qGrJ0qqX8HFvc8xY=
X-Received: by 10.223.183.40 with SMTP id l40mr14498939wre.154.1500317139008; 
	Mon, 17 Jul 2017 11:45:39 -0700 (PDT)
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com.
	[209.85.128.176]) by smtp.gmail.com with ESMTPSA id
	g18sm24035344wrg.69.2017.07.17.11.45.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 11:45:37 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f176.google.com with SMTP id y43so5289161wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 11:45:37 -0700 (PDT)
X-Received: by 10.223.139.218 with SMTP id w26mr11411015wra.206.1500317137646; 
	Mon, 17 Jul 2017 11:45:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.198.141 with HTTP; Mon, 17 Jul 2017 11:45:36 -0700 (PDT)
In-Reply-To: <5f6ad89554e31ff40b720599eb60f0237f1b4dfa.1500229225.git.wei.tee.ng@intel.com>
References: <cover.1500229225.git.wei.tee.ng@intel.com>
	<5f6ad89554e31ff40b720599eb60f0237f1b4dfa.1500229225.git.wei.tee.ng@intel.com>
Date: Mon, 17 Jul 2017 15:45:36 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoCK=4gG_wzvw1hRy=yRPDdWzxRtw0Bv68hEvtxawvCSQ@mail.gmail.com>
Message-ID: <CAP9ODKoCK=4gG_wzvw1hRy=yRPDdWzxRtw0Bv68hEvtxawvCSQ@mail.gmail.com>
To: "Ng, Wei Tee" <wei.tee.ng@intel.com>
Cc: Saul Wold <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] initramfs-framework: include install-efi module in recipe for installation
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
X-List-Received-Date: Mon, 17 Jul 2017 18:45:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jul 16, 2017 at 4:29 PM,  <wei.tee.ng@intel.com> wrote:
> From: "Ng, Wei Tee" <wei.tee.ng@intel.com>
>
> Utilized the existing init-install-efi.sh script and renamed it to
> install-efi.sh to manage the installation process of images in
> initramfs-framework model. This script will be executed when
> "install" option is being chosen in the grub menu and install
> the image on the target platform. A new install-efi module is
> being added in the recipe to handle the installation process
> using initramfs-framework.
>
> [YOCTO #10989]
>
> Signed-off-by: Ng, Wei Tee <wei.tee.ng@intel.com>

Fine now ;-)


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

