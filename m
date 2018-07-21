Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id EE8D378AFC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 17:03:17 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id k12-v6so26582010oiw.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 10:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=DvRVLOGejqKAfZLwDQ+rUaYbM9eYNRUA7pkbnIMxU+c=;
	b=FWmb67RWkt6hIOQUEOM5eo+LWFuSX+dl+HsRUyirVvsqHxdYyqZmv/6lt1dVa8UKvp
	KcKamNZZP6c5HKGw2AsHLRBxdDmpP89we7LOqoAGTn+Yui56ExAmWzMNDJ3/BGtNvNUg
	33iT2vGW4EguPRIwjoCVqv3eN4E2bi8UV1vNna+l9CpWDB5JJkg6Fmz+A4IcT5VxdEs3
	1r9jl4IQtvjPGJFPh5DAQTq9L3l+nSP4yjgYHUa1NBWejSqrg0QgK+a/ZRRF5+XvO66/
	kzt7fiXeUmFaxJCppDwRHL4rz+JbZ7++JRph4dJ+fsdzRlvQiMYNilxuCNCTD7isszP/
	iqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=DvRVLOGejqKAfZLwDQ+rUaYbM9eYNRUA7pkbnIMxU+c=;
	b=N2yjZuK9jrAbJ4Wpu1NiSVHTTe/vwH5zlE48/Dgjtlr3VCk4nQcQ1Y9oqHFPFo3+We
	nZ5Ns692teo/Oo5JR24Ex4xiH81L9Qpvys/Gg2Be8Tr6w9FfV1x5xZJdaiNaij0JCJz4
	x94y5ZhKi3uDOKT44XZzQsrzSH823a0YaclRqhlxPEqa+ykIS6uOZdIrRbkEtoezizuk
	PcSdXfUNO9RkBwW2lIITBcBMpEJtnT3tttneIoRDpOiiKjJ0RxGXYsVBEZNCe8gBV2qw
	6bULv8ua/SH/16SDNlkGi9DudxLF9rjDtxqx50H0qovxZDbN+Jwr1p2P09SK7kcWsTkN
	1QSw==
X-Gm-Message-State: AOUpUlEQpos+JBs/3OdNAw0Ii86BPP2+CqXg1+aOFczJ6kerenN11Slu
	x0lNl/RYKxGjCbgMzQnjFJvOmdiva1bFSqQCE1c=
X-Google-Smtp-Source: AAOMgpczqURwHkcfwdlTUuLkZD3NP0i4c3Xa4C2GnN2dABJ+uNRKH47Q5ab4RT1YBbPlLOkOj7HCwidubOMw9r53Llk=
X-Received: by 2002:aca:560d:: with SMTP id
	k13-v6mr2356962oib.190.1532192599100; 
	Sat, 21 Jul 2018 10:03:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP; Sat, 21 Jul 2018 10:03:18
	-0700 (PDT)
In-Reply-To: <20180721162715.12611-1-raj.khem@gmail.com>
References: <20180721162715.12611-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 21 Jul 2018 19:03:18 +0200
Message-ID: <CANNYZj8xEFn1inNpWqRcYd7Zu9=PwYVMGdm6QKEzK3ErhVHHcQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] glibc-locale: Fix host-user-contaminated QA errors
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
X-List-Received-Date: Sat, 21 Jul 2018 17:03:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

2018-07-21 18:27 GMT+02:00 Khem Raj <raj.khem@gmail.com>:
> Fixes
>
> ERROR: glibc-locale-2.27-r0 do_package_qa: QA Issue: glibc-locale: /glibc=
-binary-localedata-hy-am/usr/lib/locale/hy_AM/LC_MEASUREMENT.tmp is owned b=
y uid 3004, which is the same as the user running bitbake. This may be due =
to host contamination [host-user-contaminated]
>

This long-standing yet elusive error has acquired something of a
mythical status. Can you explain what was going on and how the patch
is fixing it?

Alex

