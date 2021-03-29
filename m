Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web09.23192.1617031035267220952
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 08:17:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hf/L/at+;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id e7so14609432edu.10
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Mar 2021 08:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iQ3yo7WNv63MZ85KXst2NwTQtUy9thJP8x+1e1PHOTQ=;
        b=hf/L/at+0KTChtT4EtZYtrT/Sr+knpHT6ktIsG26Idvad5nuAX+QxSkREhgUGlP/e3
         2WOnPFYtbx/PkAst9lVAZuwr+nkfqguS9q/5ZkVMXKyAZLBpf2DG7lnQ69mc+n2gR53t
         8JEQ9KCUjAVOXJdrsDtd+C+9i5vZ91zoDFznTfQACGlwKj4Zu6olbu92JYRTxVvFffvU
         7ECI1H4nRehHpCzo0XWb12oqTo2gBx++cq14yEfoFOsfhA7BkpWy/G6wm1jl+wkOCJKr
         TErwavDIFJzbtbfydvaFYZUE4jPcaubYElm4XSjcwTpgh7b3nMgquGU45qAdhpfrRzHL
         TYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iQ3yo7WNv63MZ85KXst2NwTQtUy9thJP8x+1e1PHOTQ=;
        b=iioGt3jZSYcJqm4vexYVQtc4LxOM9LA5G8jSigpdXaSxZWMREQcf8UYjUfYaJh9rn2
         29eWy0719Nv7y66+9OlN6Dv9t9fsn1Xteq9vZ3EmnJsy9fk7KWZu8MQBV9E+ojNDmD4h
         0NTFZerfpNnIXvumepU29XiEdyhTdKggBrh5hKV6MPDZfIS5ikBVUlyrzeFl9+E/yxyv
         KryI9FwBKuVR4NL3MX0nqfNFnSMbVKbXEiz3DkMoUs4P0v3cylwShRJeRi5xgnvaovrW
         UZZ3V4VYUw2nk16yfsoC6QtLK0Z9+K/5dDBH8AuCWONxIN2QeShC+7T/lwIyUfgcnj2J
         9omQ==
X-Gm-Message-State: AOAM533/Pggs2CbUJWJ4BszXNAw6gMY6NCr3tbiQqufQ+EdHoAGFwLYo
	4BoJFRYfT7Nb+Kq8rUrD6mSDERp8Po7zRSY6U4k=
X-Google-Smtp-Source: ABdhPJytK2qdrBXMbt2Jwv9B3DBxgL9JlgcQ734/480D9+wGayVcroOivWp2xUeahPdOPGeE1eKtQJ5vJme92UdpXbY=
X-Received: by 2002:aa7:cf95:: with SMTP id z21mr28466180edx.76.1617031033570;
 Mon, 29 Mar 2021 08:17:13 -0700 (PDT)
MIME-Version: 1.0
References: <1617028952-12188-1-git-send-email-Neetika.Singh@kpit.com>
 <CAMKF1spvzo5LyO1a1kO2vrT-uUiXHM+ZGHffKC0AJhubQ2=c8Q@mail.gmail.com> <BMXPR01MB235831D5134C15F33350AD479F7E9@BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <BMXPR01MB235831D5134C15F33350AD479F7E9@BMXPR01MB2358.INDPRD01.PROD.OUTLOOK.COM>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 29 Mar 2021 17:17:02 +0200
Message-ID: <CA+chaQfetV_fjDi+-PR7M7ipZYS2gYb9UbNJnOQax4JkAHveng@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][master][PATCH] libcroco: Add fix for CVE-2020-12825
To: "Neetika.Singh" <Neetika.Singh@kpit.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Nisha Parrakat <Nisha.Parrakat@kpit.com>
Content-Type: multipart/alternative; boundary="00000000000058c7b905beae60c2"

--00000000000058c7b905beae60c2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The subject still says [meta-oe] while the patch is for oe-core, that might
be what mislead Khem.

On Mon, Mar 29, 2021 at 5:04 PM Neetika.Singh <Neetika.Singh@kpit.com>
wrote:

> Hi Raj,
>
> I have verified locally and these changes are showing to me as up to dat=
e
> on latest oe-core master branch.
>
> git log origin/master..HEAD
> commit 1abebf8d3ce044609ae29d7dee7a9b268e510ebd
> Author: Neetika Singh <Neetika.Singh@kpit.com>
> Date:   Fri Nov 20 18:35:15 2020 +0530
>
>     libcroco: Add fix for CVE-2020-12825
>
>     Added refreshed patch for CVE issue CVE-2020-12825
>     Link:
> https://gitlab.com/inkscape/inkscape/-/commit/203d62efefe6f79080863dda61=
593003b4c31f25
>
>     Signed-off-by: Neetika.Singh <Neetika.Singh@kpit.com>
>
>
>  Thanks & Regards,
>  Neetika Singh
>  Product Engineering Services (PES)
>  KPIT Technologies Limited
>
>
> ------------------------------
> *From:* Khem Raj <raj.khem@gmail.com>
> *Sent:* 29 March 2021 20:18
> *To:* Neetika Singh <Neetika.Singh@kpit.com>
> *Cc:* Patches and discussions about the oe-core layer <
> openembedded-core@lists.openembedded.org>; Nisha Parrakat <
> Nisha.Parrakat@kpit.com>
> *Subject:* Re: [meta-oe][master][PATCH] libcroco: Add fix for
> CVE-2020-12825
>
> On Mon, Mar 29, 2021 at 7:42 AM Neetika.Singh <Neetika.Singh@kpit.com>
> wrote:
> >
> > From: Neetika Singh <Neetika.Singh@kpit.com>
> >
> > Added refreshed patch for CVE issue CVE-2020-12825
> > Link:
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitl=
ab.com%2Finkscape%2Finkscape%2F-%2Fcommit%2F203d62efefe6f79080863dda6159300=
3b4c31f25&amp;data=3D04%7C01%7CNeetika.Singh%40kpit.com%7C8e558ea4a71d4cec7=
dad08d8f2c1d822%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63752626173546=
4157%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik=
1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DOkTKj7JQfH35aD1GkovrszMEQxQVkATiTjd=
o6VpiCEk%3D&amp;reserved=3D0
> >
> > Signed-off-by: Neetika.Singh <Neetika.Singh@kpit.com>
> > ---
> >  .../libcroco/libcroco/CVE-2020-12825.patch         | 192
> +++++++++++++++++++++
> >  meta/recipes-support/libcroco/libcroco_0.6.13.bb   |  22 +++
> >  2 files changed, 214 insertions(+)
> >  create mode 100644
> meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
> >  create mode 100644 meta/recipes-support/libcroco/libcroco_0.6.13.bb
>
> libcroco is already there in oe-core, perhaps you can rebase this
> patch on top of latest oe-core master branch and resend.
>
> >
> > diff --git a/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.pat=
ch
> b/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
> > new file mode 100644
> > index 0000000..f813ded
> > --- /dev/null
> > +++ b/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
> > @@ -0,0 +1,192 @@
> > +From 203d62efefe6f79080863dda61593003b4c31f25 Mon Sep 17 00:00:00 200=
1
> > +From: Michael Catanzaro <mcatanzaro@gnome.org>
> > +Date: Thu, 13 Aug 2020 20:03:05 -0500
> > +Subject: [PATCH] libcroco parser: limit recursion in block and any
> productions
> > +
> > +If we don't have any limits, we can recurse forever and overflow the
> > +stack.
> > +
> > +This is for CVE-2020-12825: Stack overflow in cr_parser_parse_any_cor=
e
> > +in cr-parser.c.
> > +
> > +Bug:
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitl=
ab.gnome.org%2FArchive%2Flibcroco%2F-%2Fissues%2F8&amp;data=3D04%7C01%7CNee=
tika.Singh%40kpit.com%7C8e558ea4a71d4cec7dad08d8f2c1d822%7C3539451eb46e4a26=
a242ff61502855c7%7C0%7C0%7C637526261735464157%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sd=
ata=3D1JQbRwD7xiTrBT1%2F9Kx8Nop84lOd3JT5ImU7eOYAfiU%3D&amp;reserved=3D0
> > +Patch from
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitl=
ab.gnome.org%2FArchive%2Flibcroco%2F-%2Fmerge_requests%2F5&amp;data=3D04%7C=
01%7CNeetika.Singh%40kpit.com%7C8e558ea4a71d4cec7dad08d8f2c1d822%7C3539451e=
b46e4a26a242ff61502855c7%7C0%7C0%7C637526261735474152%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C100=
0&amp;sdata=3D7jcaMq8meYRVhbA4o%2BN0XZZ1Hxz0jxqg31jxZUVHIV4%3D&amp;reserved=
=
=3D0
> > +
> > +CVE: CVE-2020-12825
> > +Upstream Status: Backport [
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitl=
ab.com%2Finkscape%2Finkscape%2F-%2Fcommit%2F203d62efefe6f79080863dda6159300=
3b4c31f25.patch&amp;data=3D04%7C01%7CNeetika.Singh%40kpit.com%7C8e558ea4a71=
d4cec7dad08d8f2c1d822%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63752626=
1735474152%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJB=
TiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DHF%2FyBXMAOe4xpTBIMhyc25pEPaL=
Sc2buc4ho910zbxk%3D&amp;reserved=3D0
> ]
> > +
> > +Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
> > +---
> > + src/cr-parser.c | 44 ++++++++++++++++++++-----------
> > + 1 file changed, 29 insertions(+), 15 deletions(-)
> > +
> > +diff --git a/src/cr-parser.c b/src/cr-parser.c
> > +index d85e71f0fc..cd7b6ebd4a 100644
> > +--- a/src/cr-parser.c
> > ++++ b/src/cr-parser.c
> > +@@ -136,6 +136,8 @@ struct _CRParserPriv {
> > +
> > + #define CHARS_TAB_SIZE 12
> > +
> > ++#define RECURSIVE_CALLERS_LIMIT 100
> > ++
> > + /**
> > +  * IS_NUM:
> > +  *@a_char: the char to test.
> > +@@ -343,9 +345,11 @@ static enum CRStatus cr_parser_parse_selector_co=
re
> (CRParser * a_this);
> > +
> > + static enum CRStatus cr_parser_parse_declaration_core (CRParser *
> a_this);
> > +
> > +-static enum CRStatus cr_parser_parse_any_core (CRParser * a_this);
> > ++static enum CRStatus cr_parser_parse_any_core (CRParser * a_this,
> > ++                                               guint      n_calls);
> > +
> > +-static enum CRStatus cr_parser_parse_block_core (CRParser * a_this);
> > ++static enum CRStatus cr_parser_parse_block_core (CRParser * a_this,
> > ++                                                 guint      n_calls)=
;
> > +
> > + static enum CRStatus cr_parser_parse_value_core (CRParser * a_this);
> > +
> > +@@ -783,7 +787,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
> > +         cr_parser_try_to_skip_spaces_and_comments (a_this);
> > +
> > +         do {
> > +-                status =3D cr_parser_parse_any_core (a_this);
> > ++                status =3D cr_parser_parse_any_core (a_this, 0);
> > +         } while (status =3D=3D CR_OK);
> > +
> > +         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr,
> > +@@ -794,7 +798,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
> > +                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
> > +                                       token);
> > +                 token =3D NULL;
> > +-                status =3D cr_parser_parse_block_core (a_this);
> > ++                status =3D cr_parser_parse_block_core (a_this, 0);
> > +                 CHECK_PARSING_STATUS (status,
> > +                                       FALSE);
> > +                 goto done;
> > +@@ -929,11 +933,11 @@ cr_parser_parse_selector_core (CRParser * a_thi=
s)
> > +
> > +         RECORD_INITIAL_POS (a_this, &init_pos);
> > +
> > +-        status =3D cr_parser_parse_any_core (a_this);
> > ++        status =3D cr_parser_parse_any_core (a_this, 0);
> > +         CHECK_PARSING_STATUS (status, FALSE);
> > +
> > +         do {
> > +-                status =3D cr_parser_parse_any_core (a_this);
> > ++                status =3D cr_parser_parse_any_core (a_this, 0);
> > +
> > +         } while (status =3D=3D CR_OK);
> > +
> > +@@ -955,10 +959,12 @@ cr_parser_parse_selector_core (CRParser * a_thi=
s)
> > +  *in chapter 4.1 of the css2 spec.
> > +  *block ::=3D '{' S* [ any | block | ATKEYWORD S* | ';' ]* '}' S*;
> > +  *@param a_this the current instance of #CRParser.
> > ++ *@param n_calls used to limit recursion depth
> > +  *FIXME: code this function.
> > +  */
> > + static enum CRStatus
> > +-cr_parser_parse_block_core (CRParser * a_this)
> > ++cr_parser_parse_block_core (CRParser * a_this,
> > ++                            guint      n_calls)
> > + {
> > +         CRToken *token =3D NULL;
> > +         CRInputPos init_pos;
> > +@@ -966,6 +972,9 @@ cr_parser_parse_block_core (CRParser * a_this)
> > +
> > +         g_return_val_if_fail (a_this && PRIVATE (a_this),
> CR_BAD_PARAM_ERROR);
> > +
> > ++        if (n_calls > RECURSIVE_CALLERS_LIMIT)
> > ++                return CR_ERROR;
> > ++
> > +         RECORD_INITIAL_POS (a_this, &init_pos);
> > +
> > +         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr,
> &token);
> > +@@ -995,13 +1004,13 @@ cr_parser_parse_block_core (CRParser * a_this)
> > +         } else if (token->type =3D=3D CBO_TK) {
> > +                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, token=
);
> > +                 token =3D NULL;
> > +-                status =3D cr_parser_parse_block_core (a_this);
> > ++                status =3D cr_parser_parse_block_core (a_this, n_cal=
ls +
> 1);
> > +                 CHECK_PARSING_STATUS (status, FALSE);
> > +                 goto parse_block_content;
> > +         } else {
> > +                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, token=
);
> > +                 token =3D NULL;
> > +-                status =3D cr_parser_parse_any_core (a_this);
> > ++                status =3D cr_parser_parse_any_core (a_this, n_calls=
 +
> 1);
> > +                 CHECK_PARSING_STATUS (status, FALSE);
> > +                 goto parse_block_content;
> > +         }
> > +@@ -1108,7 +1117,7 @@ cr_parser_parse_value_core (CRParser * a_this)
> > +                 status =3D cr_tknzr_unget_token (PRIVATE (a_this)->t=
knzr,
> > +                                                token);
> > +                 token =3D NULL;
> > +-                status =3D cr_parser_parse_block_core (a_this);
> > ++                status =3D cr_parser_parse_block_core (a_this, 0);
> > +                 CHECK_PARSING_STATUS (status, FALSE);
> > +                 ref++;
> > +                 goto continue_parsing;
> > +@@ -1122,7 +1131,7 @@ cr_parser_parse_value_core (CRParser * a_this)
> > +                 status =3D cr_tknzr_unget_token (PRIVATE (a_this)->t=
knzr,
> > +                                                token);
> > +                 token =3D NULL;
> > +-                status =3D cr_parser_parse_any_core (a_this);
> > ++                status =3D cr_parser_parse_any_core (a_this, 0);
> > +                 if (status =3D=3D CR_OK) {
> > +                         ref++;
> > +                         goto continue_parsing;
> > +@@ -1162,10 +1162,12 @@
> > +  *        | FUNCTION | DASHMATCH | '(' any* ')' | '[' any* ']' ] S*;
> > +  *
> > +  *@param a_this the current instance of #CRParser.
> > ++ *@param n_calls used to limit recursion depth
> > +  *@return CR_OK upon successfull completion, an error code otherwise=
.
> > +  */
> > + static enum CRStatus
> > +-cr_parser_parse_any_core (CRParser * a_this)
> > ++cr_parser_parse_any_core (CRParser * a_this,
> > ++                          guint      n_calls)
> > + {
> > +         CRToken *token1 =3D NULL,
> > +                 *token2 =3D NULL;
> > +@@ -1173,6 +1184,9 @@ cr_parser_parse_any_core (CRParser * a_this)
> > +
> > +         g_return_val_if_fail (a_this, CR_BAD_PARAM_ERROR);
> > +
> > ++        if (n_calls > RECURSIVE_CALLERS_LIMIT)
> > ++                return CR_ERROR;
> > ++
> > +         RECORD_INITIAL_POS (a_this, &init_pos);
> > +
> > +         status =3D cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr,
> &token1);
> > +@@ -1211,7 +1225,7 @@ cr_parser_parse_any_core (CRParser * a_this)
> > +                  *We consider parameter as being an "any*" productio=
n.
> > +                  */
> > +                 do {
> > +-                        status =3D cr_parser_parse_any_core (a_this)=
;
> > ++                        status =3D cr_parser_parse_any_core (a_this,
> n_calls + 1);
> > +                 } while (status =3D=3D CR_OK);
> > +
> > +                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR)=
;
> > +@@ -1236,7 +1250,7 @@ cr_parser_parse_any_core (CRParser * a_this)
> > +                 }
> > +
> > +                 do {
> > +-                        status =3D cr_parser_parse_any_core (a_this)=
;
> > ++                        status =3D cr_parser_parse_any_core (a_this,
> n_calls + 1);
> > +                 } while (status =3D=3D CR_OK);
> > +
> > +                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR)=
;
> > +@@ -1264,7 +1278,7 @@ cr_parser_parse_any_core (CRParser * a_this)
> > +                 }
> > +
> > +                 do {
> > +-                        status =3D cr_parser_parse_any_core (a_this)=
;
> > ++                        status =3D cr_parser_parse_any_core (a_this,
> n_calls + 1);
> > +                 } while (status =3D=3D CR_OK);
> > +
> > +                 ENSURE_PARSING_COND (status =3D=3D CR_PARSING_ERROR)=
;
> > +--
> > +GitLab
> > diff --git a/meta/recipes-support/libcroco/libcroco_0.6.13.bb
> b/meta/recipes-support/libcroco/libcroco_0.6.13.bb
> > new file mode 100644
> > index 0000000..fd5927e
> > --- /dev/null
> > +++ b/meta/recipes-support/libcroco/libcroco_0.6.13.bb
> > @@ -0,0 +1,22 @@
> > +SUMMARY =3D "Cascading Style Sheet (CSS) parsing and manipulation too=
lkit"
> > +HOMEPAGE =3D "
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.g=
nome.org%2F&amp;data=3D04%7C01%7CNeetika.Singh%40kpit.com%7C8e558ea4a71d4ce=
c7dad08d8f2c1d822%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637526261735=
474152%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6=
Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DZ9wmwFLA%2BuBT243Dv5a666ng67OAfyt=
EYyAVv3sn4GA%3D&amp;reserved=3D0
> "
> > +BUGTRACKER =3D "
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugz=
illa.gnome.org%2F&amp;data=3D04%7C01%7CNeetika.Singh%40kpit.com%7C8e558ea4a=
71d4cec7dad08d8f2c1d822%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637526=
261735474152%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC=
JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DynFHfdJS8RUpg8kqJOBlTsQPz3%=
2FxMvoBgBiVMLAC0u4%3D&amp;reserved=3D0
> "
> > +
> > +LICENSE =3D "LGPLv2 & LGPLv2.1"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9=
abc605
> \
> > +
> file://src/cr-rgb.c;endline=3D22;md5=3D31d5f0944d556c8589d04ea6055fcc66 =
\
> > +
> file://tests/cr-test-utils.c;endline=3D21;md5=3D2382c27934cae1d3792fcb17=
a6142c4e
> "
> > +
> > +SECTION =3D "x11/utils"
> > +DEPENDS =3D "glib-2.0 libxml2 zlib"
> > +BBCLASSEXTEND =3D "native nativesdk"
> > +EXTRA_OECONF +=3D "--enable-Bsymbolic=3Dauto"
> > +
> > +BINCONFIG =3D "${bindir}/croco-0.6-config"
> > +
> > +inherit gnomebase gtk-doc binconfig-disabled
> > +
> > +SRC_URI +=3D "file://CVE-2020-12825.patch"
> > +
> > +SRC_URI[archive.md5sum] =3D "c80c5a8385011a0260dce6bd0da93dce"
> > +SRC_URI[archive.sha256sum] =3D
> "767ec234ae7aa684695b3a735548224888132e063f92db585759b422570621d4"
> > --
> > 2.7.4
> >
> > This message contains information that may be privileged or confidenti=
al
> and is the property of the KPIT Technologies Ltd. It is intended only fo=
r
> the person to whom it is addressed. If you are not the intended recipien=
t,
> you are not authorized to read, print, retain copy, disseminate,
> distribute, or use this message or any part thereof. If you receive this
> message in error, please notify the sender immediately and delete all
> copies of this message. KPIT Technologies Ltd. does not accept any
> liability for virus infected mails.
> This message contains information that may be privileged or confidential
> and is the property of the KPIT Technologies Ltd. It is intended only fo=
r
> the person to whom it is addressed. If you are not the intended recipien=
t,
> you are not authorized to read, print, retain copy, disseminate,
> distribute, or use this message or any part thereof. If you receive this
> message in error, please notify the sender immediately and delete all
> copies of this message. KPIT Technologies Ltd. does not accept any
> liability for virus infected mails.
>
>=20
>
>

--00000000000058c7b905beae60c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The subject still says [meta-oe] while the patch is for oe=
-core, that might be what mislead Khem.</div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 29, 2021 at 5:04 PM Neet=
ika.Singh &lt;<a href=3D"mailto:Neetika.Singh@kpit.com">Neetika.Singh@kpit.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0);background-color:rgb(255,255,255)">
Hi Raj,</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0);background-color:rgb(255,255,255)">
I have verified locally and these changes are showing to me as up to date =
on latest oe-core master branch.</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0);background-color:rgb(255,255,255)">
<br>
</div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0);background-color:rgb(255,255,255)">
git log origin/master..HEAD
<div>commit 1abebf8d3ce044609ae29d7dee7a9b268e510ebd</div>
<div>Author: Neetika Singh &lt;<a href=3D"mailto:Neetika.Singh@kpit.com" t=
arget=3D"_blank">Neetika.Singh@kpit.com</a>&gt;</div>
<div>Date: =C2=A0 Fri Nov 20 18:35:15 2020 +0530</div>
<div><br>
</div>
<div>=C2=A0 =C2=A0 libcroco: Add fix for CVE-2020-12825</div>
<div>=C2=A0 =C2=A0 </div>
<div>=C2=A0 =C2=A0 Added refreshed patch for CVE issue CVE-2020-12825</div=
>
<div>=C2=A0 =C2=A0 Link: <a href=3D"https://gitlab.com/inkscape/inkscape/-=
/commit/203d62efefe6f79080863dda61593003b4c31f25" target=3D"_blank">https:/=
/gitlab.com/inkscape/inkscape/-/commit/203d62efefe6f79080863dda61593003b4c3=
1f25</a></div>
<div>=C2=A0 =C2=A0 </div>
<div>=C2=A0 =C2=A0 Signed-off-by: Neetika.Singh &lt;<a href=3D"mailto:Neet=
ika.Singh@kpit.com" target=3D"_blank">Neetika.Singh@kpit.com</a>&gt;</div>
<br>
</div>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif;font-size:12p=
t;color:rgb(0,0,0)">
<br>
</div>
<div id=3D"gmail-m_-8405785055394451331Signature">
<div>
<div name=3D"divtagdefaultwrapper">
<font size=3D"3" face=3D"&#39;Segoe UI&#39;,Sans-Serif"></font>
<div name=3D"divtagdefaultwrapper" style=3D"margin:0px">
<div name=3D"divtagdefaultwrapper" style=3D"margin:0px"><font size=3D"3" f=
ace=3D"&#39;Segoe UI&#39;,Sans-Serif" color=3D"black"><span dir=3D"ltr" sty=
le=3D"font-size:12pt;background-color:white">
<div id=3D"gmail-m_-8405785055394451331Signature"><font size=3D"2"><span s=
tyle=3D"font-size:11pt"><font color=3D"003366"><span style=3D"font-size:9pt=
" lang=3D"en-IN">=C2=A0</span></font></span>Thanks &amp; Regards,<br>
</font>
<div style=3D"margin:0px"><font size=3D"2">=C2=A0<font color=3D"003366">Ne=
etika Singh<br>
=C2=A0Product Engineering Services (PES)</font></font></div>
<div style=3D"margin:0px"><font size=3D"2"><font color=3D"003366">=C2=A0KP=
IT Technologies Limited<br>
</font></font></div>
<font size=3D"2"></font>
<div style=3D"margin:0px"><br>
</div>
<font color=3D"00CCFF"></font>
<div style=3D"margin:0px"><font color=3D"00CCFF"></font>
<div><font color=3D"00CCFF"></font>
<div style=3D"margin:0px"><span style=3D"font-size:11pt"><font color=3D"00=
CCFF"><b><span style=3D"font-size:9pt" lang=3D"en-IN"></span><span style=3D=
"font-size:9pt" lang=3D"en-IN"></span></b></font><font color=3D"#8EAADB"><s=
pan style=3D"font-size:10pt" lang=3D"en-IN"><b><br>
</b></span></font></span></div>
</div>
</div>
</div>
</span></font></div>
</div>
<font size=3D"3" face=3D"&#39;Segoe UI&#39;,Sans-Serif"></font></div>
</div>
</div>
</div>
<div id=3D"gmail-m_-8405785055394451331appendonsend"></div>
<hr style=3D"display:inline-block;width:98%">
<div id=3D"gmail-m_-8405785055394451331divRplyFwdMsg" dir=3D"ltr"><font fa=
ce=3D"Calibri, sans-serif" style=3D"font-size:11pt" color=3D"#000000"><b>Fr=
om:</b> Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank=
">raj.khem@gmail.com</a>&gt;<br>
<b>Sent:</b> 29 March 2021 20:18<br>
<b>To:</b> Neetika Singh &lt;<a href=3D"mailto:Neetika.Singh@kpit.com" tar=
get=3D"_blank">Neetika.Singh@kpit.com</a>&gt;<br>
<b>Cc:</b> Patches and discussions about the oe-core layer &lt;<a href=3D"=
mailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembe=
dded-core@lists.openembedded.org</a>&gt;; Nisha Parrakat &lt;<a href=3D"mai=
lto:Nisha.Parrakat@kpit.com" target=3D"_blank">Nisha.Parrakat@kpit.com</a>&=
gt;<br>
<b>Subject:</b> Re: [meta-oe][master][PATCH] libcroco: Add fix for CVE-202=
0-12825</font>
<div>=C2=A0</div>
</div>
<div><font size=3D"2"><span style=3D"font-size:11pt">
<div>On Mon, Mar 29, 2021 at 7:42 AM Neetika.Singh &lt;<a href=3D"mailto:N=
eetika.Singh@kpit.com" target=3D"_blank">Neetika.Singh@kpit.com</a>&gt; wro=
te:<br>
&gt;<br>
&gt; From: Neetika Singh &lt;<a href=3D"mailto:Neetika.Singh@kpit.com" tar=
get=3D"_blank">Neetika.Singh@kpit.com</a>&gt;<br>
&gt;<br>
&gt; Added refreshed patch for CVE issue CVE-2020-12825<br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgitlab.com%2Finkscape%2Finkscape%2F-%2Fcommit%2F203d62efe=
fe6f79080863dda61593003b4c31f25&amp;amp;data=3D04%7C01%7CNeetika.Singh%40kp=
it.com%7C8e558ea4a71d4cec7dad08d8f2c1d822%7C3539451eb46e4a26a242ff61502855c=
7%7C0%7C0%7C637526261735464157%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi=
LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DOkTKj=
7JQfH35aD1GkovrszMEQxQVkATiTjdo6VpiCEk%3D&amp;amp;reserved=3D0" target=3D"_=
blank">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab=
.com%2Finkscape%2Finkscape%2F-%2Fcommit%2F203d62efefe6f79080863dda61593003b=
4c31f25&amp;amp;data=3D04%7C01%7CNeetika.Singh%40kpit.com%7C8e558ea4a71d4ce=
c7dad08d8f2c1d822%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637526261735=
464157%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6=
Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DOkTKj7JQfH35aD1GkovrszMEQxQVk=
ATiTjdo6VpiCEk%3D&amp;amp;reserved=3D0</a><br>
&gt;<br>
&gt; Signed-off-by: Neetika.Singh &lt;<a href=3D"mailto:Neetika.Singh@kpit=
.com" target=3D"_blank">Neetika.Singh@kpit.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../libcroco/libcroco/CVE-2020-12825.patch=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 192 +++++++++++++++++++++<br>
&gt;=C2=A0 meta/recipes-support/libcroco/<a href=3D"http://libcroco_0.6.13=
.bb" target=3D"_blank">libcroco_0.6.13.bb</a>=C2=A0=C2=A0 |=C2=A0 22 +++<br=
>
&gt;=C2=A0 2 files changed, 214 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/libcroco/libcroco/CVE-2=
020-12825.patch<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/libcroco/<a href=3D"htt=
p://libcroco_0.6.13.bb" target=3D"_blank">libcroco_0.6.13.bb</a><br>
<br>
libcroco is already there in oe-core, perhaps you can rebase this<br>
patch on top of latest oe-core master branch and resend.<br>
<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.pa=
tch b/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000..f813ded<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch<br>
&gt; @@ -0,0 +1,192 @@<br>
&gt; +From 203d62efefe6f79080863dda61593003b4c31f25 Mon Sep 17 00:00:00 20=
01<br>
&gt; +From: Michael Catanzaro &lt;<a href=3D"mailto:mcatanzaro@gnome.org" =
target=3D"_blank">mcatanzaro@gnome.org</a>&gt;<br>
&gt; +Date: Thu, 13 Aug 2020 20:03:05 -0500<br>
&gt; +Subject: [PATCH] libcroco parser: limit recursion in block and any p=
roductions<br>
&gt; +<br>
&gt; +If we don&#39;t have any limits, we can recurse forever and overflow=
 the<br>
&gt; +stack.<br>
&gt; +<br>
&gt; +This is for CVE-2020-12825: Stack overflow in cr_parser_parse_any_co=
re<br>
&gt; +in cr-parser.c.<br>
&gt; +<br>
&gt; +Bug: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgitlab.gnome.org%2FArchive%2Flibcroco%2F-%2Fissues%2F8&am=
p;amp;data=3D04%7C01%7CNeetika.Singh%40kpit.com%7C8e558ea4a71d4cec7dad08d8f=
2c1d822%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637526261735464157%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D1JQbRwD7xiTrBT1%2F9Kx8Nop84lOd3JT5ImU7e=
OYAfiU%3D&amp;amp;reserved=3D0" target=3D"_blank">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab=
.gnome.org%2FArchive%2Flibcroco%2F-%2Fissues%2F8&amp;amp;data=3D04%7C01%7CN=
eetika.Singh%40kpit.com%7C8e558ea4a71d4cec7dad08d8f2c1d822%7C3539451eb46e4a=
26a242ff61502855c7%7C0%7C0%7C637526261735464157%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;=
amp;sdata=3D1JQbRwD7xiTrBT1%2F9Kx8Nop84lOd3JT5ImU7eOYAfiU%3D&amp;amp;reserv=
ed=3D0</a><br>
&gt; +Patch from <a href=3D"https://apc01.safelinks.protection.outlook.com=
/?url=3Dhttps%3A%2F%2Fgitlab.gnome.org%2FArchive%2Flibcroco%2F-%2Fmerge_req=
uests%2F5&amp;amp;data=3D04%7C01%7CNeetika.Singh%40kpit.com%7C8e558ea4a71d4=
cec7dad08d8f2c1d822%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6375262617=
35474152%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi=
I6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D7jcaMq8meYRVhbA4o%2BN0XZZ1H=
xz0jxqg31jxZUVHIV4%3D&amp;amp;reserved=3D0" target=3D"_blank">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab=
.gnome.org%2FArchive%2Flibcroco%2F-%2Fmerge_requests%2F5&amp;amp;data=3D04%=
7C01%7CNeetika.Singh%40kpit.com%7C8e558ea4a71d4cec7dad08d8f2c1d822%7C353945=
1eb46e4a26a242ff61502855c7%7C0%7C0%7C637526261735474152%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1=
000&amp;amp;sdata=3D7jcaMq8meYRVhbA4o%2BN0XZZ1Hxz0jxqg31jxZUVHIV4%3D&amp;am=
p;reserved=3D0</a><br>
&gt; +<br>
&gt; +CVE: CVE-2020-12825<br>
&gt; +Upstream Status: Backport [<a href=3D"https://apc01.safelinks.protec=
tion.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab.com%2Finkscape%2Finkscape%2F-%=
2Fcommit%2F203d62efefe6f79080863dda61593003b4c31f25.patch&amp;amp;data=3D04=
%7C01%7CNeetika.Singh%40kpit.com%7C8e558ea4a71d4cec7dad08d8f2c1d822%7C35394=
51eb46e4a26a242ff61502855c7%7C0%7C0%7C637526261735474152%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
1000&amp;amp;sdata=3DHF%2FyBXMAOe4xpTBIMhyc25pEPaLSc2buc4ho910zbxk%3D&amp;a=
mp;reserved=3D0" target=3D"_blank">https://apc01.safelinks.protection.outlo=
ok.com/?url=3Dhttps%3A%2F%2Fgitlab.com%2Finkscape%2Finkscape%2F-%2Fcommit%2=
F203d62efefe6f79080863dda61593003b4c31f25.patch&amp;amp;data=3D04%7C01%7CNe=
etika.Singh%40kpit.com%7C8e558ea4a71d4cec7dad08d8f2c1d822%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637526261735474152%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;a=
mp;sdata=3DHF%2FyBXMAOe4xpTBIMhyc25pEPaLSc2buc4ho910zbxk%3D&amp;amp;reserve=
d=3D0</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Neetika Singh &lt;<a href=3D"mailto:Neetika.Singh@kpi=
t.com" target=3D"_blank">Neetika.Singh@kpit.com</a>&gt;<br>
&gt; +---<br>
&gt; + src/cr-parser.c | 44 ++++++++++++++++++++-----------<br>
&gt; + 1 file changed, 29 insertions(+), 15 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/cr-parser.c b/src/cr-parser.c<br>
&gt; +index d85e71f0fc..cd7b6ebd4a 100644<br>
&gt; +--- a/src/cr-parser.c<br>
&gt; ++++ b/src/cr-parser.c<br>
&gt; +@@ -136,6 +136,8 @@ struct _CRParserPriv {<br>
&gt; +<br>
&gt; + #define CHARS_TAB_SIZE 12<br>
&gt; +<br>
&gt; ++#define RECURSIVE_CALLERS_LIMIT 100<br>
&gt; ++<br>
&gt; + /**<br>
&gt; +=C2=A0 * IS_NUM:<br>
&gt; +=C2=A0 *@a_char: the char to test.<br>
&gt; +@@ -343,9 +345,11 @@ static enum CRStatus cr_parser_parse_selector_c=
ore (CRParser * a_this);<br>
&gt; +<br>
&gt; + static enum CRStatus cr_parser_parse_declaration_core (CRParser * a=
_this);<br>
&gt; +<br>
&gt; +-static enum CRStatus cr_parser_parse_any_core (CRParser * a_this);<=
br>
&gt; ++static enum CRStatus cr_parser_parse_any_core (CRParser * a_this,<b=
r>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 guint=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n_calls);<br>
&gt; +<br>
&gt; +-static enum CRStatus cr_parser_parse_block_core (CRParser * a_this)=
;<br>
&gt; ++static enum CRStatus cr_parser_parse_block_core (CRParser * a_this,=
<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 guint=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n_calls);<br>
&gt; +<br>
&gt; + static enum CRStatus cr_parser_parse_value_core (CRParser * a_this)=
;<br>
&gt; +<br>
&gt; +@@ -783,7 +787,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)<=
br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cr_parser_try_to_sk=
ip_spaces_and_comments (a_this);<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do {<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 status =3D cr_parser_parse_any_core (a_this);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 status =3D cr_parser_parse_any_core (a_this, 0);<=
br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } while (status =3D=
=
=3D CR_OK);<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D cr_tknzr=
_get_next_token (PRIVATE (a_this)-&gt;tknzr,<br>
&gt; +@@ -794,7 +798,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)<=
br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cr_tknzr_unget_token (PRIVATE (a_this)-&gt;=
tknzr,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 token);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 token =3D NULL;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 status =3D cr_parser_parse_block_core (a_this);<b=
r>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 status =3D cr_parser_parse_block_core (a_this, 0)=
;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CHECK_PARSING_STATUS (status,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 FALSE);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto done;<br>
&gt; +@@ -929,11 +933,11 @@ cr_parser_parse_selector_core (CRParser * a_th=
is)<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RECORD_INITIAL_POS =
(a_this, &amp;init_pos);<br>
&gt; +<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D cr_parser_par=
se_any_core (a_this);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D cr_parser_par=
se_any_core (a_this, 0);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CHECK_PARSING_STATU=
S (status, FALSE);<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do {<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 status =3D cr_parser_parse_any_core (a_this);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 status =3D cr_parser_parse_any_core (a_this, 0);<=
br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } while (status =3D=
=
=3D CR_OK);<br>
&gt; +<br>
&gt; +@@ -955,10 +959,12 @@ cr_parser_parse_selector_core (CRParser * a_th=
is)<br>
&gt; +=C2=A0 *in chapter 4.1 of the css2 spec.<br>
&gt; +=C2=A0 *block ::=3D &#39;{&#39; S* [ any | block | ATKEYWORD S* | &#=
39;;&#39; ]* &#39;}&#39; S*;<br>
&gt; +=C2=A0 *@param a_this the current instance of #CRParser.<br>
&gt; ++ *@param n_calls used to limit recursion depth<br>
&gt; +=C2=A0 *FIXME: code this function.<br>
&gt; +=C2=A0 */<br>
&gt; + static enum CRStatus<br>
&gt; +-cr_parser_parse_block_core (CRParser * a_this)<br>
&gt; ++cr_parser_parse_block_core (CRParser * a_this,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 guint=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n_calls)<br>
&gt; + {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CRToken *token =3D =
NULL;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CRInputPos init_pos=
;<br>
&gt; +@@ -966,6 +972,9 @@ cr_parser_parse_block_core (CRParser * a_this)<b=
r>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_return_val_if_fai=
l (a_this &amp;&amp; PRIVATE (a_this), CR_BAD_PARAM_ERROR);<br>
&gt; +<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (n_calls &gt; RECURSI=
VE_CALLERS_LIMIT)<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return CR_ERROR;<br>
&gt; ++<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RECORD_INITIAL_POS =
(a_this, &amp;init_pos);<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D cr_tknzr=
_get_next_token (PRIVATE (a_this)-&gt;tknzr, &amp;token);<br>
&gt; +@@ -995,13 +1004,13 @@ cr_parser_parse_block_core (CRParser * a_this=
)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else if (token-&g=
t;type =3D=3D CBO_TK) {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cr_tknzr_unget_token (PRIVATE (a_this)-&gt;=
tknzr, token);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 token =3D NULL;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 status =3D cr_parser_parse_block_core (a_this);<b=
r>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 status =3D cr_parser_parse_block_core (a_this, n_=
calls + 1);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CHECK_PARSING_STATUS (status, FALSE);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto parse_block_content;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cr_tknzr_unget_token (PRIVATE (a_this)-&gt;=
tknzr, token);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 token =3D NULL;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 status =3D cr_parser_parse_any_core (a_this);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 status =3D cr_parser_parse_any_core (a_this, n_ca=
lls + 1);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CHECK_PARSING_STATUS (status, FALSE);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto parse_block_content;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +@@ -1108,7 +1117,7 @@ cr_parser_parse_value_core (CRParser * a_this)=
<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D cr_tknzr_unget_token (PRIVATE (a=
_this)-&gt;tknzr,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t=
oken);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 token =3D NULL;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 status =3D cr_parser_parse_block_core (a_this);<b=
r>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 status =3D cr_parser_parse_block_core (a_this, 0)=
;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CHECK_PARSING_STATUS (status, FALSE);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ref++;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 goto continue_parsing;<br>
&gt; +@@ -1122,7 +1131,7 @@ cr_parser_parse_value_core (CRParser * a_this)=
<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D cr_tknzr_unget_token (PRIVATE (a=
_this)-&gt;tknzr,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 t=
oken);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 token =3D NULL;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 status =3D cr_parser_parse_any_core (a_this);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 status =3D cr_parser_parse_any_core (a_this, 0);<=
br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (status =3D=3D CR_OK) {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ref++;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 goto continue_parsing;<br>
&gt; +@@ -1162,10 +1162,12 @@<br>
&gt; +=C2=A0 *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | FUNCTION | DASH=
MATCH | &#39;(&#39; any* &#39;)&#39; | &#39;[&#39; any* &#39;]&#39; ] S*;<b=
r>
&gt; +=C2=A0 *<br>
&gt; +=C2=A0 *@param a_this the current instance of #CRParser.<br>
&gt; ++ *@param n_calls used to limit recursion depth<br>
&gt; +=C2=A0 *@return CR_OK upon successfull completion, an error code oth=
erwise.<br>
&gt; +=C2=A0 */<br>
&gt; + static enum CRStatus<br>
&gt; +-cr_parser_parse_any_core (CRParser * a_this)<br>
&gt; ++cr_parser_parse_any_core (CRParser * a_this,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 guint=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 n_calls)<br>
&gt; + {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CRToken *token1 =3D=
 NULL,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *token2 =3D NULL;<br>
&gt; +@@ -1173,6 +1184,9 @@ cr_parser_parse_any_core (CRParser * a_this)<b=
r>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 g_return_val_if_fai=
l (a_this, CR_BAD_PARAM_ERROR);<br>
&gt; +<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (n_calls &gt; RECURSI=
VE_CALLERS_LIMIT)<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 return CR_ERROR;<br>
&gt; ++<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RECORD_INITIAL_POS =
(a_this, &amp;init_pos);<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D cr_tknzr=
_get_next_token (PRIVATE (a_this)-&gt;tknzr, &amp;token1);<br>
&gt; +@@ -1211,7 +1225,7 @@ cr_parser_parse_any_core (CRParser * a_this)<b=
r>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *We consider parameter as being an &q=
uot;any*&quot; production.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do {<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
tatus =3D cr_parser_parse_any_core (a_this);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
tatus =3D cr_parser_parse_any_core (a_this, n_calls + 1);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } while (status =3D=3D CR_OK);<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ENSURE_PARSING_COND (status =3D=3D CR_PARSI=
NG_ERROR);<br>
&gt; +@@ -1236,7 +1250,7 @@ cr_parser_parse_any_core (CRParser * a_this)<b=
r>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do {<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
tatus =3D cr_parser_parse_any_core (a_this);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
tatus =3D cr_parser_parse_any_core (a_this, n_calls + 1);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } while (status =3D=3D CR_OK);<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ENSURE_PARSING_COND (status =3D=3D CR_PARSI=
NG_ERROR);<br>
&gt; +@@ -1264,7 +1278,7 @@ cr_parser_parse_any_core (CRParser * a_this)<b=
r>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do {<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
tatus =3D cr_parser_parse_any_core (a_this);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
tatus =3D cr_parser_parse_any_core (a_this, n_calls + 1);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } while (status =3D=3D CR_OK);<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ENSURE_PARSING_COND (status =3D=3D CR_PARSI=
NG_ERROR);<br>
&gt; +--<br>
&gt; +GitLab<br>
&gt; diff --git a/meta/recipes-support/libcroco/<a href=3D"http://libcroco=
_0.6.13.bb" target=3D"_blank">libcroco_0.6.13.bb</a> b/meta/recipes-support=
/libcroco/<a href=3D"http://libcroco_0.6.13.bb" target=3D"_blank">libcroco_=
0.6.13.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000..fd5927e<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/libcroco/<a href=3D"http://libcroco_0.6.13=
.bb" target=3D"_blank">libcroco_0.6.13.bb</a><br>
&gt; @@ -0,0 +1,22 @@<br>
&gt; +SUMMARY =3D &quot;Cascading Style Sheet (CSS) parsing and manipulati=
on toolkit&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://apc01.safelinks.protection.out=
look.com/?url=3Dhttp%3A%2F%2Fwww.gnome.org%2F&amp;amp;data=3D04%7C01%7CNeet=
ika.Singh%40kpit.com%7C8e558ea4a71d4cec7dad08d8f2c1d822%7C3539451eb46e4a26a=
242ff61502855c7%7C0%7C0%7C637526261735474152%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp=
;sdata=3DZ9wmwFLA%2BuBT243Dv5a666ng67OAfytEYyAVv3sn4GA%3D&amp;amp;reserved=
=3D0" target=3D"_blank">https://apc01.safelinks.protection.outlook.com/?ur=
l=3Dhttp%3A%2F%2Fwww.gnome.org%2F&amp;amp;data=3D04%7C01%7CNeetika.Singh%40=
kpit.com%7C8e558ea4a71d4cec7dad08d8f2c1d822%7C3539451eb46e4a26a242ff6150285=
5c7%7C0%7C0%7C637526261735474152%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DZ9w=
mwFLA%2BuBT243Dv5a666ng67OAfytEYyAVv3sn4GA%3D&amp;amp;reserved=3D0</a>&quot=
;<br>
&gt; +BUGTRACKER =3D &quot;<a href=3D"https://apc01.safelinks.protection.o=
utlook.com/?url=3Dhttps%3A%2F%2Fbugzilla.gnome.org%2F&amp;amp;data=3D04%7C0=
1%7CNeetika.Singh%40kpit.com%7C8e558ea4a71d4cec7dad08d8f2c1d822%7C3539451eb=
46e4a26a242ff61502855c7%7C0%7C0%7C637526261735474152%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000=
&amp;amp;sdata=3DynFHfdJS8RUpg8kqJOBlTsQPz3%2FxMvoBgBiVMLAC0u4%3D&amp;amp;r=
eserved=3D0" target=3D"_blank">https://apc01.safelinks.protection.outlook.c=
om/?url=3Dhttps%3A%2F%2Fbugzilla.gnome.org%2F&amp;amp;data=3D04%7C01%7CNeet=
ika.Singh%40kpit.com%7C8e558ea4a71d4cec7dad08d8f2c1d822%7C3539451eb46e4a26a=
242ff61502855c7%7C0%7C0%7C637526261735474152%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp=
;sdata=3DynFHfdJS8RUpg8kqJOBlTsQPz3%2FxMvoBgBiVMLAC0u4%3D&amp;amp;reserved=
=3D0</a>&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;LGPLv2 &amp; LGPLv2.1&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;<a></a>file://COPYING;md5=3D55ca817ccb7d5=
b5b66355690e9abc605 \<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a>
file://src/cr-rgb.c;endline=3D22;md5=3D31d5f0944d556c8589d04ea6055fcc66</a=
> \<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a>
file://tests/cr-test-utils.c;endline=3D21;md5=3D2382c27934cae1d3792fcb17a6=
142c4e</a>&quot;<br>
&gt; +<br>
&gt; +SECTION =3D &quot;x11/utils&quot;<br>
&gt; +DEPENDS =3D &quot;glib-2.0 libxml2 zlib&quot;<br>
&gt; +BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; +EXTRA_OECONF +=3D &quot;--enable-Bsymbolic=3Dauto&quot;<br>
&gt; +<br>
&gt; +BINCONFIG =3D &quot;${bindir}/croco-0.6-config&quot;<br>
&gt; +<br>
&gt; +inherit gnomebase gtk-doc binconfig-disabled<br>
&gt; +<br>
&gt; +SRC_URI +=3D &quot;<a>file://CVE-2020-12825.patch</a>&quot;<br>
&gt; +<br>
&gt; +SRC_URI[archive.md5sum] =3D &quot;c80c5a8385011a0260dce6bd0da93dce&q=
uot;<br>
&gt; +SRC_URI[archive.sha256sum] =3D &quot;767ec234ae7aa684695b3a735548224=
888132e063f92db585759b422570621d4&quot;<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt; This message contains information that may be privileged or confident=
ial and is the property of the KPIT Technologies Ltd. It is intended only f=
or the person to whom it is addressed. If you are not the intended recipien=
t, you are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part the=
reof. If you receive this message in error, please notify the sender immedi=
ately and delete all copies of this message. KPIT Technologies Ltd. does no=
t accept any liability for virus
 infected mails.<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential a=
nd is the property of the KPIT Technologies Ltd. It is intended only for th=
e person to whom it is addressed. If you are not the intended recipient, yo=
u are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part the=
reof. If you receive this message in error, please notify the sender immedi=
ately and delete all copies of this message. KPIT Technologies Ltd. does no=
t accept any liability for virus
 infected mails.
</div>

<br>
<br>
<br>
</blockquote></div>

--00000000000058c7b905beae60c2--
