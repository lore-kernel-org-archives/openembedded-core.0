Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E1FC46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 04:51:48 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.10276.1704775902228665650
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jan 2024 20:51:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I1k5Zl5G;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6dc018228b4so1679818a34.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jan 2024 20:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704775901; x=1705380701; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlJiJYsXUeh/W+6RCY3Q+RbNR9as8wuRF+JP3M8r/+Y=;
        b=I1k5Zl5GIcb5DDygoYB30kJcQ/g6yzjG6KU7N+VsaUK64QebXp5OPSc8ev772ar8jI
         Tk+Pgq94YYY0KbNyjaqa+qdyIYfmcF/8iupkDjSoDLB+eDMfQezj1+Ct+Nx4QDs9CIKj
         m2KJn4rIGLebBcdhdTC9pY4mOswmsP3mkZ3D9kdfbVvX0IbR8zeaf5156gtJ5L8d7eZL
         mdJxYN0Or0nLJLb8qMCwvcRpMwPFOxRBUd3WMStkGlNHhVLPPLe7SAYWgObec5tXEQrC
         gImRh9YHDSDzX3SbApu5PRKRTCcnY3r2AbUpoLSlhHz1ohLrXsYYumc4JrhR3WjXzApB
         JbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704775901; x=1705380701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mlJiJYsXUeh/W+6RCY3Q+RbNR9as8wuRF+JP3M8r/+Y=;
        b=PYdZPw/UzEck41ts0DYfo+v+e9pW9Cz6RlD1KI+DTVkxFW4t88eO8819RcQTm9PNeG
         t5DKGX7k/kTOvlhxjPjjESVaTOrDDmzslQPZv3dkVez4+MptbNuw+0GRlAWAWnUl82Nw
         absXtWq8mOIMyy3wAnztUzeTPsb3L7Klfq8UOvUNSW/PNTUjlQtXHVlLN8yfrggV+Nfz
         Z6Y9ZLsfQCpEnLYEKLKAr0CtkArEFTJkhUWTQfdj8wqSsEfponvlvzPjure17/4j29Cd
         BwJUut5xWcuxfF3z6mRM52Rh2c3KNCWoRT3tSbG+Y8J8H5LNDvhG+hysqkue9MW/MxMW
         5jpg==
X-Gm-Message-State: AOJu0Yy1QL/DEm1C5wPDXmCQXUlhpWBb3eM7PBuGxbg/N0CqxDlzptrR
	OczAObRW2v/0G0SgiKGp98G4L5Jgy3pullxusnY=
X-Google-Smtp-Source: AGHT+IGzupliY/g+vqplrk6vQcZxB/gdTWtpJMvcy5gJEW2gGiWoSSSdwH4nVEXNewRxts41Fl8GUCw3SlCeUDglJVg=
X-Received: by 2002:a05:6871:d08e:b0:1fb:15c3:2882 with SMTP id
 mw14-20020a056871d08e00b001fb15c32882mr5429611oac.100.1704775901260; Mon, 08
 Jan 2024 20:51:41 -0800 (PST)
MIME-Version: 1.0
References: <1704271378-18012-1-git-send-email-wangmy@fujitsu.com> <1704271378-18012-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1704271378-18012-2-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Jan 2024 20:51:15 -0800
Message-ID: <CAMKF1sq6=xXciGLcmdpYsNnzM8H5RK=7uzjNde5BKH5EVC1w3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-lxml: upgrade 4.9.4 -> 45.0.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jan 2024 04:51:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193442

subject line should say 5.0.0 instead of 45.0.0

Secondly, be aware that this upgrade will need to disable
incompatible-function-pointer-types warning as error
when using clang. I have added a relevant fix to nonclangable conf
file in meta-clang.

On Wed, Jan 3, 2024 at 12:44=E2=80=AFAM wangmy <wangmy@fujitsu.com> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -LP#1976304: The "Element.addnext()" method previously inserted the new e=
lement
>  before existing tail text.  The tail text of both sibling elements now s=
tays on
>  the respective elements.
> -LP#1980767, GH#379: "TreeBuilder.close()" could fail with a "TypeError" =
after
>  parsing incorrect input.
> -"Element.itertext(with_tail=3DFalse)" returned the tail text of comments=
 and
>  processing instructions, despite the explicit option.
> -GH#370: A crash with recent libxml2 2.11.x versions was resolved.
> -A compile problem with recent libxml2 2.12.x versions was resolved.
> -The internal exception handling in C callbacks was improved for Cython 3=
.0.
> -The exception declarations of "xmlInputReadCallback", "xmlInputCloseCall=
back",
> -"xmlOutputWriteCallback" and "xmlOutputCloseCallback" in "tree.pxd" were
>  corrected to prevent running Python code or calling into the C-API with =
a live
>  exception set.
> -GH#385: The long deprecated "unittest.makeSuite()" function is no longer=
 used.
> -LP#1522052: A file-system specific test is now optional and should no lo=
nger fail
>  on systems that don't support it.
> -GH#392: Some tests were adapted for libxml2 2.13.
> -Contains all fixes from lxml 4.9.4.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../python/{python3-lxml_4.9.4.bb =3D> python3-lxml_5.0.0.bb}    | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-lxml_4.9.4.bb =3D> python3-=
lxml_5.0.0.bb} (94%)
>
> diff --git a/meta/recipes-devtools/python/python3-lxml_4.9.4.bb b/meta/re=
cipes-devtools/python/python3-lxml_5.0.0.bb
> similarity index 94%
> rename from meta/recipes-devtools/python/python3-lxml_4.9.4.bb
> rename to meta/recipes-devtools/python/python3-lxml_5.0.0.bb
> index ed8bce0735..e27405fd23 100644
> --- a/meta/recipes-devtools/python/python3-lxml_4.9.4.bb
> +++ b/meta/recipes-devtools/python/python3-lxml_5.0.0.bb
> @@ -18,10 +18,11 @@ LIC_FILES_CHKSUM =3D "file://LICENSES.txt;md5=3De4c04=
5ebad958ead4b48008f70838403 \
>
>  DEPENDS +=3D "libxml2 libxslt"
>
> -SRC_URI[sha256sum] =3D "b1541e50b78e15fa06a2670157a1962ef06591d4c998b998=
047fff5e3236880e"
> +SRC_URI[sha256sum] =3D "2219cbf790e701acf9a21a31ead75f983e73daf0eceb9da6=
990212e4d20ebefe"
>
>  SRC_URI +=3D "${PYPI_SRC_URI}"
>  inherit pkgconfig pypi setuptools3
> +PYPI_PACKAGE_EXT =3D "zip"
>
>  # {standard input}: Assembler messages:
>  # {standard input}:1488805: Error: branch out of range
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193276): https://lists.openembedded.org/g/openembedde=
d-core/message/193276
> Mute This Topic: https://lists.openembedded.org/mt/103498685/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

