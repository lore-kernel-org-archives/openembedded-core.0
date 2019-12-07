Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 6ABD26C42C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Dec 2019 15:43:44 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id d5so10544657qto.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Dec 2019 07:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QCqKQma06WVhZjpjsMzfMwdZ2W2piB7JURrWxTOMNIQ=;
	b=Be4R8EwR2sckbRPal3JxNh48du9Sycypn/1+2JVAMldUPu2bjXsMk+6dBlCSSfSx1M
	p/NOy/jE0u/Jk/pbRKuPBowsBnKpzbu+aUJszYeyqC1Y9LccHLT/VzqyqZLoJtR/lZRt
	doz1xcsLapKLH7E54923+6P2NndxJjqvFk9ghd+nD/Le5gaP4wwaq7wgLj54sPgG87dT
	nM9N8QzGRSGOVPS7DP80LJPUrLVUXp2D85ZwJLJY9D4XgkGl/IrE1zLMy/t4T1AHful5
	y6kTCkHOjtr/r73NmqxwRhYZvga1uiQMXi+gn3IeqK3b2PlwyWirW9gMok6AShqF5qDX
	Inuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QCqKQma06WVhZjpjsMzfMwdZ2W2piB7JURrWxTOMNIQ=;
	b=ezXx+t+/WkhVPujGazEsCwxqKJEFkNi6SiLXOtaEx7mpMEQ7aze7Yb/ij+MjLmJkDw
	rpFLekfO+rBHRqyKpwXLrv+JGWo+E5jKysw3V5ddlWyPHege2d1DQPw65hztE4b2LkeU
	nq9Y/obpx6MDzbQibd1+SVlQCVKbYPkvVXTsyBLqZthxOqO3UU3Q5Iqvdk02AEyDF093
	1Og5X64fH6AH8JD/XolABeDPx6N1Zns3F9KsogNZW2wjGSa8GsJlsecJhjYYaCvQBVTk
	qjH5K4doIRMUg4NxQ5HilFJKo58sgY3g/vOtN5Vy0hjKY/+IcInHyw/xAmBarmyXYy+o
	ly0g==
X-Gm-Message-State: APjAAAW+AVNbc2hOl2wfgjldcXJRM5zilyWaw8nSdwlq0DcQCjdetK5E
	gYUkFaQlyZ0bfobuickIhXjT0G0OdlnQ+Ixzu/g=
X-Google-Smtp-Source: APXvYqxaYV0zQmT7gnQC1yWzVeo/A37Gc6WSDaPbAYdWwfOoGOCwZ7oxEqywFjgayfA1i6Zstx02nuCaEW+s9vbRsv8=
X-Received: by 2002:ac8:41c3:: with SMTP id o3mr17686604qtm.88.1575733424869; 
	Sat, 07 Dec 2019 07:43:44 -0800 (PST)
MIME-Version: 1.0
References: <8746d8e88a538d8abede3a76718fd594ca895af0.camel@gmail.com>
In-Reply-To: <8746d8e88a538d8abede3a76718fd594ca895af0.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 Dec 2019 07:43:18 -0800
Message-ID: <CAMKF1sr+KfcD3=St9E2ATQgN6RyF=AHdpFh3pAHE9R5X-kr0wQ@mail.gmail.com>
To: claus.stovgaard@gmail.com
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: connman dependency of readline
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
X-List-Received-Date: Sat, 07 Dec 2019 15:43:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 7, 2019 at 7:40 AM <claus.stovgaard@gmail.com> wrote:
>
> Hi
>
> I am starting to use Yocto / OpenEmbedded, where I was looking into
> using ConnMan as network manager.
>
> Though I was wondering about the readline dependency.
> Looking at the recipe
> https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-connectivity/connman/connman.inc
> it is set to always depend on readline in the DEPENDS variable, even
> though as far as I know it is only the connmanctl which depend on
> readline.
> In EXTRA_OECONF the --enable-client is hardcoded.
>
> The client is though not included in the image unless you also add
> connman-client.
>
> So I am thinking on creating a patch where I create a
> PACKAGECONFIG[readline] like bluez5, as I would not need the client and
> will need not to include readline because of GPLv3.
>
> I guess email is the prefered way for patches compared to github pull
> requests?

yes

>
> Instead of my idea of creating as PACKAGECONFIG[readline], is there a
> better way so it is only included if connman-client is used, instead of
> just connman?

you are on the right track

>
> Have a nice weekend.
> Claus Stovgaard
>
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

