Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43])
	by mail.openembedded.org (Postfix) with ESMTP id EEC177DB3C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 12:21:47 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id p23so8678340iol.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 05:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4EArOAmUb7gkawwu2PjfxWvVkNv1Sfe2emUK4IT+lbs=;
	b=GXQyu5Hd4uK8JBeADxAyuxuSLM0WuFhYl/PtZ+rslH6Y5FHKRdQtNLIzQZrj0Hkp4f
	ieixImbfAVOwwenteNPUzFN+w9qb2fNNpmR9/dFZ6A9F4HgaqN53VJPrXtT/5r9bMEFz
	7obbG2lTNuBHjJTCn7eSuMSIIYNV2Odq56dIO1URYIuoQhc7tJ2zCM+txzP51ve/S6jd
	y4DO/4WCjk7Bru+bCA5X3Teu2hM7TDUj0HrDr0tpw269lKhDsD7dwORkrToNH7xv9y6X
	DhyydA2IcNDEox1FO45vqL9JSL+w7W//pQDltfLfrgS6Sft6lJqTXR/TvJwbvp0hvl8v
	zUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4EArOAmUb7gkawwu2PjfxWvVkNv1Sfe2emUK4IT+lbs=;
	b=F5aWkdkNRqq6te5odM21guKftcHx06STEUZOAOi9fO53wN1DDAclaZMwEZ84knn50L
	njoglHTiEBzx+t8FPN55UP/TI+6toN5OZ0YSNVdG9YjSsn2W6EELyIF9qdB5PMVOKiTK
	gYijksTEzlNk/YuDFbl5vnvS7aXZEK7+02P/Yy5DE7MhujoWfZvXJJMDF0Q/vChJ4vA1
	ICWAel4tbndJmfG9U/IPVXUwRk5W6YUBn1Vo9wZYnhB9igrYBd/+WzGEC52v/AUdb2Gc
	y5Xlr9UOjzvS3QIX2Rj7PfjJuD45z8wu/6xHVzSFmK+4WWxjNhCVV4gFjxBcMos3CYkf
	hAXQ==
X-Gm-Message-State: APjAAAV0X8WktgctVtk2qYEbLhUN15fce5b4SqvXdsmRREAPCS99LoS9
	xrBDT7MxeF/aLiuzFu8v6t0jJoonq4Rg+v9ztIs=
X-Google-Smtp-Source: APXvYqzwxU+vSrBCwvrvBbcD9qAvf/xT9Fm1/WTyrRC8la1lSf0BRhXZ9bgY91HH9OpVxFB49f4kaWQ/x1Jj6Uc8LMg=
X-Received: by 2002:a5e:d505:: with SMTP id e5mr13817591iom.99.1556540508918; 
	Mon, 29 Apr 2019 05:21:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190427113714.30173-1-schnitzeltony@gmail.com>
	<d935a0811d57ce8681e7aeeedaf2722233242ae4.camel@linuxfoundation.org>
	<CALbNGRSBsq7c8AAdpHUfkYytbeBMddDns5R7HeQ=9bWZU_OLyA@mail.gmail.com>
	<a45f59b03312a7693bd5d4e4ae04c600@basmevissen.nl>
In-Reply-To: <a45f59b03312a7693bd5d4e4ae04c600@basmevissen.nl>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 29 Apr 2019 14:21:37 +0200
Message-ID: <CALbNGRT_FRQfA0jpP7DHsFOxnt97JW-KEjyGXOkW9V2w+Ujgyw@mail.gmail.com>
To: Bas Mevissen <abuse@basmevissen.nl>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vte-native: reduce c++ requirements from c++17 -> c++11
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
X-List-Received-Date: Mon, 29 Apr 2019 12:21:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2019 at 12:56 PM Bas Mevissen <abuse@basmevissen.nl> wrote:
>
> On 2019-04-29 11:29, Andreas M=C3=BCller wrote:
>
> (...)
>
> >>
> > Understood - hope to find time till tomorrow for this. Need to find an
> > old machine for test because otherwise further fixes might remain
> > incomplete again.
> >
>
> Why not add the g++ option --std=3Dc++11 when test building this recipe?
>
> $cat test.cc
>
> #include <string>
>
> using namespace std::literals;
>
> int main()
> {
>         return 0;
> }
>
>
> $ g++ --std=3Dc++17 test.cc -o test
> $ g++ --std=3Dc++11 test.cc -o test
> test.cc:5:22: error: =E2=80=98literals=E2=80=99 is not a namespace-name
>      5 | using namespace std::literals;
>        |                      ^~~~~~~~
>
> -- Bas.
Did that but on CFLAGS (copy & paste from another place in recipe) and
since issues popped up I thought it was right :(

Andreas

