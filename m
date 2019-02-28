Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9062B7C40C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 22:25:42 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id a15so13141289qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 14:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iTfz6ZfArYczO4gd+RG2W4nzefBjMRUXsMqCLuvbs0M=;
	b=gpNCvd9Vuld+OiYPf/PG7T8cY08vcFkRPhrnt7WyHu/cWcILI+BKjZzNK2IKA6flwX
	dst9LX34QRyS5DcxY3BAh8grhyJ8BcbX9WUvPrexWObofp7hSfZD/8TE2NgzocDvDGn1
	TXE65XOnE4OlDvWsGJSeAVmQUH1ddRNaj5Bp6rQTyHqN06c8IDh6CnEdhOh70+4eU+QI
	AkaEpR6GPwUEvKtN/0dsxlK2w/iNyOJ8fGa1OV9utM8roz14ySTde0V7tvawetfcXVRt
	f2j0+2hzkDVFbsVWE2WkwGvkfHmFILKy1fLfz/Ad6UIbHbnlvI4S5mLdboyeLp+F8Sxe
	cSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iTfz6ZfArYczO4gd+RG2W4nzefBjMRUXsMqCLuvbs0M=;
	b=irGq/uGqjJymQoiW24VtuhP95E2PSrFejAWtZKqUQCUiHN0YiqIlAN+bre+CRSYyCG
	aagQLfa41OpqWjNTBda0rg/34a/CCAuMNZ0uj0ZZgGXlf51y//QJSqQQjsuWEU00VMCJ
	ils0Rx4Yop8WOjTcnBgIf+UZlqkNw4QaCBaUdYzkGfsbM5ziKYgADsgEWW99py8uovM3
	XWtCu7Jua9RhNHd1sxxwAId8MgZTYhlJNNL948WH6mXshe7xsVHIovEf1qfthx23kU4o
	Le18zcB97OaIyrEWiMY9lrNej+MV/WSjUtEQZd5kUH5tIYaUbyNhxCugJWjqXups4Os4
	2WBw==
X-Gm-Message-State: APjAAAUvQvFAA6o51/vgFHEainHdR1JWW85Hik5S2Fo/7XJnLsfuZ/W6
	+faiNggFA55MhOQ8xAwlhKxvN/ACrfSPCmUtg2Q=
X-Google-Smtp-Source: APXvYqwrOFbcrr1/f81y1oUm8WzJR24Se9EjtqHsxc2TxsqTbV6wvRXWqrlp+FcAqKJLdMLrMNDTkHddgi6Wuv/jcTo=
X-Received: by 2002:a37:4c88:: with SMTP id z130mr1477909qka.206.1551392743111;
	Thu, 28 Feb 2019 14:25:43 -0800 (PST)
MIME-Version: 1.0
References: <20190228213251.31036-1-alistair.francis@wdc.com>
	<44473a1d54ad68139b8fe9ef3e5b0fdc31870801.camel@linuxfoundation.org>
In-Reply-To: <44473a1d54ad68139b8fe9ef3e5b0fdc31870801.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Feb 2019 14:25:17 -0800
Message-ID: <CAMKF1so3KK1v=guafU5K+_nDU3jQm-0HG-CgRCf5qWA_i4gRpQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu-native: Add missing fdt PACKAGECONFIG
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
X-List-Received-Date: Thu, 28 Feb 2019 22:25:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 28, 2019 at 2:24 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2019-02-28 at 21:33 +0000, Alistair Francis wrote:
> > This is required to fix this build failure:
> >
> > qemu-3.1.0/hw/core/loader-fit.c:30:10: fatal error: libfdt.h: No such
> > file or directory
> >  #include <libfdt.h>
> >           ^~~~~~~~~~
> > compilation terminated.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  meta/recipes-devtools/qemu/qemu-native_3.1.0.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> > b/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> > index c8acff8e19..0b6a7f8b6e 100644
> > --- a/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> > +++ b/meta/recipes-devtools/qemu/qemu-native_3.1.0.bb
> > @@ -6,4 +6,4 @@ require qemu-native.inc
> >
> >  EXTRA_OECONF_append = " --target-list=${@get_qemu_usermode_target_li
> > st(d)} --disable-tools --disable-blobs --disable-guest-agent"
> >
> > -PACKAGECONFIG ??= ""
> > +PACKAGECONFIG ??= "fdt"
>
> I think this is a rebuild bug, did you try cleaning and rebuilding
> qemu-native?
>
> I did hit this when testing but in amongst the rest of the chaos from
> today, forgot that :(
>

dont think so , if one has libfdt on host and is not version qemu like
it will have build errors.

> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

