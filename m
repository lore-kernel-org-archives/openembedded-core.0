Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f178.google.com (unknown [209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id D85CA65D33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 20:30:16 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id rl12so10860049iec.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 13:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=MVqx1ymgNy5p8uEoiQGCuWJdCgThDgHttDGc2vIzZnU=;
	b=JnSTZUXEFIb+e/2Y5raw8fPIK/oWbDOp7ujxP43OvXEJqTeV4CQOKyYBL7YYSdI5E3
	iT7pM84bIKLSNkj/MuWkFl1KhfpL7wMiqah1NLnh9hkDfRWVBWTRVNZJejvGji2w1RtK
	ivriaQ+TBFEcmqakKf6UJHRUG/u4DmxNMta52w04igRok3RKp61mt6oY9iYsonSGgrGA
	8HMMyZ2nRrTf+hPgRMN9om6M+9hUyMjEXyYYMQlSfjSdy5dAqbdQGgHG69bIOjL+UCcQ
	FXkOX3izfSEIbWZGaDtu2WJgJJNAGyX9l9NgeYZEPIz9wgepAxOcQGc/Iu/jPatFXRId
	xY2g==
X-Received: by 10.42.50.68 with SMTP id z4mr2474938icf.70.1401309017358; Wed,
	28 May 2014 13:30:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.117.33 with HTTP; Wed, 28 May 2014 13:29:47 -0700 (PDT)
In-Reply-To: <CACS+7ZSGKFG06F_jFOJZu7FJqLh2F+FgkW30PSMRQ8Xdio51Qw@mail.gmail.com>
References: <CACS+7ZSGKFG06F_jFOJZu7FJqLh2F+FgkW30PSMRQ8Xdio51Qw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 May 2014 13:29:47 -0700
Message-ID: <CAMKF1soJxRchiG2YCNs8oiQZEmeD8Xx7JBFEb0RVxEtwKCaeHA@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gzip: Avoid host contamination during build
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
X-List-Received-Date: Wed, 28 May 2014 20:30:19 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 27, 2014 at 4:38 PM, Dan McGregor <danismostlikely@gmail.com> wrote:
> +EXTRA_OEMAKE = "GREP=${base_bindir}/grep"

is this grep path encoded into gzip and then referred when running ?

