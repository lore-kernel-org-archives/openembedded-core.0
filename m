Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 600FD6ABF7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 08:33:28 +0000 (UTC)
Received: by wiun10 with SMTP id n10so37031802wiu.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 01:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type:subject:from:date:to
	:message-id; bh=7Bu2lrClhox7jplFFCLjgvEDvTjVNHzPG0ueJFtkzDY=;
	b=m5am51A82iPNIv2TApxR6vVTsaSboHSXhJZyQpwMz5GQ3EgNZLJ10CwRjSHqz5UVY2
	K9c28UGmsEcyAwRMGPZ7zyoFPUg0l6/aZhJ0yxttcCLdE3yWXze7n+MCfA0EOxshWTAT
	B/vPKKVN8+8dHOiHrL8PreXHv9HRzQahvXx70yw258YwboDXSZA5NB2DmFCLIfB9w8FW
	VW46u+hbnidHsUnjY1sR+OUt7uZ62j7D4M+isTV29iYlx7j7Ytsulp9SP+nQe59IFY9f
	AE7hx8NgcwZ84ZQ7ZWTbR86uZJr3rbIOmTcbs3rMnFt4eF7mHjEbr1Cr3vqDi3DfxXAQ
	0dXw==
X-Received: by 10.180.82.135 with SMTP id i7mr11732319wiy.85.1428827609780;
	Sun, 12 Apr 2015 01:33:29 -0700 (PDT)
Received: from [10.49.48.182] (089144208182.atnat0017.highway.a1.net.
	[89.144.208.182]) by mx.google.com with ESMTPSA id
	ax10sm6039351wjc.26.2015.04.12.01.33.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Apr 2015 01:33:28 -0700 (PDT)
User-Agent: K-9 Mail for Android
In-Reply-To: <2f1431e35ccf21d9ea3f956bf14ced26980f8f3c.1428714999.git.raj.khem@gmail.com>
References: <9f232e6f50da95ec02e84c6c25a321250e439d79.1428714999.git.raj.khem@gmail.com><cover.1428714999.git.raj.khem@gmail.com>
	<2f1431e35ccf21d9ea3f956bf14ced26980f8f3c.1428714999.git.raj.khem@gmail.com>
MIME-Version: 1.0
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Sun, 12 Apr 2015 10:30:37 +0200
To: Khem Raj <raj.khem@gmail.com>,openembedded-core@lists.openembedded.org
Message-ID: <A43175A7-E10C-4E5D-9E9B-E91744725F7E@gmail.com>
Subject: Re: [PATCH 13/17] sudo: Disable hardening for musl
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
X-List-Received-Date: Sun, 12 Apr 2015 08:33:30 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8

On April 11, 2015 3:20:44 AM GMT+02:00, Khem Raj <raj.khem@gmail.com> wrote:
>musl does not yet enable ssp

What happened to distro feature ssp, BTW?

Thanks,


