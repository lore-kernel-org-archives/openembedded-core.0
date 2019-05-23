Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 812AA7E3C6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 17:25:35 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id j53so7654253qta.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 10:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MM2nYy+uhxnE8j2/rN5BB557r3hjkqtj3F+xJCb25iU=;
	b=p8wHeXfIewOfCdOS7mRO5k4/gn5KuOQkFJI6tE0zNORw6PhvdvoiMGtahs7a2laIIp
	YW+hOhEQJ/YQfasR6IUQRnPP+jissBWMwz1pT7rYOzFv/xszW7rnE6yywzyEF84e9UdE
	qqQX+TMGsU8W6tUvXxoM85+0I7jlfuDsobq8V6NESBgjfUbIJCzahTjQMq9mA7wR13bK
	1Oy2FWqgrAQ4J63H3z6BHSif2EBZTXMH8X54PDBf9rygiRWnf0Q8FdTBkuyflelMicPG
	ltApQ42YFp031bZekJ9R92/1aNqLvGgfPpQHt+gLPaxsDVXXJakccZwj0XLi3soIzjZw
	byqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MM2nYy+uhxnE8j2/rN5BB557r3hjkqtj3F+xJCb25iU=;
	b=V7Y/5QPbQ9dD/3s26qor6+AVgDukPOjZIKYPqSlr8BJ/OJp4lpf5j9uQLQK+5HQA0m
	VWPg5Z6ohi4nXZZESpsJOVMYX33yLT4DaaI/CbNDDQTP4TCX7VTYPMvNONOHUmI7DqpV
	uacjs3AJHsQaQzyBrBieCZTCMgtOouYpvQq+4a+OVut7PFUCpUDzJ1s+WDrFb6pNgfcM
	NMEoghdw/002rZtPfkdhTLyznlm+4Iz8iCU1U/PmYq9U+k9AHp6sqHCN57lD3pNzQKgS
	vHEfN3YGQbdMdT3x8hBPU4cuKQmm8wWwuoTLI/VvvetHJxmVydtA/eD7FUjFnbA+R9jN
	PogA==
X-Gm-Message-State: APjAAAUd9lW3AfOGPR1ZKgsORB24qt2Tt8WEc4Shc9Mhh/u/6+XNDJXA
	1RzwxdQQKeAZOnuCxVsCWZWacOjS07NoOrOfOvtMita2
X-Google-Smtp-Source: APXvYqyuFcXVrc7b4MDex/FoAf0liVeZ+th9IwNn+jM3CLDEeVnvPcdxr4M7j9zOi0toHY9fObKyXaw90lk55cpOQ3U=
X-Received: by 2002:a0c:96e7:: with SMTP id b36mr45033198qvd.51.1558632336081; 
	Thu, 23 May 2019 10:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190523145819.23329-1-raj.khem@gmail.com>
	<20190523160654.GC3348@localhost>
In-Reply-To: <20190523160654.GC3348@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 May 2019 10:25:10 -0700
Message-ID: <CAMKF1sr=zz140V8js6i6NgkDFOWzrbZpMGw9R5MOKeZxk-KJ-w@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "musl: Add TEMP_FAILURE_RETRY from glibc"
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
X-List-Received-Date: Thu, 23 May 2019 17:25:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 23, 2019 at 9:06 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Thu, May 23, 2019 at 07:58:19AM -0700, Khem Raj wrote:
> >...
> > Secondly, musl and glibc are under different licenses and importing
> > code from one to other could taint it.
> >...
>
> How many LOC are considered the legal limit in OE for that?
>

Just make it easy where it can. OE does not guarantee any of that.

> Many of the musl support patches (e.g. [1]) contain more LOC from glibc
> headers,[2] so if these are considered a problem there might be more
> legal review ahead.
>

Yes I am aware.

> cu
> Adrian
>
> [1] meta/recipes-extended/pam/libpam/0001-Add-support-for-defining-missing-funcitonality.patch
> [2] https://sourceware.org/git/?p=glibc.git;a=blame;f=string/string.h;hb=0a54e4010fe0085cd36deaff9442a7e88de3270d#l131
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

