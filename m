Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id B3FDA65D7A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Apr 2014 23:00:34 +0000 (UTC)
Received: by mail-ig0-f175.google.com with SMTP id ur14so1633415igb.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Apr 2014 16:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=taM7IhSb90vxOOfHjvq4vMe7t+XIlQ5nCaQq7ALyRdE=;
	b=yi1HdlluVhIwWjx+9jlbGY60ZhCcHs04hkNyNlI7K+gUjWslktyxrMEtL/oamJSE+u
	6bbF9Lg4gSAWNGzHVBhmrZR6QI1YGVV40Yn3o/tAzbzhUuIjF4v5rR4L/MHpsPRVKIm8
	fVgdXURDHK8aVQLq6P9wzsfompbuvJhbjGnDi5vW1y2xcGaQeX8+i4x5SW6kXS/KAeI8
	TDivlY8jct4st0ViP+R8kphGrSp7pJmuENKJKsT12tJZb8rQHD9bHB1QRNLBKJEeejSW
	M881ZqGEFSb65MqGsqSFLWTIQUYz+cNdiQN4J5e21qA49aP1P7OSDvJbrGGnxnJo6Xhz
	excQ==
X-Received: by 10.42.120.15 with SMTP id d15mr6724459icr.35.1397689235500;
	Wed, 16 Apr 2014 16:00:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.229.14 with HTTP; Wed, 16 Apr 2014 16:00:05 -0700 (PDT)
In-Reply-To: <19970662.Q9VEOkvyDS@peggleto-mobl5.ger.corp.intel.com>
References: <1397640696-21281-1-git-send-email-mac@mcrowe.com>
	<33281528.ls5nyFEmlx@peggleto-mobl5.ger.corp.intel.com>
	<20140416095359.GA9773@mcrowe.com>
	<19970662.Q9VEOkvyDS@peggleto-mobl5.ger.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 16 Apr 2014 16:00:05 -0700
Message-ID: <CAMKF1spBiULOrYb-17LsA7C1MXxz=nZ3_BPu3VfJiqkMaYLqLg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Mike Crowe <mac@mcrowe.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] native.bbclass: Override TARGET_ flags too
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
X-List-Received-Date: Wed, 16 Apr 2014 23:00:34 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 16, 2014 at 2:59 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Since this doesn't look like something recent though I'd like to understand
> why it being effectively wrong hasn't been an issue up to this point.

because unless you build something like mips and arm in single
workspace you don't have different TARGET_LDFLAGS
and issue remains latent. With mips we change the hash-style since
mips can't support gnu style we have to use sysv and
that changes the TARGET_LDFLAGS but it should not change the
native/nativesdk flags only target flags

