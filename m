Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
	[209.85.219.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1E55F7C24D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Feb 2019 11:53:56 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id 7so5406131ybp.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 03:53:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=zjEVbaNq0EQoNGxyqbyHnitjHLPrKl8PRhCL5j0JYVg=;
	b=kCFxIlw1SHsNag9413pU+vlGnvtMyPnnMv0fTySNJKrOedJ74nrr8jtDSuRo6V5Z8S
	q+guEPfbXBswkYrxUwpyZOYj25qx3HQbNp54DuQy7GK4tpCf5zNZZMHytVCnTEWXo699
	Y9Jq9zpCn1iXUQ5/z35KsYPrcPxYm4hdFgE3TzpmBxGf68gkbiXu2EzsdX+acXMZOroa
	kMRc8m6Jqet6j9nDAeW4ADQWr9cNFNJKZ+mQOghdk8hMdgHOh849kl3pZ+0TjiSAeZYA
	Cqq0o4LciayraivpPaXhZAj6AFPuxrZO1GDRYOqJIJXdh6R3Pr9Gl5/d5qlEXy02lidw
	xdzw==
X-Gm-Message-State: AJcUukdB4rtMzNzpp4b3Qxtli7jqAj3ixEos4uSoYafkxPgldb9G+Pl0
	vwOTpwGqXwooLp6S39wW14VZbzj3
X-Google-Smtp-Source: ALg8bN4esw0xHUyDGWQdOJGZNE6kAFLWD7lOCCQWsfKw9CCfp1Yr/Uh6YESAEhUwbE4MyAFIdUDyqQ==
X-Received: by 2002:a25:23d7:: with SMTP id
	j206mr39784820ybj.213.1549281237914; 
	Mon, 04 Feb 2019 03:53:57 -0800 (PST)
Received: from bluvision ([77.107.218.170]) by smtp.gmail.com with ESMTPSA id
	x133sm6929142ywg.57.2019.02.04.03.53.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Feb 2019 03:53:57 -0800 (PST)
Message-ID: <801ec212e1bc34947eba0b6c288a8e458fae09eb.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 04 Feb 2019 11:53:55 +0000
In-Reply-To: <6a968439b13cc6e02c74c75f4441fc7918443794.camel@linuxfoundation.org>
References: <20190114125632.4780-1-git@andred.net>
	<20190116125124.20177-1-git@andred.net>
	<6a968439b13cc6e02c74c75f4441fc7918443794.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH v4 00/12] util-linux: one package per binary
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
X-List-Received-Date: Mon, 04 Feb 2019 11:53:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Actually,

On Fri, 2019-02-01 at 07:32 +0000, Richard Purdie wrote:
> On Wed, 2019-01-16 at 12:51 +0000, André Draszik wrote:
> > v4:
> > * update patch 06/15
> >   * unconditionally assign PACKAGE_PREPROCESS_FUNCS
> > * update patch 07/15
> >   * introduce update_files() helper function
> 
> Ran this in -next but we saw things like:
> 
> ERROR: util-linux-2.32.1-r0 do_package: QA Issue: util-linux:
> Files/directories were installed but not shipped in any package:
>   /usr/bin/x86_64
>   /usr/bin/i386
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within
> do_install
> 
> (from
> https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/267662/raw
> )
> qemuarm was similar:
> https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/267853/raw

I didn't have access to these logs before - the 2nd log shows a failure in
nativesdk. My v5 only addresses the failure for non-nativesdk builds.

No need to try v5...


Cheers,
André



