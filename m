Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id A67BB7E4E9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 19:44:00 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id j1so9197970qkk.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 12:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=oz+QZLHwTfNrlOKU4YKMrzriTeTXPfGFFFiEGlLxyKs=;
	b=LSAZ4Vl/XlvkzISpVNkjygt8FaekT10nrhGTMqhBkAC1MivAmd9N7YPLBNwNuJgt9A
	kXACm2ZVS2dgWa1OMESihrJ3bIqXaUmUmlvwzTIKaOIZO50eUtOcDz7WZAU4ItOkY9ZU
	3V1FOUr98LxKtZbxiJ3HoOoi2NFrZJI27BUB3xRgFVYIrG5/uUYGGiPdz8fAZyD9fr0h
	fYoDpN1xv2caxVZl9uc4VDNQv5jr/v7mxLmotHDlLzs1gN2roj31bQyaPbnD0IscXVKL
	6GCU4mYQOyE6LBWPKoh2jTfUebdF26eexqEDfqQr4Vyi0jfClCsOFbpzYE6dq7fUc9W4
	0aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=oz+QZLHwTfNrlOKU4YKMrzriTeTXPfGFFFiEGlLxyKs=;
	b=pZ2yI85nZfMIwXGJOXaMGQfP6VVCyTGLS2y+ZmwwDl62Q1yZgHo5n0iOF/TkkWytF1
	oPxDNDK7Nju8qrksJCfTHjOb/g9Vj2oIOPlu85Wm4zu1u/y+x1DVhbfhYt/8Q1PdxaNj
	DB299Qt70o5y2RNp/mYnU/geh/YY424Nz4Zw1J+RNFH0mwGUtpsT4dvXJY6JZrh0pxgN
	hR7X8+wcrrXUXgdgJJ3VKT5eA895JOlVLIBywIFMS+CLQxuE+m8gdcH6QrwDvOLqhJMj
	3ufga00yBrOiZz3AP1gQMHtGUY6J6zwp59m26l3F1e4p0e8x6XzgLoQpWqFwVuUQnApl
	Yhzw==
X-Gm-Message-State: APjAAAUcJLkjYcHwAo2/J+0Thhm+ULNrapyuBQrNVtjPUIZw61081Kml
	JNXIBgV/AZU1Mt6AEJYPFipG5/UxEqGqfIdVBo4=
X-Google-Smtp-Source: APXvYqynHuYlQnqaEnSbXXUNGknlZFTdWwQZ6N+ribUXGtdaEHwFD2ODH9109kDv6uBnSQCI/s6wYrAABOHHkey/amw=
X-Received: by 2002:ac8:2f35:: with SMTP id j50mr85825219qta.378.1558727041420;
	Fri, 24 May 2019 12:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1558664136.git.Qi.Chen@windriver.com>
	<ff55bb58704a56b9957b36863b704dad3d69ea0f.1558664136.git.Qi.Chen@windriver.com>
	<17c3408af1ebd7edc0f9c99c0bbec3617e8885b9.camel@linuxfoundation.org>
	<CAMKF1so1cOr78PRop6cLi+w7GTSSnKgniOpNyJxgDU_EVSbkfw@mail.gmail.com>
	<CA+chaQf--h3zXut4+ahWea1AU_d6Uv=eFk1UuuCts8Xj_S9S=g@mail.gmail.com>
In-Reply-To: <CA+chaQf--h3zXut4+ahWea1AU_d6Uv=eFk1UuuCts8Xj_S9S=g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 May 2019 12:43:35 -0700
Message-ID: <CAMKF1speuBwsG=D_UA0DfTe4noa84czCgycv20doci5mE3Kxmw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd: avoid musl specific patches affect glibc systems
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
X-List-Received-Date: Fri, 24 May 2019 19:44:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 24, 2019 at 12:14 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> It's still nicer to have
> SRC_URI_append_libc-musl = " ${SRC_URI_MUSL}"
> if the intermediate SRC_URI_MUSL variable is useful.

yeah we can do away with this one variable here.

>
> On Fri, May 24, 2019 at 7:59 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Fri, May 24, 2019 at 10:31 AM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >
>> > On Fri, 2019-05-24 at 10:17 +0800, Chen Qi wrote:
>> > > systemd upstream only care about glibc. We made musl specific
>> > > patches so that systemd could work. But currently these patches
>> > > contain potential security issues.
>> > >
>> > > So apply these patches only when the libc is musl.
>> > >
>> > > Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> > > ---
>> > >  meta/recipes-core/systemd/systemd_242.bb | 2 +-
>> > >  1 file changed, 1 insertion(+), 1 deletion(-)
>> > >
>> > > diff --git a/meta/recipes-core/systemd/systemd_242.bb b/meta/recipes-
>> > > core/systemd/systemd_242.bb
>> > > index 2dda0d0..adb592f 100644
>> > > --- a/meta/recipes-core/systemd/systemd_242.bb
>> > > +++ b/meta/recipes-core/systemd/systemd_242.bb
>> > > @@ -27,7 +27,7 @@ SRC_URI += "file://touchscreen.rules \
>> > >             "
>> > >
>> > >  # patches needed by musl
>> > > -SRC_URI += "${SRC_URI_MUSL}"
>> > > +SRC_URI += "${@d.getVar('SRC_URI_MUSL') if d.getVar('TCLIBC') ==
>> > > 'musl' else ''}"
>> > >  SRC_URI_MUSL = "file://0001-Use-getenv-when-secure-versions-are-not-
>> > > available.patch \
>> > >                 file://0002-don-t-use-glibc-specific-qsort_r.patch \
>> > >                 file://0003-missing_type.h-add-__compare_fn_t-and-
>> > > comparison_fn_.patch \
>> >
>> > Doesn't the usual SRC_URI_append_libc-musl = "X" work?
>> >
>>
>> yes this should be better, SRC_URI_MUSL was introduced so someone
>> could override it
>> but if we make it optional then using override is better I think
>>
>> > Cheers,
>> >
>> > Richard
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

