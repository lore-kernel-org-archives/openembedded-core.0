Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9614B77E79
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 20:58:57 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id w64so120300845wma.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=vKJNWbiwoguW2d9s6N5yZVy4XOUQFc8hQWGm2fx1tGQ=;
	b=fs+Jmsb5icnV6IrmzEcQZy2JcHKIFWQ7Wnexzg2LxAnTyY1BGFVPZ74dTPRHFCo0D8
	6rdzBAb7sZ57bm0Iy6gI35h0kIMohLk+BInH1PR0cd8h9MICiegJnmWz2zG+9fqn44uU
	zOUfIVmfVFombcHF1DFSHnxapXjllp3+F/jZPCDk/YWpuIdjDIfYbOFAhGbqYj+H8M+U
	/Gokfbeq8GPiJtu800urtU0MMjH1VlFUIkknZ1KzqXKtQgaIo8d9TojmqDnWZik7z+n9
	9LVfCa1068x+efnGSyETMFgbY8+JYqJ46d2b0XB7eRsfUoZnP9GQncd8FC0egJIwQRN7
	sKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=vKJNWbiwoguW2d9s6N5yZVy4XOUQFc8hQWGm2fx1tGQ=;
	b=PJ4NpWqDJGvHxbdQLq10y9+Hb6rBFFV/sJJ//nMtH13BGwJxDJ6OmCbVklCBVPX9CB
	eLI1B90hioC71HTMYSR8hpWukJLxueY84+uceN4uy54TDjNI8ldeSEnoSNMX1W/3NRSm
	r2KXkgcuPkk0hn4VdJiS3H2ZWVkqQiQrH2TRSXPAfQ6EF9nIqK1trY16r41ycfqRLBEE
	nG+mL8WDECwxeeuTbNFfK2d3DewetcjDqu8mamKC8fxkxA3ugLJMte0jMo0qw0oCjl1i
	5qr0Y/Mj9OS1069hoLclmxcCJbBX3Jo4EblL03o2MMe7y6RBugBHM3DnkqNin1Tj7r/6
	3yMw==
X-Gm-Message-State: AN3rC/4E7pU0bhBTWdhziDhFnqCTOAEpYjfVwsrIzDYBCSptzntg0b6z
	+42S5pljrGS4cO5evX9ytMsMCCuyaA==
X-Received: by 10.28.4.69 with SMTP id 66mr4729177wme.65.1492117137739; Thu,
	13 Apr 2017 13:58:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.153.248 with HTTP; Thu, 13 Apr 2017 13:58:57 -0700 (PDT)
In-Reply-To: <CALbNGRSe-WDecX=v+uj=PCnGe6hTTJ7J2MK4j3=ynF=mkbLZmA@mail.gmail.com>
References: <20170413154453.24792-1-schnitzeltony@googlemail.com>
	<CABcZANnmLud2YgBd8nrNMzNrBGXULfhqs0rYg9YqTAi74T6kpw@mail.gmail.com>
	<CA+chaQf+NQpGT9s8P8rgYShP0un+=A5BYRO1rY71whE5ZntSrw@mail.gmail.com>
	<CALbNGRRoXXroY1_Kxc-2uunttn3dN+K4t68WWb1m0WwMvnrUBg@mail.gmail.com>
	<CAJTo0La4Uf5VWhz0Ou7_MH2AYFnBPs2OObt-FAkKJuYhJE49KQ@mail.gmail.com>
	<CALbNGRSe-WDecX=v+uj=PCnGe6hTTJ7J2MK4j3=ynF=mkbLZmA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 13 Apr 2017 13:58:57 -0700
Message-ID: <CAJ86T=VN2mDsMSA4O_AjB+6rg12-SPmh=Go6ZsjNu3cLpLxY7w@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: add unzip to HOSTTOOLS
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
X-List-Received-Date: Thu, 13 Apr 2017 20:58:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2017 at 1:34 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Thu, Apr 13, 2017 at 5:57 PM, Burton, Ross <ross.burton@intel.com> wro=
te:
>> On 13 April 2017 at 16:53, Andreas M=C3=BCller <schnitzeltony@googlemail=
.com>
>> wrote:
>>>
>>> OK - but why do I see this error in do_unpack?
>>
>> What recipe and task?
>>
>> Ross
>>
> It is not that simple and it drives me mad (as usual :)
>
> Failing recipes were [1-2]. They failed in task (do_)unpack.

[1] SRC_URI =3D " \
    http://.../latest/download;downloadfilename=3Dpolyphone-1-8-src.zip \

base.bbclass tests the end of the URI path, not downloadfilename, so
it's not going to detect this dependency correctly.

[2] SRC_URI =3D " \
    http://.../hires-sounds.7z;name=3Dsound \

base.bbclass doesn't test for .7z extensions, so won't detect this
dependency either.

In both cases, the fix should probably go in base.bbclass.

> For unknown reasons case [1] (polyphone) works fine now. OK - I pulled
> oe-core again (40 commits) - this is what I usually do when things
> fail but I cannot see what commit has mended the issue for case [1].
>
> Case [2] could be fixed by
> do_unpack[depends] +=3D "p7zip-native:do_populate_sysroot"
>
> So I hope my do_unpack trouble is gone. Thanks for taking care and
> ignore the patch I sent.
>
> Andreas
>
> [1] https://github.com/schnitzeltony/meta-qt5-extra/blob/master/recipes-m=
isc/recipes-multimedia/polyphone/polyphone_1.8.bb
> [2] https://github.com/schnitzeltony/meta-retro/blob/master/recipes-games=
/dxx-rebirth/d1x-rebirth_v0.58.1.bb
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

