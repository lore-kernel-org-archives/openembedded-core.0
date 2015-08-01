Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 659B076643;
	Sat,  1 Aug 2015 13:13:18 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so66272538wib.0;
	Sat, 01 Aug 2015 06:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:content-type:mime-version:content-transfer-encoding;
	bh=OpaqbQ5uHjzjVx6tfCIGWwMqQPTTq6QI4mKMS/SzGDw=;
	b=07wBgj99m0SSemCof/UifMLkx4t62R0jMGKKyeIKARQoBulrfqEJh0rZU37WRPZoT8
	2YZaM3a7mNTcOEci48Yx7c3W5UEyjjhvJEaEzsriigp8QirZGgwsMMd46oE6IZYufuoL
	YtFmRtR/TKnbB07lfnFAiR/GK+GX8PeZzFQSoYIZBrDa7W+Upw9VbHOQAeateugxEmVh
	83sfciuBeQWuNhvldv6WYaRaKvLbVBLB/fQkCQ2xJv8f0x2AufLEWSw7cM13Tal3j1RG
	3QDKhqZqXMNVFtEGi9rffiXUR1JLZ+FEcJk/TJ2NN9Su6ddzh5ZehdS3r+XvmaQ7JPBx
	qnuw==
X-Received: by 10.180.216.42 with SMTP id on10mr17724871wic.3.1438434798354;
	Sat, 01 Aug 2015 06:13:18 -0700 (PDT)
Received: from [192.168.0.7] (212-41-113-53.adsl.solnet.ch. [212.41.113.53])
	by smtp.gmail.com with ESMTPSA id
	bi6sm12453809wjc.25.2015.08.01.06.13.16
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Aug 2015 06:13:17 -0700 (PDT)
Message-ID: <1438434795.3833.4.camel@Saturn.local.all>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Sat, 01 Aug 2015 15:13:15 +0200
In-Reply-To: <CALbNGRTeSPxqOvbxVBtDW6aHk7ncB2CUFDRa9WBVAy0d68S0Pw@mail.gmail.com>
References: <20150730180140.GN2457@jama>
	<CALbNGRTeSPxqOvbxVBtDW6aHk7ncB2CUFDRa9WBVAy0d68S0Pw@mail.gmail.com>
X-Mailer: Evolution 3.10.4 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2015-07-29
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
X-List-Received-Date: Sat, 01 Aug 2015 13:13:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Andreas
Am Samstag, den 01.08.2015, 14:47 +0200 schrieb Andreas Müller:
> >     * /meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs_1.10.1.bb, do_compile
> ^ Had a short look into this: It is caused by update of libgphoto2.
> Hope to find time this weekend.
I did the same and have a backported fix from a later version of gvfs.
i.e. applying
https://git.gnome.org/browse/gvfs/commit/daemon/gvfsbackendgphoto2.c?id=259a09183f7c96b5fb0f6453bb4b0bcf92e3eaa2

Currently I'm compiling an image to test on an ARM target.

Regards
Max



