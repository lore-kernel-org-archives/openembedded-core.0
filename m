Return-Path: <nirbheek.chauhan@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6502E78087
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jan 2018 10:07:13 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id w188so17949346iod.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jan 2018 02:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pUMw6qlE5wsZvB8zgFPpxVQGoTFEqDF80bzZtMWZXwM=;
	b=l3Y1w/oBFKnF1l7/vRrecozbmHf59+jmIvKvUOi0rf8Syli5FTyCRaq52Kx7F2f+qM
	/Fg1DBfjPLMkz1XzWnEoPu0VtKEZT0eJ4tl+wzdJDjykttxp9tj4Wfifd+EIwKQ0tw//
	GyLpTl+WUuyay7+rFnIkmbB3ExsUX3cY96fRPSVu5amBNHqSOg7dd71KiyUxtuLY5elK
	i1jL7MuN8+rf603/0EhyJX7FekAyXNCd49Pb0gGwgNvl1jGwqFZN3lLyPkBYrf/oDtn7
	5teQbYeKoOui64Yc8Np40gOsBgRd64BrGgGeIUZv7Z2Io7afQWXODyPmW2bSKsRLtPuD
	vEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pUMw6qlE5wsZvB8zgFPpxVQGoTFEqDF80bzZtMWZXwM=;
	b=d8b478IzZrFTa0VaxWdessw7c78Rc/YAlhuSMnLpVzsJHri4UfkhCBDW7LFfpVHRdI
	ZCtfaGyb8mJ88Tr3uWEJR2LCD9Na1nfJph1en94T6Y3GU+qzIj6aCVUVAhmlvC7L5khH
	G+pwdtR8Vudw0jKjwAKGWTACup6kDautR9L+ReqwqzjRCPhHCev2mmzInI3yKqa5I3R6
	KQAA2YlOYMrHJOKRfgBaNf60gVh4g/nrEZ6R4Pp29JL1IJHpnvi3vuj/fAg/graXJEMl
	PAPX4m33TJtKBRWOX4jcaspuH5RQi4U0VBN+MnwIgoYfEFijnKDZWrs1bayyd/OChKAy
	KyLA==
X-Gm-Message-State: AKwxytc3VE+O62yFN1ZAl2gyIei9fFjiQXcwtbDCGm0oLTVAKO+MSii6
	3LBjgA5FTYOq0XGgGcal5xn82DDzOx7Ed2tzfLo=
X-Google-Smtp-Source: ACJfBour8xnIkxiqVhkgSH41WCJjgWlr8JY9wSrMSjjczhSdyJIp3eV52Qy9kiZZYR89r6JCUvwA7hxbBL1ryV6qEzY=
X-Received: by 10.107.201.208 with SMTP id z199mr14615639iof.74.1515492435435; 
	Tue, 09 Jan 2018 02:07:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.20.194 with HTTP; Tue, 9 Jan 2018 02:06:54 -0800 (PST)
In-Reply-To: <CADqQcK4-=Q3mvKJfhjHbJEUYeTiGq3c7dCAR3E=w+ktr+_7RyA@mail.gmail.com>
References: <2ce0ac68-4ef4-41f5-c931-81990ecd1d03@xevo.com>
	<CADqQcK4-=Q3mvKJfhjHbJEUYeTiGq3c7dCAR3E=w+ktr+_7RyA@mail.gmail.com>
From: Nirbheek Chauhan <nirbheek.chauhan@gmail.com>
Date: Tue, 9 Jan 2018 15:36:54 +0530
Message-ID: <CADqQcK6VA46LEmCymx9OT_+JWcLPX56PmW4mzLzh_8eLgG2UAQ@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: Jussi Pakkanen <jpakkane@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Issues with meson in SDK with cross-file
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
X-List-Received-Date: Tue, 09 Jan 2018 10:07:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 9, 2018 at 3:20 PM, Nirbheek Chauhan
<nirbheek.chauhan@gmail.com> wrote:
>> If we want to setup a cross-file to use these arguments, we would have to
>> generate the cross-file on-the-fly (not good).
>
> Out of interest, why is that not good? That is precisely what Gentoo
> does and it has to solve the same problems here that Yocto is facing.
>

To expand on this, the reason why meson requires a cross file for
cross-compilation is because we allow build files to use both native
and cross compilers within the same build. This is quite useful when
you want to build a tool (or generator) as part of the project that
you then use to build/generate other things that are used in the cross
build.

That workflow is really difficult or impossible in Autotools and
CMake, but it's a surprisingly common use-case.

Generating cross files is quite easy since they're INI files[1]. If
you use the same toolchain for the entire build, you only need to
generate it once.

1. https://docs.python.org/3/library/configparser.html

Cheers,
Nirbheek

