Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web08.8795.1623856209817301744
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 08:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0qV9zuus;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.41, mailfrom: steve@sakoman.com)
Received: by mail-wm1-f41.google.com with SMTP id t11-20020a1cc30b0000b02901cec841b6a0so2731139wmf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 08:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MfTOkDd8K7L84DCNbwtQF/a0xO6YXKiwy+CMSDVIl0Q=;
        b=0qV9zuusTSlFQ+Jus2jXHiEgdX0XiD4hua9BB1fCueWlK6exkN4oluM2e2OX09grr9
         kILVxqPY4qEPpg26ThAvUA/KMk0QI1doaP0Ak2Yh/XDAg9A19Pe4TMq6DFtD2Ymko5d6
         ETXr5O5+WvfnMgC82QTRssZs4SRCXYYqiDt1pQxFpoEPczLdbgZmkpdyBTGakhYdDXOU
         uB0g/LTmNtbphxkuqAbcmW8qqBobXl+ZMQJwLr5tAw9SphZ3XlpQOZNYabkuC3ViS6Kg
         QAzc+LLYaCpUxqUHQsMgjzGPyWyC/TgDsVweV6+LoE89tF1TeyaDp7JOHNqt+ThrepAy
         6wLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MfTOkDd8K7L84DCNbwtQF/a0xO6YXKiwy+CMSDVIl0Q=;
        b=ohamchzvQN2gSW1fsNNThbB0kx7FuZ82a67caWcBFCpOjhLoxjB88De7kMAumXnbOr
         ve2s+3Djd4SLDjsmF15tsBkaH90De9JgbFsM3/zNcdW6XGIvUl1e5zumSJC0niyeZlxV
         HdyRZwhMzZe3GybOm49nlJzyBxVFNlE3sJyIbsuYzAd3ymf+/3N8NQWoX1RwdLF4yVyK
         fL5LgbPssMz45IPvAdiiyhpowX4ZSz8RZ2iMK+ncagQsFVxGL4+rZfeLR3+Uhn8YvU3i
         1hZ1GbD9Eq5U7xuIsQ7HU1Y2HWIidCPzFejzupdnB3bFbqmKPlN4hR2D3Djlr+yeQZfZ
         Wtdg==
X-Gm-Message-State: AOAM531/a+gANkS1pWjwCuErn5vmohM0YQ/q/4/xY3Vzsn9Q0EWH1q5P
	RFEfFLq7vQ2zdPibuYTuiRPMiG2eI98DWo9h36F6kA==
X-Google-Smtp-Source: ABdhPJwhx13+9li+Q/4oWvGtKfw/It0O5DS+AJeN3B+WmQescDvk6lBk8v+282gf0r0v/WuEQxGGxOFPqCkJngcOoBQ=
X-Received: by 2002:a7b:c749:: with SMTP id w9mr11888585wmk.3.1623856207526;
 Wed, 16 Jun 2021 08:10:07 -0700 (PDT)
MIME-Version: 1.0
References: <168917379DAE252D.8130@lists.openembedded.org> <2c3d063872f3f664011cbbfbbe3679d52b49ff5d.camel@iris-sensing.com>
In-Reply-To: <2c3d063872f3f664011cbbfbbe3679d52b49ff5d.camel@iris-sensing.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 16 Jun 2021 05:09:55 -1000
Message-ID: <CAOSpxdZPuM-z3VbVJ+G8LQjOFRyRdoMcfcM5N1rENMfhQUPWEw@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] expat: fix CVE-2013-0340
To: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 16, 2021 at 4:49 AM Jasper Orschulko
<Jasper.Orschulko@iris-sensing.com> wrote:
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
>
> P.S.: I am not too familiar with expat, this particular CVE, not with
> the practise of backporting security patches, so someone(TM) should
> definitely take a closer look at this first.

Will do!

A few initial comments:

1. Please don't PGP sign patch emails :-)
2. Change the patch file name to CVE-2013-0340.patch

Other than that it looks OK at first glance.

For reference the patch requirements for CVE's are outlined at:

https://wiki.yoctoproject.org/wiki/Security

in the "Patch name convention and commit message" section.

Thanks for helping with CVEs!

Steve




> With best regards
>
> Jasper Orschulko
> DevOps Engineer
>
> Tel. +49 30 58 58 14 265
> Fax +49 30 58 58 14 999
> Jasper.Orschulko@iris-sensing.com
>
> =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =
=E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=
=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=
=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2 =E2=80=A2
>
> iris-GmbH
> infrared & intelligent sensors
> Ostendstra=C3=9Fe 1-14 | 12459 Berlin
>
> https://iris-sensing.com/
>
>
>
>
> On Wed, 2021-06-16 at 14:44 +0000, Jasper Orschulko wrote:
> > expat < 4.0 is vulnerable to billion laughs attacks (see
> > [https://github.com/libexpat/libexpat/issues/34]). This patch
> > backports
> > the commits b1d039607d3d8a042bf0466bfcc1c0f104e353c8
> > and 60959f2b491876199879d97c8ed956eabb0c2e73 from upstream.
> >
> > Additionally, the SRC_URI had to be adjusted due to renaming of the
> > source archive
> >
> > Signed-off-by: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
> > ---
> >  ...expat-Backport-fix-for-CVE-2013-0340.patch | 1758
> > +++++++++++++++++
> >  meta/recipes-core/expat/expat_2.2.9.bb        |    3 +-
> >  2 files changed, 1760 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-core/expat/expat/0001-expat-
> > Backport-
> > fix-for-CVE-2013-0340.patch
> >
> > diff --git a/meta/recipes-core/expat/expat/0001-expat-Backport-fix-
> > for-
> > CVE-2013-0340.patch b/meta/recipes-core/expat/expat/0001-expat-
> > Backport-fix-for-CVE-2013-0340.patch
> > new file mode 100644
> > index 0000000000..b2ca066d96
> > --- /dev/null
> > +++ b/meta/recipes-core/expat/expat/0001-expat-Backport-fix-for-CVE-
> > 2013-0340.patch
> > @@ -0,0 +1,1758 @@
> > +From 6f68eb0439f3c1807a143ff8c8972e74d404d8f0 Mon Sep 17 00:00:00
> > 2001
> > +From: Sebastian Pipping <sebastian@pipping.org>
> > +Date: Mon, 19 Apr 2021 21:42:51 +0200
> > +Subject: [PATCH] expat: Backport fix for CVE-2013-0340
> > +
> > +Issue: https://github.com/libexpat/libexpat/issues/34
> > +
> > +This patch cherry-picks the following commits from upstream release
> > +2.4.0 onto 2.2.9:
> > +
> > +- b1d039607d3d8a042bf0466bfcc1c0f104e353c8
> > +- 60959f2b491876199879d97c8ed956eabb0c2e73
> > +
> > +Upstream-Status: Backport
> > +CVE: CVE-2013-0340
> > +Signed-off-by: Jasper Orschulko <Jasper.Orschulko@iris-sensing.com>
> > +---
> > + expat/lib/expat.h       |   21 +-
> > + expat/lib/internal.h    |   30 +
> > + expat/lib/libexpat.def  |    3 +
> > + expat/lib/libexpatw.def |    3 +
> > + expat/lib/xmlparse.c    | 1147
> > +++++++++++++++++++++++++++++++++++++-
> > -
> > + 5 files changed, 1143 insertions(+), 61 deletions(-)
> > +
> > +diff --git a/expat/lib/expat.h b/expat/lib/expat.h
> > +index 48a6e2a3..796086c2 100644
> > +--- a/expat/lib/expat.h
> > ++++ b/expat/lib/expat.h
> > +@@ -115,7 +115,9 @@ enum XML_Error {
> > +   XML_ERROR_RESERVED_PREFIX_XMLNS,
> > +   XML_ERROR_RESERVED_NAMESPACE_URI,
> > +   /* Added in 2.2.1. */
> > +-  XML_ERROR_INVALID_ARGUMENT
> > ++  XML_ERROR_INVALID_ARGUMENT,
> > ++  /* Backported from 2.4.0. */
> > ++  XML_ERROR_AMPLIFICATION_LIMIT_BREACH
> > + };
> > +
> > + enum XML_Content_Type {
> > +@@ -997,7 +999,10 @@ enum XML_FeatureEnum {
> > +   XML_FEATURE_SIZEOF_XML_LCHAR,
> > +   XML_FEATURE_NS,
> > +   XML_FEATURE_LARGE_SIZE,
> > +-  XML_FEATURE_ATTR_INFO
> > ++  XML_FEATURE_ATTR_INFO,
> > ++  /* Added in Expat 2.4.0. */
> > ++
> > XML_FEATURE_BILLION_LAUGHS_ATTACK_PROTECTION_MAXIMUM_AMPLIFICATION_DE
> > FA
> > ULT,
> > ++
> > XML_FEATURE_BILLION_LAUGHS_ATTACK_PROTECTION_ACTIVATION_THRESHOLD_DEF
> > AU
> > LT
> > +   /* Additional features must be added to the end of this enum. */
> > + };
> > +
> > +@@ -1010,6 +1015,18 @@ typedef struct {
> > + XMLPARSEAPI(const XML_Feature *)
> > + XML_GetFeatureList(void);
> > +
> > ++#ifdef XML_DTD
> > ++/* Backported from Expat 2.4.0. */
> > ++XMLPARSEAPI(XML_Bool)
> > ++XML_SetBillionLaughsAttackProtectionMaximumAmplification(
> > ++    XML_Parser parser, float maximumAmplificationFactor);
> > ++
> > ++/* Backported from Expat 2.4.0. */
> > ++XMLPARSEAPI(XML_Bool)
> > ++XML_SetBillionLaughsAttackProtectionActivationThreshold(
> > ++    XML_Parser parser, unsigned long long
> > activationThresholdBytes);
> > ++#endif
> > ++
> > + /* Expat follows the semantic versioning convention.
> > +    See http://semver.org.
> > + */
> > +diff --git a/expat/lib/internal.h b/expat/lib/internal.h
> > +index 60913dab..d8b31fa2 100644
> > +--- a/expat/lib/internal.h
> > ++++ b/expat/lib/internal.h
> > +@@ -101,10 +101,40 @@
> > + #  endif
> > + #endif
> > +
> > ++#include <limits.h> // ULONG_MAX
> > ++
> > ++#if defined(_WIN32) && ! defined(__USE_MINGW_ANSI_STDIO)
> > ++#  define EXPAT_FMT_ULL(midpart) "%" midpart "I64u"
> > ++#  if defined(_WIN64) // Note: modifier "td" does not work for
> > MinGW
> > ++#    define EXPAT_FMT_PTRDIFF_T(midpart) "%" midpart "I64d"
> > ++#  else
> > ++#    define EXPAT_FMT_PTRDIFF_T(midpart) "%" midpart "d"
> > ++#  endif
> > ++#else
> > ++#  define EXPAT_FMT_ULL(midpart) "%" midpart "llu"
> > ++#  if ! defined(ULONG_MAX)
> > ++#    error Compiler did not define ULONG_MAX for us
> > ++#  elif ULONG_MAX =3D=3D 18446744073709551615u // 2^64-1
> > ++#    define EXPAT_FMT_PTRDIFF_T(midpart) "%" midpart "ld"
> > ++#  else
> > ++#    define EXPAT_FMT_PTRDIFF_T(midpart) "%" midpart "d"
> > ++#  endif
> > ++#endif
> > ++
> > + #ifndef UNUSED_P
> > + #  define UNUSED_P(p) (void)p
> > + #endif
> > +
> > ++/* NOTE BEGIN If you ever patch these defaults to greater values
> > ++              for non-attack XML payload in your environment,
> > ++              please file a bug report with libexpat.  Thank you!
> > ++*/
> > ++#define
> > \
> > ++  100.0f
> > ++#define
> > \
> > ++  8388608 // 8 MiB, 2^23
> > ++/* NOTE END */
> > ++
> > + #ifdef __cplusplus
> > + extern "C" {
> > + #endif
> > +diff --git a/expat/lib/libexpat.def b/expat/lib/libexpat.def
> > +index 16faf595..b5e59d8d 100644
> > +--- a/expat/lib/libexpat.def
> > ++++ b/expat/lib/libexpat.def
> > +@@ -76,3 +76,6 @@ EXPORTS
> > +   XML_SetHashSalt @67
> > + ; added with version 2.2.5
> > +   _INTERNAL_trim_to_complete_utf8_characters @68
> > ++; backported from version 2.4.0
> > ++  XML_SetBillionLaughsAttackProtectionActivationThreshold @69
> > ++  XML_SetBillionLaughsAttackProtectionMaximumAmplification @70
> > +diff --git a/expat/lib/libexpatw.def b/expat/lib/libexpatw.def
> > +index 16faf595..ebd77707 100644
> > +--- a/expat/lib/libexpatw.def
> > ++++ b/expat/lib/libexpatw.def
> > +@@ -76,3 +76,6 @@ EXPORTS
> > +   XML_SetHashSalt @67
> > + ; added with version 2.2.5
> > +   _INTERNAL_trim_to_complete_utf8_characters @68
> > ++; backported from version 2.4.0
> > ++  XML_SetBillionLaughsAttackProtectionActivationThreshold @69
> > ++  XML_SetBillionLaughsAttackProtectionMaximumAmplification @7
> > +diff --git a/expat/lib/xmlparse.c b/expat/lib/xmlparse.c
> > +index 3aaf35b9..fdcc7296 100644
> > +--- a/expat/lib/xmlparse.c
> > ++++ b/expat/lib/xmlparse.c
> > +@@ -47,6 +47,8 @@
> > + #include <limits.h> /* UINT_MAX */
> > + #include <stdio.h>  /* fprintf */
> > + #include <stdlib.h> /* getenv, rand_s */
> > ++#include <stdint.h> /* uintptr_t */
> > ++#include <math.h>   /* isnan */
> > +
> > + #ifdef _WIN32
> > + #  define getpid GetCurrentProcessId
> > +@@ -373,6 +375,31 @@ typedef struct open_internal_entity {
> > +   XML_Bool betweenDecl; /* WFC: PE Between Declarations */
> > + } OPEN_INTERNAL_ENTITY;
> > +
> > ++enum XML_Account {
> > ++  XML_ACCOUNT_DIRECT,           /* bytes directly passed to the
> > Expat
> > parser */
> > ++  XML_ACCOUNT_ENTITY_EXPANSION, /* intermediate bytes produced
> > during
> > entity
> > ++                                   expansion */
> > ++  XML_ACCOUNT_NONE              /* i.e. do not account, was
> > accounted
> > already */
> > ++};
> > ++
> > ++#ifdef XML_DTD
> > ++typedef unsigned long long XmlBigCount;
> > ++typedef struct accounting {
> > ++  XmlBigCount countBytesDirect;
> > ++  XmlBigCount countBytesIndirect;
> > ++  int debugLevel;
> > ++  float maximumAmplificationFactor; // >=3D1.0
> > ++  unsigned long long activationThresholdBytes;
> > ++} ACCOUNTING;
> > ++
> > ++typedef struct entity_stats {
> > ++  unsigned int countEverOpened;
> > ++  unsigned int currentDepth;
> > ++  unsigned int maximumDepthSeen;
> > ++  int debugLevel;
> > ++} ENTITY_STATS;
> > ++#endif /* XML_DTD */
> > ++
> > + typedef enum XML_Error PTRCALL Processor(XML_Parser parser, const
> > char *start,
> > +                                          const char *end, const
> > char
> > **endPtr);
> > +
> > +@@ -403,16 +430,18 @@ static enum XML_Error
> > initializeEncoding(XML_Parser parser);
> > + static enum XML_Error doProlog(XML_Parser parser, const ENCODING
> > *enc,
> > +                                const char *s, const char *end, int
> > tok,
> > +                                const char *next, const char
> > **nextPtr,
> > +-                               XML_Bool haveMore, XML_Bool
> > allowClosingDoctype);
> > ++                               XML_Bool haveMore, XML_Bool
> > allowClosingDoctype,
> > ++                               enum XML_Account account);
> > + static enum XML_Error processInternalEntity(XML_Parser parser,
> > ENTITY
> > *entity,
> > +                                             XML_Bool betweenDecl);
> > + static enum XML_Error doContent(XML_Parser parser, int
> > startTagLevel,
> > +                                 const ENCODING *enc, const char
> > *start,
> > +                                 const char *end, const char
> > **endPtr,
> > +-                                XML_Bool haveMore);
> > ++                                XML_Bool haveMore, enum XML_Account
> > account);
> > + static enum XML_Error doCdataSection(XML_Parser parser, const
> > ENCODING *,
> > +                                      const char **startPtr, const
> > char *end,
> > +-                                     const char **nextPtr, XML_Bool
> > haveMore);
> > ++                                     const char **nextPtr, XML_Bool
> > haveMore,
> > ++                                     enum XML_Account account);
> > + #ifdef XML_DTD
> > + static enum XML_Error doIgnoreSection(XML_Parser parser, const
> > ENCODING *,
> > +                                       const char **startPtr, const
> > char *end,
> > +@@ -422,7 +451,8 @@ static enum XML_Error doIgnoreSection(XML_Parser
> > parser, const ENCODING *,
> > + static void freeBindings(XML_Parser parser, BINDING *bindings);
> > + static enum XML_Error storeAtts(XML_Parser parser, const ENCODING
> > *,
> > +                                 const char *s, TAG_NAME
> > *tagNamePtr,
> > +-                                BINDING **bindingsPtr);
> > ++                                BINDING **bindingsPtr,
> > ++                                enum XML_Account account);
> > + static enum XML_Error addBinding(XML_Parser parser, PREFIX *prefix,
> > +                                  const ATTRIBUTE_ID *attId, const
> > XML_Char *uri,
> > +                                  BINDING **bindingsPtr);
> > +@@ -431,15 +461,18 @@ static int defineAttribute(ELEMENT_TYPE *type,
> > ATTRIBUTE_ID *, XML_Bool isCdata,
> > +                            XML_Parser parser);
> > + static enum XML_Error storeAttributeValue(XML_Parser parser, const
> > ENCODING *,
> > +                                           XML_Bool isCdata, const
> > char *,
> > +-                                          const char *, STRING_POOL
> > *);
> > ++                                          const char *, STRING_POOL
> > *,
> > ++                                          enum XML_Account
> > account);
> > + static enum XML_Error appendAttributeValue(XML_Parser parser, const
> > ENCODING *,
> > +                                            XML_Bool isCdata, const
> > char *,
> > +-                                           const char *,
> > STRING_POOL
> > *);
> > ++                                           const char *,
> > STRING_POOL
> > *,
> > ++                                           enum XML_Account
> > account);
> > + static ATTRIBUTE_ID *getAttributeId(XML_Parser parser, const
> > ENCODING
> > *enc,
> > +                                     const char *start, const char
> > *end);
> > + static int setElementTypePrefix(XML_Parser parser, ELEMENT_TYPE *);
> > + static enum XML_Error storeEntityValue(XML_Parser parser, const
> > ENCODING *enc,
> > +-                                       const char *start, const
> > char
> > *end);
> > ++                                       const char *start, const
> > char
> > *end,
> > ++                                       enum XML_Account account);
> > + static int reportProcessingInstruction(XML_Parser parser, const
> > ENCODING *enc,
> > +                                        const char *start, const
> > char
> > *end);
> > + static int reportComment(XML_Parser parser, const ENCODING *enc,
> > +@@ -503,6 +536,35 @@ static XML_Parser parserCreate(const XML_Char
> > *encodingName,
> > +
> > + static void parserInit(XML_Parser parser, const XML_Char
> > *encodingName);
> > +
> > ++#ifdef XML_DTD
> > ++static float accountingGetCurrentAmplification(XML_Parser
> > rootParser);
> > ++static void accountingReportStats(XML_Parser originParser, const
> > char
> > *epilog);
> > ++static void accountingOnAbort(XML_Parser originParser);
> > ++static void accountingReportDiff(XML_Parser rootParser,
> > ++                                 unsigned int
> > levelsAwayFromRootParser,
> > ++                                 const char *before, const char
> > *after,
> > ++                                 ptrdiff_t bytesMore, int
> > source_line,
> > ++                                 enum XML_Account account);
> > ++static XML_Bool accountingDiffTolerated(XML_Parser originParser,
> > int
> > tok,
> > ++                                        const char *before, const
> > char *after,
> > ++                                        int source_line,
> > ++                                        enum XML_Account account);
> > ++
> > ++static void entityTrackingReportStats(XML_Parser parser, ENTITY
> > *entity,
> > ++                                      const char *action, int
> > sourceLine);
> > ++static void entityTrackingOnOpen(XML_Parser parser, ENTITY *entity,
> > ++                                 int sourceLine);
> > ++static void entityTrackingOnClose(XML_Parser parser, ENTITY
> > *entity,
> > ++                                  int sourceLine);
> > ++
> > ++static XML_Parser getRootParserOf(XML_Parser parser,
> > ++                                  unsigned int *outLevelDiff);
> > ++static const char *unsignedCharToPrintable(unsigned char c);
> > ++#endif /* XML_DTD */
> > ++
> > ++static unsigned long getDebugLevel(const char *variableName,
> > ++                                   unsigned long
> > defaultDebugLevel);
> > ++
> > + #define poolStart(pool) ((pool)->start)
> > + #define poolEnd(pool) ((pool)->ptr)
> > + #define poolLength(pool) ((pool)->ptr - (pool)->start)
> > +@@ -616,6 +678,10 @@ struct XML_ParserStruct {
> > +   enum XML_ParamEntityParsing m_paramEntityParsing;
> > + #endif
> > +   unsigned long m_hash_secret_salt;
> > ++#ifdef XML_DTD
> > ++  ACCOUNTING m_accounting;
> > ++  ENTITY_STATS m_entity_stats;
> > ++#endif
> > + };
> > +
> > + #define MALLOC(parser, s) (parser->m_mem.malloc_fcn((s)))
> > +@@ -1055,6 +1121,18 @@ parserInit(XML_Parser parser, const XML_Char
> > *encodingName) {
> > +   parser->m_paramEntityParsing =3D XML_PARAM_ENTITY_PARSING_NEVER;
> > + #endif
> > +   parser->m_hash_secret_salt =3D 0;
> > ++
> > ++#ifdef XML_DTD
> > ++  memset(&parser->m_accounting, 0, sizeof(ACCOUNTING));
> > ++  parser->m_accounting.debugLevel =3D
> > getDebugLevel("EXPAT_ACCOUNTING_DEBUG", 0u);
> > ++  parser->m_accounting.maximumAmplificationFactor
> > ++      =3D
> > EXPAT_BILLION_LAUGHS_ATTACK_PROTECTION_MAXIMUM_AMPLIFICATION_DEFAULT;
> > ++  parser->m_accounting.activationThresholdBytes
> > ++      =3D
> > EXPAT_BILLION_LAUGHS_ATTACK_PROTECTION_ACTIVATION_THRESHOLD_DEFAULT;
> > ++
> > ++  memset(&parser->m_entity_stats, 0, sizeof(ENTITY_STATS));
> > ++  parser->m_entity_stats.debugLevel =3D
> > getDebugLevel("EXPAT_ENTITY_DEBUG", 0u);
> > ++#endif
> > + }
> > +
> > + /* moves list of bindings to m_freeBindingList */
> > +@@ -2318,6 +2396,10 @@ XML_ErrorString(enum XML_Error code) {
> > +   /* Added in 2.2.5. */
> > +   case XML_ERROR_INVALID_ARGUMENT: /* Constant added in 2.2.1,
> > already */
> > +     return XML_L("invalid argument");
> > ++  /* Backported from 2.4.0. */
> > ++  case XML_ERROR_AMPLIFICATION_LIMIT_BREACH:
> > ++    return XML_L(
> > ++        "limit on input amplification factor (from DTD and
> > entities)
> > breached");
> > +   }
> > +   return NULL;
> > + }
> > +@@ -2354,41 +2436,75 @@ XML_ExpatVersionInfo(void) {
> > +
> > + const XML_Feature *XMLCALL
> > + XML_GetFeatureList(void) {
> > +-  static const XML_Feature features[]
> > +-      =3D {{XML_FEATURE_SIZEOF_XML_CHAR, XML_L("sizeof(XML_Char)"),
> > +-          sizeof(XML_Char)},
> > +-         {XML_FEATURE_SIZEOF_XML_LCHAR, XML_L("sizeof(XML_LChar)"),
> > +-          sizeof(XML_LChar)},
> > ++  static const XML_Feature features[] =3D {
> > ++      {XML_FEATURE_SIZEOF_XML_CHAR, XML_L("sizeof(XML_Char)"),
> > ++       sizeof(XML_Char)},
> > ++      {XML_FEATURE_SIZEOF_XML_LCHAR, XML_L("sizeof(XML_LChar)"),
> > ++       sizeof(XML_LChar)},
> > + #ifdef XML_UNICODE
> > +-         {XML_FEATURE_UNICODE, XML_L("XML_UNICODE"), 0},
> > ++      {XML_FEATURE_UNICODE, XML_L("XML_UNICODE"), 0},
> > + #endif
> > + #ifdef XML_UNICODE_WCHAR_T
> > +-         {XML_FEATURE_UNICODE_WCHAR_T,
> > XML_L("XML_UNICODE_WCHAR_T"),
> > 0},
> > ++      {XML_FEATURE_UNICODE_WCHAR_T, XML_L("XML_UNICODE_WCHAR_T"),
> > 0},
> > + #endif
> > + #ifdef XML_DTD
> > +-         {XML_FEATURE_DTD, XML_L("XML_DTD"), 0},
> > ++      {XML_FEATURE_DTD, XML_L("XML_DTD"), 0},
> > + #endif
> > + #ifdef XML_CONTEXT_BYTES
> > +-         {XML_FEATURE_CONTEXT_BYTES, XML_L("XML_CONTEXT_BYTES"),
> > +-          XML_CONTEXT_BYTES},
> > ++      {XML_FEATURE_CONTEXT_BYTES, XML_L("XML_CONTEXT_BYTES"),
> > ++       XML_CONTEXT_BYTES},
> > + #endif
> > + #ifdef XML_MIN_SIZE
> > +-         {XML_FEATURE_MIN_SIZE, XML_L("XML_MIN_SIZE"), 0},
> > ++      {XML_FEATURE_MIN_SIZE, XML_L("XML_MIN_SIZE"), 0},
> > + #endif
> > + #ifdef XML_NS
> > +-         {XML_FEATURE_NS, XML_L("XML_NS"), 0},
> > ++      {XML_FEATURE_NS, XML_L("XML_NS"), 0},
> > + #endif
> > + #ifdef XML_LARGE_SIZE
> > +-         {XML_FEATURE_LARGE_SIZE, XML_L("XML_LARGE_SIZE"), 0},
> > ++      {XML_FEATURE_LARGE_SIZE, XML_L("XML_LARGE_SIZE"), 0},
> > + #endif
> > + #ifdef XML_ATTR_INFO
> > +-         {XML_FEATURE_ATTR_INFO, XML_L("XML_ATTR_INFO"), 0},
> > ++      {XML_FEATURE_ATTR_INFO, XML_L("XML_ATTR_INFO"), 0},
> > + #endif
> > +-         {XML_FEATURE_END, NULL, 0}};
> > ++#ifdef XML_DTD
> > ++      /* Added in Expat 2.4.0. */
> > ++
> > {XML_FEATURE_BILLION_LAUGHS_ATTACK_PROTECTION_MAXIMUM_AMPLIFICATION_D
> > EF
> > AULT,
> > ++       XML_L("XML_BLAP_MAX_AMP"),
> > ++       (long int)
> > ++
> > EXPAT_BILLION_LAUGHS_ATTACK_PROTECTION_MAXIMUM_AMPLIFICATION_DEFAULT}
> > ,
> > ++
> > {XML_FEATURE_BILLION_LAUGHS_ATTACK_PROTECTION_ACTIVATION_THRESHOLD_DE
> > FA
> > ULT,
> > ++       XML_L("XML_BLAP_ACT_THRES"),
> > ++
> > EXPAT_BILLION_LAUGHS_ATTACK_PROTECTION_ACTIVATION_THRESHOLD_DEFAULT},
> > ++#endif
> > ++      {XML_FEATURE_END, NULL, 0}};
> > +
> > +   return features;
> > + }
> > +
> > ++#ifdef XML_DTD
> > ++XML_Bool XMLCALL
> > ++XML_SetBillionLaughsAttackProtectionMaximumAmplification(
> > ++    XML_Parser parser, float maximumAmplificationFactor) {
> > ++  if ((parser =3D=3D NULL) || (parser->m_parentParser !=3D NULL)
> > ++      || isnan(maximumAmplificationFactor)
> > ++      || (maximumAmplificationFactor < 1.0f)) {
> > ++    return XML_FALSE;
> > ++  }
> > ++  parser->m_accounting.maximumAmplificationFactor =3D
> > maximumAmplificationFactor;
> > ++  return XML_TRUE;
> > ++}
> > ++
> > ++XML_Bool XMLCALL
> > ++XML_SetBillionLaughsAttackProtectionActivationThreshold(
> > ++    XML_Parser parser, unsigned long long activationThresholdBytes)
> > {
> > ++  if ((parser =3D=3D NULL) || (parser->m_parentParser !=3D NULL)) {
> > ++    return XML_FALSE;
> > ++  }
> > ++  parser->m_accounting.activationThresholdBytes =3D
> > activationThresholdBytes;
> > ++  return XML_TRUE;
> > ++}
> > ++#endif /* XML_DTD */
> > ++
> > + /* Initially tag->rawName always points into the parse buffer;
> > +    for those TAG instances opened while the current parse buffer
> > was
> > +    processed, and not yet closed, we need to store tag->rawName in
> > a
> > more
> > +@@ -2441,9 +2557,9 @@ storeRawNames(XML_Parser parser) {
> > + static enum XML_Error PTRCALL
> > + contentProcessor(XML_Parser parser, const char *start, const char
> > *end,
> > +                  const char **endPtr) {
> > +-  enum XML_Error result
> > +-      =3D doContent(parser, 0, parser->m_encoding, start, end,
> > endPtr,
> > +-                  (XML_Bool)! parser->m_parsingStatus.finalBuffer);
> > ++  enum XML_Error result =3D doContent(
> > ++      parser, 0, parser->m_encoding, start, end, endPtr,
> > ++      (XML_Bool)! parser->m_parsingStatus.finalBuffer,
> > XML_ACCOUNT_DIRECT);
> > +   if (result =3D=3D XML_ERROR_NONE) {
> > +     if (! storeRawNames(parser))
> > +       return XML_ERROR_NO_MEMORY;
> > +@@ -2468,6 +2584,14 @@ externalEntityInitProcessor2(XML_Parser
> > parser,
> > const char *start,
> > +   int tok =3D XmlContentTok(parser->m_encoding, start, end, &next);
> > +   switch (tok) {
> > +   case XML_TOK_BOM:
> > ++#ifdef XML_DTD
> > ++    if (! accountingDiffTolerated(parser, tok, start, next,
> > __LINE__,
> > ++                                  XML_ACCOUNT_DIRECT)) {
> > ++      accountingOnAbort(parser);
> > ++      return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
> > ++    }
> > ++#endif /* XML_DTD */
> > ++
> > +     /* If we are at the end of the buffer, this would cause the
> > next
> > stage,
> > +        i.e. externalEntityInitProcessor3, to pass control directly
> > to
> > +        doContent (by detecting XML_TOK_NONE) without processing any
> > xml text
> > +@@ -2505,6 +2629,10 @@ externalEntityInitProcessor3(XML_Parser
> > parser,
> > const char *start,
> > +   const char *next =3D start; /* XmlContentTok doesn't always set th=
e
> > last arg */
> > +   parser->m_eventPtr =3D start;
> > +   tok =3D XmlContentTok(parser->m_encoding, start, end, &next);
> > ++  /* Note: These bytes are accounted later in:
> > ++           - processXmlDecl
> > ++           - externalEntityContentProcessor
> > ++  */
> > +   parser->m_eventEndPtr =3D next;
> > +
> > +   switch (tok) {
> > +@@ -2546,7 +2674,8 @@ externalEntityContentProcessor(XML_Parser
> > parser, const char *start,
> > +                                const char *end, const char
> > **endPtr)
> > {
> > +   enum XML_Error result
> > +       =3D doContent(parser, 1, parser->m_encoding, start, end,
> > endPtr,
> > +-                  (XML_Bool)! parser->m_parsingStatus.finalBuffer);
> > ++                  (XML_Bool)! parser->m_parsingStatus.finalBuffer,
> > ++                  XML_ACCOUNT_ENTITY_EXPANSION);
> > +   if (result =3D=3D XML_ERROR_NONE) {
> > +     if (! storeRawNames(parser))
> > +       return XML_ERROR_NO_MEMORY;
> > +@@ -2557,7 +2686,7 @@ externalEntityContentProcessor(XML_Parser
> > parser, const char *start,
> > + static enum XML_Error
> > + doContent(XML_Parser parser, int startTagLevel, const ENCODING
> > *enc,
> > +           const char *s, const char *end, const char **nextPtr,
> > +-          XML_Bool haveMore) {
> > ++          XML_Bool haveMore, enum XML_Account account) {
> > +   /* save one level of indirection */
> > +   DTD *const dtd =3D parser->m_dtd;
> > +
> > +@@ -2575,6 +2704,17 @@ doContent(XML_Parser parser, int
> > startTagLevel,
> > const ENCODING *enc,
> > +   for (;;) {
> > +     const char *next =3D s; /* XmlContentTok doesn't always set the
> > last arg */
> > +     int tok =3D XmlContentTok(enc, s, end, &next);
> > ++#ifdef XML_DTD
> > ++    const char *accountAfter
> > ++        =3D ((tok =3D=3D XML_TOK_TRAILING_RSQB) || (tok =3D=3D
> > XML_TOK_TRAILING_CR))
> > ++              ? (haveMore ? s /* i.e. 0 bytes */ : end)
> > ++              : next;
> > ++    if (! accountingDiffTolerated(parser, tok, s, accountAfter,
> > __LINE__,
> > ++                                  account)) {
> > ++      accountingOnAbort(parser);
> > ++      return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
> > ++    }
> > ++#endif
> > +     *eventEndPP =3D next;
> > +     switch (tok) {
> > +     case XML_TOK_TRAILING_CR:
> > +@@ -2630,6 +2770,14 @@ doContent(XML_Parser parser, int
> > startTagLevel,
> > const ENCODING *enc,
> > +       XML_Char ch =3D (XML_Char)XmlPredefinedEntityName(
> > +           enc, s + enc->minBytesPerChar, next - enc-
> > > minBytesPerChar);
> > +       if (ch) {
> > ++#ifdef XML_DTD
> > ++        /* NOTE: We are replacing 4-6 characters original input for
> > 1
> > character
> > ++         *       so there is no amplification and hence recording
> > without
> > ++         *       protection. */
> > ++        accountingDiffTolerated(parser, tok, (char *)&ch,
> > ++                                ((char *)&ch) + sizeof(XML_Char),
> > __LINE__,
> > ++                                XML_ACCOUNT_ENTITY_EXPANSION);
> > ++#endif /* XML_DTD */
> > +         if (parser->m_characterDataHandler)
> > +           parser->m_characterDataHandler(parser->m_handlerArg, &ch,
> > 1);
> > +         else if (parser->m_defaultHandler)
> > +@@ -2748,7 +2896,8 @@ doContent(XML_Parser parser, int
> > startTagLevel,
> > const ENCODING *enc,
> > +       }
> > +       tag->name.str =3D (XML_Char *)tag->buf;
> > +       *toPtr =3D XML_T('\0');
> > +-      result =3D storeAtts(parser, enc, s, &(tag->name), &(tag-
> > > bindings));
> > ++      result
> > ++          =3D storeAtts(parser, enc, s, &(tag->name), &(tag-
> > >bindings),
> > account);
> > +       if (result)
> > +         return result;
> > +       if (parser->m_startElementHandler)
> > +@@ -2772,7 +2921,8 @@ doContent(XML_Parser parser, int
> > startTagLevel,
> > const ENCODING *enc,
> > +       if (! name.str)
> > +         return XML_ERROR_NO_MEMORY;
> > +       poolFinish(&parser->m_tempPool);
> > +-      result =3D storeAtts(parser, enc, s, &name, &bindings);
> > ++      result =3D storeAtts(parser, enc, s, &name, &bindings,
> > ++                         XML_ACCOUNT_NONE /* token spans whole
> > start
> > tag */);
> > +       if (result !=3D XML_ERROR_NONE) {
> > +         freeBindings(parser, bindings);
> > +         return result;
> > +@@ -2907,7 +3057,8 @@ doContent(XML_Parser parser, int
> > startTagLevel,
> > const ENCODING *enc,
> > +       /* END disabled code */
> > +       else if (parser->m_defaultHandler)
> > +         reportDefault(parser, enc, s, next);
> > +-      result =3D doCdataSection(parser, enc, &next, end, nextPtr,
> > haveMore);
> > ++      result
> > ++          =3D doCdataSection(parser, enc, &next, end, nextPtr,
> > haveMore, account);
> > +       if (result !=3D XML_ERROR_NONE)
> > +         return result;
> > +       else if (! next) {
> > +@@ -3036,7 +3187,8 @@ freeBindings(XML_Parser parser, BINDING
> > *bindings) {
> > + */
> > + static enum XML_Error
> > + storeAtts(XML_Parser parser, const ENCODING *enc, const char
> > *attStr,
> > +-          TAG_NAME *tagNamePtr, BINDING **bindingsPtr) {
> > ++          TAG_NAME *tagNamePtr, BINDING **bindingsPtr,
> > ++          enum XML_Account account) {
> > +   DTD *const dtd =3D parser->m_dtd; /* save one level of indirection
> > */
> > +   ELEMENT_TYPE *elementType;
> > +   int nDefaultAtts;
> > +@@ -3146,7 +3298,7 @@ storeAtts(XML_Parser parser, const ENCODING
> > *enc, const char *attStr,
> > +       /* normalize the attribute value */
> > +       result =3D storeAttributeValue(
> > +           parser, enc, isCdata, parser->m_atts[i].valuePtr,
> > +-          parser->m_atts[i].valueEnd, &parser->m_tempPool);
> > ++          parser->m_atts[i].valueEnd, &parser->m_tempPool,
> > account);
> > +       if (result)
> > +         return result;
> > +       appAtts[attIndex] =3D poolStart(&parser->m_tempPool);
> > +@@ -3535,9 +3687,9 @@ addBinding(XML_Parser parser, PREFIX *prefix,
> > const ATTRIBUTE_ID *attId,
> > + static enum XML_Error PTRCALL
> > + cdataSectionProcessor(XML_Parser parser, const char *start, const
> > char *end,
> > +                       const char **endPtr) {
> > +-  enum XML_Error result
> > +-      =3D doCdataSection(parser, parser->m_encoding, &start, end,
> > endPtr,
> > +-                       (XML_Bool)! parser-
> > > m_parsingStatus.finalBuffer);
> > ++  enum XML_Error result =3D doCdataSection(
> > ++      parser, parser->m_encoding, &start, end, endPtr,
> > ++      (XML_Bool)! parser->m_parsingStatus.finalBuffer,
> > XML_ACCOUNT_DIRECT);
> > +   if (result !=3D XML_ERROR_NONE)
> > +     return result;
> > +   if (start) {
> > +@@ -3557,7 +3709,8 @@ cdataSectionProcessor(XML_Parser parser, const
> > char *start, const char *end,
> > + */
> > + static enum XML_Error
> > + doCdataSection(XML_Parser parser, const ENCODING *enc, const char
> > **startPtr,
> > +-               const char *end, const char **nextPtr, XML_Bool
> > haveMore) {
> > ++               const char *end, const char **nextPtr, XML_Bool
> > haveMore,
> > ++               enum XML_Account account) {
> > +   const char *s =3D *startPtr;
> > +   const char **eventPP;
> > +   const char **eventEndPP;
> > +@@ -3575,6 +3728,14 @@ doCdataSection(XML_Parser parser, const
> > ENCODING *enc, const char **startPtr,
> > +   for (;;) {
> > +     const char *next;
> > +     int tok =3D XmlCdataSectionTok(enc, s, end, &next);
> > ++#ifdef XML_DTD
> > ++    if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
> > account)) {
> > ++      accountingOnAbort(parser);
> > ++      return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
> > ++    }
> > ++#else
> > ++    UNUSED_P(account);
> > ++#endif
> > +     *eventEndPP =3D next;
> > +     switch (tok) {
> > +     case XML_TOK_CDATA_SECT_CLOSE:
> > +@@ -3719,6 +3880,13 @@ doIgnoreSection(XML_Parser parser, const
> > ENCODING *enc, const char **startPtr,
> > +   *eventPP =3D s;
> > +   *startPtr =3D NULL;
> > +   tok =3D XmlIgnoreSectionTok(enc, s, end, &next);
> > ++#  ifdef XML_DTD
> > ++  if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
> > ++                                XML_ACCOUNT_DIRECT)) {
> > ++    accountingOnAbort(parser);
> > ++    return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
> > ++  }
> > ++#  endif
> > +   *eventEndPP =3D next;
> > +   switch (tok) {
> > +   case XML_TOK_IGNORE_SECT:
> > +@@ -3803,6 +3971,15 @@ processXmlDecl(XML_Parser parser, int
> > isGeneralTextEntity, const char *s,
> > +   const char *versionend;
> > +   const XML_Char *storedversion =3D NULL;
> > +   int standalone =3D -1;
> > ++
> > ++#ifdef XML_DTD
> > ++  if (! accountingDiffTolerated(parser, XML_TOK_XML_DECL, s, next,
> > __LINE__,
> > ++                                XML_ACCOUNT_DIRECT)) {
> > ++    accountingOnAbort(parser);
> > ++    return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
> > ++  }
> > ++#endif
> > ++
> > +   if (! (parser->m_ns ? XmlParseXmlDeclNS : XmlParseXmlDecl)(
> > +           isGeneralTextEntity, parser->m_encoding, s, next,
> > &parser-
> > > m_eventPtr,
> > +           &version, &versionend, &encodingName, &newEncoding,
> > &standalone)) {
> > +@@ -3952,6 +4129,10 @@ entityValueInitProcessor(XML_Parser parser,
> > const char *s, const char *end,
> > +
> > +   for (;;) {
> > +     tok =3D XmlPrologTok(parser->m_encoding, start, end, &next);
> > ++    /* Note: Except for XML_TOK_BOM below, these bytes are
> > accounted
> > later in:
> > ++             - storeEntityValue
> > ++             - processXmlDecl
> > ++    */
> > +     parser->m_eventEndPtr =3D next;
> > +     if (tok <=3D 0) {
> > +       if (! parser->m_parsingStatus.finalBuffer && tok !=3D
> > XML_TOK_INVALID) {
> > +@@ -3970,7 +4151,8 @@ entityValueInitProcessor(XML_Parser parser,
> > const char *s, const char *end,
> > +         break;
> > +       }
> > +       /* found end of entity value - can store it now */
> > +-      return storeEntityValue(parser, parser->m_encoding, s, end);
> > ++      return storeEntityValue(parser, parser->m_encoding, s, end,
> > ++                              XML_ACCOUNT_DIRECT);
> > +     } else if (tok =3D=3D XML_TOK_XML_DECL) {
> > +       enum XML_Error result;
> > +       result =3D processXmlDecl(parser, 0, start, next);
> > +@@ -3997,6 +4179,14 @@ entityValueInitProcessor(XML_Parser parser,
> > const char *s, const char *end,
> > +     */
> > +     else if (tok =3D=3D XML_TOK_BOM && next =3D=3D end
> > +              && ! parser->m_parsingStatus.finalBuffer) {
> > ++#  ifdef XML_DTD
> > ++      if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
> > ++                                    XML_ACCOUNT_DIRECT)) {
> > ++        accountingOnAbort(parser);
> > ++        return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
> > ++      }
> > ++#  endif
> > ++
> > +       *nextPtr =3D next;
> > +       return XML_ERROR_NONE;
> > +     }
> > +@@ -4039,16 +4229,24 @@ externalParEntProcessor(XML_Parser parser,
> > const char *s, const char *end,
> > +   }
> > +   /* This would cause the next stage, i.e. doProlog to be passed
> > XML_TOK_BOM.
> > +      However, when parsing an external subset, doProlog will not
> > accept a BOM
> > +-     as valid, and report a syntax error, so we have to skip the
> > BOM
> > ++     as valid, and report a syntax error, so we have to skip the
> > BOM,
> > and
> > ++     account for the BOM bytes.
> > +   */
> > +   else if (tok =3D=3D XML_TOK_BOM) {
> > ++    if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
> > ++                                  XML_ACCOUNT_DIRECT)) {
> > ++      accountingOnAbort(parser);
> > ++      return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
> > ++    }
> > ++
> > +     s =3D next;
> > +     tok =3D XmlPrologTok(parser->m_encoding, s, end, &next);
> > +   }
> > +
> > +   parser->m_processor =3D prologProcessor;
> > +   return doProlog(parser, parser->m_encoding, s, end, tok, next,
> > nextPtr,
> > +-                  (XML_Bool)! parser->m_parsingStatus.finalBuffer,
> > XML_TRUE);
> > ++                  (XML_Bool)! parser->m_parsingStatus.finalBuffer,
> > XML_TRUE,
> > ++                  XML_ACCOUNT_DIRECT);
> > + }
> > +
> > + static enum XML_Error PTRCALL
> > +@@ -4061,6 +4259,9 @@ entityValueProcessor(XML_Parser parser, const
> > char *s, const char *end,
> > +
> > +   for (;;) {
> > +     tok =3D XmlPrologTok(enc, start, end, &next);
> > ++    /* Note: These bytes are accounted later in:
> > ++             - storeEntityValue
> > ++    */
> > +     if (tok <=3D 0) {
> > +       if (! parser->m_parsingStatus.finalBuffer && tok !=3D
> > XML_TOK_INVALID) {
> > +         *nextPtr =3D s;
> > +@@ -4078,7 +4279,7 @@ entityValueProcessor(XML_Parser parser, const
> > char *s, const char *end,
> > +         break;
> > +       }
> > +       /* found end of entity value - can store it now */
> > +-      return storeEntityValue(parser, enc, s, end);
> > ++      return storeEntityValue(parser, enc, s, end,
> > XML_ACCOUNT_DIRECT);
> > +     }
> > +     start =3D next;
> > +   }
> > +@@ -4092,13 +4293,14 @@ prologProcessor(XML_Parser parser, const
> > char
> > *s, const char *end,
> > +   const char *next =3D s;
> > +   int tok =3D XmlPrologTok(parser->m_encoding, s, end, &next);
> > +   return doProlog(parser, parser->m_encoding, s, end, tok, next,
> > nextPtr,
> > +-                  (XML_Bool)! parser->m_parsingStatus.finalBuffer,
> > XML_TRUE);
> > ++                  (XML_Bool)! parser->m_parsingStatus.finalBuffer,
> > XML_TRUE,
> > ++                  XML_ACCOUNT_DIRECT);
> > + }
> > +
> > + static enum XML_Error
> > + doProlog(XML_Parser parser, const ENCODING *enc, const char *s,
> > const
> > char *end,
> > +          int tok, const char *next, const char **nextPtr, XML_Bool
> > haveMore,
> > +-         XML_Bool allowClosingDoctype) {
> > ++         XML_Bool allowClosingDoctype, enum XML_Account account) {
> > + #ifdef XML_DTD
> > +   static const XML_Char externalSubsetName[] =3D {ASCII_HASH, '\0'};
> > + #endif /* XML_DTD */
> > +@@ -4125,6 +4327,10 @@ doProlog(XML_Parser parser, const ENCODING
> > *enc, const char *s, const char *end,
> > +   static const XML_Char enumValueSep[] =3D {ASCII_PIPE, '\0'};
> > +   static const XML_Char enumValueStart[] =3D {ASCII_LPAREN, '\0'};
> > +
> > ++#ifndef XML_DTD
> > ++  UNUSED_P(account);
> > ++#endif
> > ++
> > +   /* save one level of indirection */
> > +   DTD *const dtd =3D parser->m_dtd;
> > +
> > +@@ -4189,6 +4395,19 @@ doProlog(XML_Parser parser, const ENCODING
> > *enc, const char *s, const char *end,
> > +       }
> > +     }
> > +     role =3D XmlTokenRole(&parser->m_prologState, tok, s, next, enc)=
;
> > ++#ifdef XML_DTD
> > ++    switch (role) {
> > ++    case XML_ROLE_INSTANCE_START: // bytes accounted in
> > contentProcessor
> > ++    case XML_ROLE_XML_DECL:       // bytes accounted in
> > processXmlDecl
> > ++    case XML_ROLE_TEXT_DECL:      // bytes accounted in
> > processXmlDecl
> > ++      break;
> > ++    default:
> > ++      if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
> > account)) {
> > ++        accountingOnAbort(parser);
> > ++        return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
> > ++      }
> > ++    }
> > ++#endif
> > +     switch (role) {
> > +     case XML_ROLE_XML_DECL: {
> > +       enum XML_Error result =3D processXmlDecl(parser, 0, s, next);
> > +@@ -4464,7 +4683,8 @@ doProlog(XML_Parser parser, const ENCODING
> > *enc,
> > const char *s, const char *end,
> > +         const XML_Char *attVal;
> > +         enum XML_Error result =3D storeAttributeValue(
> > +             parser, enc, parser->m_declAttributeIsCdata,
> > +-            s + enc->minBytesPerChar, next - enc->minBytesPerChar,
> > &dtd->pool);
> > ++            s + enc->minBytesPerChar, next - enc->minBytesPerChar,
> > &dtd->pool,
> > ++            XML_ACCOUNT_NONE);
> > +         if (result)
> > +           return result;
> > +         attVal =3D poolStart(&dtd->pool);
> > +@@ -4497,8 +4717,9 @@ doProlog(XML_Parser parser, const ENCODING
> > *enc,
> > const char *s, const char *end,
> > +       break;
> > +     case XML_ROLE_ENTITY_VALUE:
> > +       if (dtd->keepProcessing) {
> > +-        enum XML_Error result =3D storeEntityValue(
> > +-            parser, enc, s + enc->minBytesPerChar, next - enc-
> > > minBytesPerChar);
> > ++        enum XML_Error result
> > ++            =3D storeEntityValue(parser, enc, s + enc-
> > >minBytesPerChar,
> > ++                               next - enc->minBytesPerChar,
> > XML_ACCOUNT_NONE);
> > +         if (parser->m_declEntity) {
> > +           parser->m_declEntity->textPtr =3D poolStart(&dtd-
> > > entityValuePool);
> > +           parser->m_declEntity->textLen
> > +@@ -4888,12 +5109,15 @@ doProlog(XML_Parser parser, const ENCODING
> > *enc, const char *s, const char *end,
> > +         if (parser->m_externalEntityRefHandler) {
> > +           dtd->paramEntityRead =3D XML_FALSE;
> > +           entity->open =3D XML_TRUE;
> > ++          entityTrackingOnOpen(parser, entity, __LINE__);
> > +           if (! parser->m_externalEntityRefHandler(
> > +                   parser->m_externalEntityRefHandlerArg, 0, entity-
> > > base,
> > +                   entity->systemId, entity->publicId)) {
> > ++            entityTrackingOnClose(parser, entity, __LINE__);
> > +             entity->open =3D XML_FALSE;
> > +             return XML_ERROR_EXTERNAL_ENTITY_HANDLING;
> > +           }
> > ++          entityTrackingOnClose(parser, entity, __LINE__);
> > +           entity->open =3D XML_FALSE;
> > +           handleDefault =3D XML_FALSE;
> > +           if (! dtd->paramEntityRead) {
> > +@@ -5091,6 +5315,13 @@ epilogProcessor(XML_Parser parser, const char
> > *s, const char *end,
> > +   for (;;) {
> > +     const char *next =3D NULL;
> > +     int tok =3D XmlPrologTok(parser->m_encoding, s, end, &next);
> > ++#ifdef XML_DTD
> > ++    if (! accountingDiffTolerated(parser, tok, s, next, __LINE__,
> > ++                                  XML_ACCOUNT_DIRECT)) {
> > ++      accountingOnAbort(parser);
> > ++      return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
> > ++    }
> > ++#endif
> > +     parser->m_eventEndPtr =3D next;
> > +     switch (tok) {
> > +     /* report partial linebreak - it might be the last token */
> > +@@ -5164,6 +5395,9 @@ processInternalEntity(XML_Parser parser,
> > ENTITY
> > *entity, XML_Bool betweenDecl) {
> > +       return XML_ERROR_NO_MEMORY;
> > +   }
> > +   entity->open =3D XML_TRUE;
> > ++#ifdef XML_DTD
> > ++  entityTrackingOnOpen(parser, entity, __LINE__);
> > ++#endif
> > +   entity->processed =3D 0;
> > +   openEntity->next =3D parser->m_openInternalEntities;
> > +   parser->m_openInternalEntities =3D openEntity;
> > +@@ -5182,17 +5416,22 @@ processInternalEntity(XML_Parser parser,
> > ENTITY *entity, XML_Bool betweenDecl) {
> > +     int tok
> > +         =3D XmlPrologTok(parser->m_internalEncoding, textStart,
> > textEnd, &next);
> > +     result =3D doProlog(parser, parser->m_internalEncoding,
> > textStart,
> > textEnd,
> > +-                      tok, next, &next, XML_FALSE, XML_FALSE);
> > ++                      tok, next, &next, XML_FALSE, XML_FALSE,
> > ++                      XML_ACCOUNT_ENTITY_EXPANSION);
> > +   } else
> > + #endif /* XML_DTD */
> > +     result =3D doContent(parser, parser->m_tagLevel, parser-
> > > m_internalEncoding,
> > +-                       textStart, textEnd, &next, XML_FALSE);
> > ++                       textStart, textEnd, &next, XML_FALSE,
> > ++                       XML_ACCOUNT_ENTITY_EXPANSION);
> > +
> > +   if (result =3D=3D XML_ERROR_NONE) {
> > +     if (textEnd !=3D next && parser->m_parsingStatus.parsing =3D=3D
> > XML_SUSPENDED) {
> > +       entity->processed =3D (int)(next - textStart);
> > +       parser->m_processor =3D internalEntityProcessor;
> > +     } else {
> > ++#ifdef XML_DTD
> > ++      entityTrackingOnClose(parser, entity, __LINE__);
> > ++#endif /* XML_DTD */
> > +       entity->open =3D XML_FALSE;
> > +       parser->m_openInternalEntities =3D openEntity->next;
> > +       /* put openEntity back in list of free instances */
> > +@@ -5225,12 +5464,13 @@ internalEntityProcessor(XML_Parser parser,
> > const char *s, const char *end,
> > +     int tok
> > +         =3D XmlPrologTok(parser->m_internalEncoding, textStart,
> > textEnd, &next);
> > +     result =3D doProlog(parser, parser->m_internalEncoding,
> > textStart,
> > textEnd,
> > +-                      tok, next, &next, XML_FALSE, XML_TRUE);
> > ++                      tok, next, &next, XML_FALSE, XML_TRUE,
> > ++                      XML_ACCOUNT_ENTITY_EXPANSION);
> > +   } else
> > + #endif /* XML_DTD */
> > +     result =3D doContent(parser, openEntity->startTagLevel,
> > +                        parser->m_internalEncoding, textStart,
> > textEnd, &next,
> > +-                       XML_FALSE);
> > ++                       XML_FALSE, XML_ACCOUNT_ENTITY_EXPANSION);
> > +
> > +   if (result !=3D XML_ERROR_NONE)
> > +     return result;
> > +@@ -5239,6 +5479,9 @@ internalEntityProcessor(XML_Parser parser,
> > const
> > char *s, const char *end,
> > +     entity->processed =3D (int)(next - (char *)entity->textPtr);
> > +     return result;
> > +   } else {
> > ++#ifdef XML_DTD
> > ++    entityTrackingOnClose(parser, entity, __LINE__);
> > ++#endif
> > +     entity->open =3D XML_FALSE;
> > +     parser->m_openInternalEntities =3D openEntity->next;
> > +     /* put openEntity back in list of free instances */
> > +@@ -5252,7 +5495,8 @@ internalEntityProcessor(XML_Parser parser,
> > const
> > char *s, const char *end,
> > +     parser->m_processor =3D prologProcessor;
> > +     tok =3D XmlPrologTok(parser->m_encoding, s, end, &next);
> > +     return doProlog(parser, parser->m_encoding, s, end, tok, next,
> > nextPtr,
> > +-                    (XML_Bool)! parser-
> > >m_parsingStatus.finalBuffer,
> > XML_TRUE);
> > ++                    (XML_Bool)! parser-
> > >m_parsingStatus.finalBuffer,
> > XML_TRUE,
> > ++                    XML_ACCOUNT_DIRECT);
> > +   } else
> > + #endif /* XML_DTD */
> > +   {
> > +@@ -5260,7 +5504,8 @@ internalEntityProcessor(XML_Parser parser,
> > const
> > char *s, const char *end,
> > +     /* see externalEntityContentProcessor vs contentProcessor */
> > +     return doContent(parser, parser->m_parentParser ? 1 : 0,
> > parser-
> > > m_encoding,
> > +                      s, end, nextPtr,
> > +-                     (XML_Bool)! parser-
> > > m_parsingStatus.finalBuffer);
> > ++                     (XML_Bool)! parser-
> > >m_parsingStatus.finalBuffer,
> > ++                     XML_ACCOUNT_DIRECT);
> > +   }
> > + }
> > +
> > +@@ -5275,9 +5520,10 @@ errorProcessor(XML_Parser parser, const char
> > *s, const char *end,
> > +
> > + static enum XML_Error
> > + storeAttributeValue(XML_Parser parser, const ENCODING *enc,
> > XML_Bool
> > isCdata,
> > +-                    const char *ptr, const char *end, STRING_POOL
> > *pool) {
> > ++                    const char *ptr, const char *end, STRING_POOL
> > *pool,
> > ++                    enum XML_Account account) {
> > +   enum XML_Error result
> > +-      =3D appendAttributeValue(parser, enc, isCdata, ptr, end, pool)=
;
> > ++      =3D appendAttributeValue(parser, enc, isCdata, ptr, end, pool,
> > account);
> > +   if (result)
> > +     return result;
> > +   if (! isCdata && poolLength(pool) && poolLastChar(pool) =3D=3D 0x2=
0)
> > +@@ -5289,11 +5535,22 @@ storeAttributeValue(XML_Parser parser, const
> > ENCODING *enc, XML_Bool isCdata,
> > +
> > + static enum XML_Error
> > + appendAttributeValue(XML_Parser parser, const ENCODING *enc,
> > XML_Bool
> > isCdata,
> > +-                     const char *ptr, const char *end, STRING_POOL
> > *pool) {
> > ++                     const char *ptr, const char *end, STRING_POOL
> > *pool,
> > ++                     enum XML_Account account) {
> > +   DTD *const dtd =3D parser->m_dtd; /* save one level of indirection
> > */
> > ++#ifndef XML_DTD
> > ++  UNUSED_P(account);
> > ++#endif
> > ++
> > +   for (;;) {
> > +     const char *next;
> > +     int tok =3D XmlAttributeValueTok(enc, ptr, end, &next);
> > ++#ifdef XML_DTD
> > ++    if (! accountingDiffTolerated(parser, tok, ptr, next, __LINE__,
> > account)) {
> > ++      accountingOnAbort(parser);
> > ++      return XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
> > ++    }
> > ++#endif
> > +     switch (tok) {
> > +     case XML_TOK_NONE:
> > +       return XML_ERROR_NONE;
> > +@@ -5353,6 +5610,14 @@ appendAttributeValue(XML_Parser parser, const
> > ENCODING *enc, XML_Bool isCdata,
> > +       XML_Char ch =3D (XML_Char)XmlPredefinedEntityName(
> > +           enc, ptr + enc->minBytesPerChar, next - enc-
> > > minBytesPerChar);
> > +       if (ch) {
> > ++#ifdef XML_DTD
> > ++        /* NOTE: We are replacing 4-6 characters original input for
> > 1
> > character
> > ++         *       so there is no amplification and hence recording
> > without
> > ++         *       protection. */
> > ++        accountingDiffTolerated(parser, tok, (char *)&ch,
> > ++                                ((char *)&ch) + sizeof(XML_Char),
> > __LINE__,
> > ++                                XML_ACCOUNT_ENTITY_EXPANSION);
> > ++#endif /* XML_DTD */
> > +         if (! poolAppendChar(pool, ch))
> > +           return XML_ERROR_NO_MEMORY;
> > +         break;
> > +@@ -5430,9 +5695,16 @@ appendAttributeValue(XML_Parser parser, const
> > ENCODING *enc, XML_Bool isCdata,
> > +         enum XML_Error result;
> > +         const XML_Char *textEnd =3D entity->textPtr + entity-
> > >textLen;
> > +         entity->open =3D XML_TRUE;
> > ++#ifdef XML_DTD
> > ++        entityTrackingOnOpen(parser, entity, __LINE__);
> > ++#endif
> > +         result =3D appendAttributeValue(parser, parser-
> > > m_internalEncoding,
> > +-                                      isCdata, (char *)entity-
> > > textPtr,
> > +-                                      (char *)textEnd, pool);
> > ++                                      isCdata, (const char
> > *)entity-
> > > textPtr,
> > ++                                      (const char *)textEnd, pool,
> > ++
> > XML_ACCOUNT_ENTITY_EXPANSION);
> > ++#ifdef XML_DTD
> > ++        entityTrackingOnClose(parser, entity, __LINE__);
> > ++#endif
> > +         entity->open =3D XML_FALSE;
> > +         if (result)
> > +           return result;
> > +@@ -5462,13 +5734,16 @@ appendAttributeValue(XML_Parser parser,
> > const
> > ENCODING *enc, XML_Bool isCdata,
> > +
> > + static enum XML_Error
> > + storeEntityValue(XML_Parser parser, const ENCODING *enc,
> > +-                 const char *entityTextPtr, const char
> > *entityTextEnd) {
> > ++                 const char *entityTextPtr, const char
> > *entityTextEnd,
> > ++                 enum XML_Account account) {
> > +   DTD *const dtd =3D parser->m_dtd; /* save one level of indirection
> > */
> > +   STRING_POOL *pool =3D &(dtd->entityValuePool);
> > +   enum XML_Error result =3D XML_ERROR_NONE;
> > + #ifdef XML_DTD
> > +   int oldInEntityValue =3D parser->m_prologState.inEntityValue;
> > +   parser->m_prologState.inEntityValue =3D 1;
> > ++#else
> > ++  UNUSED_P(account);
> > + #endif /* XML_DTD */
> > +   /* never return Null for the value argument in EntityDeclHandler,
> > +      since this would indicate an external entity; therefore we
> > +@@ -5481,6 +5756,16 @@ storeEntityValue(XML_Parser parser, const
> > ENCODING *enc,
> > +   for (;;) {
> > +     const char *next;
> > +     int tok =3D XmlEntityValueTok(enc, entityTextPtr, entityTextEnd,
> > &next);
> > ++
> > ++#ifdef XML_DTD
> > ++    if (! accountingDiffTolerated(parser, tok, entityTextPtr, next,
> > __LINE__,
> > ++                                  account)) {
> > ++      accountingOnAbort(parser);
> > ++      result =3D XML_ERROR_AMPLIFICATION_LIMIT_BREACH;
> > ++      goto endEntityValue;
> > ++    }
> > ++#endif
> > ++
> > +     switch (tok) {
> > +     case XML_TOK_PARAM_ENTITY_REF:
> > + #ifdef XML_DTD
> > +@@ -5516,13 +5801,16 @@ storeEntityValue(XML_Parser parser, const
> > ENCODING *enc,
> > +           if (parser->m_externalEntityRefHandler) {
> > +             dtd->paramEntityRead =3D XML_FALSE;
> > +             entity->open =3D XML_TRUE;
> > ++            entityTrackingOnOpen(parser, entity, __LINE__);
> > +             if (! parser->m_externalEntityRefHandler(
> > +                     parser->m_externalEntityRefHandlerArg, 0,
> > entity-
> > > base,
> > +                     entity->systemId, entity->publicId)) {
> > ++              entityTrackingOnClose(parser, entity, __LINE__);
> > +               entity->open =3D XML_FALSE;
> > +               result =3D XML_ERROR_EXTERNAL_ENTITY_HANDLING;
> > +               goto endEntityValue;
> > +             }
> > ++            entityTrackingOnClose(parser, entity, __LINE__);
> > +             entity->open =3D XML_FALSE;
> > +             if (! dtd->paramEntityRead)
> > +               dtd->keepProcessing =3D dtd->standalone;
> > +@@ -5530,9 +5818,12 @@ storeEntityValue(XML_Parser parser, const
> > ENCODING *enc,
> > +             dtd->keepProcessing =3D dtd->standalone;
> > +         } else {
> > +           entity->open =3D XML_TRUE;
> > ++          entityTrackingOnOpen(parser, entity, __LINE__);
> > +           result =3D storeEntityValue(
> > +-              parser, parser->m_internalEncoding, (char *)entity-
> > > textPtr,
> > +-              (char *)(entity->textPtr + entity->textLen));
> > ++              parser, parser->m_internalEncoding, (const char
> > *)entity->textPtr,
> > ++              (const char *)(entity->textPtr + entity->textLen),
> > ++              XML_ACCOUNT_ENTITY_EXPANSION);
> > ++          entityTrackingOnClose(parser, entity, __LINE__);
> > +           entity->open =3D XML_FALSE;
> > +           if (result)
> > +             goto endEntityValue;
> > +@@ -6893,3 +7184,741 @@ copyString(const XML_Char *s, const
> > XML_Memory_Handling_Suite *memsuite) {
> > +   memcpy(result, s, charsRequired * sizeof(XML_Char));
> > +   return result;
> > + }
> > ++
> > ++#ifdef XML_DTD
> > ++
> > ++static float
> > ++accountingGetCurrentAmplification(XML_Parser rootParser) {
> > ++  const XmlBigCount countBytesOutput
> > ++      =3D rootParser->m_accounting.countBytesDirect
> > ++        + rootParser->m_accounting.countBytesIndirect;
> > ++  const float amplificationFactor
> > ++      =3D rootParser->m_accounting.countBytesDirect
> > ++            ? (countBytesOutput
> > ++               / (float)(rootParser-
> > >m_accounting.countBytesDirect))
> > ++            : 1.0f;
> > ++  assert(! rootParser->m_parentParser);
> > ++  return amplificationFactor;
> > ++}
> > ++
> > ++static void
> > ++accountingReportStats(XML_Parser originParser, const char *epilog)
> > {
> > ++  const XML_Parser rootParser =3D getRootParserOf(originParser,
> > NULL);
> > ++  assert(! rootParser->m_parentParser);
> > ++
> > ++  if (rootParser->m_accounting.debugLevel < 1) {
> > ++    return;
> > ++  }
> > ++
> > ++  const float amplificationFactor
> > ++      =3D accountingGetCurrentAmplification(rootParser);
> > ++  fprintf(stderr,
> > ++          "expat: Accounting(%p): Direct " EXPAT_FMT_ULL(
> > ++              "10") ", indirect " EXPAT_FMT_ULL("10") ",
> > amplification %8.2f%s",
> > ++          (void *)rootParser, rootParser-
> > > m_accounting.countBytesDirect,
> > ++          rootParser->m_accounting.countBytesIndirect,
> > ++          (double)amplificationFactor, epilog);
> > ++}
> > ++
> > ++static void
> > ++accountingOnAbort(XML_Parser originParser) {
> > ++  accountingReportStats(originParser, " ABORTING\n");
> > ++}
> > ++
> > ++static void
> > ++accountingReportDiff(XML_Parser rootParser,
> > ++                     unsigned int levelsAwayFromRootParser, const
> > char *before,
> > ++                     const char *after, ptrdiff_t bytesMore, int
> > source_line,
> > ++                     enum XML_Account account) {
> > ++  assert(! rootParser->m_parentParser);
> > ++
> > ++  fprintf(stderr,
> > ++          " (+" EXPAT_FMT_PTRDIFF_T("6") " bytes %s|%d,
> > xmlparse.c:%d) %*s\"",
> > ++          bytesMore, (account =3D=3D XML_ACCOUNT_DIRECT) ? "DIR" :
> > "EXP",
> > ++          levelsAwayFromRootParser, source_line, 10, "");
> > ++
> > ++  const char ellipis[] =3D "[..]";
> > ++  const size_t ellipsisLength =3D sizeof(ellipis) /* because compile=
-
> > time */ - 1;
> > ++  const unsigned int contextLength =3D 10;
> > ++
> > ++  /* Note: Performance is of no concern here */
> > ++  const char *walker =3D before;
> > ++  if ((rootParser->m_accounting.debugLevel >=3D 3)
> > ++      || (after - before)
> > ++             <=3D (ptrdiff_t)(contextLength + ellipsisLength +
> > contextLength)) {
> > ++    for (; walker < after; walker++) {
> > ++      fprintf(stderr, "%s", unsignedCharToPrintable(walker[0]));
> > ++    }
> > ++  } else {
> > ++    for (; walker < before + contextLength; walker++) {
> > ++      fprintf(stderr, "%s", unsignedCharToPrintable(walker[0]));
> > ++    }
> > ++    fprintf(stderr, ellipis);
> > ++    walker =3D after - contextLength;
> > ++    for (; walker < after; walker++) {
> > ++      fprintf(stderr, "%s", unsignedCharToPrintable(walker[0]));
> > ++    }
> > ++  }
> > ++  fprintf(stderr, "\"\n");
> > ++}
> > ++
> > ++static XML_Bool
> > ++accountingDiffTolerated(XML_Parser originParser, int tok, const
> > char
> > *before,
> > ++                        const char *after, int source_line,
> > ++                        enum XML_Account account) {
> > ++  /* Note: We need to check the token type *first* to be sure that
> > ++   *       we can even access variable <after>, safely.
> > ++   *       E.g. for XML_TOK_NONE <after> may hold an invalid
> > pointer.
> > */
> > ++  switch (tok) {
> > ++  case XML_TOK_INVALID:
> > ++  case XML_TOK_PARTIAL:
> > ++  case XML_TOK_PARTIAL_CHAR:
> > ++  case XML_TOK_NONE:
> > ++    return XML_TRUE;
> > ++  }
> > ++
> > ++  if (account =3D=3D XML_ACCOUNT_NONE)
> > ++    return XML_TRUE; /* because these bytes have been accounted
> > for,
> > already */
> > ++
> > ++  unsigned int levelsAwayFromRootParser;
> > ++  const XML_Parser rootParser
> > ++      =3D getRootParserOf(originParser, &levelsAwayFromRootParser);
> > ++  assert(! rootParser->m_parentParser);
> > ++
> > ++  const int isDirect
> > ++      =3D (account =3D=3D XML_ACCOUNT_DIRECT) && (originParser =3D=
=3D
> > rootParser);
> > ++  const ptrdiff_t bytesMore =3D after - before;
> > ++
> > ++  XmlBigCount *const additionTarget
> > ++      =3D isDirect ? &rootParser->m_accounting.countBytesDirect
> > ++                 : &rootParser->m_accounting.countBytesIndirect;
> > ++
> > ++  /* Detect and avoid integer overflow */
> > ++  if (*additionTarget > (XmlBigCount)(-1) - (XmlBigCount)bytesMore)
> > ++    return XML_FALSE;
> > ++  *additionTarget +=3D bytesMore;
> > ++
> > ++  const XmlBigCount countBytesOutput
> > ++      =3D rootParser->m_accounting.countBytesDirect
> > ++        + rootParser->m_accounting.countBytesIndirect;
> > ++  const float amplificationFactor
> > ++      =3D accountingGetCurrentAmplification(rootParser);
> > ++  const XML_Bool tolerated
> > ++      =3D (countBytesOutput < rootParser-
> > > m_accounting.activationThresholdBytes)
> > ++        || (amplificationFactor
> > ++            <=3D rootParser-
> > >m_accounting.maximumAmplificationFactor);
> > ++
> > ++  if (rootParser->m_accounting.debugLevel >=3D 2) {
> > ++    accountingReportStats(rootParser, "");
> > ++    accountingReportDiff(rootParser, levelsAwayFromRootParser,
> > before, after,
> > ++                         bytesMore, source_line, account);
> > ++  }
> > ++
> > ++  return tolerated;
> > ++}
> > ++
> > ++static void
> > ++entityTrackingReportStats(XML_Parser rootParser, ENTITY *entity,
> > ++                          const char *action, int sourceLine) {
> > ++  assert(! rootParser->m_parentParser);
> > ++  if (rootParser->m_entity_stats.debugLevel < 1)
> > ++    return;
> > ++
> > ++#  if defined(XML_UNICODE)
> > ++  const char *const entityName =3D "[..]";
> > ++#  else
> > ++  const char *const entityName =3D entity->name;
> > ++#  endif
> > ++
> > ++  fprintf(
> > ++      stderr,
> > ++      "expat: Entities(%p): Count %9d, depth %2d/%2d %*s%s%s; %s
> > length %d (xmlparse.c:%d)\n",
> > ++      (void *)rootParser, rootParser-
> > >m_entity_stats.countEverOpened,
> > ++      rootParser->m_entity_stats.currentDepth,
> > ++      rootParser->m_entity_stats.maximumDepthSeen,
> > ++      (rootParser->m_entity_stats.currentDepth - 1) * 2, "",
> > ++      entity->is_param ? "%" : "&", entityName, action, entity-
> > > textLen,
> > ++      sourceLine);
> > ++}
> > ++
> > ++static void
> > ++entityTrackingOnOpen(XML_Parser originParser, ENTITY *entity, int
> > sourceLine) {
> > ++  const XML_Parser rootParser =3D getRootParserOf(originParser,
> > NULL);
> > ++  assert(! rootParser->m_parentParser);
> > ++
> > ++  rootParser->m_entity_stats.countEverOpened++;
> > ++  rootParser->m_entity_stats.currentDepth++;
> > ++  if (rootParser->m_entity_stats.currentDepth
> > ++      > rootParser->m_entity_stats.maximumDepthSeen) {
> > ++    rootParser->m_entity_stats.maximumDepthSeen++;
> > ++  }
> > ++
> > ++  entityTrackingReportStats(rootParser, entity, "OPEN ",
> > sourceLine);
> > ++}
> > ++
> > ++static void
> > ++entityTrackingOnClose(XML_Parser originParser, ENTITY *entity, int
> > sourceLine) {
> > ++  const XML_Parser rootParser =3D getRootParserOf(originParser,
> > NULL);
> > ++  assert(! rootParser->m_parentParser);
> > ++
> > ++  entityTrackingReportStats(rootParser, entity, "CLOSE",
> > sourceLine);
> > ++  rootParser->m_entity_stats.currentDepth--;
> > ++}
> > ++
> > ++static XML_Parser
> > ++getRootParserOf(XML_Parser parser, unsigned int *outLevelDiff) {
> > ++  XML_Parser rootParser =3D parser;
> > ++  unsigned int stepsTakenUpwards =3D 0;
> > ++  while (rootParser->m_parentParser) {
> > ++    rootParser =3D rootParser->m_parentParser;
> > ++    stepsTakenUpwards++;
> > ++  }
> > ++  assert(! rootParser->m_parentParser);
> > ++  if (outLevelDiff !=3D NULL) {
> > ++    *outLevelDiff =3D stepsTakenUpwards;
> > ++  }
> > ++  return rootParser;
> > ++}
> > ++
> > ++static const char *
> > ++unsignedCharToPrintable(unsigned char c) {
> > ++  switch (c) {
> > ++  case 0:
> > ++    return "\\0";
> > ++  case 1:
> > ++    return "\\x1";
> > ++  case 2:
> > ++    return "\\x2";
> > ++  case 3:
> > ++    return "\\x3";
> > ++  case 4:
> > ++    return "\\x4";
> > ++  case 5:
> > ++    return "\\x5";
> > ++  case 6:
> > ++    return "\\x6";
> > ++  case 7:
> > ++    return "\\x7";
> > ++  case 8:
> > ++    return "\\x8";
> > ++  case 9:
> > ++    return "\\t";
> > ++  case 10:
> > ++    return "\\n";
> > ++  case 11:
> > ++    return "\\xB";
> > ++  case 12:
> > ++    return "\\xC";
> > ++  case 13:
> > ++    return "\\r";
> > ++  case 14:
> > ++    return "\\xE";
> > ++  case 15:
> > ++    return "\\xF";
> > ++  case 16:
> > ++    return "\\x10";
> > ++  case 17:
> > ++    return "\\x11";
> > ++  case 18:
> > ++    return "\\x12";
> > ++  case 19:
> > ++    return "\\x13";
> > ++  case 20:
> > ++    return "\\x14";
> > ++  case 21:
> > ++    return "\\x15";
> > ++  case 22:
> > ++    return "\\x16";
> > ++  case 23:
> > ++    return "\\x17";
> > ++  case 24:
> > ++    return "\\x18";
> > ++  case 25:
> > ++    return "\\x19";
> > ++  case 26:
> > ++    return "\\x1A";
> > ++  case 27:
> > ++    return "\\x1B";
> > ++  case 28:
> > ++    return "\\x1C";
> > ++  case 29:
> > ++    return "\\x1D";
> > ++  case 30:
> > ++    return "\\x1E";
> > ++  case 31:
> > ++    return "\\x1F";
> > ++  case 32:
> > ++    return " ";
> > ++  case 33:
> > ++    return "!";
> > ++  case 34:
> > ++    return "\\\"";
> > ++  case 35:
> > ++    return "#";
> > ++  case 36:
> > ++    return "$";
> > ++  case 37:
> > ++    return "%";
> > ++  case 38:
> > ++    return "&";
> > ++  case 39:
> > ++    return "'";
> > ++  case 40:
> > ++    return "(";
> > ++  case 41:
> > ++    return ")";
> > ++  case 42:
> > ++    return "*";
> > ++  case 43:
> > ++    return "+";
> > ++  case 44:
> > ++    return ",";
> > ++  case 45:
> > ++    return "-";
> > ++  case 46:
> > ++    return ".";
> > ++  case 47:
> > ++    return "/";
> > ++  case 48:
> > ++    return "0";
> > ++  case 49:
> > ++    return "1";
> > ++  case 50:
> > ++    return "2";
> > ++  case 51:
> > ++    return "3";
> > ++  case 52:
> > ++    return "4";
> > ++  case 53:
> > ++    return "5";
> > ++  case 54:
> > ++    return "6";
> > ++  case 55:
> > ++    return "7";
> > ++  case 56:
> > ++    return "8";
> > ++  case 57:
> > ++    return "9";
> > ++  case 58:
> > ++    return ":";
> > ++  case 59:
> > ++    return ";";
> > ++  case 60:
> > ++    return "<";
> > ++  case 61:
> > ++    return "=3D";
> > ++  case 62:
> > ++    return ">";
> > ++  case 63:
> > ++    return "?";
> > ++  case 64:
> > ++    return "@";
> > ++  case 65:
> > ++    return "A";
> > ++  case 66:
> > ++    return "B";
> > ++  case 67:
> > ++    return "C";
> > ++  case 68:
> > ++    return "D";
> > ++  case 69:
> > ++    return "E";
> > ++  case 70:
> > ++    return "F";
> > ++  case 71:
> > ++    return "G";
> > ++  case 72:
> > ++    return "H";
> > ++  case 73:
> > ++    return "I";
> > ++  case 74:
> > ++    return "J";
> > ++  case 75:
> > ++    return "K";
> > ++  case 76:
> > ++    return "L";
> > ++  case 77:
> > ++    return "M";
> > ++  case 78:
> > ++    return "N";
> > ++  case 79:
> > ++    return "O";
> > ++  case 80:
> > ++    return "P";
> > ++  case 81:
> > ++    return "Q";
> > ++  case 82:
> > ++    return "R";
> > ++  case 83:
> > ++    return "S";
> > ++  case 84:
> > ++    return "T";
> > ++  case 85:
> > ++    return "U";
> > ++  case 86:
> > ++    return "V";
> > ++  case 87:
> > ++    return "W";
> > ++  case 88:
> > ++    return "X";
> > ++  case 89:
> > ++    return "Y";
> > ++  case 90:
> > ++    return "Z";
> > ++  case 91:
> > ++    return "[";
> > ++  case 92:
> > ++    return "\\\\";
> > ++  case 93:
> > ++    return "]";
> > ++  case 94:
> > ++    return "^";
> > ++  case 95:
> > ++    return "_";
> > ++  case 96:
> > ++    return "`";
> > ++  case 97:
> > ++    return "a";
> > ++  case 98:
> > ++    return "b";
> > ++  case 99:
> > ++    return "c";
> > ++  case 100:
> > ++    return "d";
> > ++  case 101:
> > ++    return "e";
> > ++  case 102:
> > ++    return "f";
> > ++  case 103:
> > ++    return "g";
> > ++  case 104:
> > ++    return "h";
> > ++  case 105:
> > ++    return "i";
> > ++  case 106:
> > ++    return "j";
> > ++  case 107:
> > ++    return "k";
> > ++  case 108:
> > ++    return "l";
> > ++  case 109:
> > ++    return "m";
> > ++  case 110:
> > ++    return "n";
> > ++  case 111:
> > ++    return "o";
> > ++  case 112:
> > ++    return "p";
> > ++  case 113:
> > ++    return "q";
> > ++  case 114:
> > ++    return "r";
> > ++  case 115:
> > ++    return "s";
> > ++  case 116:
> > ++    return "t";
> > ++  case 117:
> > ++    return "u";
> > ++  case 118:
> > ++    return "v";
> > ++  case 119:
> > ++    return "w";
> > ++  case 120:
> > ++    return "x";
> > ++  case 121:
> > ++    return "y";
> > ++  case 122:
> > ++    return "z";
> > ++  case 123:
> > ++    return "{";
> > ++  case 124:
> > ++    return "|";
> > ++  case 125:
> > ++    return "}";
> > ++  case 126:
> > ++    return "~";
> > ++  case 127:
> > ++    return "\\x7F";
> > ++  case 128:
> > ++    return "\\x80";
> > ++  case 129:
> > ++    return "\\x81";
> > ++  case 130:
> > ++    return "\\x82";
> > ++  case 131:
> > ++    return "\\x83";
> > ++  case 132:
> > ++    return "\\x84";
> > ++  case 133:
> > ++    return "\\x85";
> > ++  case 134:
> > ++    return "\\x86";
> > ++  case 135:
> > ++    return "\\x87";
> > ++  case 136:
> > ++    return "\\x88";
> > ++  case 137:
> > ++    return "\\x89";
> > ++  case 138:
> > ++    return "\\x8A";
> > ++  case 139:
> > ++    return "\\x8B";
> > ++  case 140:
> > ++    return "\\x8C";
> > ++  case 141:
> > ++    return "\\x8D";
> > ++  case 142:
> > ++    return "\\x8E";
> > ++  case 143:
> > ++    return "\\x8F";
> > ++  case 144:
> > ++    return "\\x90";
> > ++  case 145:
> > ++    return "\\x91";
> > ++  case 146:
> > ++    return "\\x92";
> > ++  case 147:
> > ++    return "\\x93";
> > ++  case 148:
> > ++    return "\\x94";
> > ++  case 149:
> > ++    return "\\x95";
> > ++  case 150:
> > ++    return "\\x96";
> > ++  case 151:
> > ++    return "\\x97";
> > ++  case 152:
> > ++    return "\\x98";
> > ++  case 153:
> > ++    return "\\x99";
> > ++  case 154:
> > ++    return "\\x9A";
> > ++  case 155:
> > ++    return "\\x9B";
> > ++  case 156:
> > ++    return "\\x9C";
> > ++  case 157:
> > ++    return "\\x9D";
> > ++  case 158:
> > ++    return "\\x9E";
> > ++  case 159:
> > ++    return "\\x9F";
> > ++  case 160:
> > ++    return "\\xA0";
> > ++  case 161:
> > ++    return "\\xA1";
> > ++  case 162:
> > ++    return "\\xA2";
> > ++  case 163:
> > ++    return "\\xA3";
> > ++  case 164:
> > ++    return "\\xA4";
> > ++  case 165:
> > ++    return "\\xA5";
> > ++  case 166:
> > ++    return "\\xA6";
> > ++  case 167:
> > ++    return "\\xA7";
> > ++  case 168:
> > ++    return "\\xA8";
> > ++  case 169:
> > ++    return "\\xA9";
> > ++  case 170:
> > ++    return "\\xAA";
> > ++  case 171:
> > ++    return "\\xAB";
> > ++  case 172:
> > ++    return "\\xAC";
> > ++  case 173:
> > ++    return "\\xAD";
> > ++  case 174:
> > ++    return "\\xAE";
> > ++  case 175:
> > ++    return "\\xAF";
> > ++  case 176:
> > ++    return "\\xB0";
> > ++  case 177:
> > ++    return "\\xB1";
> > ++  case 178:
> > ++    return "\\xB2";
> > ++  case 179:
> > ++    return "\\xB3";
> > ++  case 180:
> > ++    return "\\xB4";
> > ++  case 181:
> > ++    return "\\xB5";
> > ++  case 182:
> > ++    return "\\xB6";
> > ++  case 183:
> > ++    return "\\xB7";
> > ++  case 184:
> > ++    return "\\xB8";
> > ++  case 185:
> > ++    return "\\xB9";
> > ++  case 186:
> > ++    return "\\xBA";
> > ++  case 187:
> > ++    return "\\xBB";
> > ++  case 188:
> > ++    return "\\xBC";
> > ++  case 189:
> > ++    return "\\xBD";
> > ++  case 190:
> > ++    return "\\xBE";
> > ++  case 191:
> > ++    return "\\xBF";
> > ++  case 192:
> > ++    return "\\xC0";
> > ++  case 193:
> > ++    return "\\xC1";
> > ++  case 194:
> > ++    return "\\xC2";
> > ++  case 195:
> > ++    return "\\xC3";
> > ++  case 196:
> > ++    return "\\xC4";
> > ++  case 197:
> > ++    return "\\xC5";
> > ++  case 198:
> > ++    return "\\xC6";
> > ++  case 199:
> > ++    return "\\xC7";
> > ++  case 200:
> > ++    return "\\xC8";
> > ++  case 201:
> > ++    return "\\xC9";
> > ++  case 202:
> > ++    return "\\xCA";
> > ++  case 203:
> > ++    return "\\xCB";
> > ++  case 204:
> > ++    return "\\xCC";
> > ++  case 205:
> > ++    return "\\xCD";
> > ++  case 206:
> > ++    return "\\xCE";
> > ++  case 207:
> > ++    return "\\xCF";
> > ++  case 208:
> > ++    return "\\xD0";
> > ++  case 209:
> > ++    return "\\xD1";
> > ++  case 210:
> > ++    return "\\xD2";
> > ++  case 211:
> > ++    return "\\xD3";
> > ++  case 212:
> > ++    return "\\xD4";
> > ++  case 213:
> > ++    return "\\xD5";
> > ++  case 214:
> > ++    return "\\xD6";
> > ++  case 215:
> > ++    return "\\xD7";
> > ++  case 216:
> > ++    return "\\xD8";
> > ++  case 217:
> > ++    return "\\xD9";
> > ++  case 218:
> > ++    return "\\xDA";
> > ++  case 219:
> > ++    return "\\xDB";
> > ++  case 220:
> > ++    return "\\xDC";
> > ++  case 221:
> > ++    return "\\xDD";
> > ++  case 222:
> > ++    return "\\xDE";
> > ++  case 223:
> > ++    return "\\xDF";
> > ++  case 224:
> > ++    return "\\xE0";
> > ++  case 225:
> > ++    return "\\xE1";
> > ++  case 226:
> > ++    return "\\xE2";
> > ++  case 227:
> > ++    return "\\xE3";
> > ++  case 228:
> > ++    return "\\xE4";
> > ++  case 229:
> > ++    return "\\xE5";
> > ++  case 230:
> > ++    return "\\xE6";
> > ++  case 231:
> > ++    return "\\xE7";
> > ++  case 232:
> > ++    return "\\xE8";
> > ++  case 233:
> > ++    return "\\xE9";
> > ++  case 234:
> > ++    return "\\xEA";
> > ++  case 235:
> > ++    return "\\xEB";
> > ++  case 236:
> > ++    return "\\xEC";
> > ++  case 237:
> > ++    return "\\xED";
> > ++  case 238:
> > ++    return "\\xEE";
> > ++  case 239:
> > ++    return "\\xEF";
> > ++  case 240:
> > ++    return "\\xF0";
> > ++  case 241:
> > ++    return "\\xF1";
> > ++  case 242:
> > ++    return "\\xF2";
> > ++  case 243:
> > ++    return "\\xF3";
> > ++  case 244:
> > ++    return "\\xF4";
> > ++  case 245:
> > ++    return "\\xF5";
> > ++  case 246:
> > ++    return "\\xF6";
> > ++  case 247:
> > ++    return "\\xF7";
> > ++  case 248:
> > ++    return "\\xF8";
> > ++  case 249:
> > ++    return "\\xF9";
> > ++  case 250:
> > ++    return "\\xFA";
> > ++  case 251:
> > ++    return "\\xFB";
> > ++  case 252:
> > ++    return "\\xFC";
> > ++  case 253:
> > ++    return "\\xFD";
> > ++  case 254:
> > ++    return "\\xFE";
> > ++  case 255:
> > ++    return "\\xFF";
> > ++  default:
> > ++    assert(0); /* never gets here */
> > ++    return "dead code";
> > ++  }
> > ++  assert(0); /* never gets here */
> > ++}
> > ++
> > ++#endif /* XML_DTD */
> > ++
> > ++static unsigned long
> > ++getDebugLevel(const char *variableName, unsigned long
> > defaultDebugLevel) {
> > ++  const char *const valueOrNull =3D getenv(variableName);
> > ++  if (valueOrNull =3D=3D NULL) {
> > ++    return defaultDebugLevel;
> > ++  }
> > ++  const char *const value =3D valueOrNull;
> > ++
> > ++  errno =3D 0;
> > ++  char *afterValue =3D (char *)value;
> > ++  unsigned long debugLevel =3D strtoul(value, &afterValue, 10);
> > ++  if ((errno !=3D 0) || (afterValue[0] !=3D '\0')) {
> > ++    errno =3D 0;
> > ++    return defaultDebugLevel;
> > ++  }
> > ++
> > ++  return debugLevel;
> > ++}
> > +--
> > +2.32.0
> > +
> > diff --git a/meta/recipes-core/expat/expat_2.2.9.bb b/meta/recipes-
> > core/expat/expat_2.2.9.bb
> > index 8f3db41352..3af457b2af 100644
> > --- a/meta/recipes-core/expat/expat_2.2.9.bb
> > +++ b/meta/recipes-core/expat/expat_2.2.9.bb
> > @@ -6,8 +6,9 @@ LICENSE =3D "MIT"
> >
> >  LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3D5b8620d98e49772d95fc1d291c26aa79"
> >
> > -SRC_URI =3D "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
> > +SRC_URI =3D "${SOURCEFORGE_MIRROR}/expat/expat-${PV}-RENAMED-
> > VULNERABLE-
> > PLEASE-USE-2.4.1-INSTEAD.tar.bz2 \
> >             file://libtool-tag.patch \
> > +           file://0001-expat-Backport-fix-for-CVE-2013-0340.patch \
> >           "
> >
> >  SRC_URI[md5sum] =3D "875a2c2ff3e8eb9e5a5cd62db2033ab5"
> >
> >
> >
> -----BEGIN PGP SIGNATURE-----
>
> iQEzBAEBCAAdFiEE4WyPMIC5Ap4+Ooo1Ygqew07VMNUFAmDKDygACgkQYgqew07V
> MNVpHAgAjxDiHJ+0Zl+xxBRKkD3E3bGlKlwsn4MOlP1HWN5zjComuAdnyQwvTmAj
> 2HRDxGUQ/ZnXUlSDbNzHSgrG2IDa1dlBWGRASRX3YxIXTJ1UL5LWHuprDL2P3xNp
> XMaAeX2a86gJKDBA7/XXkrbVuCafjGZ6r0+urvcqpJFO1FR1Qb0aklAe/pEVtEYS
> XcN2tWfqeOy9HBOvLIBfFwkRE07oBfr0eWxKzECOq1MPOUYr9k/E4LwqGEWcrOrq
> rJM2U07Esu0NkQQSPZXP+NTYO9v5ztZjCLzOb0eI7tGbduW3ay7fOlawfP8fgiON
> YVMOzcvA9DFOK7Z3ur3nCL7MWnN3OA=3D=3D
> =3DJFZY
> -----END PGP SIGNATURE-----
>
>=20
>
