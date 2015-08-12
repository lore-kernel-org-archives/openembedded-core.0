Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 30D8560034
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 16:57:20 +0000 (UTC)
Received: by iodb91 with SMTP id b91so26103331iod.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 09:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=aYg9WrmhQ2bExCHscK8eoH/PDSiAdrxpYlZlPGr7n84=;
	b=aGqSGeXPe+IovGwSJOl6fthxy73n0bVDz4Sz6h9fZiobilwhAbsKMDsKmVdIGFaYXQ
	44PPbSJnbtiecLqB9CVcNdy981AMoqrlURYrKDAcQnSHpMfke/GnYwTAOUAzSnNbHZ5a
	vPvYWBTLPWC6ACOgdJVcmpHWFBlb+B7++KYy6oYR8m7P9x1NQMjaV01jYk37HZg8KGbb
	8r0+fze/rYFvlqZBZ+lB2cDaYAvvU86b6ooPBonRXYaziygCdjGdRvC00CbSSz9dzkRc
	IjnUZz+XLZS8BlgjiVreWBg6ZWIwSJQbRIBkcdO7uja1YhVRB62DrvTECY0aMLxUEuoO
	+TnA==
X-Received: by 10.107.34.194 with SMTP id i185mr32503007ioi.49.1439398640805; 
	Wed, 12 Aug 2015 09:57:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Wed, 12 Aug 2015 09:56:51 -0700 (PDT)
In-Reply-To: <20150812094953.GL6102@loska>
References: <1439303596-18965-1-git-send-email-ed.bartosh@linux.intel.com>
	<1439372011-26268-1-git-send-email-ed.bartosh@linux.intel.com>
	<20150812094953.GL6102@loska>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Aug 2015 09:56:51 -0700
Message-ID: <CAMKF1squ7h9gzvrX8u3m2_K_BeO7gto_ji5f4UBdJxnuNMyLZA@mail.gmail.com>
To: Mikko.Rapeli@bmw.de
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: shell script guidelines in oe-core? (was Re: [PATCH v4] create-pull-request: cleanup bashisms)
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
X-List-Received-Date: Wed, 12 Aug 2015 16:57:21 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 12, 2015 at 2:49 AM,  <Mikko.Rapeli@bmw.de> wrote:
> This reminded me of the problems I've seen with various oe-core shell scripts:
> they are missing systematic error handling.
>
> IMO using bash and 'set -euxo pipefail' are a good approach to catch errors
> early in shell scripts. Manually checking for $? is error prone and things
> like pipes can hide them. Using undefined variables is another thing
> which should fail early before things go horribly wrong. And in build automation
> I'd rather see output of -x since things can fail in mysterious ways.
> And then there's quoting....
>
> One useful guide is to use shellcheck as static analysis tool for shell scripts.
>
> I guess internally bitbake uses at least set -e.
>
> Comments?

all these are good suggestions, I would recommend to open bugs for all
of these some of them might need
to cite the scripts which need fixing.

