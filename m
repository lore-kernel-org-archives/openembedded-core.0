Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 127AA78A24
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 09:51:58 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id l43so16548617wrc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Mar 2018 01:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MAmCe4IZu5zyIrSzehkbvpdU1OW02nbYXkBOwDpC9m0=;
	b=MhdT0epIVdLPQ6sYFI/7DHzaSVwV7WVh9rDTseYC0EPVJXWcpfsHTXyh6NHXXrwooO
	fw+BBhBzoUqS1cvWdEoLdPKgZrPLsUTA33PrHjx9n5S+xjKP6KdXbNIh/vjmULSc13aZ
	d3pTbv+nmtV0B81iDo8/QobNIgdT5X9qnnzxuMgHSq6iDN1wVov8dbwY6lC/pRykHrVT
	HtTgDn2bR1vZza0I6zZv2WTSx7tk9t26Cod9/W2GyFoGwvanYcgp7CClYZdVcCL4yIBT
	hZE+fagrSZrGta9AFtAMXpUloQXh8JYmh2d4ruz9QBJPJpEXnfUAjyTZI8DXkem62BOH
	/CbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MAmCe4IZu5zyIrSzehkbvpdU1OW02nbYXkBOwDpC9m0=;
	b=kQKuLKMO3HMxlMg2yTocQeeapCzpXONs2g9Pk+Ac0+ruoHywxo4LltUCTqnIvI3QCa
	55fmMKjSS6GBteoMJLxBe9betfzlaNXE3HXpB8Vk/3ee43LJ0gH6NpEdTbzv5SHKUWyE
	t5ShheN7wEo49T4/KKeY5V1e2Mq5Ro1NsrL+oBIGOpkfu/4b7c9vDJXIBuHBqAF5P+kX
	TWLD12S7uLeFmiS0JTd0NyYqTSRSEj+sWYudPHF2XhuMcyFzdPUAN2aYqPQXrutvDtBC
	zdlULsHFqnnjCZlElFHi0EcR0z3Nz/pem2X+5/yqvyvTtIXLZRwxMeJ1wrJilmz1HVWA
	0Rzw==
X-Gm-Message-State: APf1xPCZyH+ezy2lwvBig4ozHAzHBItIoyIjogy5T+6DgToBNbngKK3r
	m/AhD+ZDZAFAIiGGahBXoNIiWr7HYDpjASAxgsg=
X-Google-Smtp-Source: AG47ELtvh5WCh5slXQLLLDGnwkjHTVXKQy/QWVKpp5/vVC2MNOMOXYzaWWk4wE3mXKeAQ1Q9tjAbpZ9tqncB/4YFsxg=
X-Received: by 10.223.161.10 with SMTP id o10mr12798986wro.60.1520243519813;
	Mon, 05 Mar 2018 01:51:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.173.193 with HTTP; Mon, 5 Mar 2018 01:51:59 -0800 (PST)
In-Reply-To: <CA+chaQf3SPQZ3UequDT7BOzUGUx0ZcSyow_pgzw-MQwFXnFHLg@mail.gmail.com>
References: <1520162492-29839-1-git-send-email-richard.purdie@linuxfoundation.org>
	<20180304141538.GB1370@jama> <20180304162216.GC1370@jama>
	<CAJ86T=VPkRT06Jg7i7CK=mZBWZM_Ssn4a0-8+zf9RQyu-NXQLA@mail.gmail.com>
	<CA+chaQf3SPQZ3UequDT7BOzUGUx0ZcSyow_pgzw-MQwFXnFHLg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 5 Mar 2018 01:51:59 -0800
Message-ID: <CAJ86T=VFg7cfFhUJYssODc5KwdfnBLG9VLbENU+j8ExKmkB57w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][morty] gcc6: Upgrade to 6.4.0 (latest stable series release)
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
X-List-Received-Date: Mon, 05 Mar 2018 09:51:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 5, 2018 at 1:19 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Thanks Andre!
>
> I've seen another failure probably caused by this gcc upgrade in morty-next:
>
> python-matplotlib triggers ICE:
>
> src/_png.cpp: In function 'void init_png()':
> src/_png.cpp:497:25: warning: variable '_png' set but not used
> [-Wunused-but-set-variable]
>      static _png_module* _png = NULL;
>                          ^~~~
> src/_png.cpp: In member function 'Py::Object _png_module::read_png(const
> Py::Tuple&)':
> src/_png.cpp:272:1: internal compiler error: Segmentation fault
>  _png_module::read_png(const Py::Tuple& args)
>  ^~~~~~~~~~~
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <http://gcc.gnu.org/bugs.html> for instructions.
> error: command 'i586-oe-linux-gcc' failed with exit status 1
> ERROR: Function failed: do_compile (log file is located at
> python-matplotlib/1.1.0-r1/temp/log.do_compile.15213)
>
> I'll try to build it with Khem's and Andre's patches only to eliminate
> hjl/indirect/gcc-6-branch/master changes.
>

FWIW, I see the same error with my OE 2.2 + gcc 6.4.0 based distro.
The ICE only happens if I build with -O2 though (the build is clean
with -Os, which I use by default).

In case it's useful to anyone, my branch of morty with a gcc 6.4.0 backport is:

  git clone https://github.com/lgirdk/openembedded-core.git --branch oe22b

