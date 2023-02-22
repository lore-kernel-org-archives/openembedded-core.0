Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D10DC61DA3
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 02:07:46 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.2602.1677031656932775340
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 18:07:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=K8j/qcRu;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-536c2a1cc07so78550887b3.5
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 18:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=27V7S/ykmHc6RAJuc57f/VlObobAsMNwnaEDL2EkFyw=;
        b=K8j/qcRufku/7IAnANWDhrTCCNkEUdamnDOXTe7Zm3HMP89WOzbbXF6Wmq9xQa8oaQ
         XlMMR+VorQmQ1p5i5kQGSIlzLP25gFykef6folXsQr8XsIiRjhciuiqK6zFeSCl4Eir4
         vyomC+JhpJXEI4lKo0u1/+oXhHeCpePnNUaIMfFFUEYSta+qTNRIyUUOyt4PgVeUKg88
         3IwE1x50tgBGXOq6qY1gJScJnyJd6vWt5whuKDe5PJ59CMBnYoz7H7Y1zrqMAfmJA4rI
         ljus0GPaOPQxgOklCB+zm+MbmKqHVKbbvcIjO6WWwOJbudKyChzuYAjtSxIdQEV+s6uy
         8pag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27V7S/ykmHc6RAJuc57f/VlObobAsMNwnaEDL2EkFyw=;
        b=T5oAKfKnmLrY9FHI5sBprMGNhp3YZUS0lv9e/+yWPWY9/FxfTelbQ72o2iCSqpjPGX
         eLj543hNCXqsAFqdS2yY6m6bFVkPEc3CBNPEBj5l3fl94FFpY0EqsQbEBNIUMT5uEIRs
         3PBaGLJrmLb55A7T/g8NZiIyRTXNogjjVZFFk+ZK8igYQMmLltUP1BUdKNYpsLx1+bFq
         AxoArSwAFJVng4JJeY63Cq6/Jw5yZTNBykpOnS5TH5L93NE7833rwBkTH7uPw+Jm2GzT
         C8+N3UHEHvKUubU1Sz1PQ0rc6F+he024VJ1LtTV8IbfqdoEoeeKhmxmcLLsmt29xsSuq
         O1Aw==
X-Gm-Message-State: AO0yUKWxeLZceLZxh9xnYLwQYHBQEtEGI2jLVhKzOpnYqWhYKEuKyELl
	ScUqxeB73K0CAxj7uSEs6/ui+LO6kyCFD58vifEmTugyhao=
X-Google-Smtp-Source: AK7set+4g0a/DwAc9dr0GmtQdF5mR7Vd5lXHE3g6f1AFSjk/ABa+P2EhvI5Hjb4KTOR97b4Z7ng9N6PZr7NW3yLU0OY=
X-Received: by 2002:a81:7b02:0:b0:52e:d589:c893 with SMTP id
 w2-20020a817b02000000b0052ed589c893mr2691559ywc.457.1677031655448; Tue, 21
 Feb 2023 18:07:35 -0800 (PST)
MIME-Version: 1.0
References: <20230221132021.2838669-1-narpat.mali@windriver.com>
In-Reply-To: <20230221132021.2838669-1-narpat.mali@windriver.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 21 Feb 2023 18:07:24 -0800
Message-ID: <CANx9H-DmrK58Ws+2sBmcr5u4oKPxhpZr7knGcZMm=0kDL=XfSg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH 1/1] apr-util: fix for CVE-2022-25147
To: Narpat Mali <narpat.mali@windriver.com>
Cc: archana.polampalli@windriver.com, hari.gpillai@windriver.com, 
	openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000019a61f05f5405c75"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 02:07:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177554

--00000000000019a61f05f5405c75
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 21, 2023 at 5:20 AM Narpat Mali <narpat.mali@windriver.com>
wrote:

> Integer Overflow or Wraparound vulnerability in apr_base64 functions
> of Apache Portable Runtime Utility (APR-util) allows an attacker to
> write beyond bounds of a buffer. This issue affects Apache Portable
> Runtime Utility (APR-util) 1.6.1 and prior versions.
>
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2022-25147
>

It might make more sense to upgrade to 1.6.3, as it appears to include some
additional fixes and no new features.

https://downloads.apache.org/apr/CHANGES-APR-UTIL-1.6


> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>  .../apr/apr-util/CVE-2022-25147.patch         | 180 ++++++++++++++++++
>  meta/recipes-support/apr/apr-util_1.6.1.bb    |   3 +-
>  2 files changed, 182 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/apr/apr-util/CVE-2022-25147.patch
>
> diff --git a/meta/recipes-support/apr/apr-util/CVE-2022-25147.patch
> b/meta/recipes-support/apr/apr-util/CVE-2022-25147.patch
> new file mode 100644
> index 0000000000..e85785aca0
> --- /dev/null
> +++ b/meta/recipes-support/apr/apr-util/CVE-2022-25147.patch
> @@ -0,0 +1,180 @@
> +From 3f5257075c7eb601aed6333e9bb5d9eb0e11254b Mon Sep 17 00:00:00 2001
> +From: Yann Ylavic <ylavic@apache.org>
> +Date: Thu, 20 Oct 2022 09:38:34 +0000
> +Subject: [PATCH] apr_base64: Make sure encoding/decoding lengths fit in
> an int
> + >= 0.
> +
> +The (old) API of apr_base64 functions has always used int for representing
> +lengths and it does not return errors. Make sure to abort() if the
> provided
> +data don't fit.
> +
> +* encoding/apr_base64.c():
> +  #define APR_BASE64_ENCODE_MAX and APR_BASE64_DECODE_MAX as the hard
> length
> +  limits for encoding and decoding respectively.
> +
> +* encoding/apr_base64.c(apr_base64_encode_len, apr_base64_encode,
> +                        apr_base64_encode_binary, apr_pbase64_encode):
> +  abort() if the given length is above APR_BASE64_ENCODE_MAX.
> +
> +* encoding/apr_base64.c(apr_base64_decode_len, apr_base64_decode,
> +                        apr_base64_decode_binary, apr_pbase64_decode):
> +  abort() if the given plain buffer length is above APR_BASE64_DECODE_MAX.
> +
> +
> +apr_base64: Follow up to r1902206: Cap to APR_BASE64_ENCODE_MAX in
> apr_pbase64_encode().
> +
> +
> +Merges r1902206[, r1904666] from trunk.
> +Merges r1904727 from 1.7.x.
> +
> +
> +git-svn-id:
> https://svn.apache.org/repos/asf/apr/apr-util/branches/1.6.x@1904728
> 13f79535-47bb-0310-9956-ffa450edef68
> +
> +CVE: CVE-2022-25147
> +
> +Upstream-Status: Backport [
> https://github.com/apache/apr-util/commit/3f5257075c7eb601aed6333e9bb5d9eb0e11254b
> ]
> +
> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> +---
> + encoding/apr_base64.c | 41 +++++++++++++++++++++++++----------------
> + 1 file changed, 25 insertions(+), 16 deletions(-)
> +
> +diff --git a/encoding/apr_base64.c b/encoding/apr_base64.c
> +index e9b75e3d..ac9f2816 100644
> +--- a/encoding/apr_base64.c
> ++++ b/encoding/apr_base64.c
> +@@ -20,11 +20,20 @@
> +  * ugly 'len' functions, which is quite a nasty cost.
> +  */
> +
> ++#undef NDEBUG /* always abort() on assert()ion failure */
> ++#include <assert.h>
> ++
> + #include "apr_base64.h"
> + #if APR_CHARSET_EBCDIC
> + #include "apr_xlate.h"
> + #endif                                /* APR_CHARSET_EBCDIC */
> +
> ++/* Above APR_BASE64_ENCODE_MAX length the encoding can't fit in an int
> >= 0 */
> ++#define APR_BASE64_ENCODE_MAX 1610612733
> ++
> ++/* Above APR_BASE64_DECODE_MAX length the decoding can't fit in an int
> >= 0 */
> ++#define APR_BASE64_DECODE_MAX 2863311524u
> ++
> + /* aaaack but it's fast and const should make it shared text page. */
> + static const unsigned char pr2six[256] =
> + {
> +@@ -109,24 +118,22 @@ APU_DECLARE(apr_status_t)
> apr_base64init_ebcdic(apr_xlate_t *to_ascii,
> +
> + APU_DECLARE(int) apr_base64_decode_len(const char *bufcoded)
> + {
> +-    int nbytesdecoded;
> +     register const unsigned char *bufin;
> +     register apr_size_t nprbytes;
> +
> +     bufin = (const unsigned char *) bufcoded;
> +     while (pr2six[*(bufin++)] <= 63);
> +-
> +     nprbytes = (bufin - (const unsigned char *) bufcoded) - 1;
> +-    nbytesdecoded = (((int)nprbytes + 3) / 4) * 3;
> ++    assert(nprbytes <= APR_BASE64_DECODE_MAX);
> +
> +-    return nbytesdecoded + 1;
> ++    return (int)(((nprbytes + 3u) / 4u) * 3u + 1u);
> + }
> +
> + APU_DECLARE(int) apr_base64_decode(char *bufplain, const char *bufcoded)
> + {
> + #if APR_CHARSET_EBCDIC
> +     apr_size_t inbytes_left, outbytes_left;
> +-#endif                                /* APR_CHARSET_EBCDIC */
> ++#endif /* APR_CHARSET_EBCDIC */
> +     int len;
> +
> +     len = apr_base64_decode_binary((unsigned char *) bufplain, bufcoded);
> +@@ -143,7 +150,7 @@ APU_DECLARE(int) apr_base64_decode(char *bufplain,
> const char *bufcoded)
> +  * the conversion of the output to ebcdic is left out.
> +  */
> + APU_DECLARE(int) apr_base64_decode_binary(unsigned char *bufplain,
> +-                                 const char *bufcoded)
> ++                                          const char *bufcoded)
> + {
> +     int nbytesdecoded;
> +     register const unsigned char *bufin;
> +@@ -153,12 +160,13 @@ APU_DECLARE(int) apr_base64_decode_binary(unsigned
> char *bufplain,
> +     bufin = (const unsigned char *) bufcoded;
> +     while (pr2six[*(bufin++)] <= 63);
> +     nprbytes = (bufin - (const unsigned char *) bufcoded) - 1;
> +-    nbytesdecoded = (((int)nprbytes + 3) / 4) * 3;
> ++    assert(nprbytes <= APR_BASE64_DECODE_MAX);
> ++    nbytesdecoded = (int)(((nprbytes + 3u) / 4u) * 3u);
> +
> +     bufout = (unsigned char *) bufplain;
> +     bufin = (const unsigned char *) bufcoded;
> +
> +-    while (nprbytes > 4) {
> ++    while (nprbytes >= 4) {
> +       *(bufout++) =
> +           (unsigned char) (pr2six[*bufin] << 2 | pr2six[bufin[1]] >> 4);
> +       *(bufout++) =
> +@@ -178,13 +186,8 @@ APU_DECLARE(int) apr_base64_decode_binary(unsigned
> char *bufplain,
> +       *(bufout++) =
> +           (unsigned char) (pr2six[bufin[1]] << 4 | pr2six[bufin[2]] >>
> 2);
> +     }
> +-    if (nprbytes > 3) {
> +-      *(bufout++) =
> +-          (unsigned char) (pr2six[bufin[2]] << 6 | pr2six[bufin[3]]);
> +-    }
> +
> +-    nbytesdecoded -= (4 - (int)nprbytes) & 3;
> +-    return nbytesdecoded;
> ++    return nbytesdecoded - (int)((4u - nprbytes) & 3u);
> + }
> +
> + static const char basis_64[] =
> +@@ -192,6 +195,8 @@ static const char basis_64[] =
> +
> + APU_DECLARE(int) apr_base64_encode_len(int len)
> + {
> ++    assert(len >= 0 && len <= APR_BASE64_ENCODE_MAX);
> ++
> +     return ((len + 2) / 3 * 4) + 1;
> + }
> +
> +@@ -203,6 +208,8 @@ APU_DECLARE(int) apr_base64_encode(char *encoded,
> const char *string, int len)
> +     int i;
> +     char *p;
> +
> ++    assert(len >= 0 && len <= APR_BASE64_ENCODE_MAX);
> ++
> +     p = encoded;
> +     for (i = 0; i < len - 2; i += 3) {
> +       *p++ = basis_64[(os_toascii[string[i]] >> 2) & 0x3F];
> +@@ -227,7 +234,7 @@ APU_DECLARE(int) apr_base64_encode(char *encoded,
> const char *string, int len)
> +     }
> +
> +     *p++ = '\0';
> +-    return p - encoded;
> ++    return (unsigned int)(p - encoded);
> + #endif                                /* APR_CHARSET_EBCDIC */
> + }
> +
> +@@ -240,6 +247,8 @@ APU_DECLARE(int) apr_base64_encode_binary(char
> *encoded,
> +     int i;
> +     char *p;
> +
> ++    assert(len >= 0 && len <= APR_BASE64_ENCODE_MAX);
> ++
> +     p = encoded;
> +     for (i = 0; i < len - 2; i += 3) {
> +       *p++ = basis_64[(string[i] >> 2) & 0x3F];
> +@@ -264,5 +273,5 @@ APU_DECLARE(int) apr_base64_encode_binary(char
> *encoded,
> +     }
> +
> +     *p++ = '\0';
> +-    return (int)(p - encoded);
> ++    return (unsigned int)(p - encoded);
> + }
> +--
> +2.32.0
> +
> diff --git a/meta/recipes-support/apr/apr-util_1.6.1.bb
> b/meta/recipes-support/apr/apr-util_1.6.1.bb
> index b851d46351..f5a2888016 100644
> --- a/meta/recipes-support/apr/apr-util_1.6.1.bb
> +++ b/meta/recipes-support/apr/apr-util_1.6.1.bb
> @@ -14,7 +14,8 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
>             file://configure_fixes.patch \
>             file://run-ptest \
>             file://0001-Fix-error-handling-in-gdbm.patch \
> -"
> +           file://CVE-2022-25147.patch \
> +          "
>
>  SRC_URI[md5sum] = "bd502b9a8670a8012c4d90c31a84955f"
>  SRC_URI[sha256sum] =
> "b65e40713da57d004123b6319828be7f1273fbc6490e145874ee1177e112c459"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177496):
> https://lists.openembedded.org/g/openembedded-core/message/177496
> Mute This Topic: https://lists.openembedded.org/mt/97108181/924729
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> ticotimo@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000019a61f05f5405c75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Feb 21, 2023 at 5:20 AM Narpat Mali &lt;<a href=3D"=
mailto:narpat.mali@windriver.com">narpat.mali@windriver.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Integer Overflow or Wraparound vuln=
erability in apr_base64 functions<br>
of Apache Portable Runtime Utility (APR-util) allows an attacker to<br>
write beyond bounds of a buffer. This issue affects Apache Portable<br>
Runtime Utility (APR-util) 1.6.1 and prior versions.<br>
<br>
Reference:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-25147" rel=3D"noreferr=
er" target=3D"_blank">https://nvd.nist.gov/vuln/detail/CVE-2022-25147</a><b=
r>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">It might make mo=
re sense to upgrade to 1.6.3, as it appears to include some additional fixe=
s and no new features.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><=
div><a href=3D"https://downloads.apache.org/apr/CHANGES-APR-UTIL-1.6">https=
://downloads.apache.org/apr/CHANGES-APR-UTIL-1.6</a></div><br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><br>
Signed-off-by: Narpat Mali &lt;<a href=3D"mailto:narpat.mali@windriver.com"=
 target=3D"_blank">narpat.mali@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../apr/apr-util/CVE-2022-25147.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 180 ++++++++++++++++++<br>
=C2=A0meta/recipes-support/apr/<a href=3D"http://apr-util_1.6.1.bb" rel=3D"=
noreferrer" target=3D"_blank">apr-util_1.6.1.bb</a>=C2=A0 =C2=A0 |=C2=A0 =
=C2=A03 +-<br>
=C2=A02 files changed, 182 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta/recipes-support/apr/apr-util/CVE-2022-25147.p=
atch<br>
<br>
diff --git a/meta/recipes-support/apr/apr-util/CVE-2022-25147.patch b/meta/=
recipes-support/apr/apr-util/CVE-2022-25147.patch<br>
new file mode 100644<br>
index 0000000000..e85785aca0<br>
--- /dev/null<br>
+++ b/meta/recipes-support/apr/apr-util/CVE-2022-25147.patch<br>
@@ -0,0 +1,180 @@<br>
+From 3f5257075c7eb601aed6333e9bb5d9eb0e11254b Mon Sep 17 00:00:00 2001<br>
+From: Yann Ylavic &lt;<a href=3D"mailto:ylavic@apache.org" target=3D"_blan=
k">ylavic@apache.org</a>&gt;<br>
+Date: Thu, 20 Oct 2022 09:38:34 +0000<br>
+Subject: [PATCH] apr_base64: Make sure encoding/decoding lengths fit in an=
 int<br>
+ &gt;=3D 0.<br>
+<br>
+The (old) API of apr_base64 functions has always used int for representing=
<br>
+lengths and it does not return errors. Make sure to abort() if the provide=
d<br>
+data don&#39;t fit.<br>
+<br>
+* encoding/apr_base64.c():<br>
+=C2=A0 #define APR_BASE64_ENCODE_MAX and APR_BASE64_DECODE_MAX as the hard=
 length<br>
+=C2=A0 limits for encoding and decoding respectively.<br>
+<br>
+* encoding/apr_base64.c(apr_base64_encode_len, apr_base64_encode,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 apr_base64_encode_binary, apr_pbase64_encode):<br>
+=C2=A0 abort() if the given length is above APR_BASE64_ENCODE_MAX.<br>
+<br>
+* encoding/apr_base64.c(apr_base64_decode_len, apr_base64_decode,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 apr_base64_decode_binary, apr_pbase64_decode):<br>
+=C2=A0 abort() if the given plain buffer length is above APR_BASE64_DECODE=
_MAX.<br>
+<br>
+<br>
+apr_base64: Follow up to r1902206: Cap to APR_BASE64_ENCODE_MAX in apr_pba=
se64_encode().<br>
+<br>
+<br>
+Merges r1902206[, r1904666] from trunk.<br>
+Merges r1904727 from 1.7.x.<br>
+<br>
+<br>
+git-svn-id: <a href=3D"https://svn.apache.org/repos/asf/apr/apr-util/branc=
hes/1.6.x@1904728" rel=3D"noreferrer" target=3D"_blank">https://svn.apache.=
org/repos/asf/apr/apr-util/branches/1.6.x@1904728</a> 13f79535-47bb-0310-99=
56-ffa450edef68<br>
+<br>
+CVE: CVE-2022-25147<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/apache/apr-util/c=
ommit/3f5257075c7eb601aed6333e9bb5d9eb0e11254b" rel=3D"noreferrer" target=
=3D"_blank">https://github.com/apache/apr-util/commit/3f5257075c7eb601aed63=
33e9bb5d9eb0e11254b</a>]<br>
+<br>
+Signed-off-by: Narpat Mali &lt;<a href=3D"mailto:narpat.mali@windriver.com=
" target=3D"_blank">narpat.mali@windriver.com</a>&gt;<br>
+---<br>
+ encoding/apr_base64.c | 41 +++++++++++++++++++++++++----------------<br>
+ 1 file changed, 25 insertions(+), 16 deletions(-)<br>
+<br>
+diff --git a/encoding/apr_base64.c b/encoding/apr_base64.c<br>
+index e9b75e3d..ac9f2816 100644<br>
+--- a/encoding/apr_base64.c<br>
++++ b/encoding/apr_base64.c<br>
+@@ -20,11 +20,20 @@<br>
+=C2=A0 * ugly &#39;len&#39; functions, which is quite a nasty cost.<br>
+=C2=A0 */<br>
+ <br>
++#undef NDEBUG /* always abort() on assert()ion failure */<br>
++#include &lt;assert.h&gt;<br>
++<br>
+ #include &quot;apr_base64.h&quot;<br>
+ #if APR_CHARSET_EBCDIC<br>
+ #include &quot;apr_xlate.h&quot;<br>
+ #endif=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* APR_CHARSET_EBCDIC */<br>
+ <br>
++/* Above APR_BASE64_ENCODE_MAX length the encoding can&#39;t fit in an in=
t &gt;=3D 0 */<br>
++#define APR_BASE64_ENCODE_MAX 1610612733<br>
++<br>
++/* Above APR_BASE64_DECODE_MAX length the decoding can&#39;t fit in an in=
t &gt;=3D 0 */<br>
++#define APR_BASE64_DECODE_MAX 2863311524u<br>
++<br>
+ /* aaaack but it&#39;s fast and const should make it shared text page. */=
<br>
+ static const unsigned char pr2six[256] =3D<br>
+ {<br>
+@@ -109,24 +118,22 @@ APU_DECLARE(apr_status_t) apr_base64init_ebcdic(apr_=
xlate_t *to_ascii,<br>
+ <br>
+ APU_DECLARE(int) apr_base64_decode_len(const char *bufcoded)<br>
+ {<br>
+-=C2=A0 =C2=A0 int nbytesdecoded;<br>
+=C2=A0 =C2=A0 =C2=A0register const unsigned char *bufin;<br>
+=C2=A0 =C2=A0 =C2=A0register apr_size_t nprbytes;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0bufin =3D (const unsigned char *) bufcoded;<br>
+=C2=A0 =C2=A0 =C2=A0while (pr2six[*(bufin++)] &lt;=3D 63);<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0nprbytes =3D (bufin - (const unsigned char *) bufcoded=
) - 1;<br>
+-=C2=A0 =C2=A0 nbytesdecoded =3D (((int)nprbytes + 3) / 4) * 3;<br>
++=C2=A0 =C2=A0 assert(nprbytes &lt;=3D APR_BASE64_DECODE_MAX);<br>
+ <br>
+-=C2=A0 =C2=A0 return nbytesdecoded + 1;<br>
++=C2=A0 =C2=A0 return (int)(((nprbytes + 3u) / 4u) * 3u + 1u);<br>
+ }<br>
+ <br>
+ APU_DECLARE(int) apr_base64_decode(char *bufplain, const char *bufcoded)<=
br>
+ {<br>
+ #if APR_CHARSET_EBCDIC<br>
+=C2=A0 =C2=A0 =C2=A0apr_size_t inbytes_left, outbytes_left;<br>
+-#endif=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* APR_CHARSET_EBCDIC */<br>
++#endif /* APR_CHARSET_EBCDIC */<br>
+=C2=A0 =C2=A0 =C2=A0int len;<br>
+=C2=A0 =C2=A0 =C2=A0<br>
+=C2=A0 =C2=A0 =C2=A0len =3D apr_base64_decode_binary((unsigned char *) buf=
plain, bufcoded);<br>
+@@ -143,7 +150,7 @@ APU_DECLARE(int) apr_base64_decode(char *bufplain, con=
st char *bufcoded)<br>
+=C2=A0 * the conversion of the output to ebcdic is left out.<br>
+=C2=A0 */<br>
+ APU_DECLARE(int) apr_base64_decode_binary(unsigned char *bufplain,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *bufcoded)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c=
onst char *bufcoded)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0int nbytesdecoded;<br>
+=C2=A0 =C2=A0 =C2=A0register const unsigned char *bufin;<br>
+@@ -153,12 +160,13 @@ APU_DECLARE(int) apr_base64_decode_binary(unsigned c=
har *bufplain,<br>
+=C2=A0 =C2=A0 =C2=A0bufin =3D (const unsigned char *) bufcoded;<br>
+=C2=A0 =C2=A0 =C2=A0while (pr2six[*(bufin++)] &lt;=3D 63);<br>
+=C2=A0 =C2=A0 =C2=A0nprbytes =3D (bufin - (const unsigned char *) bufcoded=
) - 1;<br>
+-=C2=A0 =C2=A0 nbytesdecoded =3D (((int)nprbytes + 3) / 4) * 3;<br>
++=C2=A0 =C2=A0 assert(nprbytes &lt;=3D APR_BASE64_DECODE_MAX);<br>
++=C2=A0 =C2=A0 nbytesdecoded =3D (int)(((nprbytes + 3u) / 4u) * 3u);<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0bufout =3D (unsigned char *) bufplain;<br>
+=C2=A0 =C2=A0 =C2=A0bufin =3D (const unsigned char *) bufcoded;<br>
+ <br>
+-=C2=A0 =C2=A0 while (nprbytes &gt; 4) {<br>
++=C2=A0 =C2=A0 while (nprbytes &gt;=3D 4) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*(bufout++) =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(unsigned char) (pr2six[*bufin] &=
lt;&lt; 2 | pr2six[bufin[1]] &gt;&gt; 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*(bufout++) =3D<br>
+@@ -178,13 +186,8 @@ APU_DECLARE(int) apr_base64_decode_binary(unsigned ch=
ar *bufplain,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*(bufout++) =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(unsigned char) (pr2six[bufin[1]]=
 &lt;&lt; 4 | pr2six[bufin[2]] &gt;&gt; 2);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 if (nprbytes &gt; 3) {<br>
+-=C2=A0 =C2=A0 =C2=A0 *(bufout++) =3D<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (unsigned char) (pr2six[bufin[2]] &lt;=
&lt; 6 | pr2six[bufin[3]]);<br>
+-=C2=A0 =C2=A0 }<br>
+ <br>
+-=C2=A0 =C2=A0 nbytesdecoded -=3D (4 - (int)nprbytes) &amp; 3;<br>
+-=C2=A0 =C2=A0 return nbytesdecoded;<br>
++=C2=A0 =C2=A0 return nbytesdecoded - (int)((4u - nprbytes) &amp; 3u);<br>
+ }<br>
+ <br>
+ static const char basis_64[] =3D<br>
+@@ -192,6 +195,8 @@ static const char basis_64[] =3D<br>
+ <br>
+ APU_DECLARE(int) apr_base64_encode_len(int len)<br>
+ {<br>
++=C2=A0 =C2=A0 assert(len &gt;=3D 0 &amp;&amp; len &lt;=3D APR_BASE64_ENCO=
DE_MAX);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0return ((len + 2) / 3 * 4) + 1;<br>
+ }<br>
+ <br>
+@@ -203,6 +208,8 @@ APU_DECLARE(int) apr_base64_encode(char *encoded, cons=
t char *string, int len)<br>
+=C2=A0 =C2=A0 =C2=A0int i;<br>
+=C2=A0 =C2=A0 =C2=A0char *p;<br>
+ <br>
++=C2=A0 =C2=A0 assert(len &gt;=3D 0 &amp;&amp; len &lt;=3D APR_BASE64_ENCO=
DE_MAX);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0p =3D encoded;<br>
+=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; len - 2; i +=3D 3) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*p++ =3D basis_64[(os_toascii[string[i]] &gt;&g=
t; 2) &amp; 0x3F];<br>
+@@ -227,7 +234,7 @@ APU_DECLARE(int) apr_base64_encode(char *encoded, cons=
t char *string, int len)<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0*p++ =3D &#39;\0&#39;;<br>
+-=C2=A0 =C2=A0 return p - encoded;<br>
++=C2=A0 =C2=A0 return (unsigned int)(p - encoded);<br>
+ #endif=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* APR_CHARSET_EBCDIC */<br>
+ }<br>
+ <br>
+@@ -240,6 +247,8 @@ APU_DECLARE(int) apr_base64_encode_binary(char *encode=
d,<br>
+=C2=A0 =C2=A0 =C2=A0int i;<br>
+=C2=A0 =C2=A0 =C2=A0char *p;<br>
+ <br>
++=C2=A0 =C2=A0 assert(len &gt;=3D 0 &amp;&amp; len &lt;=3D APR_BASE64_ENCO=
DE_MAX);<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0p =3D encoded;<br>
+=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; len - 2; i +=3D 3) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*p++ =3D basis_64[(string[i] &gt;&gt; 2) &amp; =
0x3F];<br>
+@@ -264,5 +273,5 @@ APU_DECLARE(int) apr_base64_encode_binary(char *encode=
d,<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0*p++ =3D &#39;\0&#39;;<br>
+-=C2=A0 =C2=A0 return (int)(p - encoded);<br>
++=C2=A0 =C2=A0 return (unsigned int)(p - encoded);<br>
+ }<br>
+-- <br>
+2.32.0<br>
+<br>
diff --git a/meta/recipes-support/apr/<a href=3D"http://apr-util_1.6.1.bb" =
rel=3D"noreferrer" target=3D"_blank">apr-util_1.6.1.bb</a> b/meta/recipes-s=
upport/apr/<a href=3D"http://apr-util_1.6.1.bb" rel=3D"noreferrer" target=
=3D"_blank">apr-util_1.6.1.bb</a><br>
index b851d46351..f5a2888016 100644<br>
--- a/meta/recipes-support/apr/<a href=3D"http://apr-util_1.6.1.bb" rel=3D"=
noreferrer" target=3D"_blank">apr-util_1.6.1.bb</a><br>
+++ b/meta/recipes-support/apr/<a href=3D"http://apr-util_1.6.1.bb" rel=3D"=
noreferrer" target=3D"_blank">apr-util_1.6.1.bb</a><br>
@@ -14,7 +14,8 @@ SRC_URI =3D &quot;${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.g=
z \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://configure_fixes.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Fix-error-handling-in=
-gdbm.patch \<br>
-&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2022-25147.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;bd502b9a8670a8012c4d90c31a84955f&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;b65e40713da57d004123b6319828be7f1273fbc6=
490e145874ee1177e112c459&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#177496): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/177496" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/177496</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97108181/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
97108181/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=
=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000019a61f05f5405c75--

