Return-Path: <eu@felipetonello.com>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 01C006A543
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 17:47:30 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id k13so1552751wgh.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Jun 2013 10:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=m7Yd3deDgO0hv6oNXxu+ON+KpeFbxyqmyib4PNrK84E=;
	b=ImSqO+O0mlxF6YLWzuhPtRcaGk+aPV/PpfvzKYaUb7paBxsRAzRTxh6dPI01mSVEHW
	oW1mdCNesFJLbQ0Cxl1+VKJ4irM1vp//VS1Sa6FGx4B/t+JsB5ebuKTvtwBSks4Tzmcs
	rjVV5YS1eKjRiUlntQRPF+Y6l1QF+uMpmuGaBx9yzoj1d8uGB272E28F87VZo3XeYVJj
	lJvOySdfC6dgxt+lLks1D9ULgRbNYAR25FSFyXYCLyPv072HqCA6H4jD26R7eEHUKBDq
	UFzFGOxqvIuVZxJhUzpwICJBZjddEVDuQcBUBHk+7YwNlFIUBCRFlR2wE2wRj0HMRwoM
	AeiA==
MIME-Version: 1.0
X-Received: by 10.180.208.49 with SMTP id mb17mr2145228wic.46.1370627251044;
	Fri, 07 Jun 2013 10:47:31 -0700 (PDT)
Received: by 10.194.59.203 with HTTP; Fri, 7 Jun 2013 10:47:30 -0700 (PDT)
In-Reply-To: <20130607174252.GI22710@jama>
References: <1370626502-5233-1-git-send-email-eu@felipetonello.com>
	<20130607174252.GI22710@jama>
Date: Fri, 7 Jun 2013 10:47:30 -0700
Message-ID: <CAGrhNMwW6mbg7WUKbVtjRX1qojb8j6q2krcL9cMVz3JJHaRaSg@mail.gmail.com>
From: Felipe Tonello <eu@felipetonello.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQmwAcF9N7+wJlo7D5R7ST6/W8fe8tcY/vCGXgMXGa/C996ELDEqcxxnpHqJjlyL4axoifL9
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] valgrind: added perl dependency
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
X-List-Received-Date: Fri, 07 Jun 2013 17:47:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Martin,

On Fri, Jun 7, 2013 at 10:42 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Jun 07, 2013 at 10:35:02AM -0700, eu@felipetonello.com wrote:
>> From: "Felipe F. Tonello" <eu@felipetonello.com>
>>
>> This is necessary since the valgrind package depends on /usr/bin/perl.
>>
>> This patch will fix this error while installing into rootfs:
>> Computing transaction...error: Can't install valgrind-3.8.1-r8@armv7a_vfp_neon: no package provides /usr/bin/perl
>
> This doesn't look as build-time dependency and before you add it to
> RDEPENDS_${PN} use grep to find which file in valgrind package is using
> /usr/bin/perl shebang

You are right, it's not a build time dependency, but this fix works anyway hehe.

>
> grep -R '#/usr/bin/perl' packages-split/valgrind
>
> and if it's just some "extra" script not always needed for valgrind,
> then move it to extra package and add perl only to
> PN-this-extra-package.

Yes, this makes sense.

Thank you

Felipe

