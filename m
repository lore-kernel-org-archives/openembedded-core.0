Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4F87177F99
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 16:08:52 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id d127so19127080wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 09:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=x+TjlJsTCtuHCJx8Tunj9AlEJwspyu3lufTqztyDCZw=;
	b=so28+AqUdR5yrcq4XICbOmpMVPrGNbqUKjnQ4A/5XmTRqylAV5f6wXa96MN2UCba5P
	tRBRdceaq6d3Bj6wYep70OeumX7ltMJvM/1/2OjRTySIE/12ro3ZlT8jR3AeV5vMCRKV
	EGifLivK3NS5cp5MOGicFe5U+cTbOsiaBRXtWgjuxFRKbfp4bLR9FxmZms/DKb3sIJwq
	TqexGdsISL+WWH4+/Qbo5gvcLIU6p3Rg9rM90XZJeQ4Ton7TqzfmssDu1vo0ouZwi2KV
	mWlR/Xk7L/0Y1gmAPRb5KPaNlmcFWc4sV9wKvXO9UAXxvnQlKxyvCmjSKpnDO3jQTxwl
	S4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=x+TjlJsTCtuHCJx8Tunj9AlEJwspyu3lufTqztyDCZw=;
	b=V+5ptKYoDaFhPGQLnHFPBNh8H507L9ZBhofLn7s0LrxkyyNxkbEYxjBfik4zSASicx
	ytD4Va+9eOFRNj5vQ49GqelrJKVP6X85sBVVDRFHq/naE6eCGfo7902i/yM23y2WodpW
	9bjnDja2bUokXdPE+AcKSKcG5QJgHpW+3Tp20PyYsx9/i3thiIClAzNyPmArFo2K9C07
	kobGZ2y5/D2EdhCancthEDbir1q9ktFvl/sDfcQOHiYGTp+SixIrAiv5XmsPz5ns429+
	5/vBqTlrfzkoUB9Wp0MQKpiFdTa/OCnS/xPI5q9oHMxUjhZDbT1RXkXgVTuD/oN7MK3O
	3Q+w==
X-Gm-Message-State: AODbwcCIPFCsnNQq9NRFSklPWy485tgdL3KjfHVxRbM1W/Ud4t79HQS2
	6ZQHwauZFc47jA==
X-Received: by 10.28.61.215 with SMTP id k206mr7598230wma.133.1495210134020;
	Fri, 19 May 2017 09:08:54 -0700 (PDT)
Received: from Saturn.local.all (138-14-48-195.pool.dsl-net.ch.
	[195.48.14.138]) by smtp.gmail.com with ESMTPSA id
	e83sm26357271wmc.28.2017.05.19.09.08.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 May 2017 09:08:53 -0700 (PDT)
Message-ID: <1495210132.3247.7.camel@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 May 2017 18:08:52 +0200
In-Reply-To: <CAJTo0Lbf1u7b+X6JTH-S+n+N80OSkFGcZnvoRnAKBgcqQ2q6xg@mail.gmail.com>
References: <20170519154856.21505-1-max.krummenacher@toradex.com>
	<CAJTo0Lbf1u7b+X6JTH-S+n+N80OSkFGcZnvoRnAKBgcqQ2q6xg@mail.gmail.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] libsolv: don't pick up bundled db from host rpm
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
X-List-Received-Date: Fri, 19 May 2017 16:08:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Freitag, den 19.05.2017, 16:51 +0100 schrieb Burton, Ross:
> On 19 May 2017 at 16:48, Max Krummenacher <max.oss.09@gmail.com> wrote:
> 
> > +Upstream-Status: Inappropriate [oe build specific]
> > 
> 
> Is this really inappropriate?  We're finding a bug in the build system but
> that doesn't mean we're the cause of the breakage.

Yes, I think so.

In the OE setup we have our own sysroot with a variant of rpm-devel and the build host has one in
/usr/...

I think that upstream need not assume that it is configured on a build host where it sees two
differently configured rpm development packages.

For my approach to work the bundled Berkely db must provide the function db_create_rpmdb which is
more likely to change than the filename db.h.

Max

> 
> Ross

