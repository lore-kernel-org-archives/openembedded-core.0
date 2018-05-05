Return-Path: <anonumiko@gmail.com>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 04BD4748D8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 20:05:41 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id f18-v6so9780012lfc.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 May 2018 13:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=0l6PfyDxhOL6dlReAEd0d2COArOxPonVMfMNJdG18m4=;
	b=iEUmGv7ScZU5B0HRByZ7Xw2Lj3OAUhYKrdsMXzKimAEfVz8cGlUXzcsxrc5B060RMt
	mKauqfrlTdiJZI+/rNm10m/4f0pkqVOEdjoezKc0AwOWV4oL5QIRQ0wFkWNZSRTnwM9m
	3hRI9gAv7CTgoKvFKjj2RjgyM85XsG9lQlI8wNYOLIdWV9vBCC40hzsB+CM9jgtJB0VP
	fxzTB2W51k0jmOlb4HjjLQofKCTzgm/qRETed4p94xltbv5LS2dlG5LxqE2BWoQvnl6N
	G8Ry7NORvrdc3KJFpiOXasfJZLdMpAFMyc7fuMmNKtC9ysR+ZbcPuYGPKIs8Q+v31Mce
	oXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=0l6PfyDxhOL6dlReAEd0d2COArOxPonVMfMNJdG18m4=;
	b=MAPTL7BXmKcUyvjPgDLt7OyMngBIiL8eIszDlpzcrsymqkYHNwPU3TncO55Tmdbld+
	mw4mK7N8Hp6DCsKDaHiEiXMvf1rPx/t9d/CHCs3kiDM6xUVtKg0wvW9xgXmOfIpzajcj
	visX+UK4X8kZrpfAIFnOAeTLGEjEByAXdDXSanaTWpnXfvapsl2uaK4yutckBEZrUSPb
	RUV0g9U3/reJOdGTPhjsvzNesjTExLKBCVBlxy3yKJRRsEMSH5WgbHZdqKDLzRtSmS6v
	h+MHKmx8en0A7/o+rEALEMNI1GBlbYP01XvZ/9oGLsRPE73YPLuEwXFXUZUpQEu1R4zm
	Es8g==
X-Gm-Message-State: ALQs6tCLLEoeQQvs+WS0VdiyCnU6qF6m433pUeVcPGlvAWPtgVI35hvk
	1e6iay+YLDBhRSs/4C0okAnGE2Vq
X-Google-Smtp-Source: AB8JxZpSdnZ6bIZHOD1U+3DQJ921SRGjBmll6qTwkKxbUsyIvwalUFjQzxNwNqHMU8bccpSWT3JArA==
X-Received: by 2002:a2e:6808:: with SMTP id
	c8-v6mr20913224lja.109.1525550742114; 
	Sat, 05 May 2018 13:05:42 -0700 (PDT)
Received: from [82.181.15.94] (82-181-15-94.bb.dnainternet.fi. [82.181.15.94])
	by smtp.gmail.com with ESMTPSA id
	h28-v6sm433743lfk.82.2018.05.05.13.05.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 May 2018 13:05:41 -0700 (PDT)
Sender: anonumiko <anonumiko@gmail.com>
To: ross.burton@intel.com
References: <20180420140930.8149-1-niko.mauno@vaisala.com>
	<20180420140930.8149-2-niko.mauno@vaisala.com>
	<CAJTo0Lb85CAs8Y+fX=b8J=AQD29DwpeseVwUEVMi5OXmAu0ewA@mail.gmail.com>
From: Niko Mauno <niko.mauno@iki.fi>
Message-ID: <b5792510-1d96-e273-58e8-ae4c54326cb6@iki.fi>
Date: Sat, 5 May 2018 23:05:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lb85CAs8Y+fX=b8J=AQD29DwpeseVwUEVMi5OXmAu0ewA@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] e2fsprogs: Complement update-alternatives scope
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
X-List-Received-Date: Sat, 05 May 2018 20:05:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/03/2018 03:56 PM, Burton, Ross wrote:
> Breaks packaging:
> 
> packages/corei7-64-poky-linux/e2fsprogs/e2fsprogs-mke2fs: FILELIST: removed
> "/sbin/mkfs.ext2 /sbin/mke2fs", added "/sbin/mkfs.ext2.e2fsprogs"
> packages/corei7-64-poky-linux/e2fsprogs/e2fsprogs-tune2fs: FILELIST:
> removed "/sbin/tune2fs"
> packages/corei7-64-poky-linux/e2fsprogs/e2fsprogs: PKGSIZE changed from
> 419692 to 645500 (+54%)
> packages/corei7-64-poky-linux/e2fsprogs/e2fsprogs: FILELIST: added
> "/sbin/mke2fs.e2fsprogs /sbin/tune2fs.e2fsprogs"

Thanks, submitted v2: http://lists.openembedded.org/pipermail/openembedded-core/2018-May/150468.html

With v2 I got:

$ buildhistory-diff
packages/i586-poky-linux/e2fsprogs/e2fsprogs-mke2fs: FILELIST: removed "/sbin/mkfs.ext2 /sbin/mke2fs", added "/sbin/mkfs.ext2.e2fsprogs /sbin/mke2fs.e2fsprogs"
  * FILES: removed "/sbin/mke2fs", added "/sbin/mke2fs.e2fsprogs"
packages/i586-poky-linux/e2fsprogs/e2fsprogs-mke2fs: RDEPENDS: added "update-alternatives-opkg"
packages/i586-poky-linux/e2fsprogs/e2fsprogs-tune2fs: FILELIST: removed "/sbin/tune2fs", added "/sbin/tune2fs.e2fsprogs"
  * FILES: removed "/sbin/tune2fs", added "/sbin/tune2fs.e2fsprogs"
packages/i586-poky-linux/e2fsprogs/e2fsprogs-tune2fs: RDEPENDS: added "update-alternatives-opkg"
packages/i586-poky-linux/e2fsprogs/e2fsprogs-mke2fs: pkg_postinst added:
  @@ -0,0 +1 @@
  +#!/bin/sh\nset -e\n\tupdate-alternatives --install /sbin/mke2fs mke2fs /sbin/mke2fs.e2fsprogs 100\n\tupdate-alternatives --install /sbin/mkfs.ext2 mkfs.ext2 /sbin/mkfs.ext2.e2fsprogs 100\n
  --
packages/i586-poky-linux/e2fsprogs/e2fsprogs-mke2fs: pkg_prerm added:
  @@ -0,0 +1 @@
  +#!/bin/sh\nset -e\n\tupdate-alternatives --remove  mke2fs /sbin/mke2fs.e2fsprogs\n\tupdate-alternatives --remove  mkfs.ext2 /sbin/mkfs.ext2.e2fsprogs\n
  --
packages/i586-poky-linux/e2fsprogs/e2fsprogs-tune2fs: pkg_postinst added:
  @@ -0,0 +1 @@
  +#!/bin/sh\nset -e\n\tupdate-alternatives --install /sbin/tune2fs tune2fs /sbin/tune2fs.e2fsprogs 100\n
  --
packages/i586-poky-linux/e2fsprogs/e2fsprogs-tune2fs: pkg_prerm added:
  @@ -0,0 +1 @@
  +#!/bin/sh\nset -e\n\tupdate-alternatives --remove  tune2fs /sbin/tune2fs.e2fsprogs\n
  --


-Niko

