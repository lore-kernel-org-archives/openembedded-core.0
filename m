Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0EC8E6F070
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 20:23:05 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id g15so6393968eak.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 12:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:date:message-id:in-reply-to:references:user-agent
	:subject:mime-version:content-type:content-transfer-encoding;
	bh=MQuf+M8mnwzX3OAEY8lOoIjGJue3OUUH6VeyWz0nF9k=;
	b=w4QeerYkzl9ml9AKjdnzcoJrHycIh7o/kjjhZGB2QPYbCw5iDzezX/C06s7VTbO+iS
	GAicEBXTef6gCiPWiiOfFX8xFWjGrm3Q2VIYEhebxq7UM/2do86aUVb90SaLrdZU2RvA
	dgTurYaoRZguFn0/La56a01TvP3X8w0QWsTgV9Chl67b7ilA4eCuRMOmbur9zT4R+eRI
	bWzTr8lvxEaCQ/Hs3oUKB4pjCvxbPjOv/vaFHYClSmsFndQ+dBGy0H4vi27D2fAxiwm0
	aK4Le8D2lO4sCSgH8DfM0nxCpCl78GSH0MiGLej6q54CSxZnYkisvmqvEfXo0Xzk2Tag
	Ussg==
X-Received: by 10.15.77.130 with SMTP id p2mr10738785eey.60.1392754986129;
	Tue, 18 Feb 2014 12:23:06 -0800 (PST)
Received: from [93.111.76.68] (093111076068.atmpu0043.highway.a1.net.
	[93.111.76.68])
	by mx.google.com with ESMTPSA id q44sm74046538eez.1.2014.02.18.12.23.02
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Feb 2014 12:23:05 -0800 (PST)
From: "Bernhard Reutner-Fischer" <rep.dot.nop@gmail.com>
To: Khem Raj <raj.khem@gmail.com>, Jonathan Liu <net147@gmail.com>
Date: Tue, 18 Feb 2014 21:23:05 +0100
Message-ID: <14446aa6118.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
In-Reply-To: <CAMKF1soAoZQg5=oGg_G3Cv5pnW=4ZFys3k=YFNsZ-6UhBfmpkQ@mail.gmail.com>
References: <1392725322-15042-1-git-send-email-net147@gmail.com>
	<CAMKF1soAoZQg5=oGg_G3Cv5pnW=4ZFys3k=YFNsZ-6UhBfmpkQ@mail.gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1 AquaMail/1.3.8 (build:
	2100414)
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types.bbclass: fix cpio IMAGE_CMD to preserve working directory
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
X-List-Received-Date: Tue, 18 Feb 2014 20:23:06 -0000
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 8bit

On 18 February 2014 15:56:41 Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Feb 18, 2014 at 4:08 AM, Jonathan Liu <net147@gmail.com> wrote:
> >  }
> >  IMAGE_CMD_cpio () {
> >         ${CPIO_TOUCH_INIT}
> > -       cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc 
> >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
> > +       (cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc 
> >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio))
> >  }
> >
>
> this would fork a new shell. you could also do something like
>  cd ${IMAGE_ROOTFS} && (find . | cpio -o -H newc
> >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio) && cd -

Or just pull the cd into the find subshell... ;)
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



Sent with AquaMail for Android
http://www.aqua-mail.com



