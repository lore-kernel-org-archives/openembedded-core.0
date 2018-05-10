Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 738EA751FB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 11:12:20 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id g1-v6so2550693iob.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 May 2018 04:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Lab4IjFLtMcmcan6w+UsumB88HIBG2drnZmvN/YleWg=;
	b=t5uN+f9SKZSkmJkkSzQB7ZgHbo8NXi+lRwmos6FQ1CtGp1VwyBHKu8Bh6baFQaPtQP
	NlcWFGxMz2vR2WAMRNoP/5Pcq2c66fRo/y/SnPjXas/z5P45M3d7xNDeqD1Pyx0NVCFX
	nSCxW0fbDDg1tIy8kvB+S2FdjJizj+X/pwSKSSOJa0r0ODndZfFX15Aiq5qX6WbOVBo4
	eqajEtbQ/p1RmZIg0fzCtOz5PDvrKlu+ORafgIQPL1QqJjl6YHQUf9b+XhihGmhFKBvb
	0qUCMaYJ15VnveeetOsC17KGOqVemL9ABdQbfTdpTKD/8/cpXHf56JlpHbbLpXtjlpEH
	Jl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Lab4IjFLtMcmcan6w+UsumB88HIBG2drnZmvN/YleWg=;
	b=ogUEA+mfgFtbcqJtK3m2GA/85CQU7N2zXc/cLPnee9VtbDCUYcrdl+BVJSZgTmuqfR
	MsBNIEtBJ6ZjVVJHDfqUhLtApus8ZfpL0DTEOZp8fAHTxi7iHPiswQLGr1conRizNNaw
	F7aoZjSIHrQQlnoDeNKU3UlU9uXZBKkIZ8epreo/zPOrNuF0DaA/uqstBR8HTSIOSROt
	+UTt/JNOD3hWSy3ZIq9r2uCjgHyWT6Y0AesUdiw58Ps++KoTlF3iJpajoQLSLPQuoWzL
	cJj4xR2tfOeE4TkWa+cg4zPuMJJHvKc4Nk5P11xTGys3d5yGksA6D4bAt6EaPuH+YfEg
	XBqA==
X-Gm-Message-State: ALKqPwdkeyH3su8dVZGyFhhEPV+fpiteNZ3QdCpyd2dDTcI4tsUHlXwR
	n9VY7kLhGso3lP1Z6rse6Pu5nyUAMVHic8i0XYEWKQ==
X-Google-Smtp-Source: AB8JxZru1n2z8Leasgf7j9Th3rNhjVEo7U0A9um1sQVON8ZO3vcB6e58V1PwNLct1Qj3u+suWTBY3W1/M7sIOpEE6uY=
X-Received: by 2002:a6b:b74b:: with SMTP id
	h72-v6mr926331iof.201.1525950741192; 
	Thu, 10 May 2018 04:12:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Thu, 10 May 2018 04:12:00 -0700 (PDT)
In-Reply-To: <20180503072458.19458-1-hongl.fnst@cn.fujitsu.com>
References: <20180503072458.19458-1-hongl.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 May 2018 12:12:00 +0100
Message-ID: <CAJTo0LbTF1Fi4coWjAJpN8ngx6G8gc0j3Gb54Va9-qgnKOoPSQ@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cups:2.2.6->2.2.7
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
X-List-Received-Date: Thu, 10 May 2018 11:12:20 -0000
Content-Type: text/plain; charset="UTF-8"

Breaks on the autobuilder:

auth.c: In function 'cups_crypt':
auth.c:2021:5: error: unknown type name '_cups_md5_state_t'; did you
mean '_cups_message_t'?
     _cups_md5_state_t state;  /* Primary MD5 state info */
     ^~~~~~~~~~~~~~~~~
     _cups_message_t
auth.c:2022:5: error: unknown type name '_cups_md5_state_t'; did you
mean '_cups_message_t'?
     _cups_md5_state_t state2;  /* Secondary MD5 state info */
     ^~~~~~~~~~~~~~~~~
     _cups_message_t

Ross

