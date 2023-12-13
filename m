Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BA78C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 20:15:15 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.46965.1702498510948250693
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 12:15:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Hj3/CoJA;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40c29f7b068so69431155e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 12:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702498509; x=1703103309; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NJn5Nx6PP26Au7WNfvCnL0TnuvhzU3lF2PWgxdYqWSE=;
        b=Hj3/CoJAdC3eonN7ivtcoRcbxDrUJTp68d52hGZebGMYjeJolGXmorebjVBPInjD2R
         lY6cVpTCAX1De71M++4KYlqJns8DdEqzrYS3H5B4dg+qfoVt9GVFhzob5tTHi01PgrQh
         pYismI8Uwb77RPPqc6VM/8L4jZnP88Q7QUUaoR+Ik/vipXTDn7GwhQbCHtoxP4nULX0U
         GZh6V8TDQj1lbtTZ/geG+vO0hatEIjRwsSChdn/g3TpQbcbNo+hcR7QD46OOIbeD3zaG
         p/eAKq5Iqt8ZzqurCPHvv52ShYKt0voO/71vVym3BuPHXVAN6xiyw7EMfrFG5zEbVG9v
         TWMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702498509; x=1703103309;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NJn5Nx6PP26Au7WNfvCnL0TnuvhzU3lF2PWgxdYqWSE=;
        b=CZlu9ezKNGCmPf0mXBpZX5U3hK0AYMH0uXYFvvHwVC1WFLmxxm83zZWtEjffEOtRdg
         7AefNbhMny78WyfUFeXhH8MgfjKjDY6OY2u5hok+dZ/2xDn4qwo5hTRUstT+cm7KBIpH
         tVrKPUUg1e2F7iJ6+/053dPjdPQT7Pln3DxPLry7m2/SuXLUh/l78Vjd+dVT0Hq0UYUB
         +HtvG2ekNinVdLUiWtETX9EuGjaOdhwyThLs2h9XQ1TU+MLy6dTKDBE85p7ZnH8h49Ac
         l8wvoc8ZhIbnPLpVa9K/n/wF4hOs0FeWbAt9ku0Cp/nL1WRoezBd6fdjLIqcd8jfaC+K
         Yyjg==
X-Gm-Message-State: AOJu0YzLLTw+o+7kvSUGaWxzVCrBTB+hQcVKqTs+9BVxMrSKBGyA8UXv
	U8OSROg/PjUrNai3vpSEG/8=
X-Google-Smtp-Source: AGHT+IGjpsAHHYm3nG2Q8KtrMmkdrMbXXP0Uuu94s4ESZkQPf9xcEdgEERYlVxLGCAjb8Gf2YEKI1Q==
X-Received: by 2002:a7b:ce13:0:b0:40c:3820:f002 with SMTP id m19-20020a7bce13000000b0040c3820f002mr4446509wmc.94.1702498508936;
        Wed, 13 Dec 2023 12:15:08 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:dcf2:2f65:9442:83f? ([2a02:169:59a6:0:dcf2:2f65:9442:83f])
        by smtp.gmail.com with ESMTPSA id fa17-20020a05600c519100b0040c46719966sm12909651wmb.25.2023.12.13.12.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 12:15:08 -0800 (PST)
Message-ID: <84e13099e7017137aa17511e693f302e19c04b36.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] oe-selftest: add a cpp-example recipe
From: adrian.freihofer@gmail.com
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Dec 2023 21:15:07 +0100
In-Reply-To: <4835257B-EEB2-4772-AA64-B787E99CFC8B@arm.com>
References: <20231207205251.4152034-1-adrian.freihofer@siemens.com>
	 <20231207205251.4152034-2-adrian.freihofer@siemens.com>
	 <4835257B-EEB2-4772-AA64-B787E99CFC8B@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 20:15:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192311

On Wed, 2023-12-13 at 11:10 +0000, Ross Burton wrote:
>=20
>=20
> > On 7 Dec 2023, at 20:52, Adrian Freihofer via
> > lists.openembedded.org
> > <adrian.freihofer=3Dgmail.com@lists.openembedded.org> wrote:
> >=20
> > +do_run_tests () {
> > +=C2=A0=C2=A0=C2=A0 meson test -C "${B}" --no-rebuild
> > +}
>=20
> Somewhere in <gestures at 100+ feature branches on poky-contrib> is a
> partial implementation of a generic =E2=80=9Crun the test suite at build =
time
> in qemu-user=E2=80=9D which failed miserably because qemu-user is pretty
> limited.=C2=A0 I suspect it was _too_ generic, by trying to run the tests
> via =E2=80=98qemu-user make check=E2=80=99.

Maybe you mean this one which is older:
https://lists.openembedded.org/g/openembedded-core/topic/89289917

And here is a more recent discussion related to my patches:
https://lists.openembedded.org/g/openembedded-core/topic/102708283#190925

>=20
> Have you had success with non-trivial test suites managed by
> cmake/meson where the tooling invokes qemu directly? Generalising
> this would be very interesting.
>=20
I probably haven't run some non-trivial test suites yet. But the simple
examples I tried worked very well. Running the tests is also
transparently supported by IDEs with support for cmake and meson
(because cmake and meson integrate qemu). Debugging doesn't work yet,
but as far as I know qemu-usermode would also provide a gdbstub, which
would at least theoretically allow seamless debugger integration.
Especially for the SDK use case with IDE integration I see some
potential in this approach. It allows to develop some unit tests on the
host and finally test and deploy the application and the test binaries
on the remote target device. At least in theory, this could hide the
additional complexity of Cross as much as possible.

However, since there are some corner cases where it does not work, it
is fully optionally integrated. cmake recipes that are known to benefit
from qemu-usermode and work reliably with it can inherit cmake-qemu
instead of cmake. Also the new oe-selftests can be seen as tests for
qemu-usermode, which is a dependency of the kernel anyway and should
therefore be tested somehow.

My intention is to introduce this feature in a very limited scope, at
least in this first step.

Adrian



> Ross


