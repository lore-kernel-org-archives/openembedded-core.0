Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web12.22987.1617029362650538654
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 07:49:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NdaJyocV;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id g20so12653631qkk.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Mar 2021 07:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5+FL0LwiGUE0PvGkQQ3P0ousC+mzagblBL30Nw4g6sc=;
        b=NdaJyocVFb5xGuL/efGFDNoyTHEay6GhtcvasSVyrdAUhHdcimM8VwBK7WV/FdMc68
         gke/rOhl2mWp5g1Mqb+1GGAv0TFHeaWUFMqu3eQECrCwG2xfyIgBt/+YGwi9Lk59xoZJ
         YRZ6q9/8wYBgBrGqaK7LMb998rA17m9BB1CCy7Ln04x58XDg37maPg6yzVy3MxN95Nyk
         SzilGk1JjKs3Bkx4YQ+5tqqBWK/dk0MPqJ1VG2Ps5ZvHA3hBnlzUbHAFHNocUiD8N1AU
         inV5vfkTO8xoreukKqDCE5teG7a1yAp+kUAjcx2IaHKidJ7BSdXQJXkxKA9tIutkcjLC
         IbBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5+FL0LwiGUE0PvGkQQ3P0ousC+mzagblBL30Nw4g6sc=;
        b=DbuqBKu1EpjSH2JTPAfcrJLOCYWqM/pY33WpflPFKSBBrkxjorSI+CPOfYxbtkfrej
         j6qCDva/cNmzm51jhEDwYXjQ5XFeoCNsgCFimdm4omAXhtrY5AjuD01FknTw3tbI/+Xy
         mmQrbcvq4y+A4tGfSNvHNh8yAwBML5i7kZG8aX7QSzNrWIZsDg0zWBAa2XFamEL2FOg4
         Y2dabktZJTHrG7LXrwwqDYXMO0KSZ2clS+vDWYaysk7rNjt6vdPiG166YqcqQ81P9sZ5
         piVg5ugppzrXvAxIfsoi8m2Snfg80AUM+lwCxQCgNlg6nj0an1Fbovcq5qQS3zH7Vx8y
         fGXw==
X-Gm-Message-State: AOAM5317c8kjGKx9NXykf7ALnOx3znG35x712LOViCnEvv9Wpwxoq/sz
	YZFh51NHiSYj1GcBF2/lVC+7D41iiAoZrUlsIjE=
X-Google-Smtp-Source: ABdhPJwtPj/Mlp3X+kIB+ThBgm5obceh9Ow1nNpV7J/IPpMlIVQfsWX82nkQGOqmPlia0RzODZKR1OtzDPiHhstHxgE=
X-Received: by 2002:a37:a350:: with SMTP id m77mr24968180qke.146.1617029361645;
 Mon, 29 Mar 2021 07:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <1617028952-12188-1-git-send-email-Neetika.Singh@kpit.com>
In-Reply-To: <1617028952-12188-1-git-send-email-Neetika.Singh@kpit.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 29 Mar 2021 07:48:55 -0700
Message-ID: <CAMKF1spvzo5LyO1a1kO2vrT-uUiXHM+ZGHffKC0AJhubQ2=c8Q@mail.gmail.com>
Subject: Re: [meta-oe][master][PATCH] libcroco: Add fix for CVE-2020-12825
To: "Neetika.Singh" <Neetika.Singh@kpit.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 29, 2021 at 7:42 AM Neetika.Singh <Neetika.Singh@kpit.com> wrot=
e:
>
> From: Neetika Singh <Neetika.Singh@kpit.com>
>
> Added refreshed patch for CVE issue CVE-2020-12825
> Link: https://gitlab.com/inkscape/inkscape/-/commit/203d62efefe6f79080863=
dda61593003b4c31f25
>
> Signed-off-by: Neetika.Singh <Neetika.Singh@kpit.com>
> ---
>  .../libcroco/libcroco/CVE-2020-12825.patch         | 192 +++++++++++++++=
++++++
>  meta/recipes-support/libcroco/libcroco_0.6.13.bb   |  22 +++
>  2 files changed, 214 insertions(+)
>  create mode 100644 meta/recipes-support/libcroco/libcroco/CVE-2020-12825=
.patch
>  create mode 100644 meta/recipes-support/libcroco/libcroco_0.6.13.bb

libcroco is already there in oe-core, perhaps you can rebase this
patch on top of latest oe-core master branch and resend.

>
> diff --git a/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch =
b/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
> new file mode 100644
> index 0000000..f813ded
> --- /dev/null
> +++ b/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
> @@ -0,0 +1,192 @@
> +From 203d62efefe6f79080863dda61593003b4c31f25 Mon Sep 17 00:00:00 2001
> +From: Michael Catanzaro <mcatanzaro@gnome.org>
> +Date: Thu, 13 Aug 2020 20:03:05 -0500
> +Subject: [PATCH] libcroco parser: limit recursion in block and any produ=
ctions
> +
> +If we don't have any limits, we can recurse forever and overflow the
> +stack.
> +
> +This is for CVE-2020-12825: Stack overflow in cr_parser_parse_any_core
> +in cr-parser.c.
> +
> +Bug: https://gitlab.gnome.org/Archive/libcroco/-/issues/8
> +Patch from https://gitlab.gnome.org/Archive/libcroco/-/merge_requests/5
> +
> +CVE: CVE-2020-12825
> +Upstream Status: Backport [https://gitlab.com/inkscape/inkscape/-/commit=
/203d62efefe6f79080863dda61593003b4c31f25.patch]
> +
> +Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
> +---
> + src/cr-parser.c | 44 ++++++++++++++++++++-----------
> + 1 file changed, 29 insertions(+), 15 deletions(-)
> +
> +diff --git a/src/cr-parser.c b/src/cr-parser.c
> +index d85e71f0fc..cd7b6ebd4a 100644
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
> +@@ -343,9 +345,11 @@ static enum CRStatus cr_parser_parse_selector_core =
(CRParser * a_this);
> +
> + static enum CRStatus cr_parser_parse_declaration_core (CRParser * a_thi=
s);
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
> +@@ -783,7 +787,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
> +         cr_parser_try_to_skip_spaces_and_comments (a_this);
> +
> +         do {
> +-                status =3D cr_parser_parse_any_core (a_this);
> ++                status =3D cr_parser_parse_any_core (a_this, 0);
> +         } while (status =3D=3D CR_OK);
> +
> +         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr,
> +@@ -794,7 +798,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
> +                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
> +                                       token);
> +                 token =3D NULL;
> +-                status =3D cr_parser_parse_block_core (a_this);
> ++                status =3D cr_parser_parse_block_core (a_this, 0);
> +                 CHECK_PARSING_STATUS (status,
> +                                       FALSE);
> +                 goto done;
> +@@ -929,11 +933,11 @@ cr_parser_parse_selector_core (CRParser * a_this)
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
> +@@ -955,10 +959,12 @@ cr_parser_parse_selector_core (CRParser * a_this)
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
> +@@ -966,6 +972,9 @@ cr_parser_parse_block_core (CRParser * a_this)
> +
> +         g_return_val_if_fail (a_this && PRIVATE (a_this), CR_BAD_PARAM_=
ERROR);
> +
> ++        if (n_calls > RECURSIVE_CALLERS_LIMIT)
> ++                return CR_ERROR;
> ++
> +         RECORD_INITIAL_POS (a_this, &init_pos);
> +
> +         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr, &t=
oken);
> +@@ -995,13 +1004,13 @@ cr_parser_parse_block_core (CRParser * a_this)
> +         } else if (token->type =3D=3D CBO_TK) {
> +                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, token);
> +                 token =3D NULL;
> +-                status =3D cr_parser_parse_block_core (a_this);
> ++                status =3D cr_parser_parse_block_core (a_this, n_calls =
+ 1);
> +                 CHECK_PARSING_STATUS (status, FALSE);
> +                 goto parse_block_content;
> +         } else {
> +                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, token);
> +                 token =3D NULL;
> +-                status =3D cr_parser_parse_any_core (a_this);
> ++                status =3D cr_parser_parse_any_core (a_this, n_calls + =
1);
> +                 CHECK_PARSING_STATUS (status, FALSE);
> +                 goto parse_block_content;
> +         }
> +@@ -1108,7 +1117,7 @@ cr_parser_parse_value_core (CRParser * a_this)
> +                 status =3D cr_tknzr_unget_token (PRIVATE (a_this)->tknz=
r,
> +                                                token);
> +                 token =3D NULL;
> +-                status =3D cr_parser_parse_block_core (a_this);
> ++                status =3D cr_parser_parse_block_core (a_this, 0);
> +                 CHECK_PARSING_STATUS (status, FALSE);
> +                 ref++;
> +                 goto continue_parsing;
> +@@ -1122,7 +1131,7 @@ cr_parser_parse_value_core (CRParser * a_this)
> +                 status =3D cr_tknzr_unget_token (PRIVATE (a_this)->tknz=
r,
> +                                                token);
> +                 token =3D NULL;
> +-                status =3D cr_parser_parse_any_core (a_this);
> ++                status =3D cr_parser_parse_any_core (a_this, 0);
> +                 if (status =3D=3D CR_OK) {
> +                         ref++;
> +                         goto continue_parsing;
> +@@ -1162,10 +1162,12 @@
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
> +@@ -1173,6 +1184,9 @@ cr_parser_parse_any_core (CRParser * a_this)
> +
> +         g_return_val_if_fail (a_this, CR_BAD_PARAM_ERROR);
> +
> ++        if (n_calls > RECURSIVE_CALLERS_LIMIT)
> ++                return CR_ERROR;
> ++
> +         RECORD_INITIAL_POS (a_this, &init_pos);
> +
> +         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr, &t=
oken1);
> +@@ -1211,7 +1225,7 @@ cr_parser_parse_any_core (CRParser * a_this)
> +                  *We consider parameter as being an "any*" production.
> +                  */
> +                 do {
> +-                        status =3D cr_parser_parse_any_core (a_this);
> ++                        status =3D cr_parser_parse_any_core (a_this, n_=
calls + 1);
> +                 } while (status =3D=3D CR_OK);
> +
> +                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR);
> +@@ -1236,7 +1250,7 @@ cr_parser_parse_any_core (CRParser * a_this)
> +                 }
> +
> +                 do {
> +-                        status =3D cr_parser_parse_any_core (a_this);
> ++                        status =3D cr_parser_parse_any_core (a_this, n_=
calls + 1);
> +                 } while (status =3D=3D CR_OK);
> +
> +                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR);
> +@@ -1264,7 +1278,7 @@ cr_parser_parse_any_core (CRParser * a_this)
> +                 }
> +
> +                 do {
> +-                        status =3D cr_parser_parse_any_core (a_this);
> ++                        status =3D cr_parser_parse_any_core (a_this, n_=
calls + 1);
> +                 } while (status =3D=3D CR_OK);
> +
> +                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR);
> +--
> +GitLab
> diff --git a/meta/recipes-support/libcroco/libcroco_0.6.13.bb b/meta/reci=
pes-support/libcroco/libcroco_0.6.13.bb
> new file mode 100644
> index 0000000..fd5927e
> --- /dev/null
> +++ b/meta/recipes-support/libcroco/libcroco_0.6.13.bb
> @@ -0,0 +1,22 @@
> +SUMMARY =3D "Cascading Style Sheet (CSS) parsing and manipulation toolki=
t"
> +HOMEPAGE =3D "http://www.gnome.org/"
> +BUGTRACKER =3D "https://bugzilla.gnome.org/"
> +
> +LICENSE =3D "LGPLv2 & LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9abc=
605 \
> +                    file://src/cr-rgb.c;endline=3D22;md5=3D31d5f0944d556=
c8589d04ea6055fcc66 \
> +                    file://tests/cr-test-utils.c;endline=3D21;md5=3D2382=
c27934cae1d3792fcb17a6142c4e"
> +
> +SECTION =3D "x11/utils"
> +DEPENDS =3D "glib-2.0 libxml2 zlib"
> +BBCLASSEXTEND =3D "native nativesdk"
> +EXTRA_OECONF +=3D "--enable-Bsymbolic=3Dauto"
> +
> +BINCONFIG =3D "${bindir}/croco-0.6-config"
> +
> +inherit gnomebase gtk-doc binconfig-disabled
> +
> +SRC_URI +=3D "file://CVE-2020-12825.patch"
> +
> +SRC_URI[archive.md5sum] =3D "c80c5a8385011a0260dce6bd0da93dce"
> +SRC_URI[archive.sha256sum] =3D "767ec234ae7aa684695b3a735548224888132e06=
3f92db585759b422570621d4"
> --
> 2.7.4
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
