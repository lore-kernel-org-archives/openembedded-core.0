Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3D5DB7C1E9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Feb 2019 12:39:11 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y185so9987772wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Feb 2019 04:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=gA2dJ46mNhxrQ0yraJaA1TdfpUNuUR8l9r1VXtK7iCo=;
	b=QNEmvHLOm6YvUwlJRnDAMdGv/CQvfD9leBaEGbWQQ7kC7drjvMkMeeR/2FW+1edvtR
	bS5d3hRI/UPRbv7eZAYqZRWTQn6wThS+r5kcAQ1ZHILoDsgtkFPmRcLYaKjQNl9bobUZ
	7ziiSYygcInr5yZM9mnGNbOQ2f4Xyl7QZ043o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=gA2dJ46mNhxrQ0yraJaA1TdfpUNuUR8l9r1VXtK7iCo=;
	b=jbqiawx/f3/tay6NyumbOfOy6KkhkR1tRsJWWQqKmDyOjkCW0D5wVhg+XwjrbUoKHb
	AhIkp8aQXKpp/No8OGUbKY8zWxRG2iYOZgrMaP/44fo98yXSjMg/29DGbusiEAN8qb00
	dbifXyy4Pyjtqggq+I1v1sA46/qFsGMrnvPGlbhRqxYJHeufvzPlhEyPTqng1q06EK51
	6qmgAWDOOG+d7fpm2wfuwffMIvTSNw+n/e4jvZbdralLueBmB3FxrJd2QwKtbIdXSo+2
	Imfgwf/jVf9drtl2Ftj67vZTf6dNy75cpdW88thfDJ+gy0YXr3gQG/hE8fqgIL2hhKcE
	70AA==
X-Gm-Message-State: AHQUAua9VSyGL8UzIowwIAMrn6Z7cr9Nc7gTA/QyrNgrU54yoZQnJ3a6
	sALyRbvvItRIyjhNwgvPanP+MA==
X-Google-Smtp-Source: AHgI3IaJuJLN+OqtyDzpPhLh9h7VE8z7TJWMdRD/Jnz1yPRsR5Bhkdw0cxpOa8qslKH3o3mW8akKgw==
X-Received: by 2002:a1c:1a8a:: with SMTP id
	a132mr13751343wma.109.1549283951782; 
	Mon, 04 Feb 2019 04:39:11 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h62sm11358261wmf.11.2019.02.04.04.39.10
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 04 Feb 2019 04:39:10 -0800 (PST)
Message-ID: <18defd991252316f39bd4904e00e060d2a701082.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 04 Feb 2019 12:39:09 +0000
In-Reply-To: <801ec212e1bc34947eba0b6c288a8e458fae09eb.camel@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190116125124.20177-1-git@andred.net>
	<6a968439b13cc6e02c74c75f4441fc7918443794.camel@linuxfoundation.org>
	<801ec212e1bc34947eba0b6c288a8e458fae09eb.camel@andred.net>
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
X-List-Received-Date: Mon, 04 Feb 2019 12:39:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2019-02-04 at 11:53 +0000, André Draszik wrote:
> Actually,
> 
> On Fri, 2019-02-01 at 07:32 +0000, Richard Purdie wrote:
> > On Wed, 2019-01-16 at 12:51 +0000, André Draszik wrote:
> > > v4:
> > > * update patch 06/15
> > >   * unconditionally assign PACKAGE_PREPROCESS_FUNCS
> > > * update patch 07/15
> > >   * introduce update_files() helper function
> > 
> > Ran this in -next but we saw things like:
> > 
> > ERROR: util-linux-2.32.1-r0 do_package: QA Issue: util-linux:
> > Files/directories were installed but not shipped in any package:
> >   /usr/bin/x86_64
> >   /usr/bin/i386
> > Please set FILES such that these items are packaged. Alternatively
> > if
> > they are unneeded, avoid installing them or delete them within
> > do_install
> > 
> > (from
> > https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/267662/raw
> > )
> > qemuarm was similar:
> > https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/267853/raw
> 
> I didn't have access to these logs before - the 2nd log shows a
> failure in
> nativesdk. My v5 only addresses the failure for non-nativesdk builds.
> 
> No need to try v5...

Well, its actually in progress already:

https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/193

Cheers,

Richard




