Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3C5F86FD28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Sep 2014 06:10:55 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id tr6so5890916ieb.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 23:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=hh3vHNMJRgOC8QrWnciLSj8XtmfIcf4okQexGxshkzk=;
	b=Br623u0ijFFNiftK7fgq/ntxxuiGE/2fhiz2c237Ld2NrhaqhJzmu1k97SuCzBa0rZ
	nYt/I5fCtL96q5me1FWGMtiSaBKz8K9VVmkt+ge9zrkPVR0Ccv5brMSZwzDEFe/UX9OM
	77h9BxyJXMEpnoa9FdD06F2E+Dw3AhogIB7w8Qpil1tYm2fP7GObwRmiwS+jqv53ZyWu
	ghOteWI1vXnczCsec0WLJvcPqnd6dABxYbzzTawFchHp2sGiaD0wjPQjG+bh8gjmU6Mh
	VJOy1GL1+QDm/mtjwa8pkqoIc8fql7ww4w4PWyGXGeXdJJ34she9mQdvl0jMrkl+gTME
	m7iQ==
X-Received: by 10.42.83.131 with SMTP id h3mr16721icl.77.1410847856539; Mon,
	15 Sep 2014 23:10:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Mon, 15 Sep 2014 23:10:26 -0700 (PDT)
In-Reply-To: <1410555811-30996-1-git-send-email-jslater@windriver.com>
References: <1410555811-30996-1-git-send-email-jslater@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Sep 2014 23:10:26 -0700
Message-ID: <CAMKF1spCXYs2OSUdjN4XCFLJsAX4iHHOQRzqEjEGf9uq7uZDFQ@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sysprof: add aarch64 support
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
X-List-Received-Date: Tue, 16 Sep 2014 06:11:00 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 12, 2014 at 2:03 PM, Joe Slater <jslater@windriver.com> wrote:
> -+#ifdef __arm__
> ++#if defined(__arm__) || defined(__aarch64__)
>  +/*

This code defined memory barriers for 32bit, Are you sure it should be
same for 64bit as well ?
how was this tested ?

