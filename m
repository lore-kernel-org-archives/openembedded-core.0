Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TGGDm-0001Lc-Ma
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 23:29:42 +0200
Received: by eaac1 with SMTP id c1so267456eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 14:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=gpf9j3Sr2i0cF77V38GOhCCrGXg4svHodYWV4bEyRc4=;
	b=DOzkFCU/HNgofPgaJQ85X9+8qiJLxUmI7cfF5MKcreZ59B5s1mxvTasR1905CUJi35
	XU3HJ/EgzsUQN3akkFFxpL5dFf9dBpmq0xxDCNDaidu95bfVek9wEZLqlMIfB0tBb+3t
	qVqrAA5SrLVrIn4VNzgG0661HnN7/K8Su2+dz40XeeJiCL4zyA3LDNGie/ZOJZa+S/eW
	5lw/6m6UH24qJOXGJbn3YadFCeglPu2Y0JQroWK2Jq2lc6ALhvSoojJerIWZn0H++OcX
	vhXLFoEBzPwlDBxpz27PzmSe/AHZIeXwMRRBYuwbnSAbyxszqDExFqswSh25NLgxmJX1
	uSBQ==
Received: by 10.14.202.131 with SMTP id d3mr16455692eeo.32.1348521414718; Mon,
	24 Sep 2012 14:16:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Mon, 24 Sep 2012 14:16:24 -0700 (PDT)
In-Reply-To: <CABcZAN=XVRRjH+57g+E24qr6vQ9Mf7Z9A7YHMcKgrFGkH6RbyA@mail.gmail.com>
References: <1348513241-18271-1-git-send-email-kergoth@gmail.com>
	<CAMKF1sqsvYcwKTG1wzAGKnWrRZ6K5yh0=D9ncGOAtOHSJ-i1cQ@mail.gmail.com>
	<CABcZAN=XVRRjH+57g+E24qr6vQ9Mf7Z9A7YHMcKgrFGkH6RbyA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Sep 2012 14:16:24 -0700
Message-ID: <CAMKF1soO3O8gWeTeJxv7Jb83r753ZF7nRCxpmvBwop-20giHsg@mail.gmail.com>
To: Chris Larson <kergoth@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Add and use 'localedir' variable
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Sep 2012 21:29:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2012 at 2:04 PM, Chris Larson <kergoth@gmail.com> wrote:
>
> This is the case by default for all eglibc builds that set libdir to
> the default. See https://gist.github.com/3756705 =E2=80=94 there's anothe=
r
> block just like that for all the other 64 bit archs for eglibc. When
> we pass =E2=80=94libdir=3D/usr/lib64, it skips this logic.
>
> So changing it would just bring us inline with the default eglibc
> behavior. The binary locale files are, as far as I'm aware, a
> relatively arch independent binary format. There's no point or benefit
> to having lib32 vs lib64 copies, they'd just be duplicated content.
>
> If it wasn't for the forthcoming 1.3 release, I'd have included the
> proposed change to the default localedir to ${exec_prefix}/lib/locale
> with this patch.

Mark explained the change here so it is OK for OE internal. I hope
external toolchains
are also fine with it.


