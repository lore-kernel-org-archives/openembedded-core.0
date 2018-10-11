Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
	[209.85.210.54])
	by mail.openembedded.org (Postfix) with ESMTP id 259E1605C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 11:45:05 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id c32so8575582otb.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 04:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=J2H3DssuMCti0XCA1cz7hz7b70GT7sOV0uwKZ0FM6aU=;
	b=2Cyu41DKTG8GDND/RZt+w+f0L/s5TKUhHaIRdPP1Him0Yq4KhyQDhFHQQKoyFaBWm2
	CW+ypXGGzSpbW/7teAjAX9p1aOTNKgG+kG9p7TqehrNlkv6YiIKmd4d5IU4FuDIWVrCF
	8zUHNR2wqPmvgcF61Vem4eNZ3bHEmAgpa6qcsoiYHctz/3B2zMOhaAHl8KBdyKxkKQcn
	DOgoVR1f2DUmMIecTCco/9T/eMjYRdkuJhoVeNkVMtxtKIY3c5vAIYsL2c7NWqLfO+mP
	80nbL7l98JbYXLoQQ4cvMnXZNEcr0mm1z8cMBJxDbPnkUH7YA22JwTuZZGGYO0wfltTU
	oj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=J2H3DssuMCti0XCA1cz7hz7b70GT7sOV0uwKZ0FM6aU=;
	b=ZLalfu/QN3wrmcV7QQaFF9As04D9P7Vo7W/Bfm/ASXTUuXty9wcecMlL9/iCW7o8H7
	9EAOPPZqhzjDnB3Q9vh5iwobk/OZs5dBf2rW2bz60ULL0rpm0Ie2voLXjnRcWZnubKJ8
	k7RWzRLJmhido4Um31PhlPSTMmCgjEMCDJXEPbQpTL1U/tNVUprpqDJM0Q/bFjKcF2jn
	UO9DBXqfOxRxLVJi1JRCqGCaRW+STyszqDuF3tPToa5PuNJPyu94PDDYw5UNcmMgpMig
	dCaapojNJtgH5Y3SPg2qk1iu05UOFJQei2G45I8pHCtDGSe5Th7HGboLl1vC3rCbF2OP
	jgzQ==
X-Gm-Message-State: ABuFfohhIZUuAfEp1lcdtaWgVX4P1tHUUVrkCpOvTCJ87eyW/InULQ/x
	yHFOPEVcu3S8OE20F/KBFlKp5q7gYBpq7UJ87+ryLw==
X-Google-Smtp-Source: ACcGV63a4Pp0mRHisgwPkO/QyF4epFn8nAtSs1SkH6iIdOgJ7X+KrZYB5/nY+AmTjytjukgY16jL/9MOMPtK7cHKA1Y=
X-Received: by 2002:a9d:44ca:: with SMTP id p10mr712556otg.291.1539258306131; 
	Thu, 11 Oct 2018 04:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <153917392546.324.13433409263803938064@git.openembedded.org>
	<20181010121845.987A72351DE@git.openembedded.org>
	<CA+chaQcmGLJaOi7xPZR90gekFSyrKRb89ZfRbf6-U43xOmh6qQ@mail.gmail.com>
In-Reply-To: <CA+chaQcmGLJaOi7xPZR90gekFSyrKRb89ZfRbf6-U43xOmh6qQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Oct 2018 12:44:54 +0100
Message-ID: <CAJTo0LbRn6aPQg=dY2186S7vqJFrzK24y9V7hte7kZRGgXbhcg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe-commits] [openembedded-core] 02/09: glib-2.0: add missing locale dependencies to PN-ptest
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
X-List-Received-Date: Thu, 11 Oct 2018 11:45:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Oct 2018 at 07:38, Martin Jansa <martin.jansa@gmail.com> wrote:
> This is causing a lot of QA errors like:
>
> lib32-glib-2.0-2.58.0: lib32-glib-2.0-ptest rdepends on lib32-locale-base-ru-ru, but it isn't a build dependency? [build-deps]
> lib32-glib-2.0-2.58.0: lib32-glib-2.0-ptest rdepends on lib32-locale-base-tr-tr, but it isn't a build dependency? [build-deps]

Can you test that adding this to the recipe solves the problem:

DEPENDS_append_libc-glibc = " virtual/libc-locale"

Ross

