Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web09.8679.1612535955928248898
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 06:39:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=YDwE420W;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.46, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f46.google.com with SMTP id i9so6086562wmq.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Feb 2021 06:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=z7TlQGCaiQjWq5yi3CTCfrmVPrp4hsua/eGCdRYFqEk=;
        b=YDwE420W9mWdDCUUdkw6rAIbZtT35S+/wqGV9BZmCRNLLNd2PX6cQNqHRQ9tfjotDe
         AD6PBh+Lhs0Sk9kg8BvJEd8axqFZ2is6INAZ9vL9CONz0uZlM2NZ9SRYgI/+m/wOyl2g
         RWogILoCjUXOgqpg+UezCbymqDZi2C8T16Wk/J/lum2ofoPMskLa5Yt6pPuAaXs9Oo6d
         N5+gXQuyPlK+SGsP8ghnpn717YUMp8WCqkFBJiyht7GmLCBRykHdFUc4wd/vA7VX5oT0
         yn+ksEzKqYgbMSipcv1EgJ+Sh0hCzghu/M906WXWZInw9qxI6SFfUDCHZEbVdg347D3X
         9l3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=z7TlQGCaiQjWq5yi3CTCfrmVPrp4hsua/eGCdRYFqEk=;
        b=VyPUI/ztGsvQuZxfhoTT9XuZ1Jgu8OWxqi3ixQperU8HpXkSmFQ7Nma9XFAwfoW6lo
         l7s1VinEZZhH9IzQgBoIL+BkV0Gp+VMJ2jN6KKDvjkJ+XIxx+I4/vEE6vHCJ6EJ6TwcY
         OzwI380D5iIEiNJprsDKwkqmKHoF4qTMUlKFJolBHRc7b2Hsnd7hRt67QnnZdpWXiZWt
         Q7alnozLQApSGNYLF1e11hSaAhrgK4auMspWZoL+N5G1rxzpPOmbx2B93WTCCPas/mvD
         ypQDu+JMMjqNa03datEs2KvJLWaLsqA7jE5A2Wm0h9RNEJfYLbQu7d2Fbe3OL7hKXPiK
         pSeA==
X-Gm-Message-State: AOAM533ocYEjjIPagTf47R5mmYOR+HVrKfX8xC5MPZ3hDRE/k/KzhR4N
	35BMvqFJxAID1QPIf+VYKeKK1W6ZAy1R2k1Ej4AIEQ==
X-Google-Smtp-Source: ABdhPJzSD2KeIirULCgKGcNhC4v4dg1qqk/DqdKI92sLa5mBstQsms7hCg7xUJcMh1Pjj+ZTeMJMpy+zW9uBhqBH6h4=
X-Received: by 2002:a7b:c0d8:: with SMTP id s24mr3982597wmh.4.1612535954275;
 Fri, 05 Feb 2021 06:39:14 -0800 (PST)
MIME-Version: 1.0
References: <1612530087-24752-1-git-send-email-Saloni.Jain@kpit.com>
In-Reply-To: <1612530087-24752-1-git-send-email-Saloni.Jain@kpit.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 5 Feb 2021 04:39:02 -1000
Message-ID: <CAOSpxdbRLmACeScG=u6aQHooxVDf0DY2zhMcv0_r2PggZaGOhw@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] libcroco: Added CVE-2020-12825
To: saloni <saloni.jain@kpit.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>, Anuj Chougule <anuj.chougule@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 5, 2021 at 3:01 AM saloni <saloni.jain@kpit.com> wrote:
>
> Added below CVE:
> CVE-2020-12825
> Link: CVE-2020-12825 [https://gitlab.gnome.org/Archive/libcroco/-/commit=
/6eb257e5c731c691eb137fca94e916ca73941a5a]
> Link: https://gitlab.gnome.org/Archive/libcroco/-/issues/8
>
> Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
> ---
>  .../libcroco/files/CVE-2020-12825.patch            | 193 ++++++++++++++=
+++++++
>  meta/recipes-support/libcroco/libcroco_0.6.13.bb   |   3 +
>  2 files changed, 196 insertions(+)
>  create mode 100644 meta/recipes-support/libcroco/files/CVE-2020-12825.p=
atch
>
> diff --git a/meta/recipes-support/libcroco/files/CVE-2020-12825.patch b/=
meta/recipes-support/libcroco/files/CVE-2020-12825.patch
> new file mode 100644
> index 0000000..966b812
> --- /dev/null
> +++ b/meta/recipes-support/libcroco/files/CVE-2020-12825.patch
> @@ -0,0 +1,193 @@
> +From 6eb257e5c731c691eb137fca94e916ca73941a5a Mon Sep 17 00:00:00 2001
> +From: Michael Catanzaro <mcatanzaro@gnome.org>
> +Date: Fri, 31 Jul 2020 15:21:53 -0500
> +Subject: [PATCH] libcroco: Limit recursion in block and any productions
> + (CVE-2020-12825)
> +
> +If we don't have any limits, we can recurse forever and overflow the
> +stack.
> +
> +Fixes #8
> +This is per https://gitlab.gnome.org/Archive/libcroco/-/issues/8
> +
> +https://gitlab.gnome.org/GNOME/gnome-shell/-/merge_requests/1404
> +
> +CVE: CVE-2020-12825
> +Upstream-Status: Backport [https://gitlab.gnome.org/Archive/libcroco/-/=
commit/6eb257e5c731c691eb137fca94e916ca73941a5a]
> +Comment: No changes done.
> +Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
> +---
> + src/cr-parser.c | 44 +++++++++++++++++++++++++++++---------------
> + 1 file changed, 29 insertions(+), 15 deletions(-)
> +
> +diff --git a/src/cr-parser.c b/src/cr-parser.c
> +index 18c9a01..f4a62e3 100644
> +--- a/src/cr-parser.c
> ++++ b/src/cr-parser.c
> +@@ -136,6 +136,8 @@ struct _CRParserPriv {
> +
> + #define CHARS_TAB_SIZE 12
> +
> ++#define RECURSIVE_CALLERS_LIMIT 100
> ++
> + /**
> +  * IS_NUM:
> +  *@a_char: the char to test.
> +@@ -344,9 +346,11 @@ static enum CRStatus cr_parser_parse_selector_core=
 (CRParser * a_this);
> +
> + static enum CRStatus cr_parser_parse_declaration_core (CRParser * a_th=
is);
> +
> +-static enum CRStatus cr_parser_parse_any_core (CRParser * a_this);
> ++static enum CRStatus cr_parser_parse_any_core (CRParser * a_this,
> ++                                               guint      n_calls);
> +
> +-static enum CRStatus cr_parser_parse_block_core (CRParser * a_this);
> ++static enum CRStatus cr_parser_parse_block_core (CRParser * a_this,
> ++                                                 guint      n_calls);
> +
> + static enum CRStatus cr_parser_parse_value_core (CRParser * a_this);
> +
> +@@ -784,7 +788,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
> +         cr_parser_try_to_skip_spaces_and_comments (a_this);
> +
> +         do {
> +-                status =3D cr_parser_parse_any_core (a_this);
> ++                status =3D cr_parser_parse_any_core (a_this, 0);
> +         } while (status =3D=3D CR_OK);
> +
> +         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr,
> +@@ -795,7 +799,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
> +                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
> +                                       token);
> +                 token =3D NULL;
> +-                status =3D cr_parser_parse_block_core (a_this);
> ++                status =3D cr_parser_parse_block_core (a_this, 0);
> +                 CHECK_PARSING_STATUS (status,
> +                                       FALSE);
> +                 goto done;
> +@@ -930,11 +934,11 @@ cr_parser_parse_selector_core (CRParser * a_this)
> +
> +         RECORD_INITIAL_POS (a_this, &init_pos);
> +
> +-        status =3D cr_parser_parse_any_core (a_this);
> ++        status =3D cr_parser_parse_any_core (a_this, 0);
> +         CHECK_PARSING_STATUS (status, FALSE);
> +
> +         do {
> +-                status =3D cr_parser_parse_any_core (a_this);
> ++                status =3D cr_parser_parse_any_core (a_this, 0);
> +
> +         } while (status =3D=3D CR_OK);
> +
> +@@ -956,10 +960,12 @@ cr_parser_parse_selector_core (CRParser * a_this)
> +  *in chapter 4.1 of the css2 spec.
> +  *block ::=3D '{' S* [ any | block | ATKEYWORD S* | ';' ]* '}' S*;
> +  *@param a_this the current instance of #CRParser.
> ++ *@param n_calls used to limit recursion depth
> +  *FIXME: code this function.
> +  */
> + static enum CRStatus
> +-cr_parser_parse_block_core (CRParser * a_this)
> ++cr_parser_parse_block_core (CRParser * a_this,
> ++                            guint      n_calls)
> + {
> +         CRToken *token =3D NULL;
> +         CRInputPos init_pos;
> +@@ -967,6 +973,9 @@ cr_parser_parse_block_core (CRParser * a_this)
> +
> +         g_return_val_if_fail (a_this && PRIVATE (a_this), CR_BAD_PARAM=
_ERROR);
> +
> ++        if (n_calls > RECURSIVE_CALLERS_LIMIT)
> ++                return CR_ERROR;
> ++
> +         RECORD_INITIAL_POS (a_this, &init_pos);
> +
> +         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr, &=
token);
> +@@ -996,13 +1005,13 @@ cr_parser_parse_block_core (CRParser * a_this)
> +         } else if (token->type =3D=3D CBO_TK) {
> +                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, token);
> +                 token =3D NULL;
> +-                status =3D cr_parser_parse_block_core (a_this);
> ++                status =3D cr_parser_parse_block_core (a_this, n_calls=
 + 1);
> +                 CHECK_PARSING_STATUS (status, FALSE);
> +                 goto parse_block_content;
> +         } else {
> +                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, token);
> +                 token =3D NULL;
> +-                status =3D cr_parser_parse_any_core (a_this);
> ++                status =3D cr_parser_parse_any_core (a_this, n_calls +=
 1);
> +                 CHECK_PARSING_STATUS (status, FALSE);
> +                 goto parse_block_content;
> +         }
> +@@ -1109,7 +1118,7 @@ cr_parser_parse_value_core (CRParser * a_this)
> +                 status =3D cr_tknzr_unget_token (PRIVATE (a_this)->tkn=
zr,
> +                                                token);
> +                 token =3D NULL;
> +-                status =3D cr_parser_parse_block_core (a_this);
> ++                status =3D cr_parser_parse_block_core (a_this, 0);
> +                 CHECK_PARSING_STATUS (status, FALSE);
> +                 ref++;
> +                 goto continue_parsing;
> +@@ -1123,7 +1132,7 @@ cr_parser_parse_value_core (CRParser * a_this)
> +                 status =3D cr_tknzr_unget_token (PRIVATE (a_this)->tkn=
zr,
> +                                                token);
> +                 token =3D NULL;
> +-                status =3D cr_parser_parse_any_core (a_this);
> ++                status =3D cr_parser_parse_any_core (a_this, 0);
> +                 if (status =3D=3D CR_OK) {
> +                         ref++;
> +                         goto continue_parsing;
> +@@ -1162,10 +1171,12 @@ cr_parser_parse_value_core (CRParser * a_this)
> +  *        | FUNCTION | DASHMATCH | '(' any* ')' | '[' any* ']' ] S*;
> +  *
> +  *@param a_this the current instance of #CRParser.
> ++ *@param n_calls used to limit recursion depth
> +  *@return CR_OK upon successfull completion, an error code otherwise.
> +  */
> + static enum CRStatus
> +-cr_parser_parse_any_core (CRParser * a_this)
> ++cr_parser_parse_any_core (CRParser * a_this,
> ++                          guint      n_calls)
> + {
> +         CRToken *token1 =3D NULL,
> +                 *token2 =3D NULL;
> +@@ -1174,6 +1185,9 @@ cr_parser_parse_any_core (CRParser * a_this)
> +
> +         g_return_val_if_fail (a_this, CR_BAD_PARAM_ERROR);
> +
> ++        if (n_calls > RECURSIVE_CALLERS_LIMIT)
> ++                return CR_ERROR;
> ++
> +         RECORD_INITIAL_POS (a_this, &init_pos);
> +
> +         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr, &=
token1);
> +@@ -1212,7 +1226,7 @@ cr_parser_parse_any_core (CRParser * a_this)
> +                  *We consider parameter as being an "any*" production.
> +                  */
> +                 do {
> +-                        status =3D cr_parser_parse_any_core (a_this);
> ++                        status =3D cr_parser_parse_any_core (a_this, n=
_calls + 1);
> +                 } while (status =3D=3D CR_OK);
> +
> +                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR);
> +@@ -1237,7 +1251,7 @@ cr_parser_parse_any_core (CRParser * a_this)
> +                 }
> +
> +                 do {
> +-                        status =3D cr_parser_parse_any_core (a_this);
> ++                        status =3D cr_parser_parse_any_core (a_this, n=
_calls + 1);
> +                 } while (status =3D=3D CR_OK);
> +
> +                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR);
> +@@ -1265,7 +1279,7 @@ cr_parser_parse_any_core (CRParser * a_this)
> +                 }
> +
> +                 do {
> +-                        status =3D cr_parser_parse_any_core (a_this);
> ++                        status =3D cr_parser_parse_any_core (a_this, n=
_calls + 1);
> +                 } while (status =3D=3D CR_OK);
> +
> +                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR);
> +--
> +GitLab
> +
> diff --git a/meta/recipes-support/libcroco/libcroco_0.6.13.bb b/meta/rec=
ipes-support/libcroco/libcroco_0.6.13.bb
> index 9171a9d..a443ff2 100644
> --- a/meta/recipes-support/libcroco/libcroco_0.6.13.bb
> +++ b/meta/recipes-support/libcroco/libcroco_0.6.13.bb
> @@ -18,3 +18,6 @@ inherit gnomebase gtk-doc binconfig-disabled
>
>  SRC_URI[archive.md5sum] =3D "c80c5a8385011a0260dce6bd0da93dce"
>  SRC_URI[archive.sha256sum] =3D "767ec234ae7aa684695b3a735548224888132e0=
63f92db585759b422570621d4"
> +
> +SRC_URI +=3D"file://CVE-2020-12825.patch \
> +"
> --
> 2.7.4

Thanks! This patch looks fine to me, but since this issue is also
present in master and gatesgarth you should resubmit with
[master][gatesgarth][dunfell] in the Subject. Otherwise Richard won't
pull this into the master branch.

Once it hits master then Anuj and I can pull into gatesgarth and dunfell.

Steve


> This message contains information that may be privileged or confidential=
 and is the property of the KPIT Technologies Ltd. It is intended only for =
the person to whom it is addressed. If you are not the intended recipient, =
you are not authorized to read, print, retain copy, disseminate, distribute=
, or use this message or any part thereof. If you receive this message in e=
rror, please notify the sender immediately and delete all copies of this me=
ssage. KPIT Technologies Ltd. does not accept any liability for virus infec=
ted mails.
>
>=20
>
