Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id A1A947E553
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 13:15:41 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id b9so19641894wrs.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Oct 2019 06:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=qyvuEd41iXomubw3HBI/MPGJiwwuEcG8JWtbZ86KE88=;
	b=T6cth2ly78Gplg63DtphIewI78cOSGN6T6BLqJ3o/vtBUG+Lt4hIwVatsbO+8Xe/Sv
	F3k5bwqfM8UpesA2HMOGOGavIF3y9iXgG+U1FodEnOdJ5mSRvxBeXSsJWVAr/vWKiAlS
	iSG+RxMgMjVrLY86OeOydicyZU7lDrq/AdaAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=qyvuEd41iXomubw3HBI/MPGJiwwuEcG8JWtbZ86KE88=;
	b=GS5kKBQIEXwkohiwwQIpzPvFECdBD94FsArNT3/lRi4RIz3w5RsdXAhlSEQy2Ts3S9
	Ulb1P96Of7I23qHKWcBETpU5Z/+UYaT7J5/cXdwocmq+bmwIkFHNtMk0JczoTVRiI771
	cb/dwQS80nOQfePp7L1NMshfLMrqUzF1K5oAEbbS4ZpTqV2PPHc+6L1zuF8F0JJcMr4U
	zjCK/RC/5CkwLNj7c3RXEpax53/dEcs1lv+kNY9XEue+kzpiYl7QLJjd00TeImHRpMuS
	459SY7qHzQFX1z39+jK4+e6CdVPGmiTbM5r5QjvYnVLK/Hk6YC/UGAeWgX0GtG30tlTq
	No/A==
X-Gm-Message-State: APjAAAX0LapGI9eRiRrXE8PBmb7iEs4M08I0HBgWmVNtSAE2NWlzXolT
	yvqGH9eXBhhFtE2ImE3Vfoqzug==
X-Google-Smtp-Source: APXvYqzP7l5TITItFXI7pmix9s2KiRaVTbYleQKoh6gEeY0gdkaFg+0Q96Ll6VixzJsl6trgTeVHpQ==
X-Received: by 2002:a5d:620d:: with SMTP id y13mr2601092wru.86.1570022142365; 
	Wed, 02 Oct 2019 06:15:42 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id z3sm5567767wmi.30.2019.10.02.06.15.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 02 Oct 2019 06:15:41 -0700 (PDT)
Message-ID: <7fb2fcf3aad554c6f6bc88935ab7b241b86fd87b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ycn aKaJoseph <ycnakajsph@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 02 Oct 2019 14:15:40 +0100
In-Reply-To: <CAC3TgA+C1NuNXu31nbB2J3Qw6j0FgLUZK+sxL3xO-JJ7f4oPAQ@mail.gmail.com>
References: <CAC3TgA+C1NuNXu31nbB2J3Qw6j0FgLUZK+sxL3xO-JJ7f4oPAQ@mail.gmail.com>
User-Agent: Evolution 3.34.0-1 
MIME-Version: 1.0
Subject: Re: [kernel-cache][PATCH] bug 13333 Add SPDX license headers to all source files for yocto-kernel-cache
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
X-List-Received-Date: Wed, 02 Oct 2019 13:15:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

diff --git a/staging/small-ck-stage.scc b/staging/small-ck-stage.scc
index 0508194..328de6e 100644
--- a/staging/small-ck-stage.scc
+++ b/staging/small-ck-stage.scc
@@ -1 +1,2 @@
-include small/small-ck.scc
+# SPDX-License-Identifier: MIT
+include small/small-ck.scc
\ No newline at end of file

It looks very like your patch has stripped all the newlines off the
last lines in the files. I suspect we probably don't want to do that.

Also, please follow the section in the README, "Submitting Patches" as
the mailing list is incorrect.

Cheers,

Richard


