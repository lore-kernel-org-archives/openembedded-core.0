Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A39DC43458
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 21:55:41 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45127.1782510939559152786
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 14:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=hF+oMOzN;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4926f8e02e8so5449745e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 14:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1782510938; x=1783115738; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2HV1knDZZT5imJ7mgf+avLAa58KH4EWaG222Y2UQkE=;
        b=hF+oMOzNt3xkh/K9ZSAyPgUcli5+6pmDeCgac0ZhQvffWXpyEaDftJQ1AqzJBCxFuS
         qu5M1EbcmslYFd9nvrdNMpfXF6cJHDfqtffjDTMH2W6TIFYx0OUR5S+DqbzXKABJcnbK
         W6o417EEmiHZwihI1HH/Dudvt0qAo79I/p3ZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782510938; x=1783115738;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2HV1knDZZT5imJ7mgf+avLAa58KH4EWaG222Y2UQkE=;
        b=jE+COpaToK03ueAYmv4uN8ZhHCyTauNnYuINOPVsYqgoyOYe9b3iz7aT3dzNWlIQfQ
         xiBeB1Q+XZogn5IYtA7oWoAnzyai8eUOF2pKHOyOW7jDTLI/O4L2Fv4wnbbxwbtHbqxQ
         RdWiEl712zOX/iepVQZzvJ2KGKkbpUWfIA3DCvGjYtP4PIUJ9TsGVmHPVCmGK3wSY1zs
         oGBpSvN72akO+oIECfhCqEskzznKgeDk3oHODk+kF/tVzD5yyLcOifdQCPF/teEpD+q/
         c6+NjccLHvUIoBzR0M0VesNPm8mZXzDlNno9NFYcBayu8hXtr+RLrqpu4pq4EmKWAu9V
         yzlg==
X-Forwarded-Encrypted: i=1; AFNElJ9yK59trHP2AJs5KOd8rF/8kXJy3x620H9/u1erCca9p7fPjgFTYBaEBH7isWQdBYOOsq0JNQ8hYMODPyXhU7G+hg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxcOljPInUkMoSmrxW3iyD8OKK4Kq8W5kkaXZlFs8UBWamYQRBn
	lwTi+AsJD5Xpel29aR1RWW1z01/+nMEN8G+3LpzCxNqkPPLq1Iz0wAGjCFj7HlAZGo8=
X-Gm-Gg: AfdE7cl1R5QFFvF93L4+waTItGQShockncWOcY62/xdqpa8r/9yB0h0/wrvlRGkVai4
	8ARV9pNB7yCINSIg3Iah7Itw82Y4+8AU0G4OfNtjLD/rREdJ0d7KoJf2Ul6ME3aQ7eP/kKqhA6t
	DO2xjU0/ZSgYG02/e0sMxUIvYmkp6+LTbqGDpf5IWfVAt52bbUkmroIRvHS1NCuyN6cPemTkxUH
	JVMvWIsci7tk2RY4jL8qLebBw8tFKCBbvD5vvwuEXfeqHzAOOxj/FfBkPh/46RnLGtpEKIyuEoz
	t0qtPncxgvsyQhoo6+KyY1UOUoRgXC0lf24Vm3PWzT/mTiIxflDWnjBWVcH1zy/zPVYEiwRO0s/
	Id48yjGcduetOYoarTlIvU3T+nUINAltVBzbWl3TY85BOzr7Nu80xvpKPITBuzrSvL6tITUfdEW
	dYIxUbrpr9qFOfchoJbLP78GqltNynoRxe4rw6gZt8pXuwudEANSHEnU5u8zi4xW92Nni3P2Pxh
	ZDuHQ==
X-Received: by 2002:a05:600c:1d1e:b0:492:2f3c:d0ed with SMTP id 5b1f17b1804b1-4926688a528mr121650055e9.30.1782510937558;
        Fri, 26 Jun 2026 14:55:37 -0700 (PDT)
Received: from localhost (2a01cb001331aa00b5501ee7aae29268.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b550:1ee7:aae2:9268])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c221d9371sm29490579f8f.21.2026.06.26.14.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 14:55:37 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Jun 2026 23:55:36 +0200
Message-Id: <DJJBE3OB1VCX.2TF3OKXRP1R5K@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH v2] expat: patch CVE-2026-45186
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <hsimeliere.opensource@witekio.com>, "Bruno Vernay"
 <bruno.vernay@se.com>
To: <tgaige.opensource@witekio.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260619081053.796111-1-tgaige.opensource@witekio.com>
In-Reply-To: <20260619081053.796111-1-tgaige.opensource@witekio.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 21:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239662

On Fri Jun 19, 2026 at 10:10 AM CEST, Theo Gaige via lists.openembedded.org=
 wrote:
> From: Theo Gaige <tgaige.opensource@witekio.com>
>
> Backport patches from [1] also mentioned in [2].
>
> [1] https://github.com/libexpat/libexpat/pull/1216
> [2] https://security-tracker.debian.org/tracker/CVE-2026-45186
>
> Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
> Reviewed-by: Bruno Vernay <bruno.vernay@se.com>
> ---

Hello,

This CVE also impacts wrynose. Can you send a fix for wrynose, and then,
ping back here?

Thanks!

>  .../expat/expat/CVE-2026-45186-01.patch       |  70 ++++
>  .../expat/expat/CVE-2026-45186-02.patch       | 318 ++++++++++++++++++
>  .../expat/expat/CVE-2026-45186-03.patch       |  46 +++
>  .../expat/expat/CVE-2026-45186-04.patch       |  32 ++
>  .../expat/expat/CVE-2026-45186-05.patch       |  32 ++
>  .../expat/expat/CVE-2026-45186-06.patch       |  87 +++++
>  .../expat/expat/CVE-2026-45186-07.patch       |  52 +++
>  meta/recipes-core/expat/expat_2.6.4.bb        |   7 +
>  8 files changed, 644 insertions(+)
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-01.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-02.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-03.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-04.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-05.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-06.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-45186-07.patch
>
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-01.patch b/meta=
/recipes-core/expat/expat/CVE-2026-45186-01.patch
> new file mode 100644
> index 0000000000..787006c0fd
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-45186-01.patch
> @@ -0,0 +1,70 @@
> +From 3020144133b2d860c44f4eeacf72e5f2843235a3 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Berkay=3D20Eren=3D20=3DC3=3D9Cr=3DC3=3DBCn?=3D <berkay=
.ueruen@siemens.com>
> +Date: Fri, 13 Mar 2026 13:26:45 +0100
> +Subject: [PATCH 1/7] Make "counting_start_element_handler" count default=
 attrs
> +
> +(cherry picked from commit 0802a5892030610144b736dec6e2f63e8600fe85)
> +
> +CVE: CVE-2026-45186
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/121=
6/commits/0802a5892030610144b736dec6e2f63e8600fe85]
> +Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
> +---
> + tests/basic_tests.c | 8 ++++----
> + tests/handlers.c    | 2 +-
> + tests/handlers.h    | 1 +
> + 3 files changed, 6 insertions(+), 5 deletions(-)
> +
> +diff --git a/tests/basic_tests.c b/tests/basic_tests.c
> +index 023d9ce..d6edb16 100644
> +--- a/tests/basic_tests.c
> ++++ b/tests/basic_tests.c
> +@@ -2439,9 +2439,9 @@ START_TEST(test_attributes) {
> +                          {XCS("id"), XCS("one")},
> +                          {NULL, NULL}};
> +   AttrInfo tag_info[] =3D {{XCS("c"), XCS("3")}, {NULL, NULL}};
> +-  ElementInfo info[] =3D {{XCS("doc"), 3, XCS("id"), NULL},
> +-                        {XCS("tag"), 1, NULL, NULL},
> +-                        {NULL, 0, NULL, NULL}};
> ++  ElementInfo info[] =3D {{XCS("doc"), 3, 0, XCS("id"), NULL},
> ++                        {XCS("tag"), 1, 0, NULL, NULL},
> ++                        {NULL, 0, 0, NULL, NULL}};
> +   info[0].attributes =3D doc_info;
> +   info[1].attributes =3D tag_info;
> +=20
> +@@ -5496,7 +5496,7 @@ START_TEST(test_deep_nested_attribute_entity) {
> +            (long unsigned)(N_LINES - 1));
> +=20
> +   AttrInfo doc_info[] =3D {{XCS("name"), XCS("deepText")}, {NULL, NULL}=
};
> +-  ElementInfo info[] =3D {{XCS("foo"), 1, NULL, NULL}, {NULL, 0, NULL, =
NULL}};
> ++  ElementInfo info[] =3D {{XCS("foo"), 1, 0, NULL, NULL}, {NULL, 0, 0, =
NULL, NULL}};
> +   info[0].attributes =3D doc_info;
> +=20
> +   XML_Parser parser =3D XML_ParserCreate(NULL);
> +diff --git a/tests/handlers.c b/tests/handlers.c
> +index e658223..9ff7b35 100644
> +--- a/tests/handlers.c
> ++++ b/tests/handlers.c
> +@@ -137,7 +137,7 @@ counting_start_element_handler(void *userData, const=
 XML_Char *name,
> +     fail("ID does not have the correct name");
> +     return;
> +   }
> +-  for (i =3D 0; i < info->attr_count; i++) {
> ++  for (i =3D 0; i < info->attr_count + info->default_attr_count; i++) {
> +     attr =3D info->attributes;
> +     while (attr->name !=3D NULL) {
> +       if (! xcstrcmp(atts[0], attr->name))
> +diff --git a/tests/handlers.h b/tests/handlers.h
> +index ac4ca94..11d45eb 100644
> +--- a/tests/handlers.h
> ++++ b/tests/handlers.h
> +@@ -88,6 +88,7 @@ typedef struct attrInfo {
> + typedef struct elementInfo {
> +   const XML_Char *name;
> +   int attr_count;
> ++  int default_attr_count;
> +   const XML_Char *id_name;
> +   AttrInfo *attributes;
> + } ElementInfo;
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-02.patch b/meta=
/recipes-core/expat/expat/CVE-2026-45186-02.patch
> new file mode 100644
> index 0000000000..fef531a439
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-45186-02.patch
> @@ -0,0 +1,318 @@
> +From ba12af3b3ffd98b9e31c3a01a20d392c89aa974e Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Berkay=3D20Eren=3D20=3DC3=3D9Cr=3DC3=3DBCn?=3D <berkay=
.ueruen@siemens.com>
> +Date: Fri, 13 Mar 2026 13:27:31 +0100
> +Subject: [PATCH 2/7] test(attlist): Cover duplicate attribute names
> +
> +Co-authored-by: Sebastian Pipping <sebastian@pipping.org>
> +(cherry picked from commit e569f47181c43dca5d262089e541ddf9a9c09927)
> +
> +CVE: CVE-2026-45186
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/121=
6/commits/e569f47181c43dca5d262089e541ddf9a9c09927]
> +Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
> +---
> + tests/basic_tests.c | 282 ++++++++++++++++++++++++++++++++++++++++++++
> + 1 file changed, 282 insertions(+)
> +
> +diff --git a/tests/basic_tests.c b/tests/basic_tests.c
> +index d6edb16..907a458 100644
> +--- a/tests/basic_tests.c
> ++++ b/tests/basic_tests.c
> +@@ -2462,6 +2462,279 @@ START_TEST(test_attributes) {
> + }
> + END_TEST
> +=20
> ++START_TEST(test_duplicate_cdata_attribute) {
> ++  /*
> ++  https://www.w3.org/TR/xml/#attdecls
> ++
> ++  Test the following statement from the linked specification:
> ++    When more than one definition is provided for the same attribute of=
 a given
> ++    element type, the first declaration is binding and later declaratio=
ns are
> ++    ignored.
> ++  */
> ++
> ++  const char *text
> ++      =3D "<!DOCTYPE doc [\n"
> ++        "  <!ATTLIST doc attribute CDATA 'expected' attribute CDATA 'ig=
nored'>\n"
> ++        "]>\n"
> ++        "<doc/>\n";
> ++  AttrInfo doc_info[] =3D {{XCS("attribute"), XCS("expected")}, {NULL, =
NULL}};
> ++  ElementInfo info[]
> ++      =3D {{XCS("doc"), 0, 1, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}=
};
> ++
> ++  XML_Parser parser =3D XML_ParserCreate(NULL);
> ++  assert_true(parser !=3D NULL);
> ++
> ++  ParserAndElementInfo parserAndElementInfos =3D {
> ++      parser,
> ++      info,
> ++  };
> ++
> ++  XML_SetStartElementHandler(parser, counting_start_element_handler);
> ++  XML_SetUserData(parser, &parserAndElementInfos);
> ++
> ++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE=
)
> ++      !=3D XML_STATUS_OK)
> ++    xml_failure(parser);
> ++
> ++  XML_ParserFree(parser);
> ++}
> ++END_TEST
> ++
> ++START_TEST(test_duplicate_id_attribute_1) {
> ++  /*
> ++  https://www.w3.org/TR/xml/#attdecls
> ++
> ++  Test the following statement from the linked specification:
> ++    When more than one definition is provided for the same attribute of=
 a given
> ++    element type, the first declaration is binding and later declaratio=
ns are
> ++    ignored.
> ++  */
> ++
> ++  const char *text
> ++      =3D "<!DOCTYPE doc [\n"
> ++        "  <!ATTLIST doc identifier CDATA 'expected' identifier ID #REQ=
UIRED>\n"
> ++        "]>\n"
> ++        "<doc/>\n";
> ++  AttrInfo doc_info[] =3D {{XCS("identifier"), XCS("expected")}, {NULL,=
 NULL}};
> ++  ElementInfo info[]
> ++      =3D {{XCS("doc"), 0, 1, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}=
};
> ++
> ++  XML_Parser parser =3D XML_ParserCreate(NULL);
> ++  assert_true(parser !=3D NULL);
> ++
> ++  ParserAndElementInfo parserAndElementInfos =3D {
> ++      parser,
> ++      info,
> ++  };
> ++
> ++  XML_SetStartElementHandler(parser, counting_start_element_handler);
> ++  XML_SetUserData(parser, &parserAndElementInfos);
> ++
> ++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE=
)
> ++      !=3D XML_STATUS_OK)
> ++    xml_failure(parser);
> ++
> ++  XML_ParserFree(parser);
> ++}
> ++END_TEST
> ++
> ++START_TEST(test_duplicate_id_attribute_2) {
> ++  /*
> ++  https://www.w3.org/TR/xml/#attdecls
> ++
> ++  Test the following statement from the linked specification:
> ++    When more than one definition is provided for the same attribute of=
 a given
> ++    element type, the first declaration is binding and later declaratio=
ns are
> ++    ignored.
> ++  */
> ++
> ++  const char *text
> ++      =3D "<!DOCTYPE doc [\n"
> ++        "  <!ATTLIST doc identifier ID #REQUIRED identifier CDATA 'unex=
pected'>\n"
> ++        "]>\n"
> ++        "<doc/>\n";
> ++  AttrInfo doc_info[] =3D {{NULL, NULL}};
> ++
> ++  ElementInfo info[]
> ++      =3D {{XCS("doc"), 0, 0, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}=
};
> ++
> ++  XML_Parser parser =3D XML_ParserCreate(NULL);
> ++  assert_true(parser !=3D NULL);
> ++
> ++  ParserAndElementInfo parserAndElementInfos =3D {
> ++      parser,
> ++      info,
> ++  };
> ++
> ++  XML_SetStartElementHandler(parser, counting_start_element_handler);
> ++  XML_SetUserData(parser, &parserAndElementInfos);
> ++
> ++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE=
)
> ++      !=3D XML_STATUS_OK)
> ++    xml_failure(parser);
> ++
> ++  XML_ParserFree(parser);
> ++}
> ++END_TEST
> ++
> ++START_TEST(test_duplicate_cdata_attribute_multiple_attlistdecl) {
> ++  /*
> ++  https://www.w3.org/TR/xml/#attdecls
> ++
> ++  Test the following statement from the linked specification:
> ++    When more than one AttlistDecl is provided for a given element type=
,
> ++    the contents of all those provided are merged.
> ++  */
> ++  const char *text =3D "<!DOCTYPE doc [\n"
> ++                     "  <!ATTLIST doc attribute CDATA 'expected'>\n"
> ++                     "  <!ATTLIST doc attribute CDATA 'ignored'>\n"
> ++                     "]>\n"
> ++                     "<doc/>\n";
> ++  AttrInfo doc_info[] =3D {{XCS("attribute"), XCS("expected")}, {NULL, =
NULL}};
> ++  ElementInfo info[]
> ++      =3D {{XCS("doc"), 0, 1, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}=
};
> ++
> ++  XML_Parser parser =3D XML_ParserCreate(NULL);
> ++  assert_true(parser !=3D NULL);
> ++
> ++  ParserAndElementInfo parserAndElementInfos =3D {
> ++      parser,
> ++      info,
> ++  };
> ++
> ++  XML_SetStartElementHandler(parser, counting_start_element_handler);
> ++  XML_SetUserData(parser, &parserAndElementInfos);
> ++
> ++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE=
)
> ++      !=3D XML_STATUS_OK)
> ++    xml_failure(parser);
> ++
> ++  XML_ParserFree(parser);
> ++}
> ++END_TEST
> ++
> ++START_TEST(test_duplicate_cdata_attribute_multiple_attlistdecl_2) {
> ++  /*
> ++  https://www.w3.org/TR/xml/#attdecls
> ++
> ++  Test the following statement from the linked specification:
> ++    When more than one AttlistDecl is provided for a given element type=
,
> ++    the contents of all those provided are merged.
> ++  */
> ++  const char *text =3D "<!DOCTYPE doc [\n"
> ++                     "  <!ATTLIST doc attribute CDATA 'expected_doc'>\n=
"
> ++                     "  <!ATTLIST tag attribute CDATA 'expected_tag'>\n=
"
> ++                     "  <!ATTLIST doc attribute CDATA 'ignored_doc'>\n"
> ++                     "]>\n"
> ++                     "<doc><tag></tag></doc>\n";
> ++  AttrInfo doc_info[] =3D {{XCS("attribute"), XCS("expected_doc")}, {NU=
LL, NULL}};
> ++  AttrInfo tag_info[] =3D {{XCS("attribute"), XCS("expected_tag")}, {NU=
LL, NULL}};
> ++  ElementInfo info[] =3D {{XCS("doc"), 0, 1, NULL, doc_info},
> ++                        {XCS("tag"), 0, 1, NULL, tag_info},
> ++                        {NULL, 0, 0, NULL, NULL}};
> ++
> ++  XML_Parser parser =3D XML_ParserCreate(NULL);
> ++  assert_true(parser !=3D NULL);
> ++
> ++  ParserAndElementInfo parserAndElementInfos =3D {
> ++      parser,
> ++      info,
> ++  };
> ++
> ++  XML_SetStartElementHandler(parser, counting_start_element_handler);
> ++  XML_SetUserData(parser, &parserAndElementInfos);
> ++
> ++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE=
)
> ++      !=3D XML_STATUS_OK)
> ++    xml_failure(parser);
> ++
> ++  XML_ParserFree(parser);
> ++}
> ++END_TEST
> ++
> ++START_TEST(test_duplicate_cdata_attribute_multiple_attlistdecl_3) {
> ++  /*
> ++  https://www.w3.org/TR/xml/#attdecls
> ++
> ++  Test the following statement from the linked specification:
> ++    When more than one AttlistDecl is provided for a given element type=
,
> ++    the contents of all those provided are merged.
> ++  */
> ++  const char *text
> ++      =3D "<!DOCTYPE doc [\n"
> ++        "  <!ATTLIST doc attribute CDATA 'expected_doc'>\n"
> ++        "  <!ATTLIST tag attribute CDATA 'expected_tag'>\n"
> ++        "  <!ATTLIST doc second_attribute CDATA 'second_expected_doc' a=
ttribute CDATA 'ignored_doc'>\n"
> ++        "]>\n"
> ++        "<doc><tag></tag></doc>\n";
> ++  AttrInfo doc_info[] =3D {{XCS("attribute"), XCS("expected_doc")},
> ++                         {XCS("second_attribute"), XCS("second_expected=
_doc")},
> ++                         {NULL, NULL}};
> ++  AttrInfo tag_info[] =3D {{XCS("attribute"), XCS("expected_tag")}, {NU=
LL, NULL}};
> ++  ElementInfo info[] =3D {{XCS("doc"), 0, 2, NULL, doc_info},
> ++                        {XCS("tag"), 0, 1, NULL, tag_info},
> ++                        {NULL, 0, 0, NULL, NULL}};
> ++
> ++  XML_Parser parser =3D XML_ParserCreate(NULL);
> ++  assert_true(parser !=3D NULL);
> ++
> ++  ParserAndElementInfo parserAndElementInfos =3D {
> ++      parser,
> ++      info,
> ++  };
> ++
> ++  XML_SetStartElementHandler(parser, counting_start_element_handler);
> ++  XML_SetUserData(parser, &parserAndElementInfos);
> ++
> ++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE=
)
> ++      !=3D XML_STATUS_OK)
> ++    xml_failure(parser);
> ++
> ++  XML_ParserFree(parser);
> ++}
> ++END_TEST
> ++
> ++START_TEST(test_duplicate_id_attribute_multiple_attlistdecl) {
> ++  /*
> ++  https://www.w3.org/TR/xml/#attdecls
> ++
> ++  Test the following statement from the linked specification:
> ++    When more than one AttlistDecl is provided for a given element type=
,
> ++    the contents of all those provided are merged.
> ++  */
> ++  const char *text =3D "<!DOCTYPE doc [\n"
> ++                     "  <!ATTLIST doc identifier ID #REQUIRED>\n"
> ++                     "  <!ATTLIST tag identifier CDATA 'identifier_tag'=
>\n"
> ++                     "  <!ATTLIST doc identifier CDATA 'ignored'>\n"
> ++                     "]>\n"
> ++                     "<doc identifier=3D'doc_identity'><tag></tag></doc=
>\n";
> ++  AttrInfo doc_info[]
> ++      =3D {{XCS("identifier"), XCS("doc_identity")}, {NULL, NULL}};
> ++  AttrInfo tag_info[]
> ++      =3D {{XCS("identifier"), XCS("identifier_tag")}, {NULL, NULL}};
> ++  ElementInfo info[] =3D {{XCS("doc"), 1, 0, XCS("identifier"), doc_inf=
o},
> ++                        {XCS("tag"), 0, 1, NULL, tag_info},
> ++                        {NULL, 0, 0, NULL, NULL}};
> ++
> ++  XML_Parser parser =3D XML_ParserCreate(NULL);
> ++  assert_true(parser !=3D NULL);
> ++
> ++  ParserAndElementInfo parserAndElementInfos =3D {
> ++      parser,
> ++      info,
> ++  };
> ++
> ++  XML_SetStartElementHandler(parser, counting_start_element_handler);
> ++  XML_SetUserData(parser, &parserAndElementInfos);
> ++
> ++  if (_XML_Parse_SINGLE_BYTES(parser, text, (int)strlen(text), XML_TRUE=
)
> ++      !=3D XML_STATUS_OK)
> ++    xml_failure(parser);
> ++
> ++  XML_ParserFree(parser);
> ++}
> ++END_TEST
> ++
> + /* Test reset works correctly in the middle of processing an internal
> +  * entity.  Exercises some obscure code in XML_ParserReset().
> +  */
> +@@ -6325,6 +6598,15 @@ make_basic_test_case(Suite *s) {
> +   tcase_add_test__ifdef_xml_dtd(tc_basic, test_empty_foreign_dtd);
> +   tcase_add_test(tc_basic, test_set_base);
> +   tcase_add_test(tc_basic, test_attributes);
> ++  tcase_add_test(tc_basic, test_duplicate_cdata_attribute);
> ++  tcase_add_test(tc_basic, test_duplicate_id_attribute_1);
> ++  tcase_add_test(tc_basic, test_duplicate_id_attribute_2);
> ++  tcase_add_test(tc_basic, test_duplicate_cdata_attribute_multiple_attl=
istdecl);
> ++  tcase_add_test(tc_basic,
> ++                 test_duplicate_cdata_attribute_multiple_attlistdecl_2)=
;
> ++  tcase_add_test(tc_basic,
> ++                 test_duplicate_cdata_attribute_multiple_attlistdecl_3)=
;
> ++  tcase_add_test(tc_basic, test_duplicate_id_attribute_multiple_attlist=
decl);
> +   tcase_add_test__if_xml_ge(tc_basic, test_reset_in_entity);
> +   tcase_add_test(tc_basic, test_resume_invalid_parse);
> +   tcase_add_test(tc_basic, test_resume_resuspended);
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-03.patch b/meta=
/recipes-core/expat/expat/CVE-2026-45186-03.patch
> new file mode 100644
> index 0000000000..2afe6dbebc
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-45186-03.patch
> @@ -0,0 +1,46 @@
> +From 852ab610685b45c62017556c38096d941c154963 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Mon, 20 Apr 2026 13:44:43 +0200
> +Subject: [PATCH 3/7] tests: Define .attributes the first time around
> +
> +(cherry picked from commit 05307d352a5aa858cdda57ec53a53b597b3a4a82)
> +
> +CVE: CVE-2026-45186
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/121=
6/commits/05307d352a5aa858cdda57ec53a53b597b3a4a82]
> +Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
> +---
> + tests/basic_tests.c | 10 ++++------
> + 1 file changed, 4 insertions(+), 6 deletions(-)
> +
> +diff --git a/tests/basic_tests.c b/tests/basic_tests.c
> +index 907a458..b0178fc 100644
> +--- a/tests/basic_tests.c
> ++++ b/tests/basic_tests.c
> +@@ -2439,11 +2439,9 @@ START_TEST(test_attributes) {
> +                          {XCS("id"), XCS("one")},
> +                          {NULL, NULL}};
> +   AttrInfo tag_info[] =3D {{XCS("c"), XCS("3")}, {NULL, NULL}};
> +-  ElementInfo info[] =3D {{XCS("doc"), 3, 0, XCS("id"), NULL},
> +-                        {XCS("tag"), 1, 0, NULL, NULL},
> ++  ElementInfo info[] =3D {{XCS("doc"), 3, 0, XCS("id"), doc_info},
> ++                        {XCS("tag"), 1, 0, NULL, tag_info},
> +                         {NULL, 0, 0, NULL, NULL}};
> +-  info[0].attributes =3D doc_info;
> +-  info[1].attributes =3D tag_info;
> +=20
> +   XML_Parser parser =3D XML_ParserCreate(NULL);
> +   assert_true(parser !=3D NULL);
> +@@ -5769,8 +5767,8 @@ START_TEST(test_deep_nested_attribute_entity) {
> +            (long unsigned)(N_LINES - 1));
> +=20
> +   AttrInfo doc_info[] =3D {{XCS("name"), XCS("deepText")}, {NULL, NULL}=
};
> +-  ElementInfo info[] =3D {{XCS("foo"), 1, 0, NULL, NULL}, {NULL, 0, 0, =
NULL, NULL}};
> +-  info[0].attributes =3D doc_info;
> ++  ElementInfo info[]
> ++      =3D {{XCS("foo"), 1, 0, NULL, doc_info}, {NULL, 0, 0, NULL, NULL}=
};
> +=20
> +   XML_Parser parser =3D XML_ParserCreate(NULL);
> +   ParserAndElementInfo parserPlusElemenInfo =3D {parser, info};
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-04.patch b/meta=
/recipes-core/expat/expat/CVE-2026-45186-04.patch
> new file mode 100644
> index 0000000000..f4c7733c70
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-45186-04.patch
> @@ -0,0 +1,32 @@
> +From 89c6acdcd919b64014b180fadec46b0d25760832 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Mon, 13 Apr 2026 01:34:03 +0200
> +Subject: [PATCH 4/7] tests: Make counting_start_element_handler enforce
> + complete attribute lists
> +
> +(cherry picked from commit 4176aff73840711060913e0ac6aa1168d8ba5c8d)
> +
> +CVE: CVE-2026-45186
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/121=
6/commits/4176aff73840711060913e0ac6aa1168d8ba5c8d]
> +Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
> +---
> + tests/handlers.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/tests/handlers.c b/tests/handlers.c
> +index 9ff7b35..5e72e8b 100644
> +--- a/tests/handlers.c
> ++++ b/tests/handlers.c
> +@@ -155,6 +155,9 @@ counting_start_element_handler(void *userData, const=
 XML_Char *name,
> +     /* Remember, two entries in atts per attribute (see above) */
> +     atts +=3D 2;
> +   }
> ++
> ++  // Self-test that the test case's list of expected attributes is comp=
lete
> ++  assert_true(atts[0] =3D=3D NULL);
> + }
> +=20
> + void XMLCALL
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-05.patch b/meta=
/recipes-core/expat/expat/CVE-2026-45186-05.patch
> new file mode 100644
> index 0000000000..480f941cb6
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-45186-05.patch
> @@ -0,0 +1,32 @@
> +From d352c83afaa3945c964aba74cb60a00822af96d3 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Sun, 8 Mar 2026 22:14:41 +0100
> +Subject: [PATCH 5/7] lib: Extract a constant for upcoming reuse
> +
> +(cherry picked from commit fb35f2d2040d114f355bae8a7450942533237530)
> +
> +CVE: CVE-2026-45186
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/121=
6/commits/fb35f2d2040d114f355bae8a7450942533237530]
> +Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
> +---
> + lib/xmlparse.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 9bc67f3..8d3e8db 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -7708,8 +7708,9 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const D=
TD *oldDtd,
> +       newE->prefix =3D (PREFIX *)lookup(oldParser, &(newDtd->prefixes),
> +                                       oldE->prefix->name, 0);
> +     for (i =3D 0; i < newE->nDefaultAtts; i++) {
> ++      const XML_Char *const attributeName =3D oldE->defaultAtts[i].id->=
name;
> +       newE->defaultAtts[i].id =3D (ATTRIBUTE_ID *)lookup(
> +-          oldParser, &(newDtd->attributeIds), oldE->defaultAtts[i].id->=
name, 0);
> ++          oldParser, &(newDtd->attributeIds), attributeName, 0);
> +       newE->defaultAtts[i].isCdata =3D oldE->defaultAtts[i].isCdata;
> +       if (oldE->defaultAtts[i].value) {
> +         newE->defaultAtts[i].value
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-06.patch b/meta=
/recipes-core/expat/expat/CVE-2026-45186-06.patch
> new file mode 100644
> index 0000000000..d39eb91f2f
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-45186-06.patch
> @@ -0,0 +1,87 @@
> +From a2c8ddb3d6f4df7af64e05bed4b3a4edeae33fd0 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Sun, 8 Mar 2026 23:05:49 +0100
> +Subject: [PATCH 6/7] lib: Introduce ELEMENT_TYPE.defaultAttsNames
> +
> +(cherry picked from commit 7f0f1b9e70d937072d2e9e37ae9edf27784cc080)
> +
> +CVE: CVE-2026-45186
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/121=
6/commits/7f0f1b9e70d937072d2e9e37ae9edf27784cc080]
> +Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
> +---
> + lib/xmlparse.c | 17 +++++++++++++++++
> + 1 file changed, 17 insertions(+)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 8d3e8db..4a29c18 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -388,6 +388,7 @@ typedef struct {
> +   int nDefaultAtts;
> +   int allocDefaultAtts;
> +   DEFAULT_ATTRIBUTE *defaultAtts;
> ++  HASH_TABLE defaultAttsNames;
> + } ELEMENT_TYPE;
> +=20
> + typedef struct {
> +@@ -3844,6 +3845,8 @@ storeAtts(XML_Parser parser, const ENCODING *enc, =
const char *attStr,
> +                                          sizeof(ELEMENT_TYPE));
> +     if (! elementType)
> +       return XML_ERROR_NO_MEMORY;
> ++    if (! elementType->defaultAttsNames.parser)
> ++      hashTableInit(&(elementType->defaultAttsNames), parser);
> +     if (parser->m_ns && ! setElementTypePrefix(parser, elementType))
> +       return XML_ERROR_NO_MEMORY;
> +   }
> +@@ -7549,6 +7552,7 @@ dtdReset(DTD *p, XML_Parser parser) {
> +     ELEMENT_TYPE *e =3D (ELEMENT_TYPE *)hashTableIterNext(&iter);
> +     if (! e)
> +       break;
> ++    hashTableDestroy(&(e->defaultAttsNames));
> +     if (e->allocDefaultAtts !=3D 0)
> +       FREE(parser, e->defaultAtts);
> +   }
> +@@ -7590,6 +7594,7 @@ dtdDestroy(DTD *p, XML_Bool isDocEntity, XML_Parse=
r parser) {
> +     ELEMENT_TYPE *e =3D (ELEMENT_TYPE *)hashTableIterNext(&iter);
> +     if (! e)
> +       break;
> ++    hashTableDestroy(&(e->defaultAttsNames));
> +     if (e->allocDefaultAtts !=3D 0)
> +       FREE(parser, e->defaultAtts);
> +   }
> +@@ -7683,6 +7688,10 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const =
DTD *oldDtd,
> +                                   sizeof(ELEMENT_TYPE));
> +     if (! newE)
> +       return 0;
> ++
> ++    if (! newE->defaultAttsNames.parser)
> ++      hashTableInit(&(newE->defaultAttsNames), parser);
> ++
> +     if (oldE->nDefaultAtts) {
> +       /* Detect and prevent integer overflow.
> +        * The preprocessor guard addresses the "always false" warning
> +@@ -7719,6 +7728,12 @@ dtdCopy(XML_Parser oldParser, DTD *newDtd, const =
DTD *oldDtd,
> +           return 0;
> +       } else
> +         newE->defaultAtts[i].value =3D NULL;
> ++
> ++      NAMED *const nameAddedOrFound =3D (NAMED *)lookup(
> ++          parser, &(newE->defaultAttsNames), attributeName, sizeof(NAME=
D));
> ++      if (! nameAddedOrFound) {
> ++        return 0;
> ++      }
> +     }
> +   }
> +=20
> +@@ -8458,6 +8473,8 @@ getElementType(XML_Parser parser, const ENCODING *=
enc, const char *ptr,
> +                                sizeof(ELEMENT_TYPE));
> +   if (! ret)
> +     return NULL;
> ++  if (! ret->defaultAttsNames.parser)
> ++    hashTableInit(&(ret->defaultAttsNames), getRootParserOf(parser, NUL=
L));
> +   if (ret->name !=3D name)
> +     poolDiscard(&dtd->pool);
> +   else {
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat/CVE-2026-45186-07.patch b/meta=
/recipes-core/expat/expat/CVE-2026-45186-07.patch
> new file mode 100644
> index 0000000000..26c829b522
> --- /dev/null
> +++ b/meta/recipes-core/expat/expat/CVE-2026-45186-07.patch
> @@ -0,0 +1,52 @@
> +From 0e4829f4be500ce687b37ec82f9650b86c8419c7 Mon Sep 17 00:00:00 2001
> +From: Sebastian Pipping <sebastian@pipping.org>
> +Date: Sun, 8 Mar 2026 23:06:29 +0100
> +Subject: [PATCH 7/7] lib: Leverage ELEMENT_TYPE.defaultAttsNames for att=
ribute
> + collision detection
> +
> +.. to resolve quadratic runtime behavior
> +
> +(cherry picked from commit 4cd4eb0683e04cd45a2ffc81a08ca2a2663994b5)
> +
> +CVE: CVE-2026-45186
> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/121=
6/commits/4cd4eb0683e04cd45a2ffc81a08ca2a2663994b5]
> +Signed-off-by: Theo Gaige <tgaige.opensource@witekio.com>
> +---
> + lib/xmlparse.c | 14 ++++++++++----
> + 1 file changed, 10 insertions(+), 4 deletions(-)
> +
> +diff --git a/lib/xmlparse.c b/lib/xmlparse.c
> +index 4a29c18..b3f0b73 100644
> +--- a/lib/xmlparse.c
> ++++ b/lib/xmlparse.c
> +@@ -7177,10 +7177,10 @@ defineAttribute(ELEMENT_TYPE *type, ATTRIBUTE_ID=
 *attId, XML_Bool isCdata,
> +   if (value || isId) {
> +     /* The handling of default attributes gets messed up if we have
> +        a default which duplicates a non-default. */
> +-    int i;
> +-    for (i =3D 0; i < type->nDefaultAtts; i++)
> +-      if (attId =3D=3D type->defaultAtts[i].id)
> +-        return 1;
> ++    NAMED *const nameFound
> ++        =3D (NAMED *)lookup(parser, &(type->defaultAttsNames), attId->n=
ame, 0);
> ++    if (nameFound)
> ++      return 1;
> +     if (isId && ! type->idAtt && ! attId->xmlns)
> +       type->idAtt =3D attId;
> +   }
> +@@ -7227,6 +7227,12 @@ defineAttribute(ELEMENT_TYPE *type, ATTRIBUTE_ID =
*attId, XML_Bool isCdata,
> +   att->isCdata =3D isCdata;
> +   if (! isCdata)
> +     attId->maybeTokenized =3D XML_TRUE;
> ++
> ++  NAMED *const nameAddedOrFound =3D (NAMED *)lookup(
> ++      parser, &(type->defaultAttsNames), attId->name, sizeof(NAMED));
> ++  if (! nameAddedOrFound)
> ++    return 0;
> ++
> +   type->nDefaultAtts +=3D 1;
> +   return 1;
> + }
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/e=
xpat/expat_2.6.4.bb
> index 151720a9e3..da9419dda9 100644
> --- a/meta/recipes-core/expat/expat_2.6.4.bb
> +++ b/meta/recipes-core/expat/expat_2.6.4.bb
> @@ -51,6 +51,13 @@ SRC_URI =3D "${GITHUB_BASE_URI}/download/R_${VERSION_T=
AG}/expat-${PV}.tar.bz2  \
>             file://CVE-2026-32777-02.patch \
>             file://CVE-2026-32778-01.patch \
>             file://CVE-2026-32778-02.patch \
> +           file://CVE-2026-45186-01.patch \
> +           file://CVE-2026-45186-02.patch \
> +           file://CVE-2026-45186-03.patch \
> +           file://CVE-2026-45186-04.patch \
> +           file://CVE-2026-45186-05.patch \
> +           file://CVE-2026-45186-06.patch \
> +           file://CVE-2026-45186-07.patch \
>             "
> =20
>  GITHUB_BASE_URI =3D "https://github.com/libexpat/libexpat/releases/"


--=20
Yoann Congal
Smile ECS


