Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9E424765B2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Aug 2015 20:12:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t71KCZkm001867; Sat, 1 Aug 2015 21:12:35 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id F8O085MFBv5z; Sat,  1 Aug 2015 21:12:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t71KCK6d001864
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sat, 1 Aug 2015 21:12:32 +0100
Message-ID: <1438459940.25455.35.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kai Kang <kai.kang@windriver.com>
Date: Sat, 01 Aug 2015 21:12:20 +0100
In-Reply-To: <16ac455da1ad4ded87a80e00ea08241d761186de.1438450455.git.kai.kang@windriver.com>
References: <cover.1438450455.git.kai.kang@windriver.com>
	<16ac455da1ad4ded87a80e00ea08241d761186de.1438450455.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] qemu: add ptest sub-package
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
X-List-Received-Date: Sat, 01 Aug 2015 20:12:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2015-08-02 at 01:35 +0800, Kai Kang wrote:
> Add sub-package ptest for qemu.
> 
[...]
> diff --git a/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile.patch b/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile.patch
> new file mode 100644
> index 0000000..2e79356
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/add-ptest-in-makefile.patch
> @@ -0,0 +1,29 @@
> +From 9b25fbc38c2c57c93ab53bf48a759bd2bd4c209d Mon Sep 17 00:00:00 2001
> +From: HYANG2 <hyang2@pek-hyang2-d1.(none)>
> +Date: Tue, 15 Jul 2014 10:13:22 +0800
> +Subject: [PATCH] fix for ptest

No Upstream-Status?

Cheers,

Richard



