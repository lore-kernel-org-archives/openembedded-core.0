Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1A76C6B8D1
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 10:34:03 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id va2so3973565obc.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Mar 2014 02:34:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TKACzwNQ+/Qq+i3YcLf+L9YkuhhSB8mU9Sd94SiqupI=;
	b=ejxSrn6v/3Su8pFeI2F3CDp/q8Q8WsVt3vNlQHnmZV0b2WmCP/vQ1WYBNprE/SztKO
	pFLDOlIc1V9u8hIFX4Wf4Vrvp0Lnil54/MEkjZ6U8U+Y7VnEnEFdoegj3VlqKLPlZCnd
	a3/Ece94HJm3LJpmsrQVYI0ClVV5z3oTnr3gmP4OeDp+pK57hljqkrfX0sNWr1Al/6XU
	JrVpeWwbcOLgOYvU3eG3aepOB0kSLYhpfAGuKxTgXN+IDZmaabaIxy1MrcgTmWy+IPEL
	bTfoYhHbTctFiuOSSJty4puBbXzuwLntITbw1Uva7eKxs85DnxTngDfI5q1DG3fXgLJK
	nhfA==
X-Gm-Message-State: ALoCoQlUTz0U9gu8Uhyfiw9aGgdQG3+sty8HIcGwehkrd8f9LseGpqsRFOuzcTRGiSMZlwCbiNfL
X-Received: by 10.182.18.102 with SMTP id v6mr110933obd.71.1394188443764; Fri,
	07 Mar 2014 02:34:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.182.99 with HTTP; Fri, 7 Mar 2014 02:33:42 -0800 (PST)
In-Reply-To: <CAMKF1sqrQ7y=UVUVgBt0nuYM=xTGofwSw2cuha91CN6rQg0TKQ@mail.gmail.com>
References: <1393965644-17393-1-git-send-email-abelous@broadcom.com>
	<1393969384.4151.5.camel@e130.pbcl.net>
	<AC63B68CC9C36B4FBF9FD4FEEFE754AA20DAA367@SJEXCHMB06.corp.ad.broadcom.com>
	<CAMKF1sqrQ7y=UVUVgBt0nuYM=xTGofwSw2cuha91CN6rQg0TKQ@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 7 Mar 2014 18:33:42 +0800
Message-ID: <CAP71WjyKO+CKgNAr-ZB+17O=8dwb=_-aRKWNWnNRmMikoibyrA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Signed-off-by: Andrey Belous <abelous@broadcom.com>
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
X-List-Received-Date: Fri, 07 Mar 2014 10:34:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Khem,

On Fri, Mar 7, 2014 at 6:43 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Mar 4, 2014 at 1:55 PM, Andrey Belous <abelous@broadcom.com> wrote:
>> Hi Phil,
>> I have prebuild uclibc library that I would like to use, without that change I cannot force to use my prebuild library
>>
>
> OK so write a uclibc recipe for it and let it provide virtual/libc
> and, we can very well have multiple version of recipes, this is no
> different. Then use higher DEFAULT_PREFERENCE for your recipe.

I still don't get it why in distro/include/tclibc-uclibc.inc we have

PREFERRED_PROVIDER_virtual/libc = "uclibc"
PREFERRED_PROVIDER_virtual/libiconv ?= "libiconv"
PREFERRED_PROVIDER_virtual/libintl ?= "gettext"
PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-eglibc"
PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-eglibc"

and in distro/include/tclibc-eglibc.inc, we have:

PREFERRED_PROVIDER_virtual/libiconv ?= "eglibc"
PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-eglibc"
PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-eglibc"
PREFERRED_PROVIDER_virtual/libintl ?= "eglibc"
PREFERRED_PROVIDER_virtual/libc ?= "eglibc"
PREFERRED_PROVIDER_virtual/nativesdk-libc ?= "nativesdk-eglibc"
PREFERRED_PROVIDER_virtual/libc-locale ?= "eglibc-locale"

Is a specific reason why in the first case we use "=" and not "?="
like used everywhere else? This file is loaded last, so we have no
chance to override the value. regardless of the actual reason, don't
we need the change anyways?

